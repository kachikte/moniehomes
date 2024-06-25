import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniehomes/src/config/app_colors.dart';
import 'package:moniehomes/src/config/app_images.dart';
import 'package:moniehomes/src/presentation/screens/home_screen.dart';
import 'package:moniehomes/src/presentation/screens/location_screen.dart';

@RoutePage()
class NavigationScreen extends ConsumerStatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  NavigationScreenState createState() => NavigationScreenState();
}

class NavigationScreenState extends ConsumerState<NavigationScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _bottomBarController;
  late Animation<Offset> _bottomBarAnimation;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentPage = _tabController.index;
      });
    });

    _bottomBarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _bottomBarAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _bottomBarController,
      curve: Curves.easeInOut,
    ));

    _bottomBarController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _bottomBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBar(
        fit: StackFit.expand,
        borderRadius: BorderRadius.circular(1000),
        duration: const Duration(seconds: 2),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.8,
        barColor: AppColors.appBlack.withOpacity(.7),
        start: 10,
        end: 0,
        offset: 40,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 500,
        iconWidth: 25,
        reverse: false,
        barDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
        ),
        iconDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
        ),
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => TabBarView(
          controller: _tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: const [
            LocationScreen(),
            Center(child: Text('Chat Page')),
            HomeScreen(),
            Center(child: Text('Favorite Page')),
            Center(child: Text('Profile Page')),
          ],
        ),
        child: SlideTransition(
          position: _bottomBarAnimation,
          child: _buildTabBar(),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      padding: const EdgeInsets.symmetric(vertical: 7),
      dividerColor: Colors.transparent,
      controller: _tabController,
      indicatorColor: Colors.transparent,
      tabs: [
        Tab(
          icon: CircleAvatar(
            radius: _getRadius(0),
            backgroundColor: _getColor(0),
            child: SizedBox(
                height: 20, child: Image.asset(AppImages.monieHomesSearchPng)),
          ),
        ),
        Tab(
          icon: CircleAvatar(
            radius: _getRadius(1),
            backgroundColor: _getColor(1),
            child: SizedBox(
                height: 20, child: Image.asset(AppImages.monieHomesChatPng)),
          ),
        ),
        Tab(
          icon: CircleAvatar(
            radius: _getRadius(2),
            backgroundColor: _getColor(2),
            child: SizedBox(
                height: 20, child: Image.asset(AppImages.monieHomesHomePng)),
          ),
        ),
        Tab(
          icon: CircleAvatar(
            radius: _getRadius(3),
            backgroundColor: _getColor(3),
            child: SizedBox(
                height: 20,
                child: Image.asset(AppImages.monieHomesFavoritePng)),
          ),
        ),
        Tab(
          icon: CircleAvatar(
            radius: _getRadius(4),
            backgroundColor: _getColor(4),
            child: SizedBox(
                height: 20, child: Image.asset(AppImages.monieHomesProfilePng)),
          ),
        ),
      ],
    );
  }

  Color _getColor(int index) {
    return _currentPage == index
        ? AppColors.primaryColor
        : AppColors.appBlack.withOpacity(.9);
  }

  double _getRadius(int index) {
    return _currentPage == index ? 50 : 30;
  }
}
