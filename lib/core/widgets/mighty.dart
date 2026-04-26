import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/mighty.dart';

class NeutralMighty extends StatelessWidget {
  const NeutralMighty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      child: SvgPicture.asset(
        MightyAssets.neutral,
        // height: double.infinity,
      ),
    );
  }
}
