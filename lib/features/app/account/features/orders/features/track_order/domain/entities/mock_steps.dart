import 'tracking_step.dart';

class MockSteps {
  static const List<TrackingStep> trackingSteps = [
    TrackingStep(
      title: 'Packing',
      time: 'Not defined yet',
      status: TrackingStatus.upcoming,
    ),
    TrackingStep(
      title: 'Picked',
      time: 'Not defined yet',
      status: TrackingStatus.upcoming,
    ),
    TrackingStep(
      title: 'In Transit',
      time: 'Not defined yet',
      status: TrackingStatus.upcoming,
    ),
    TrackingStep(
      title: 'Delivered',
      time: 'Not defined yet',
      status: TrackingStatus.upcoming,
    ),
  ];
}
