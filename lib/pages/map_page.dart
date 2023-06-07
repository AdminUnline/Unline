import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mvp/models/map_marker_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mvp/components/event_widget.dart';

class AppConstants {
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiYWRtaW4tdW5saW5lIiwiYSI6ImNsaGE4bTAxcjBmNXAzZHFmcG1mbmZyanEifQ.GAVHXZzcoHCsN2gkh7QxiA';

  static const String mapBoxStyleId = 'YOUR_STYLE_ID';

  static final myLocation = LatLng(51.5090214, -0.1982948);
}

class MapPage extends StatefulWidget {
  MapPage({
    super.key,
  });
  var editingBool = false;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  final pageController = PageController();
  int selectedIndex = 0;
  var currentLocation = AppConstants.myLocation;

  late final MapController mapController;

   late LatLng currentPostion = AppConstants.myLocation;

  void _getUserLocation() async {
    LocationPermission permission;
   permission = await Geolocator.requestPermission();
    var position = await GeolocatorPlatform.instance.getCurrentPosition();

    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
     _getUserLocation();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unline Anywhere'),
        elevation: 2,
        leading: IconButton(
            onPressed: () => Navigator.pushNamed(context, '/profile-page'),
            icon: const Icon(Icons.account_circle_rounded)),
        actions: <Widget>[
          IconButton(
              onPressed: () =>
                  Navigator.popAndPushNamed(context, '/event-page'),
              icon: const Icon(Icons.attractions))
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 11,
              center: currentPostion,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/admin-unline/clha976hd010m01quhllafvo8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWRtaW4tdW5saW5lIiwiYSI6ImNsaGE2ODZucTBlYmkzZ3BoZGl5aDU1ZXEifQ.XmhQzY_-NjHJPkGGTMdEwA",
                additionalOptions: {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              MarkerLayerOptions(
                markers: [
                  for (int i = 0; i < mapMarkers.length; i++)
                    Marker(
                      height: 40,
                      width: 40,
                      point: mapMarkers[i].location ?? AppConstants.myLocation,
                      builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            pageController.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            selectedIndex = i;
                            currentLocation = mapMarkers[i].location ??
                                AppConstants.myLocation;
                            _animatedMapMove(currentLocation, 11.5);
                            setState(() {});
                          },
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: selectedIndex == i ? 1 : 0.7,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: selectedIndex == i ? 1 : 0.5,
                              child: SvgPicture.asset(
                                'assets/map_marker.svg',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            height: MediaQuery.of(context).size.height * 0.2,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                selectedIndex = value;
                currentLocation =
                    mapMarkers[value].location ?? AppConstants.myLocation;
                _animatedMapMove(currentLocation, 11.5);
                setState(() {});
              },
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return EventWidget(mapMarker: item,);},
            ),
          )
        ],
      ),
    );
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}
