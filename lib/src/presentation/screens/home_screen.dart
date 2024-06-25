import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniehomes/src/config/config.dart';
import 'package:moniehomes/src/presentation/providers/app_size_provider.dart';
import 'package:moniehomes/src/presentation/widgets/widgets.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..forward();

  late final Animation<double> _animation = Tween<double>(
    begin: 0,
    end: 400,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));

  late final AnimationController _buttonController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<double> _buttonAnimation = CurvedAnimation(
    parent: _buttonController,
    curve: Curves.easeIn,
  );

  late final AnimationController _avatarController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<double> _avatarAnimation = CurvedAnimation(
    parent: _avatarController,
    curve: Curves.easeIn,
  );

  late final AnimationController _radiusController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<double> _radiusAnimation = Tween<double>(
    begin: 0,
    end: 25,
  ).animate(CurvedAnimation(parent: _radiusController, curve: Curves.easeIn));

  late final AnimationController _textController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<Offset> _textAnimation = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

  late final AnimationController _buyController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<int> _buyAnimation = IntTween(
    begin: 0,
    end: 1034,
  ).animate(CurvedAnimation(parent: _buyController, curve: Curves.easeIn));

  late final AnimationController _rentController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<int> _rentAnimation = IntTween(
    begin: 0,
    end: 2212,
  ).animate(CurvedAnimation(parent: _rentController, curve: Curves.easeIn));

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _buttonController.forward();
    _avatarController.forward();
    _radiusController.forward();
    _textController.forward();
    _buyController.forward();
    _rentController.forward();
  }

  void _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _buttonController.dispose();
    _avatarController.dispose();
    _radiusController.dispose();
    _textController.dispose();
    _buyController.dispose();
    _rentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = ref.watch(appSizeProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(.001),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, widget) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.appBackground,
                  expandedHeight: screenSize.height * .6,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            AppColors.appWhite,
                            AppColors.appWhite.withOpacity(.9),
                            AppColors.appWhite.withOpacity(.7),
                            AppColors.appWhite.withOpacity(.5),
                            AppColors.appWhite.withOpacity(.3),
                            AppColors.appWhite.withOpacity(.1),
                            AppColors.primaryColor.withOpacity(.1)
                          ])),
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.height * .02,
                          horizontal: screenSize.width * .04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedBuilder(
                                animation: _buttonAnimation,
                                builder: (context, child) {
                                  return AnimatedOpacity(
                                    opacity: _buttonAnimation.value,
                                    duration: const Duration(seconds: 1),
                                    child: AppTextButton(
                                      width: screenSize.width * .4,
                                      height: screenSize.height * .06,
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
                                  );
                                },
                              ),
                              AnimatedBuilder(
                                animation: Listenable.merge(
                                    [_avatarAnimation, _radiusAnimation]),
                                builder: (context, child) {
                                  return AnimatedOpacity(
                                    opacity: _avatarAnimation.value,
                                    duration: const Duration(seconds: 1),
                                    child: CircleAvatar(
                                      radius: _radiusAnimation.value,
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
                                          AppImages.monieHomesProfilePicturePng,
                                          fit: BoxFit.contain,
                                        )),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SlideTransition(
                            position: _textAnimation,
                            child: Text(
                              'Hi, Marina',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          SlideTransition(
                            position: _textAnimation,
                            child: Text(
                              "let's select your\nperfect place",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                radius:
                                    screenSize.height / screenSize.width * 45,
                                child: Container(
                                  padding: const EdgeInsets.all(17),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'BUY',
                                        style: TextStyle(
                                            color: AppColors.appWhite,
                                            fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      AnimatedBuilder(
                                        animation: _buyAnimation,
                                        builder: (context, child) {
                                          return Text(
                                            '${_buyAnimation.value}',
                                            style: const TextStyle(
                                                color: AppColors.appWhite,
                                                fontSize: 45,
                                                fontWeight: FontWeight.w700),
                                          );
                                        },
                                      ),
                                      const Text(
                                        'offers',
                                        style: TextStyle(
                                            color: AppColors.appWhite,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                height: screenSize.height * .22,
                                width: screenSize.width * .42,
                                decoration: const BoxDecoration(
                                    color: AppColors.appButton,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'RENT',
                                      style: TextStyle(
                                          color: AppColors.appText,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    AnimatedBuilder(
                                      animation: _rentAnimation,
                                      builder: (context, child) {
                                        return Text(
                                          '${_rentAnimation.value}',
                                          style: const TextStyle(
                                              color: AppColors.appText,
                                              fontSize: 45,
                                              fontWeight: FontWeight.w700),
                                        );
                                      },
                                    ),
                                    const Text(
                                      'offers',
                                      style: TextStyle(
                                          color: AppColors.appText,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((_, index) {
                  return Container(
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                        color: AppColors.appWhite,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        HomesDisplayWidget(
                          height: screenSize.height * .35,
                          width: screenSize.width,
                          image: AppImages.monieHomesWoodenInteriorJpg,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomesDisplayWidget(
                              height: screenSize.height * .45,
                              width: screenSize.width * .48,
                              image: AppImages.monieHomesInteriorTwoJpg,
                            ),
                            Column(
                              children: [
                                HomesDisplayWidget(
                                  height: screenSize.height * .22,
                                  width: screenSize.width * .45,
                                  image: AppImages.monieHomesWoodenInteriorJpg,
                                ),
                                HomesDisplayWidget(
                                  height: screenSize.height * .22,
                                  width: screenSize.width * .45,
                                  image: AppImages.monieHomesInteriorThreeJpg,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }, childCount: 1)),
              ],
            );
          },
        ),
      ),
    );
  }
}
