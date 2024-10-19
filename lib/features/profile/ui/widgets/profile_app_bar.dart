import 'package:flutter/material.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black))),
      Text('Profile', style: AppTextStyles.font24BlackSemiBold),
      CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.add_shopping_cart_sharp, color: Colors.black)),
      )
    ]);
  }
}
