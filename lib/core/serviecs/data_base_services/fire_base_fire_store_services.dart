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
}
