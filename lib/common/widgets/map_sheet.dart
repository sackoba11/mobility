import 'package:flutter/material.dart';

/// Bottom-sheet carte unifié (Phase 4) : poignée + coins arrondis.
/// Remplace le pattern Stack + DraggableScrollableSheet dupliqué partout.
class MapSheet extends StatelessWidget {
  final Widget child;
  final double initialSize;
  final double minSize;
  final double maxSize;
  final bool scrollable;

  const MapSheet({
    super.key,
    required this.child,
    this.initialSize = 0.35,
    this.minSize = 0.25,
    this.maxSize = 0.75,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return DraggableScrollableSheet(
      initialChildSize: initialSize,
      minChildSize: minSize,
      maxChildSize: maxSize,
      snap: true,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: scheme.outline,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: scrollable
                    ? SingleChildScrollView(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                        child: child,
                      )
                    : Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20, 4, 20, 24),
                        child: child,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// En-tête de section dans une sheet.
class SheetTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SheetTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleLarge),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(subtitle!,
              style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant)),
        ],
      ],
    );
  }
}
