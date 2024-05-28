class WorkOutPlansModel {
  WorkOutTypes? cardio;
  WorkOutTypes? strengthTraining;
  WorkOutTypes? flexibility;

  WorkOutPlansModel({this.cardio, this.strengthTraining, this.flexibility});

  WorkOutPlansModel.fromJson(Map<String, dynamic> json) {
    cardio = json['Cardio'] != null ? WorkOutTypes.fromJson(json['Cardio']) : null;
    strengthTraining = json['Strength Training'] != null
        ? WorkOutTypes.fromJson(json['Strength Training'])
        : null;
    flexibility = json['Flexibility'] != null
        ? WorkOutTypes.fromJson(json['Flexibility'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cardio != null) {
      data['Cardio'] = cardio!.toJson();
    }
    if (strengthTraining != null) {
      data['Strength Training'] = strengthTraining!.toJson();
    }
    if (flexibility != null) {
      data['Flexibility'] = flexibility!.toJson();
    }
    return data;
  }
}

class WorkOutTypes {
  String? typeOfExercises;
  String? durationAndFrequencyOfWorkouts;
  String? intensityLevel;
  String? specificExercisesOrRoutines;
  String? caloriesBurnt;

  WorkOutTypes(
      {this.typeOfExercises,
        this.durationAndFrequencyOfWorkouts,
        this.intensityLevel,
        this.specificExercisesOrRoutines,
        this.caloriesBurnt});

  WorkOutTypes.fromJson(Map<String, dynamic> json) {
    typeOfExercises = json['Type of exercises'];
    durationAndFrequencyOfWorkouts = json['Duration and frequency of workouts'];
    intensityLevel = json['Intensity level'];
    specificExercisesOrRoutines = json['Specific exercises or routines'];
    caloriesBurnt = json['Calories burnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Type of exercises'] = typeOfExercises;
    data['Duration and frequency of workouts'] =
        durationAndFrequencyOfWorkouts;
    data['Intensity level'] = intensityLevel;
    data['Specific exercises or routines'] = specificExercisesOrRoutines;
    data['Calories burnt'] = caloriesBurnt;
    return data;
  }
}
