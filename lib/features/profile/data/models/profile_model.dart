class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl; // We will use the dicebear seed here
  final String subscriptionTier;

  // Mutable Data (The North Star & Context)
  String northStarGoal;
  String coachTone;
  String workoutStyle;
  String equipment;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.subscriptionTier,
    required this.northStarGoal,
    required this.coachTone,
    required this.workoutStyle,
    required this.equipment,
  });

  // Ready for your Rails Backend GET request
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String,
      subscriptionTier: json['subscriptionTier'] as String,
      northStarGoal: json['northStarGoal'] as String,
      coachTone: json['coachTone'] as String,
      workoutStyle: json['workoutStyle'] as String,
      equipment: json['equipment'] as String,
    );
  }

  // Ready for your Rails Backend POST/PUT request
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'subscriptionTier': subscriptionTier,
      'northStarGoal': northStarGoal,
      'coachTone': coachTone,
      'workoutStyle': workoutStyle,
      'equipment': equipment,
    };
  }
}
