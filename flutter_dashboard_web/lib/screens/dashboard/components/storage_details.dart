import 'package:flutter/material.dart';
import 'package:flutter_dashboard_web/screens/dashboard/components/storage_info_card.dart';

import '../../../constants.dart';
import 'chart.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Storage Details",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),
          ),
          Chart(),
          StorageInfoCard(
            title: "Documents Files",
            svgSrc: "assets/icons/Documents.svg",
            amountOfFiles: "1.3GB",
            numOfFiles: 1329,
          ),
          StorageInfoCard(
            title: "Media Files",
            svgSrc: "assets/icons/media.svg",
            amountOfFiles: "15.3GB",
            numOfFiles: 1329,
          ),
          StorageInfoCard(
            title: "Other Files",
            svgSrc: "assets/icons/folder.svg",
            amountOfFiles: "15.3GB",
            numOfFiles: 1329,
          ),
          StorageInfoCard(
            title: "Unknown Files",
            svgSrc: "assets/icons/unknown.svg",
            amountOfFiles: "15.3GB",
            numOfFiles: 1329,
          )
        ],
      ),
    );
  }
}