abstract class DataBaseServies {
  // collection methods
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

  //  SUBCOLLECTION METHODS

  Future<void> addSubCollectionData({
    required String path,
    required String docId,
    required String subCollection,
    required Map<String, dynamic> data,
    String? subDocId,
  });

  Future<dynamic> readSubCollection({
    required String path,
    required String docId,
    required String subCollection,
    String? subCollectionDocId,
  });

  Future<void> updateSubCollectionData({
    required String path,
    required String docId,
    required String subCollection,
    required String subDocId,
    required Map<String, dynamic> data,
  });

  // Future<void> deleteSubCollectionData({
  //   required String path,
  //   required String docId,
  //   required String subCollection,
  //   required String subDocId,
  // });

  //
  // more fun logic

  // Future<void> setData({
  //   required String path,
  //   required String dataId,
  //   required Map<String, dynamic> data,
  // });

  // Future<void> mergeData({
  //   required String path,
  //   required String dataId,
  //   required Map<String, dynamic> data,
  // });

  // Stream<List<Map<String, dynamic>>> streamCollection({required String path});

  // Stream<List<Map<String, dynamic>>> streamSubCollection({
  //   required String path,
  //   required String docId,
  //   required String subCollection,
  // });
}
