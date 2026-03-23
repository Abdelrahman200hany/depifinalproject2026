import 'dart:convert';

import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/serviecs/shared_prefs_services/shared_prefs.dart';
import 'package:depifinalproject/feature/auth/data/models/user_model.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';

UserEntity getUserData() {
  var jesonData = Prefs.getString(kUserDataSave);
  var userData = UserModel.fromjeson(jsonDecode(jesonData));
  return userData;
}
