import 'package:boxtox/model/modelTimeline.dart';
import 'package:boxtox/style/color.dart';
import 'package:boxtox/view/search.dart';
import 'package:boxtox/view/widget/timelines_tracking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  TextEditingController data = TextEditingController();

  @override
  void initState() {
    super.initState();
    data.text = Get.parameters['data'];
  }

  @override
  Widget build(BuildContext context) {
    MapboxMapController mapController;

    void _onMapCreated(MapboxMapController controller) {
      mapController = controller;
    }

    movcam({double lat, double long}) {
      // mapController.addSymbol(
      //   SymbolOptions(
      //     geometry: LatLng(a.first.lat, a.first.long),
      //     iconImage: 'assets/icon.png',
      //     iconSize: 0.1,
      //   ),
      // );
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, long),
            zoom: 14,
          ),
        ),
      );
    }

    void onStyleLoadedCallback() {
      for (var val in a) {
        mapController.addSymbol(
          SymbolOptions(
            geometry: LatLng(val.lat, val.long),
            iconImage: 'assets/pin.png',
            iconSize: 0.7,
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: primer,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: MapboxMap(
              compassEnabled: false,

              // myLocationEnabled: true,
              styleString: "mapbox://styles/baydim/ckrwvaowp4qqk17pk0onwnkzx",

              onMapCreated: _onMapCreated,
              zoomGesturesEnabled: true,
              rotateGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(a.first.lat, a.first.long),
                zoom: 14,
              ),
              onStyleLoadedCallback: onStyleLoadedCallback,
            ),
          ),
          Positioned(
            child: SafeArea(
              child: Search(
                textEditingController: data,
                depan: false,
              ),
            ),
          ),
          Positioned(
            child: DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.2,
              maxChildSize: 0.5,
              builder: (context, scrollController) {
                return NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification ov) {
                    ov.disallowGlow();
                    return true;
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 40,
                            offset: Offset(0, 5))
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Positioned(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                for (var i = 0; i < a.length; i++)
                                  if (i == 0)
                                    InkWell(
                                      onTap: () {
                                        movcam(
                                          lat: a.first.lat,
                                          long: a.first.long,
                                        );
                                      },
                                      child: timelinesTracking(
                                        first: true,
                                        status: a.first.status,
                                        lokasi: a.first.lokasi,
                                        lat: a.first.lat,
                                        long: a.first.long,
                                        date: a.first.date,
                                      ),
                                    )
                                  else if (i == a.length - 1)
                                    InkWell(
                                      onTap: () {
                                        movcam(
                                          lat: a.last.lat,
                                          long: a.last.long,
                                        );
                                      },
                                      child: timelinesTracking(
                                        last: true,
                                        status: a.last.status,
                                        lokasi: a.last.lokasi,
                                        lat: a.last.lat,
                                        long: a.last.long,
                                        date: a.last.date,
                                      ),
                                    )
                                  else
                                    InkWell(
                                      onTap: () {
                                        movcam(
                                          lat: a[i].lat,
                                          long: a[i].long,
                                        );
                                      },
                                      child: timelinesTracking(
                                        status: a[i].status,
                                        lokasi: a[i].lokasi,
                                        lat: a[i].lat,
                                        long: a[i].long,
                                        date: a[i].date,
                                      ),
                                    ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                Get.width / 2.8, 15, Get.width / 2.8, 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
