enum TrackingStatus { completed, current, upcoming }

class TrackingStep {
  final String title;
  final String time;
  final TrackingStatus status;

  const TrackingStep({
    required this.title,
    required this.time,
    required this.status,
  });
}
