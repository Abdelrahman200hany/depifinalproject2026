abstract class DataBaseServies {
  //  add data to database
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  });

  //read data from data base
  Future<dynamic> readData({String? documentID, required String path});
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

  Future<dynamic> readSpecificData({
    required String path,
    Map<String, dynamic>? query,
  });

  Future<void> deletedata({required String path, required String dataId});
  Future<void> upDatadata({
    required String path,
    required String dataId,
    Map<String, dynamic>? data,
  });
}
