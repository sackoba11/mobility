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

  factory StatusBadge.active(BuildContext context, {String label = "En service"}) {
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
class BusCard extends StatelessWidget {
  final BusFromDb bus;
  final VoidCallback onTap;

  const BusCard({super.key, required this.bus, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: Text(
                  bus.number.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bus.source,
                        style: theme.textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.arrow_downward,
                            size: 14,
                            color: theme.colorScheme.onSurfaceVariant),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(bus.destination,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme
                                      .colorScheme.onSurfaceVariant),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (bus.isActive)
                    StatusBadge.active(context)
                  else
                    StatusBadge.line(context, "Ligne"),
                  const SizedBox(height: 8),
                  Icon(Icons.chevron_right,
                      color: theme.colorScheme.onSurfaceVariant),
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
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(_icon,
                    color: theme.colorScheme.onSecondaryContainer),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(gare.name,
                        style: theme.textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text("${gare.type.label} • ${gare.commune}",
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color:
                                theme.colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right,
                  color: theme.colorScheme.onSurfaceVariant),
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

  const ItineraryCard(
      {super.key, required this.itinerary, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${itinerary.source.name}  ↔  ${itinerary.destination.name}",
                      style: theme.textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  StatusBadge.line(context, itinerary.type.label),
                  const SizedBox(width: 8),
                  Text(itinerary.commune,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant)),
                  const Spacer(),
                  Icon(Icons.chevron_right,
                      color: theme.colorScheme.onSurfaceVariant),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
