// import 'package:p12_basic_widgets/domain/entities/user.dart';
// import 'package:p12_basic_widgets/domain/enums/enum_app_state.dart';
// import 'package:p12_basic_widgets/domain/enums/enum_language.dart';
// import 'package:p12_basic_widgets/domain/enums/enum_mode.dart';

// class DatabaseRepository {
//   final List<User> _users;
//   final List<AppState> _appStates;
//   final AppState _currentAppstate;
//   bool _onDuty;
//   bool _smokeActive;
//   bool _alarmActive;
//   final Language _language;

//   DatabaseRepository(this._users, this._appStates, this._currentAppstate,
//       this._onDuty, this._smokeActive, this._alarmActive, this._language);

//   Future<void> setAppState(AppState appState) async {
//     Future.delayed(const Duration(seconds: 2));
//     AppState currentAppstate = appState;
//   }

//   Future<void> addUser(User user) async {
//     Future.delayed(const Duration(seconds: 2));
//     _users.add(user);
//   }

//   Future<void> deleteUser(User user) async {
//     Future.delayed(const Duration(seconds: 2));
//     _users.remove(user);
//   }

//   Future<void> setOnDuty() async {
//     Future.delayed(const Duration(seconds: 2));
//     _onDuty = true;
//   }

//   Future<void> setOffDuty() async {
//     Future.delayed(const Duration(seconds: 2));
//     _onDuty = false;
//   }

//   Future<void> setSmokeActive() async {
//     Future.delayed(const Duration(seconds: 2));
//     _smokeActive = true;
//   }

//   Future<void> setSmokeNonActive() async {
//     Future.delayed(const Duration(seconds: 2));
//     _smokeActive = false;
//   }

//   Future<void> setAlarmActive() async {
//     Future.delayed(const Duration(seconds: 2));
//     _alarmActive = true;
//   }

//   Future<void> setAlarmNonActive() async {
//     Future.delayed(const Duration(seconds: 2));
//     _alarmActive = false;
//   }

//   Future<void> setLanguage(Language language) async {
//     Future.delayed(const Duration(seconds: 2));
//     Language currentLanguage;
//     currentLanguage = language;
//   }

//   Future<void> setColorMode(Mode colorMode) async {
//     Future.delayed(const Duration(seconds: 2));
//     Mode currentMode;
//     currentMode = colorMode;
//   }

//   List<User> get users => _users;

//   List<AppState> get appStates => _appStates;

//   AppState get currentAppState => _currentAppstate;

//   bool get onDuty => _onDuty;

//   bool get smokeActive => _smokeActive;

//   bool get alarmActive => _alarmActive;
// }
