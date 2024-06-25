// import 'package:auto_route/annotations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:moniehomes/src/config/app_colors.dart';
// import 'package:moniehomes/src/config/app_images.dart';
// import 'package:moniehomes/src/config/config.dart';
// import 'package:moniehomes/src/presentation/providers/app_size_provider.dart';
//
// @RoutePage()
// class LocationScreen extends ConsumerStatefulWidget {
//   const LocationScreen({Key? key}) : super(key: key);
//
//   @override
//   LocationScreenState createState() => LocationScreenState();
// }
//
// class LocationScreenState extends ConsumerState<LocationScreen>
//     with SingleTickerProviderStateMixin {
//   late GoogleMapController mapController;
//
//   final LatLng _center = const LatLng(45.521563, -122.677433);
//
//   final String _darkMapStyle = '''
//   [
//     {"elementType": "geometry", "stylers": [{"color": "#212121"}]},
//     {"elementType": "labels.icon", "stylers": [{"visibility": "off"}]},
//     {"elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
//     {"elementType": "labels.text.stroke", "stylers": [{"color": "#212121"}]},
//     {"featureType": "administrative", "elementType": "geometry", "stylers": [{"color": "#757575"}]},
//     {"featureType": "administrative.country", "elementType": "labels.text.fill", "stylers": [{"color": "#9e9e9e"}]},
//     {"featureType": "administrative.land_parcel", "stylers": [{"visibility": "off"}]},
//     {"featureType": "administrative.locality", "elementType": "labels.text.fill", "stylers": [{"color": "#bdbdbd"}]},
//     {"featureType": "poi", "elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
//     {"featureType": "poi.park", "elementType": "geometry", "stylers": [{"color": "#181818"}]},
//     {"featureType": "poi.park", "elementType": "labels.text.fill", "stylers": [{"color": "#616161"}]},
//     {"featureType": "poi.park", "elementType": "labels.text.stroke", "stylers": [{"color": "#1b1b1b"}]},
//     {"featureType": "road", "elementType": "geometry.fill", "stylers": [{"color": "#2c2c2c"}]},
//     {"featureType": "road", "elementType": "labels.text.fill", "stylers": [{"color": "#8a8a8a"}]},
//     {"featureType": "road.arterial", "elementType": "geometry", "stylers": [{"color": "#373737"}]},
//     {"featureType": "road.highway", "elementType": "geometry", "stylers": [{"color": "#3c3c3c"}]},
//     {"featureType": "road.highway.controlled_access", "elementType": "geometry", "stylers": [{"color": "#4e4e4e"}]},
//     {"featureType": "road.local", "elementType": "labels.text.fill", "stylers": [{"color": "#616161"}]},
//     {"featureType": "transit", "elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
//     {"featureType": "water", "elementType": "geometry", "stylers": [{"color": "#000000"}]},
//     {"featureType": "water", "elementType": "labels.text.fill", "stylers": [{"color": "#3d3d3d"}]}
//   ]
//   ''';
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     mapController.setMapStyle(_darkMapStyle);
//   }
//
//   late AnimationController _controller;
//   late final Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000), // Adjust duration as needed
//     );
//     _animation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget _buildAnimatedWidget() {
//     return SlideTransition(
//       position: Tween<Offset>(
//         begin: const Offset(0, 1),
//         // Offset by 1 towards the bottom (off-screen)
//         end: const Offset(0, -3), // Center of the screen
//       ).animate(_controller),
//       child: Container(
//         height: 100,
//         width: double.infinity,
//         color: Colors.blue,
//         alignment: Alignment.center,
//         child: const Text(
//           'Animated Widget',
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//       ),
//     );
//   }
//
//   TextEditingController textEditingController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = ref.watch(appSizeProvider);
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 11.0,
//             ),
//           ),
//           Positioned(
//             left: size.width * .1,
//             top: size.height * .097,
//             child: SizedBox(
//               width: size.width * .64,
//               child: TextField(
//                 enabled: true,
//                 style: const TextStyle(
//                     color: AppColors.appBlack, height: .7, fontSize: 18),
//                 textAlign: TextAlign.center,
//                 textAlignVertical: TextAlignVertical.center,
//                 controller: textEditingController,
//                 cursorColor: AppColors.appBlack,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: AppColors.appWhite,
//                   isDense: true,
//                   contentPadding: const EdgeInsets.all(6),
//                   prefixIcon: Image.asset(
//                     AppImages.monieHomesSearchPng,
//                     width: 10,
//                     height: 10,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     borderSide: BorderSide.none,
//                   ),
//                   hintText: "Saint Petersburg",
//                   hintStyle: const TextStyle(color: AppColors.appBlack, height: 1),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: size.width * .1,
//             top: size.height * .1,
//             child: CircleAvatar(
//               radius: 25,
//               backgroundColor: AppColors.appWhite.withOpacity(.9),
//               child: Image.asset(
//                 AppImages.monieHomesSecurePng,
//                 height: 40,
//                 width: 40,
//               ),
//             ),
//           ),
//           Positioned(
//             left: size.width * .1,
//             top: size.height * .7,
//             child: GestureDetector(
//               onTap: () {},
//               child: CircleAvatar(
//                 radius: 25,
//                 backgroundColor: Colors.grey.withOpacity(.7),
//                 child: Image.asset(
//                   AppImages.monieHomesStackPng,
//                   height: 40,
//                   width: 40,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: size.width * .1,
//             top: size.height * .78,
//             child: GestureDetector(
//               onTap: () {},
//               child: CircleAvatar(
//                 radius: 25,
//                 backgroundColor: Colors.grey.withOpacity(.7),
//                 child: Image.asset(
//                   AppImages.monieHomesLocationPng,
//                   height: 40,
//                   width: 40,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: size.width * .1,
//             top: size.height * .78,
//             child: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 height: 50,
//                 width: size.width * .4,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(25)),
//                   color: Colors.grey.withOpacity(.7),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Image.asset(
//                       AppImages.monieHomesMenuPng,
//                       height: 40,
//                       width: 40,
//                     ),
//                     const Text(
//                       'List of variants',
//                       style: TextStyle(color: AppColors.appWhite, fontSize: 12),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moniehomes/src/config/app_colors.dart';
import 'package:moniehomes/src/config/app_images.dart';
import 'package:moniehomes/src/config/config.dart';
import 'package:moniehomes/src/presentation/providers/app_size_provider.dart';

