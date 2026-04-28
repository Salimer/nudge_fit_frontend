import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets/mighty.dart';

class MightyHome extends StatelessWidget {
  const MightyHome({super.key, required this.assetName});

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      child: SvgPicture.asset(assetName),
    );
  }
}

class ReadingMighty extends StatelessWidget {
  const ReadingMighty({super.key});

  @override
  Widget build(BuildContext context) {
    return MightyHome(assetName: MightyAssets.reading);
  }
}

class RestingMighty extends StatelessWidget {
  const RestingMighty({super.key});

  @override
  Widget build(BuildContext context) {
    return MightyHome(assetName: MightyAssets.resting);
  }
}
