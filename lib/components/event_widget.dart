import 'package:flutter/material.dart';
import '../models/map_marker_model.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({
    super.key,
    this.mapMarker,
  });
  final MapMarker? mapMarker;
  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator EventWidget - GROUP

    return Container(
        width: MediaQuery.of(context).size.width,
        height: 149,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(),
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 149,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: Color.fromRGBO(15, 210, 228, 1),
                  ))),
          Positioned(
              top: 60,
              left: 56,
              child: Text(
                widget.mapMarker!.event ?? '',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 103,
              left: 70,
              child: Container(
                  width: 160,
                  height: 160.47368335723877,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: IconButton(
                            style: ButtonStyle(),
                            onPressed: () => {},
                            icon: const Icon(
                                color: Color.fromARGB(255, 245, 241, 241),
                                size: 20,
                                Icons.send))),
                  ]))),
          Positioned(
              top: 9,
              left: 22,
              child: Container(
                  width: 40.88595199584961,
                  height: 41,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bluedot.png'),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.all(
                        Radius.elliptical(40.88595199584961, 41)),
                  ))),
          Positioned(
              top: 11,
              left: 74,
              child: Text(
                widget.mapMarker!.user ?? 'You',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 121,
              left: 55,
              child: Text(
                '12',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 122,
              left: 107,
              child: Text(
                '9',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 29,
              left: 74,
              child: Text(
                widget.mapMarker!.timestamp ?? '',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 104,
              left: 20,
              child: Container(
                  width: 160,
                  height: 160,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: IconButton(
                            style: ButtonStyle(),
                            onPressed: () => {},
                            icon: const Icon(
                                color: Color.fromARGB(255, 245, 241, 241),
                                size: 20,
                                Icons.message))),
                  ]))),
        ]));
  }
}