@RoutePage()
class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends ConsumerState<LocationScreen>
    with SingleTickerProviderStateMixin {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  final String _darkMapStyle = '''
  [
    {"elementType": "geometry", "stylers": [{"color": "#212121"}]},
    {"elementType": "labels.icon", "stylers": [{"visibility": "off"}]},
    {"elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
    {"elementType": "labels.text.stroke", "stylers": [{"color": "#212121"}]},
    {"featureType": "administrative", "elementType": "geometry", "stylers": [{"color": "#757575"}]},
    {"featureType": "administrative.country", "elementType": "labels.text.fill", "stylers": [{"color": "#9e9e9e"}]},
    {"featureType": "administrative.land_parcel", "stylers": [{"visibility": "off"}]},
    {"featureType": "administrative.locality", "elementType": "labels.text.fill", "stylers": [{"color": "#bdbdbd"}]},
    {"featureType": "poi", "elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
    {"featureType": "poi.park", "elementType": "geometry", "stylers": [{"color": "#181818"}]},
    {"featureType": "poi.park", "elementType": "labels.text.fill", "stylers": [{"color": "#616161"}]},
    {"featureType": "poi.park", "elementType": "labels.text.stroke", "stylers": [{"color": "#1b1b1b"}]},
    {"featureType": "road", "elementType": "geometry.fill", "stylers": [{"color": "#2c2c2c"}]},
    {"featureType": "road", "elementType": "labels.text.fill", "stylers": [{"color": "#8a8a8a"}]},
    {"featureType": "road.arterial", "elementType": "geometry", "stylers": [{"color": "#373737"}]},
    {"featureType": "road.highway", "elementType": "geometry", "stylers": [{"color": "#3c3c3c"}]},
    {"featureType": "road.highway.controlled_access", "elementType": "geometry", "stylers": [{"color": "#4e4e4e"}]},
    {"featureType": "road.local", "elementType": "labels.text.fill", "stylers": [{"color": "#616161"}]},
    {"featureType": "transit", "elementType": "labels.text.fill", "stylers": [{"color": "#757575"}]},
    {"featureType": "water", "elementType": "geometry", "stylers": [{"color": "#000000"}]},
    {"featureType": "water", "elementType": "labels.text.fill", "stylers": [{"color": "#3d3d3d"}]}
  ]
  ''';

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_darkMapStyle);
  }

  late AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedWidget() {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        // Offset by 1 towards the bottom (off-screen)
        end: const Offset(0, -3), // Center of the screen
      ).animate(_controller),
      child: Container(
        height: 100,
        width: double.infinity,
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text(
          'Animated Widget',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  TextEditingController textEditingController = TextEditingController();

  // Define the markers
  final List<Marker> _markers = const [
    Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(45.521563, -122.677433),
      infoWindow: InfoWindow(title: 'Marker 1', snippet: 'Description 1'),
    ),
    Marker(
      markerId: MarkerId('marker2'),
      position: LatLng(45.531563, -122.677433),
      infoWindow: InfoWindow(title: 'Marker 2', snippet: 'Description 2'),
    ),
    Marker(
      markerId: MarkerId('marker3'),
      position: LatLng(45.541563, -122.677433),
      infoWindow: InfoWindow(title: 'Marker 3', snippet: 'Description 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = ref.watch(appSizeProvider);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: Set<Marker>.of(_markers),
          ),
          Positioned(
            left: size.width * .1,
            top: size.height * .097,
            child: SizedBox(
              width: size.width * .64,
              child: TextField(
                enabled: true,
                style: const TextStyle(
                    color: AppColors.appBlack, height: .7, fontSize: 18),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                controller: textEditingController,
                cursorColor: AppColors.appBlack,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.appWhite,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(6),
                  prefixIcon: Image.asset(
                    AppImages.monieHomesSearchPng,
                    width: 10,
                    height: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Saint Petersburg",
                  hintStyle:
                      const TextStyle(color: AppColors.appBlack, height: 1),
                ),
              ),
            ),
          ),
          Positioned(
            right: size.width * .1,
            top: size.height * .1,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.appWhite.withOpacity(.9),
              child: Image.asset(
                AppImages.monieHomesSecurePng,
                height: 40,
                width: 40,
              ),
            ),
          ),
          Positioned(
            left: size.width * .1,
            top: size.height * .7,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.withOpacity(.7),
                child: Image.asset(
                  AppImages.monieHomesStackPng,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * .1,
            top: size.height * .78,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.withOpacity(.7),
                child: Image.asset(
                  AppImages.monieHomesLocationPng,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),
          Positioned(
            right: size.width * .1,
            top: size.height * .78,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: size.width * .4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: Colors.grey.withOpacity(.7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      AppImages.monieHomesMenuPng,
                      height: 40,
                      width: 40,
                    ),
                    const Text(
                      'List of variants',
                      style: TextStyle(color: AppColors.appWhite, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
