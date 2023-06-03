import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mvp/pages/signin_page.dart';
import 'models/map_marker_model.dart';
import 'components/event_widget.dart';
import 'pages/profile_page.dart';
import 'dart:ui';
//import 'package:geolocator/geolocator.dart';

/*TODOS

User Device Location

StreamBuilder

*/

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => App();
}


class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Events',
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () => {Navigator.pushNamed(context, '/')},
                    icon: const Icon(Icons.arrow_back))),
            body: Column(
              children: <Widget>[
                for (var event in mapMarkers)
                 EventWidget(mapMarker: event,)],
            )));
  }
}

class MapPage extends StatelessWidget {
  @override
  late GoogleMapController mapController;

  //fake user location
  final LatLng _center = const LatLng(47.620422, -122.349358);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(
        '[{"elementType":"geometry","stylers":[{"color":"#ebe3cd"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#523735"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f1e6"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#c9b2a6"}]},{"featureType":"administrative.land_parcel","elementType":"geometry.stroke","stylers":[{"color":"#dcd2be"}]},{"featureType":"administrative.land_parcel","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#ae9e90"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"poi","elementType":"labels.text","stylers":[{"visibility":"off"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#93817c"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#a5b076"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#447530"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#f5f1e6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#fdfcf8"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#f8c967"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#e9bc62"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"color":"#e98d58"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.stroke","stylers":[{"color":"#db8555"}]},{"featureType":"road.local","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#806b63"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"transit.line","elementType":"labels.text.fill","stylers":[{"color":"#8f7d77"}]},{"featureType":"transit.line","elementType":"labels.text.stroke","stylers":[{"color":"#ebe3cd"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#b9d3c2"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#92998d"}]}]');
  }

  @override
  Widget build(BuildContext context) {
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
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 17.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("marker1"),
                position: _center,
              ),
              Marker(
                  markerId: const MarkerId("marker2"),
                  position: const LatLng(47.620, -122.350),
                  icon: BitmapDescriptor.defaultMarkerWithHue(60)),
              Marker(
                  markerId: const MarkerId("marker3"),
                  position: const LatLng(47.619, -122.3478),
                  icon: BitmapDescriptor.defaultMarkerWithHue(60)),
            }));
  }
}

class _MyAppState extends State<MyApp> {
  //BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  //late BitmapDescriptor makerIcon;
  final List<Marker> _listMk = [];
  @override
  late GoogleMapController mapController;

  //fake user location

  final LatLng _center = const LatLng(47.620422, -122.349358);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      // Fetch Data and build list of events
      _listMk.add(Marker(
        markerId: const MarkerId('Self'),
        draggable: false,
        position: _center,
      ));
      _listMk.add(Marker(
        markerId: const MarkerId('1'),
        draggable: false,
        position: LatLng(47.620, -122.350),
        icon: BitmapDescriptor.defaultMarkerWithHue(60),
      ));
      _listMk.add(Marker(
        markerId: const MarkerId('2'),
        draggable: false,
        position: LatLng(47.619, -122.3478),
        icon: BitmapDescriptor.defaultMarkerWithHue(60),
      ));
    });
    mapController.setMapStyle(
        '[{"elementType":"geometry","stylers":[{"color":"#ebe3cd"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#523735"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f1e6"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#c9b2a6"}]},{"featureType":"administrative.land_parcel","elementType":"geometry.stroke","stylers":[{"color":"#dcd2be"}]},{"featureType":"administrative.land_parcel","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#ae9e90"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"poi","elementType":"labels.text","stylers":[{"visibility":"off"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#93817c"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#a5b076"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#447530"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#f5f1e6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#fdfcf8"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#f8c967"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#e9bc62"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"color":"#e98d58"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.stroke","stylers":[{"color":"#db8555"}]},{"featureType":"road.local","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#806b63"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"transit.line","elementType":"labels.text.fill","stylers":[{"color":"#8f7d77"}]},{"featureType":"transit.line","elementType":"labels.text.stroke","stylers":[{"color":"#ebe3cd"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#b9d3c2"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#92998d"}]}]');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: '/profile-page',
      routes: {
        '/profile-page': (BuildContext context) => ProfilePage(),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Unline Anywhere'),
          elevation: 2,
          leading: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/profile-page'),
              icon: const Icon(Icons.account_circle_rounded)),
          actions: <Widget>[
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/event-page'),
                icon: const Icon(Icons.attractions))
          ],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 17.0,
          ),
          markers: Set.of(_listMk),
          /*{
           Marker(
            markerId: const MarkerId("marker1"),
            position: _center,
            draggable: true,
            //icon:markerIcon,
            onDragEnd: (value) {
              // value is the new position
            },
          ),
          Marker(
            markerId: const MarkerId("marker2"),
            position: const LatLng(47.620, -122.350),
            icon: makerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker3"),
            position: const LatLng(47.619, -122.3478),
          ),
        
        },*/
        ),
      ),
    );
  }
}

class App extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/profile-page': (BuildContext context) => ProfilePage(),
          '/event-page': (BuildContext context) => EventPage(),
          '/signin-page': (BuildContext context) => SignInPage(),
        },
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green[700],
        ),
        home: MapPage());
  }
}
