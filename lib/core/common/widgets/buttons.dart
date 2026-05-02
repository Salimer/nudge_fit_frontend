import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../constants/spaces.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ShadButton(
        onPressed: isLoading ? null : onPressed,
        enabled: !isLoading && enabled,
        child: isLoading ? const CircularProgressIndicator() : Text(text),
      ),
    );
  }
}

class CustomTextButtonWidget extends StatelessWidget {
  const CustomTextButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Prevents column from taking full height
          children: [
            Padding(
              padding: const EdgeInsets.all(Spaces.xs),
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 0,
                ), // The "gap" you wanted
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:
                          Theme.of(context).textTheme.bodyMedium?.color ??
                          Colors.black,
                      width: 1.0, // Thickness of the line
                    ),
                  ),
                ),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    // Remove the old decoration here
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                width: Spaces.lg,
                height: Spaces.lg,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(text),
      ),
    );
  }
}
