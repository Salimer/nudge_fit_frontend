import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/mighty.dart';

class MightyOnboarding extends StatelessWidget {
  const MightyOnboarding({super.key, required this.assetName});

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      child: SvgPicture.asset(assetName),
    );
  }
}

class NeutralMighty extends StatelessWidget {
  const NeutralMighty({super.key});

  @override
  Widget build(BuildContext context) {
    return MightyOnboarding(assetName: MightyAssets.neutral);
  }
}

class SeriousMighty extends StatelessWidget {
  const SeriousMighty({super.key});

  @override
  Widget build(BuildContext context) {
    return MightyOnboarding(assetName: MightyAssets.serious);
  }
}

class FlexMighty extends StatelessWidget {
  const FlexMighty({super.key});

  @override
  Widget build(BuildContext context) {
    return MightyOnboarding(assetName: MightyAssets.flex);
  }
}

class ProudMighty extends StatelessWidget {
  const ProudMighty({super.key});

  @override
  Widget build(BuildContext context) {
    return MightyOnboarding(assetName: MightyAssets.proud);
  }
}
