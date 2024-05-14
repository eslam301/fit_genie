//https://127.0.0.1:8000/api/workoutplan/
import 'dart:convert';

import 'package:fitgenie/pages/work_out_planes/work_out_model/work_out_model.dart';
import 'package:http/http.dart' as http;

class WorkOutApiManger {
  static Future<WorkOutPlansModel> fetchWorkOutData() async {
    // Uri uri = Uri.https(
    //     "https://127.0.0.1:8000/api/workoutplan/"
    // );
    Map<String , dynamic> response = {
      "Cardio": {
        "Type of exercises": "Running, Cycling, Swimming",
        "Duration and frequency of workouts": "30-45 minutes, 3-4 times a week",
        "Intensity level": "Moderate",
        "Specific exercises or routines": "Jogging, Biking, Freestyle swimming",
        "Calories burnt": "300-400 calories"
      },
      "Strength Training": {
        "Type of exercises": "Compound exercises (e.g., squats, lunges, push-ups, rows)",
        "Duration and frequency of workouts": "45-60 minutes, 2-3 times a week",
        "Intensity level": "Moderate-High",
        "Specific exercises or routines": "Barbell squats, Dumbbell lunges, Bench press, Barbell rows",
        "Calories burnt": "250-350 calories"
      },
      "Flexibility": {
        "Type of exercises": "Yoga, Pilates, Stretching",
        "Duration and frequency of workouts": "20-30 minutes, 1-2 times a week",
        "Intensity level": "Low-Moderate",
        "Specific exercises or routines": "Sun salutations, Downward-facing dog, Child's pose, Quad stretches",
        "Calories burnt": "100-150 calories"
      }
    };
    print('response : $response');
    return WorkOutPlansModel.fromJson(response);
    // final response = await http.get(uri);
    // if (response.statusCode == 200 && jsonDecode(response.body)['status'] == 'ok') {
    //   return WorkOutPlansModel.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('Failed to load Source');
    // }
  }
}