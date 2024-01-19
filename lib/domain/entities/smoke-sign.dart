class SmokeSign {
  String description;
  bool smokeActive;

  SmokeSign(this.description, this.smokeActive);

  void activateSmoke() => smokeActive = true;

  void cancelSmoke() => smokeActive = false;
}
