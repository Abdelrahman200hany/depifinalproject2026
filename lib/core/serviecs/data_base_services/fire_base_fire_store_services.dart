import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/data_base_services.dart';

class FireStoreServices implements DataBaseServies {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  // add data to database with  or withOut DocIC
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  }) async {
    if (documentID == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(documentID).set(data);
    }
  }

  @override
  // Read data from database with secail Doc ID
  Future<dynamic> readData({String? documentID, required String path}) async {
    if (documentID != null) {
      var data = await firestore.collection(path).doc(documentID).get();
      return data.data() as Map<String, dynamic>;
    } else {
      var data = await firestore.collection(path).get();
      return data.docs.map((e) => e.data()).toList();
    }
  }

  @override
  // check  user Data was found in data base or not
  Future<bool> chekedDataIfExitsinDatabase({
    required String path,
    required String deumentID,
  }) async {
    var userIsExits = await firestore.collection(path).doc(deumentID).get();

    return userIsExits.exists;
  }

  @override
  // Fillering data
  Future<List<Map<String, dynamic>>> readWhereData({
    required String path,
    required String field,
    required value,
  }) async {
    var querySnapshot = await firestore
        .collection(path)
        .where(field, isEqualTo: value)
        .get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<dynamic> readSpecificData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    Query<Map<String, dynamic>> data = firestore.collection(path);

    if (query != null) {
      query.forEach((key, value) {
        data = data.where(key, isEqualTo: value);
      });
    }
    var result = await data.get();
    return result.docs.map((e) => e.data()).toList();
  }

  @override
  Future<void> deletedata({
    required String path,
    required String dataId,
  }) async {
    await firestore.collection(path).doc(dataId).delete();
  }

  @override
  Future<void> upDatadata({
    required String path,
    required String dataId,
    Map<String, dynamic>? data,
  }) async {
    if (data != null) {
      await firestore.collection(path).doc(dataId).update(data);
    }
    null;
  }

  @override
  Future<void> addSubCollectionData({
    required String path,
    required String docId,
    required String subCollection,
    required Map<String, dynamic> data,
    String? subDocId,
  }) async {
    if (subDocId != null) {
      await firestore
          .collection(path)
          .doc(docId)
          .collection(subCollection)
          .doc(subDocId)
          .set(data);
    } else {
      await firestore
          .collection(path)
          .doc(docId)
          .collection(subCollection)
          .add(data);
    }
  }

  // @override
  // Future<dynamic> readSubCollection({
  //   required String path,
  //   required String docId,
  //   required String subCollection,
  //   String? subCollectionDocId,
  // }) async {
  //   if (subCollectionDocId != null) {
  //     var data = await firestore
  //         .collection(path)
  //         .doc(docId)
  //         .collection(subCollection)
  //         .doc(subCollectionDocId)
  //         .get();

  //     return data.data() as Map<String, dynamic>;
  //   }
  //   var data = await firestore
  //       .collection(path)
  //       .doc(docId)
  //       .collection(subCollection)
  //       .get();

  //   return data.docs.map((e) => e.data()).toList();
  // }
  @override
  Future<dynamic> readSubCollection({
    required String path,
    required String docId,
    required String subCollection,
    String? subCollectionDocId,
    Map<String, dynamic>? query,
  }) async {
    if (subCollectionDocId != null) {
      var data = await firestore
          .collection(path)
          .doc(docId)
          .collection(subCollection)
          .doc(subCollectionDocId)
          .get();

      return data.data() as Map<String, dynamic>;
    }

    Query<Map<String, dynamic>> data = firestore
        .collection(path)
        .doc(docId)
        .collection(subCollection);

    if (query != null) {
      query.forEach((key, value) {
        data = data.where(key, isEqualTo: value);
      });
    }

    var result = await data.get();

    return result.docs.map((e) => e.data()).toList();
  }

  @override
  Future<void> updateSubCollectionData({
    required String path,
    required String docId,
    required String subCollection,
    required String subDocId,
    required Map<String, dynamic> data,
  }) async {
    await firestore
        .collection(path)
        .doc(docId)
        .collection(subCollection)
        .doc(subDocId)
        .update(data);
  }

  // ==============================
  // Stream Collection
  // ==============================

  @override
  Stream<List<Map<String, dynamic>>> streamCollection({required String path}) {
    return firestore
        .collection(path)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  // ==============================
  // Stream Collection Where
  // ==============================

  @override
  Stream<List<Map<String, dynamic>>> streamCollectionWhere({
    required String path,
    required String field,
    required dynamic value,
  }) {
    return firestore
        .collection(path)
        .where(field, arrayContains: value)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  // ==============================
  // Stream SubCollection
  // ==============================

  @override
  Stream<List<Map<String, dynamic>>> streamSubCollection({
    required String path,
    required String docId,
    required String subCollection,
  }) {
    return firestore
        .collection(path)
        .doc(docId)
        .collection(subCollection)
        .orderBy("createdAt", descending: false)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  // ==============================
  // Stream SubCollection Where
  // ==============================

  @override
  Stream<List<Map<String, dynamic>>> streamSubCollectionWhere({
    required String path,
    required String docId,
    required String subCollection,
    required String field,
    required dynamic value,
  }) {
    return firestore
        .collection(path)
        .doc(docId)
        .collection(subCollection)
        .where(field, isEqualTo: value)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  // ==============================
  // Array Contains
  // ==============================

  @override
  Future<List<Map<String, dynamic>>> readWhereArrayContains({
    required String path,
    required String field,
    required dynamic value,
  }) async {
    final result = await firestore
        .collection(path)
        .where(field, arrayContains: value)
        .get();

    return result.docs.map((e) => e.data()).toList();
  }

  // ==============================
  // Array Contains + OrderBy
  // ==============================

  @override
  Future<List<Map<String, dynamic>>> readWhereArrayContainsOrderBy({
    required String path,
    required String field,
    required dynamic value,
    required String orderBy,
    bool descending = true,
  }) async {
    final result = await firestore
        .collection(path)
        .where(field, arrayContains: value)
        .orderBy(orderBy, descending: descending)
        .get();

    return result.docs.map((e) => e.data()).toList();
  }

  // ==============================
  // Ordered Collection
  // ==============================

  @override
  Future<List<Map<String, dynamic>>> readOrderedCollection({
    required String path,
    required String orderBy,
    bool descending = true,
  }) async {
    final result = await firestore
        .collection(path)
        .orderBy(orderBy, descending: descending)
        .get();

    return result.docs.map((e) => e.data()).toList();
  }

  // ==============================
  // Ordered SubCollection
  // ==============================

  @override
  Future<List<Map<String, dynamic>>> readOrderedSubCollection({
    required String path,
    required String docId,
    required String subCollection,
    required String orderBy,
    bool descending = true,
  }) async {
    final result = await firestore
        .collection(path)
        .doc(docId)
        .collection(subCollection)
        .orderBy(orderBy, descending: descending)
        .get();

    return result.docs.map((e) => e.data()).toList();
  }
}
