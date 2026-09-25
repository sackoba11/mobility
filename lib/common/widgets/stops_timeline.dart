import 'package:flutter/material.dart';
import 'package:mobility/models/stop/stop.dart';

/// Timeline verticale des arrêts (partagée détail bus / onglet service).
/// Affiche le label Firestore, sinon "Arrêt N" — jamais de coords brutes.
class StopsTimeline extends StatelessWidget {
  final List<Stop> stops;
  const StopsTimeline({super.key, required this.stops});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    if (stops.isEmpty) {
      return Text("Aucun arrêt renseigné.",
          style: theme.textTheme.bodyMedium
              ?.copyWith(color: scheme.onSurfaceVariant));
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stops.length,
      itemBuilder: (context, index) {
        final stop = stops[index];
        final isLast = index == stops.length - 1;
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color:
                          index == 0 ? scheme.primary : scheme.surface,
                      border: Border.all(
                          color: scheme.primary, width: 2.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                          width: 2.5, color: scheme.primaryContainer),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: isLast ? 0 : 14),
                  child: Text(stop.displayName(index),
                      style: theme.textTheme.bodyMedium),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
