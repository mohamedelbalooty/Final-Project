import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../constants.dart';

TimelineTile customTimeLine(
    Color color, IconData icon, String contentAddress, bool first, bool last) {
  return TimelineTile(
    alignment: TimelineAlign.start,
    isFirst: first,
    isLast: last,
    indicatorStyle: IndicatorStyle(
      width: 25,
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      iconStyle: IconStyle(
        color: Colors.white,
        iconData: icon,
      ),
    ),
    endChild: Container(
      constraints: BoxConstraints(
        minHeight: 50,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 5, top: 10),
        child: Flexible(
          child: Text(
            contentAddress,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: KBlackColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    ),
  );
}