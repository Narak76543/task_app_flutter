class TaskModel {
  final int? id;
  final String title;
  final String description;
  final String startDateTime;
  final String endDateTime;
  final String dateTime;


  TaskModel(
      {
        this.id,
        required this.title,
        required this.description,
        required this.startDateTime,
        required this.endDateTime,
        required this.dateTime
      });
}