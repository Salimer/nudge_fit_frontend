import 'package:flutter/material.dart';

import '../../../../core/constants/app_padding.dart';

class ActionRequiredView extends StatelessWidget {
  const ActionRequiredView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.vertical,
          horizontal: AppPadding.horizontal,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              
            ],
          )
        )
      ),
    );
  }
}
