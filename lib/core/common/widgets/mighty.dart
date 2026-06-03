import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets/mighty.dart';

class ConstrainedMighty extends StatelessWidget {
  const ConstrainedMighty({
    super.key,
    required this.assetName,
    this.maxHeight,
    this.maxWidth,
  });

  final String assetName;
  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? MediaQuery.sizeOf(context).height * 0.5,
        maxWidth: maxWidth ?? MediaQuery.sizeOf(context).width * 0.7,
      ),
      child: SvgPicture.asset(assetName),
    );
  }
}

class NeutralMighty extends StatelessWidget {
  const NeutralMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.neutral,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class SeriousMighty extends StatelessWidget {
  const SeriousMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.serious,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class FlexMighty extends StatelessWidget {
  const FlexMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.flex,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class ProudMighty extends StatelessWidget {
  const ProudMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.proud,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class PremiumMighty extends StatelessWidget {
  const PremiumMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.premium,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class ReadingMighty extends StatelessWidget {
  const ReadingMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.reading,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class RestingMighty extends StatelessWidget {
  const RestingMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.resting,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class CelebratingMighty extends StatelessWidget {
  const CelebratingMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.celebrating,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class CryingMighty extends StatelessWidget {
  const CryingMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.crying,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}

class HappyMighty extends StatelessWidget {
  const HappyMighty({super.key, this.maxHeight, this.maxWidth});

  final double? maxHeight;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedMighty(
      assetName: MightyAssets.happy,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}
