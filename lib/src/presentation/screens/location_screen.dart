import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniehomes/src/config/config.dart';
import 'package:moniehomes/src/presentation/providers/providers.dart';

@RoutePage()
class LocationScreen extends ConsumerWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final size = ref.watch(appSizeProvider);

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
        child: const Text('Intro'),
      ),
    );
  }
}
