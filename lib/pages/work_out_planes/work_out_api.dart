//https://127.0.0.1:8000/api/workoutplan/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgenie/pages/work_out_planes/work_out_model/work_out_model.dart';

import '../../core/data_manger/data_manger.dart';

// class WorkOutApiManger {
//   static Future<WorkOutPlansModel> fetchWorkOutData() async {
//     // Uri uri = Uri.https(
//     //     "https://127.0.0.1:8000/api/workoutplan/"
//     // );
//     Map<String , dynamic> response = {
//       "Cardio": {
//         "Type of exercises": "Running, Cycling, Swimming",
//         "Duration and frequency of workouts": "30-45 minutes, 3-4 times a week",
//         "Intensity level": "Moderate",
//         "Specific exercises or routines": "Jogging, Biking, Freestyle swimming",
//         "Calories burnt": "300-400 calories"
//       },
//       "Strength Training": {
//         "Type of exercises": "(squats, lunges, push-ups, rows)",
//         "Duration and frequency of workouts": "45-60 minutes, 2-3 times a week",
//         "Intensity level": "Moderate-High",
//         "Specific exercises or routines": "Barbell squats, Dumbbell lunges, Bench press, Barbell rows",
//         "Calories burnt": "250-350 calories"
//       },
//       "Flexibility": {
//         "Type of exercises": "Yoga, Pilates, Stretching",
//         "Duration and frequency of workouts": "20-30 minutes, 1-2 times a week",
//         "Intensity level": "Low-Moderate",
//         "Specific exercises or routines": "Sun salutations, Downward-facing dog, Child's pose, Quad stretches",
//         "Calories burnt": "100-150 calories"
//       }
//     };
//     return WorkOutPlansModel.fromJson(response);
//     // final response = await http.get(uri);
//     // if (response.statusCode == 200 && jsonDecode(response.body)['status'] == 'ok') {
//     //   return WorkOutPlansModel.fromJson(jsonDecode(response.body));
//     // } else {
//     //   throw Exception('Failed to load Source');
//     // }
//   }
// }

class WorkOutAPIMangerFirebase {
  static Future<WorkOutPlansModel> fetchWorkOutData(
      {required String email}) async {
    print('featching work out data');

    CollectionReference WorkOutsData =
        FirebaseFirestore.instance.collection('workout');

    try {
      QuerySnapshot querySnapshot =
          await WorkOutsData.where('user', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        // Fetch the first document in the snapshot
        var userData = querySnapshot.docs.first['data'];
        print('-------------------------------------------------------------');
        print('userData: $userData');
        print('-------------------------------------------------------------');
        print('before parse');
        //String data = 'Type of exercises: Strength-training, cardio, flexibilityDuration and frequency of workouts: 60 minutes, 4 times a weekIntensity level: Moderate to highSpecific exercises or routines:- Squats (3 sets of 10 reps) - 100 calories- Lunges (3 sets of 10 reps per leg) - 80 calories- Push-ups (3 sets of 10 reps) - 70 calories- Pull-ups (3 sets of 10 reps) - 60 calories- Bench press (3 sets of 10 reps) - 80 calories- Overhead press (3 sets of 10 reps) - 70 calories- Rows (3 sets of 10 reps) - 60 calories- Bicep curls (3 sets of 10 reps) - 50 calories- Triceps extensions (3 sets of 10 reps) - 40 calories- Cardio (30 minutes of running or cycling) - 250 calories- Flexibility (10 minutes of stretching) - 30 calories';
        WorkOutPlansModel parsedData = parseWorkoutData(userData);
        print('after parse');
        print('-------------------------------------------------------------');

        print('-------------------------------------------------------------');
        return parsedData;
      } else {
        print('User data not found');
        return WorkOutPlansModel();
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return WorkOutPlansModel();
    }
  }
}