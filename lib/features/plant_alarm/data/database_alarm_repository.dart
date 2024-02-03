abstract class DatabaseAlarmRepository {
  Future<void> createAlarmSignal();
  Future<void> deleteAlarmSignal();
}
