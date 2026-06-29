import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(height: 45),

        Text(
          getUserData().name ,

          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 5),

        Text(
                  getUserData().userType ,
  

          style: TextStyle(color: Color(0xff1E6DEB), fontSize: 15),
        ),
      ],
    );
  }
}
