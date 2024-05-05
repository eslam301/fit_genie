class WorkData {
  static const List<Map<String, dynamic>> workOutData = [
    {
      "title": "Cardio",
      "subtitle": "treadmill",
      "description": "30 m",
    },
    {
      "title": "Leg",
      "subtitle": "Squad",
      "description": "4x12",
    },
  ];
  static List<Map<String, dynamic>> getWorkOutData() {
    return workOutData;
  }
}
