import 'package:boxtox/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

Widget timelinesTracking({
  bool first: false,
  bool last: false,
  String status,
  String lokasi,
  double lat,
  double long,
  DateTime date,
}) {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd|HH:mm");
  String d = dateFormat.format(date);
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
    child: TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      contents: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  d.split("|")[0],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  d.split("|")[1],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.inventory,
                    color: primer,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 1.6,
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 1.6,
                      child: Text(lokasi),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      node: TimelineNode(
        indicator: DotIndicator(
          color: primer,
        ),
        startConnector: !first
            ? SolidLineConnector(
                color: primer,
              )
            : null,
        endConnector: !last
            ? SolidLineConnector(
                color: primer,
              )
            : null,
      ),
    ),
  );
}
