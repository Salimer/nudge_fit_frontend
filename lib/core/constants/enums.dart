enum HomeScreenEnum {
  setupRequired, // Maps to "setup_required"
  restDay, // Maps to "rest_day"
  actionRequired, // Maps to "action_required"
  completed, // Maps to "completed"
  skipped; // Maps to "skipped"

  factory HomeScreenEnum.fromJsonKey(String jsonKey) {
    switch (jsonKey) {
      case 'setup_required':
        return HomeScreenEnum.setupRequired;
      case 'rest_day':
        return HomeScreenEnum.restDay;
      case 'action_required':
        return HomeScreenEnum.actionRequired;
      case 'completed':
        return HomeScreenEnum.completed;
      case 'skipped':
        return HomeScreenEnum.skipped;
      default:
        throw Exception('Unknown HomeScreenStateEnum: $jsonKey');
    }
  }
}
