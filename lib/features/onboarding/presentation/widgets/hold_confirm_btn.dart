import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';

class HoldToConfirmButton extends StatefulWidget {
  final VoidCallback onConfirm;
  final Widget child;
  final Color? color;
  final double durationSeconds;

  const HoldToConfirmButton({
    super.key,
    required this.onConfirm,
    required this.child,
    this.color,
    this.durationSeconds = 3.0,
  });

  @override
  State<HoldToConfirmButton> createState() => _HoldToConfirmButtonState();
}

class _HoldToConfirmButtonState extends State<HoldToConfirmButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Spark> sparks = [];
  final math.Random _random = math.Random();

  // Track vibration timing
  double _lastVibrationValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (widget.durationSeconds * 1000).toInt()),
    );

    _controller.addListener(_onTick);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        HapticFeedback.vibrate(); // Final strong thump
        widget.onConfirm();
        _reset();
      }
    });
  }

  void _onTick() {
    _updateSparks();
    _handleHaptics();
  }

  void _handleHaptics() {
    if (_controller.status != AnimationStatus.forward) return;

    // Vibration frequency increases as progress increases
    double progress = _controller.value;
    double vibrationInterval = math.max(0.02, 0.2 * (1.0 - progress));

    if (progress - _lastVibrationValue >= vibrationInterval) {
      _lastVibrationValue = progress;
      HapticFeedback.selectionClick();
    }
  }

  void _updateSparks() {
    setState(() {
      // Move and fade existing sparks
      for (var spark in sparks) {
        spark.update();
      }

      // Remove invisible sparks
      sparks.removeWhere((s) => s.alpha <= 0);

      // Only spawn new sparks when holding (forward)
      if (_controller.isAnimating &&
          _controller.status == AnimationStatus.forward) {
        for (int i = 0; i < 2; i++) {
          sparks.add(
            Spark(
              progress: _controller.value,
              random: _random,
              color: widget.color ?? FTheme.of(context).colors.primary,
            ),
          );
        }
      }
    });
  }

  void _handleTapDown(TapDownDetails details) => _controller.forward();

  void _handleTapUp(TapUpDetails details) {
    _lastVibrationValue = 0.0;
    _reset();
  }

  void _handleTapCancel() {
    _lastVibrationValue = 0.0;
    _reset();
  }

  void _reset() {
    if (_controller.status != AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Visual Jitter/Shake when nearing completion (>70%)
        double shake = 0.0;
        if (_controller.status == AnimationStatus.forward &&
            _controller.value > 0.7) {
          shake = (_random.nextDouble() - 0.5) * (_controller.value * 5);
        }

        return Transform.translate(
          offset: Offset(shake, shake),
          child: GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            child: CustomPaint(
              painter: SparkPainter(
                sparks: sparks,
                progress: _controller.value,
                color: widget.color ?? FTheme.of(context).colors.primary,
              ),
              child: Container(
                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (widget.color ?? FTheme.of(context).colors.primary)
                      .withValues(alpha: 0.1),
                ),
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Spark {
  late double xOffset;
  late double yOffset;
  late double vx;
  late double vy;
  double alpha = 1.0;
  final Color color;

  Spark({
    required double progress,
    required math.Random random,
    required this.color,
  }) {
    // Determine the angle at the leading edge of the arc
    final double angle = (2 * math.pi * progress) - (math.pi / 2);

    xOffset = math.cos(angle);
    yOffset = math.sin(angle);

    // Exploding velocity outwards
    double speed = random.nextDouble() * 4 + 2;
    vx = xOffset * speed + (random.nextDouble() - 0.5) * 2;
    vy = yOffset * speed + (random.nextDouble() - 0.5) * 2;
  }

  void update() {
    xOffset += vx * 0.01;
    yOffset += vy * 0.01;
    alpha -= 0.04; // Fade over time
  }
}

class SparkPainter extends CustomPainter {
  final List<Spark> sparks;
  final double progress;
  final Color color;

  SparkPainter({
    required this.sparks,
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    const strokeWidth = 6.0;

    // 1. Background static ring
    final bgPaint = Paint()
      ..color = color.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius - (strokeWidth / 2), bgPaint);

    // 2. Glowing Progress Arc
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - (strokeWidth / 2)),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );

    // 3. Render Sparks
    for (var spark in sparks) {
      if (spark.alpha <= 0) continue;
      final sparkPaint = Paint()..color = spark.color.withValues(alpha: spark.alpha);
      final sparkPos = Offset(
        center.dx + (spark.xOffset * radius),
        center.dy + (spark.yOffset * radius),
      );
      canvas.drawCircle(sparkPos, 1.5, sparkPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
