convertToDate (String dateString) {
  try {
    DateTime dateTime = DateTime.parse(dateString);
    return "${dateTime.day.toString().padLeft(2,'0')}-${dateTime.month.toString().padLeft(2,'0')}-${dateTime.year} ";
  } catch (e) {
    return  "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ";
  }
}