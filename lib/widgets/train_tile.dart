import 'package:flutter/material.dart';

import '../models/train.dart';

class TrainTile extends StatelessWidget {
  const TrainTile({Key? key, required this.train}) : super(key: key);

  final Train train;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(5),
        // color: Colors.grey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(int.parse(train.trnNo).toString() + ' ' + train.trnGpName),
              width: 80,
              alignment: Alignment.centerRight,
            ),
            VerticalDivider(width: 50),
            Text(train.dptTmQb),
            VerticalDivider(width: 50),
            Text(train.arvTmQb),
          ],
        ),
      ),
      onTap: () {
        debugPrint('${train.trnNo}');

        Navigator.pushNamed(
          context,
          '/seatmap/srcars',
          arguments: {
            'train': train,
          },
        );
      },
    );
  }
}
