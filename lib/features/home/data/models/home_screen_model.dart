import '../../../../core/constants/enums.dart';

sealed class HomeScreenModel {
  final String username;
  final HomeScreenEnum state;

  HomeScreenModel({required this.username, required this.state});
}

class ActionRequiredModel extends HomeScreenModel {
  final int streak;
  final String? inAppMessage;
  final String targetTime;

  ActionRequiredModel({
    required super.username,
    required super.state,
    required this.streak,
    required this.inAppMessage,
    required this.targetTime,
  });

  factory ActionRequiredModel.fromJson(Map<String, dynamic> json) {
    return ActionRequiredModel(
      username: json['username'],
      state: HomeScreenEnum.fromJsonKey(json['state']),
      streak: json['streak'],
      inAppMessage: json['in_app_message'],
      targetTime: json['target_time'],
    );
  }
}

class CompletedModel extends HomeScreenModel {
  final int streak;
  final String nextContractDay;

  CompletedModel({
    required super.username,
    required super.state,
    required this.streak,
    required this.nextContractDay,
  });

  factory CompletedModel.fromJson(Map<String, dynamic> json) {
    return CompletedModel(
      username: json['username'],
      state: HomeScreenEnum.fromJsonKey(json['state']),
      streak: json['streak'],
      nextContractDay: json['next_contract_day'],
    );
  }
}

class SkippedModel extends HomeScreenModel {
  final String excuseMessage;

  SkippedModel({
    required super.username,
    required super.state,
    required this.excuseMessage,
  });

  factory SkippedModel.fromJson(Map<String, dynamic> json) {
    return SkippedModel(
      username: json['username'],
      state: HomeScreenEnum.fromJsonKey(json['state']),
      excuseMessage: json['excuse_message'],
    );
  }
}

class RestDayModel extends HomeScreenModel {
  final int streak;

  RestDayModel({
    required super.username,
    required super.state,
    required this.streak,
  });

  factory RestDayModel.fromJson(Map<String, dynamic> json) {
    return RestDayModel(
      username: json['username'],
      state: HomeScreenEnum.fromJsonKey(json['state']),
      streak: json['streak'],
    );
  }
}

class SetupRequiredModel extends HomeScreenModel {
  SetupRequiredModel({required super.username, required super.state});

  factory SetupRequiredModel.fromJson(Map<String, dynamic> json) {
    return SetupRequiredModel(
      username: json['username'],
      state: HomeScreenEnum.fromJsonKey(json['state']),
    );
  }
}
