import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniehomes/src/config/config.dart';
import 'package:moniehomes/src/presentation/providers/providers.dart';
import 'package:moniehomes/src/presentation/widgets/widgets.dart';

class IntroWidget extends ConsumerWidget {
  final String image;
  final String titleText;
  final String bodyText;

  const IntroWidget(
      {required this.image, required this.titleText, required this.bodyText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(appSizeProvider);

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            image,
            height: size.height * .3,
          ),
          Text(
            titleText, textAlign: TextAlign.center,
            // 'Creating Career\nPortfolio With Fun', textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            bodyText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppElevatedButton(
                height: size.height * .07,
                width: size.width * .35,
                buttonText: 'Sign up',
                func: () {
                  log('This is the signup button');
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return FractionallySizedBox(
                          widthFactor: 1.0,
                          child: Container(
                            height: size.height * .45,
                            padding: EdgeInsets.symmetric(horizontal: size.width * .05, vertical: size.height * .02),
                            decoration: const BoxDecoration(
                                color: AppColors.appBackground,
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(25),
                                    right: Radius.circular(25))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          AutoRouter.of(context).maybePop(),
                                      child: const CircleAvatar(
                                        backgroundColor: AppColors.appGrey,
                                        radius: 10,
                                        child: Icon(
                                          Icons.close,
                                          color: AppColors.appBackground,
                                          size: 10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                AppTextButton(
                                  width: size.width * .9,
                                  height: size.height * .07,
                                  buttonText: 'Sign up with email',
                                  func: () {
                                    log('Signup with email');
                                  },
                                  iconWidget: const Icon(
                                    Icons.mail_outline_outlined,
                                    color: AppColors.appBackground,
                                  ),
                                ),
                                AppTextButton(
                                  width: size.width * .9,
                                  height: size.height * .07,
                                  buttonText: 'Continue with Twitter',
                                  func: () {
                                    log('Signup with twitter');
                                  },
                                  iconWidget: const Icon(
                                    Icons.mail_outline_outlined,
                                    color: AppColors.appBackground,
                                  ),
                                ),
                                AppTextButton(
                                  width: size.width * .9,
                                  height: size.height * .07,
                                  buttonText: 'Sign up with email',
                                  func: () {
                                    log('Signup with email');
                                  },
                                  iconWidget: const Icon(
                                    Icons.mail_outline_outlined,
                                    color: AppColors.appBackground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
              AppTextButton(
                height: size.height * .07,
                width: size.width * .35,
                buttonText: 'Log in',
                func: () {
                  log('This is the login button');
                },
                backgroundColor: AppColors.appBackground,
                textColor: AppColors.primaryColor,
                borderColor: AppColors.appGrey,
              )
            ],
          ),
          AppTextButton(
            height: size.height * .07,
            width: size.width * .4,
            buttonText: 'Continue as Guest',
            func: () {
              log('This is the Continue as Guest button');
            },
            backgroundColor: AppColors.appBackground,
            textColor: AppColors.primaryColor,
            borderColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
