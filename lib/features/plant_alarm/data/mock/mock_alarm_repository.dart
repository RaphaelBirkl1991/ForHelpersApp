import 'package:p12_basic_widgets/features/plant_alarm/data/database_alarm_repository.dart';
import 'package:p12_basic_widgets/features/plant_alarm/data/mock/mock_alarm_service.dart';

class MockAlarmRepository implements DatabaseAlarmRepository {
  final MockAlarmService mockAlarmService;

  MockAlarmRepository(this.mockAlarmService);

  @override
  Future<void> createAlarmSignal() async {
    mockAlarmService.createAlarm();
  }

  @override
  Future<void> deleteAlarmSignal() async {
    mockAlarmService.deleteAlarm();
  }
}
