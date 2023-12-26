import 'package:p12_basic_widgets/entities/user.dart';
import 'package:p12_basic_widgets/enums/enum_app-state.dart';

class DatabaseRepository {
  List<User> _users;
  List<AppState> _appStates;
  AppState _currentAppstate;
  bool _onDuty;
  bool _smokeActive;
  bool _alarmActive;

  DatabaseRepository(this._users, this._appStates, this._currentAppstate,
      this._onDuty, this._smokeActive, this._alarmActive);

  void setAppState(AppState appState) {
    AppState currentAppstate = appState;
  }

  void addUser(User user) => _users.add(user);

  void deleteUser(User user) => _users.remove(user);

  void setOnDuty() => _onDuty = true;

  void setOffDuty() => _onDuty = false;

  void setSmokeActive() => _smokeActive = true;

  void setSmokeNonActive() => _smokeActive = false;

  void setAlarmActive() => _alarmActive = true;

  void setAlarmNonActive() => _alarmActive = false;

  List<User> get users => _users;

  List<AppState> get appStates => _appStates;

  AppState get currentAppState => _currentAppstate;

  bool get onDuty => _onDuty;

  bool get smokeActive => _smokeActive;

  bool get alarmActive => _alarmActive;
}
