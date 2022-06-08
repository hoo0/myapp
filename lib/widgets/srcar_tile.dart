import 'package:flutter/material.dart';

import '../models/train.dart';
import '../models/srcar.dart';

class SrcarTile extends StatelessWidget {
  const SrcarTile({Key? key, required this.train, required this.srcar}) : super(key: key);

  final Train train;
  final Srcar srcar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(5),
        // color: Colors.grey,
        child: Row(
          children: [
            Container(
              child: Text(int.parse(srcar.srcarNo).toString()),
              width: 50,
              alignment: Alignment.centerRight,
            ),
            VerticalDivider(width: 50),
            Container(child: Text(srcar.seatCnt.toString(), textAlign: TextAlign.right), width: 30),
            VerticalDivider(width: 50),
            Text(srcar.psrmClNm),
          ],
        ),
      ),
      onTap: () {
        debugPrint('${srcar.srcarNo}');

        Navigator.pushNamed(
          context,
          '/seatmap/seats2',
          arguments: {
            'train': train,
            'srcar': srcar,
          },
        );
      },
    );
  }
}
