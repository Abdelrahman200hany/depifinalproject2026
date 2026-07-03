import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/feature/main_view/domain/repo/user_repo.dart';

class UserRepoImpl extends UserRepo {
  @override
  String getUserType() {
    return getUserData().userType;
  }
}
