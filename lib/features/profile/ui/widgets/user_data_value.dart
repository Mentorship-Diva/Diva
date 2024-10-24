import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDataValue extends StatelessWidget {
  const UserDataValue({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
            ),
            Text(
              value,
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Divider(),
      ],
    );
  }
}
