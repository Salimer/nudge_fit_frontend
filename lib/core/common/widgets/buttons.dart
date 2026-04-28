import 'package:flutter/material.dart';

class CustomElevatedButton1 extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomElevatedButton1({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
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
              padding: const EdgeInsets.all(4.0),
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
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
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
