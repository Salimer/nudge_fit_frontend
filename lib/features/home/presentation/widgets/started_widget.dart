import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import '../../../../core/extensions/build_context.dart';

class StartedWidget extends StatefulWidget {
  const StartedWidget({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  State<StartedWidget> createState() => _StartedWidgetState();
}

class _StartedWidgetState extends State<StartedWidget> {
  double _dragValue = 0.0;
  bool _isResetting = false;

  @override
  Widget build(BuildContext context) {
    final TextDirection direction = Directionality.of(context);
    final bool isRtl = direction == TextDirection.rtl;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        const double handleSize = 58.0;
        final double maxDragDistance = maxWidth - handleSize;

        return Container(
          height: handleSize,
          width: double.infinity,
          decoration: BoxDecoration(
            color: FTheme.of(context).colors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(handleSize / 2),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background Hint
              Opacity(
                opacity: (1 - (_dragValue / maxDragDistance) * 1.5).clamp(0, 1),
                child: Text(
                  context.l10n.btnStarted,
                  style: TextStyle(
                    color: FTheme.of(context).colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // The Slider
              Positioned.directional(
                textDirection: direction,
                start: _dragValue,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _isResetting = false;
                      double delta = isRtl
                          ? -details.delta.dx
                          : details.delta.dx;
                      _dragValue = (_dragValue + delta).clamp(
                        0.0,
                        maxDragDistance,
                      );
                    });

                    if (_dragValue % 25 < 5) HapticFeedback.selectionClick();
                  },
                  onHorizontalDragEnd: (_) {
                    if (_dragValue >= maxDragDistance * 0.8) {
                      setState(() => _dragValue = maxDragDistance);
                      HapticFeedback.heavyImpact();
                      widget.onPressed?.call();
                    } else {
                      setState(() {
                        _isResetting = true;
                        _dragValue = 0.0;
                      });
                      HapticFeedback.lightImpact();
                    }
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: _isResetting ? 300 : 0),
                    curve: Curves.easeOutBack,
                    height: handleSize,
                    width: handleSize,
                    decoration: BoxDecoration(
                      color: FTheme.of(context).colors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FIcons.chevronRight,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
