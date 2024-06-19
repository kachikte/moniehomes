import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniehomes/src/config/config.dart';
import 'package:moniehomes/src/presentation/providers/app_size_provider.dart';
import 'package:moniehomes/src/presentation/widgets/buttons/app_text_button.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = ref.watch(appSizeProvider);

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SizedBox(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: screenSize.height * .04,
                  horizontal: screenSize.width * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextButton(
                        width: screenSize.width * .35,
                        height: screenSize.height * .07,
                        buttonText: 'Saint Petersburg',
                        func: () {},
                        iconWidget: const Icon(
                          Icons.location_on_rounded,
                          color: AppColors.appText,
                          size: 16,
                        ),
                        backgroundColor: AppColors.appButton,
                        borderColor: AppColors.appButton,
                        textColor: AppColors.appText,
                      ),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.appWhite,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: ClipOval(
                              child: Image.asset(
                            AppImages.monieHomesProfilePicture,
                            fit: BoxFit.contain,
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Hi, Marina',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "let's select your\nperfect place",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Positioned(
                top: screenSize.height * .4,
                child: Container(
                  height: screenSize.height,
                  width: screenSize.width,
                  decoration: const BoxDecoration(
                      color: AppColors.appWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          height: screenSize.height * .35,
                          width: screenSize.width,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: ClipOval(
                            child: Image.asset(
                              AppImages.monieHomesWoodenInteriorLogoJpg,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
