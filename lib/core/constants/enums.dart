enum HomeScreenStateEnum {
  setupRequired, // Maps to "setup_required"
  restDay, // Maps to "rest_day"
  actionRequired, // Maps to "action_required"
  completed, // Maps to "completed"
  skipped; // Maps to "skipped"

  factory HomeScreenStateEnum.fromJsonKey(String jsonKey) {
    switch (jsonKey) {
      case 'setup_required':
        return HomeScreenStateEnum.setupRequired;
      case 'rest_day':
        return HomeScreenStateEnum.restDay;
      case 'action_required':
        return HomeScreenStateEnum.actionRequired;
      case 'completed':
        return HomeScreenStateEnum.completed;
      case 'skipped':
        return HomeScreenStateEnum.skipped;
      default:
        throw Exception('Unknown HomeScreenStateEnum: $jsonKey');
    }
  }
}
