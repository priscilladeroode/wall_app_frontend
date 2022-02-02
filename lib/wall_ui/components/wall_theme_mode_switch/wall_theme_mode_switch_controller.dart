import '../../../commons/stores/app_store.dart';

class WallThemeModeSwitcherController {
  final AppStore store;

  WallThemeModeSwitcherController(this.store);

  void changeMode() {
    store.setThemeMode();
  }
}
