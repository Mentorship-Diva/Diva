import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/extensions.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/no_notifications.png',
              width: context.screenWidth / 2,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'No Notifications yet',
            ),
          ],
        ),
      ),
    );
  }
}
