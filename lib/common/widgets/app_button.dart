import 'package:flutter/material.dart';

/// Bouton principal Mobility (Phase 4).
/// Remplace CustomButtonWithoutIcon / CustomButtonWithDoubleIcons.
enum AppButtonVariant { primary, secondary, outline, danger }

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final ValueNotifier<bool>? loading;
  final Widget? icon;
  final bool expanded;

  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.loading,
    this.icon,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final loadingNotifier = loading ?? ValueNotifier(false);

    Widget content(bool isLoading) {
      if (isLoading) {
        return SizedBox(
          width: 26,
          height: 26,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: variant == AppButtonVariant.outline
                ? scheme.primary
                : scheme.onPrimary,
          ),
        );
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 12),
          ],
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      );
    }

    final style = switch (variant) {
      AppButtonVariant.primary => FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
        ),
      AppButtonVariant.secondary => FilledButton.styleFrom(
          backgroundColor: scheme.secondary,
          foregroundColor: scheme.onSecondary,
        ),
      AppButtonVariant.danger => FilledButton.styleFrom(
          backgroundColor: scheme.error,
          foregroundColor: scheme.onError,
        ),
      AppButtonVariant.outline => OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.primary, width: 1.5),
        ),
    };

    return ValueListenableBuilder<bool>(
      valueListenable: loadingNotifier,
      builder: (_, isLoading, _) {
        final child = SizedBox(
          width: expanded ? double.infinity : null,
          height: 56,
          child: variant == AppButtonVariant.outline
              ? OutlinedButton(
                  onPressed: isLoading ? null : onPressed,
                  style: style,
                  child: content(isLoading),
                )
              : FilledButton(
                  onPressed: isLoading ? null : onPressed,
                  style: style,
                  child: content(isLoading),
                ),
        );
        return child;
      },
    );
  }
}
