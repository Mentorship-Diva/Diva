import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';

import '../../../../generated/l10n.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int count = 1;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 8,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color:
                  isSelected ? AppColors.mainColor : AppColors.lightGreyColor,
              width: isSelected ? 1.5 : .5,
            ),
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.cartGirl,
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 80.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Elegant wrapped dress',
                      ),
                      Text(
                        '550 L.E',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.mainColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 2,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count > 0) {
                                    count--;
                                  }
                                });
                              },
                              child: Icon(
                                CupertinoIcons.minus,
                                color: AppColors.whiteColor,
                                size: 14,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                count.toString(),
                                style: AppTextStyles.font14WhiteSemiBold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.add,
                                color: AppColors.whiteColor,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.mainColor
                            : AppColors.lightGreyColor,
                        width: isSelected ? 5 : 1,
                      ),
                    ),
                    padding: EdgeInsets.all(1),
                    width: 15,
                    height: 15,
                  ),
                  Text(
                    S.of(context).edit,
                    style: AppTextStyles.font14Pink400UnderLine,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
