import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/other_profile_user_view_body.dart';
import 'package:flutter/material.dart';

class OtherProfileUserView extends StatelessWidget {
  const OtherProfileUserView({super.key, required this.delivery});
  final DeliveryEntity delivery;

  static const String routeName = 'OtherProfileUserView';

  @override
  Widget build(BuildContext context) {
    return OtherProfileUserViewBody(delivery: delivery);
  }
}
