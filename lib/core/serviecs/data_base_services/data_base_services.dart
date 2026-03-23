abstract class DataBaseServies {
  //  add data to database
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  });

  //read data from data base
  Future<Map<String, dynamic>> readData({
    required String documentID,
    required String path,
  });
  // check if user data was found or not
  Future<bool> chekedDataIfExitsinDatabase({
    required String path,
    required String deumentID,
  });
  // Fillering data
  Future<List<Map<String, dynamic>>> readWhereData({
    required String path,
    required String field,
    required dynamic value,
  });
}
