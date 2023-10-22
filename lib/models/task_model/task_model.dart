class TaskModel {
  static String name = "task";
  String title;
  String describtion;

  int dateTime;
  String id;
  bool isDone;

  TaskModel(
      {required this.title,
      required this.dateTime,
      required this.describtion,
      this.isDone = true,
      this.id = ""});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json["title"] as String,
          describtion: json["describtion"] as String,
          dateTime: json["dateTime"] as int,
          id: json["id"] as String,
          isDone: json["isDone"] as bool,
        );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "describtion": describtion,
      "dateTime": dateTime,
      "id": id,
      "isDone": isDone,
    };
  }
}
