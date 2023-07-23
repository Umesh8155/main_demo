import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:main_demo/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_colors.dart';
import '../app_styles.dart';
import '../lang_directory/language_constant.dart';

showRatingDialog() {
  double ratingValue = 0.0;
  showDialog(
    context: Get.context!,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColors.transparentColor,
        insetPadding: EdgeInsets.all(20.w),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              color: AppColors.whiteColor),
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              5.h.height(),
              Text(
                "Rate this app",
                style: AppStyles.blackBold18,
              ),
              25.h.height(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    glow: false,
                    unratedColor: AppColors.greyColor,
                    itemSize: 45.sp,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: AppColors.primaryColor,
                    ),
                    onRatingUpdate: (rating) {
                      ratingValue = rating;
                    },
                  )
                ],
              ),
              25.h.height(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: Text(
                          "Not Now",
                          style: AppStyles.blackBold16
                              .copyWith(color: AppColors.primaryColor),
                        )),
                  ),
                  InkWell(
                    onTap: () async {
                      Get.back();
                      if (ratingValue > 3) {
                        String appLink = "app link";

                        await launch(appLink);

                      } else {
                        final Uri params = Uri(
                            scheme: 'mailto',
                            path: "main@gmail.com",
                            queryParameters: {
                              'subject':
                                  '${LanguageConstant.appLabel.tr} Review',
                            });
                        String url = params.toString();

                        await launch(url);
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        child: Text(
                          "OK",
                          style: AppStyles.blackBold16
                              .copyWith(color: AppColors.primaryColor),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
