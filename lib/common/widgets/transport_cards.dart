import 'package:flutter/material.dart';
import 'package:mobility/models/bus/bus_from_realTime/bus_from_db.dart';
import 'package:mobility/models/gare/gare.dart';
import 'package:mobility/models/itineraire_gare/itineraire_gare.dart';
import 'package:mobility/models/transport_type.dart';

/// Badge de statut (En service / ligne de bus...).
class StatusBadge extends StatelessWidget {
  final String label;
  final Color background;
  final Color foreground;

  const StatusBadge({
    super.key,
    required this.label,
    required this.background,
    required this.foreground,
  });

  factory StatusBadge.active(
    BuildContext context, {
    String label = "En service",
  }) {
    final scheme = Theme.of(context).colorScheme;
    return StatusBadge(
      label: label,
      background: scheme.primaryContainer,
      foreground: scheme.onPrimaryContainer,
    );
  }

  factory StatusBadge.line(BuildContext context, String label) {
    final scheme = Theme.of(context).colorScheme;
    return StatusBadge(
      label: label,
      background: scheme.secondaryContainer,
      foreground: scheme.onSecondaryContainer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: foreground,
        ),
      ),
    );
  }
}

/// Carte bus (Phase 4) : numéro + trajet + badge.
/// Gabarit fin par défaut (compact: false pour l'ancien grand format).
class BusCard extends StatelessWidget {
  final BusFromDb bus;
  final VoidCallback onTap;
  final bool compact;

  const BusCard(
      {super.key,
      required this.bus,
      required this.onTap,
      this.compact = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final badgeSize = compact ? 44.0 : 56.0;
    return Card(
      margin: compact ? EdgeInsets.zero : null,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(compact ? 10 : 16),
          child: Row(
            children: [
              Container(
                width: badgeSize,
                height: badgeSize,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  bus.displayNumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: compact ? 15 : 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(width: compact ? 10 : 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      bus.source,
                      style: compact
                          ? theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700)
                          : theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          size: 14,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            bus.destination,
                            style: (compact
                                    ? theme.textTheme.bodySmall
                                    : theme.textTheme.bodyMedium)
                                ?.copyWith(
                              color: theme
                                  .colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    // if (bus.variantLabel.isNotEmpty) ...[
                    //   const SizedBox(height: 2),
                    //   // Text(bus.variantLabel,
                    //   //     style: theme.textTheme.bodySmall?.copyWith(
                    //   //         color: theme.colorScheme.onSurfaceVariant),
                    //   //     maxLines: 1,
                    //   //     overflow: TextOverflow.ellipsis),
                    // ],
                  ],
                ),
              ),
              SizedBox(width: compact ? 6 : 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (bus.isActive)
                    StatusBadge.active(context)
                  else
                    StatusBadge.line(context, "Ligne"),
                  SizedBox(height: compact ? 4 : 8),
                  Icon(
                    Icons.chevron_right,
                    size: compact ? 20 : 24,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Carte gare (Phase 4).
class GareCard extends StatelessWidget {
  final Gare gare;
  final VoidCallback onTap;

  const GareCard({super.key, required this.gare, required this.onTap});

  IconData get _icon => switch (gare.type) {
    TransportType.gbaka => Icons.directions_bus,
    TransportType.taxi => Icons.local_taxi,
    TransportType.bus => Icons.directions_bus_filled,
    TransportType.unknown => Icons.location_on,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _icon,
                  color: theme.colorScheme.onSecondaryContainer,
                  size: 22,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      gare.name,
                      style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      "${gare.type.label} • ${gare.commune}",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 20,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Carte itinéraire gare (Phase 4) : source <-> destination + type.
class ItineraryCard extends StatelessWidget {
  final ItineraireGare itinerary;
  final VoidCallback onTap;

  const ItineraryCard({
    super.key,
    required this.itinerary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${itinerary.source.name}  ↔  ${itinerary.destination.name}",
                      style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  StatusBadge.line(context, itinerary.type.label),
                  const SizedBox(width: 8),
                  Text(
                    itinerary.commune,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
