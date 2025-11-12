class CategoryModel {
  static String tableName = "category";
  final int? id;
  final String title;
  final String dateTime;

  CategoryModel({
    this.id,
    required this.title,
    required this.dateTime,
  });
}
