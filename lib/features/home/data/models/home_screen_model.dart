sealed class HomeScreenModel {
  final String title;
  final String message;

  HomeScreenModel(this.title, this.message);
}

class ActionRequired extends HomeScreenModel {
  ActionRequired(super.title, super.message);
}

class CompleteWorkout extends HomeScreenModel {
  CompleteWorkout(super.title, super.message);
}
