import 'package:flutter/material.dart';
import 'package:myapp/services/train_schedule_service.dart';
import 'package:provider/provider.dart';

import '../models/train_schedule.dart';
import '../providers/train_provider.dart';
import '../services/scar_service.dart';
import '../models/train.dart';
import '../models/srcar.dart';
import 'srcars2_seats2_screen.dart';

import '../widgets/error_message.dart';

class SrcarsScreen extends StatefulWidget {
  const SrcarsScreen({Key? key}) : super(key: key);

  @override
  State<SrcarsScreen> createState() => _SrcarsScreenState();
}

class _SrcarsScreenState extends State<SrcarsScreen> with SingleTickerProviderStateMixin {
  late final Train train;
  late TrainSchedule trainSchedule;
  final List<Srcar> srcars = [];

  final List<Widget> srcarTabs = [];
  final List<Widget> srcarTabViews = [];

  var title = '';
  var result = '';
  var message = '';

  @override
  void initState() {
    super.initState();

    train = context.read<TrainProvider>().train;

    setTitle();
    callService();
  }

  void setTitle() {
    var trnNo = '#' + int.parse(train.trnNo).toString();
    var tDptTm = train.dptTm;
    var dptTm = tDptTm.substring(0, 2) + ':' + tDptTm.substring(2, 4);

    title = trnNo + ' ' + dptTm;
  }

  @override
  Widget build(BuildContext context) {
    return srcars.isNotEmpty ? mainWidget(context) : errorWidget(context);
  }

  Widget errorWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ErrorMessage(message: message),
    );
  }

  Widget mainWidget(BuildContext context) {
    return DefaultTabController(
      length: srcars.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Tab>[
              ...srcars
                  .map(
                    (srcar) => Tab(text: int.parse(srcar.srcarNo).toString()),
                  )
                  .toList()
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ...srcars
                .map(
                  (srcar) => SrcarSeatsScreen(train: train, srcar: srcar),
                )
                .toList()
          ],
        ),
      ),
    );
  }

  void callService() async {
    try {
      List<Srcar> tempSrcars = [];

      var trnScheduleData = await TrainScheduleService.getTrainSchedule(
        runDt: train.runDt,
        trnNo: train.trnNo,
        trnGpCd: train.trnGpCd,
      );
      debugPrint('trnScheduleData=$trnScheduleData');
      trainSchedule = TrainSchedule.createByData(trnScheduleData);
      train.schedule = trainSchedule;

      var srcarData = await SrcarService.getSrcar(
        dptDt: train.dptDt,
        trnNo: train.trnNo,
        dptStnCd: train.dptStnCd,
        arvStnCd: train.arvStnCd,
        psrmClCd: '1',
      );
      debugPrint('srcarData=$srcarData');
      // debugPrint("srcarData['strResult']=${srcarData['strResult']}");

      if (srcarData['strResult'] == 'SUCC') {
        var srcarInfos = srcarData['srcar_infos']['srcar_info'] as List;
        srcarInfos.map((srcarInfo) {
          tempSrcars.add(Srcar.createBySrcarInfo(srcarInfo));
        }).toList();
      } else {
        setState(() {
          result = srcarData['strResult'];
          message = srcarData['h_msg_txt'];
        });
      }

      var srcarData2 = await SrcarService.getSrcar(
        dptDt: train.dptDt,
        trnNo: train.trnNo,
        dptStnCd: train.dptStnCd,
        arvStnCd: train.arvStnCd,
        psrmClCd: '2',
      );
      // debugPrint('srcarData2=$srcarData2');

      if (srcarData2['strResult'] == 'SUCC') {
        var srcarInfos2 = srcarData2['srcar_infos']['srcar_info'] as List;
        srcarInfos2.map((srcarInfo) {
          tempSrcars.add(Srcar.createBySrcarInfo(srcarInfo));
        }).toList();
      } else {
        setState(() {
          result = srcarData2['strResult'];
          message = srcarData2['h_msg_txt'];
        });
      }
      debugPrint('result=$result message=$message');

      if (tempSrcars.isNotEmpty) {
        tempSrcars.sort((Srcar a, Srcar b) => int.parse(a.srcarNo).compareTo(int.parse(b.srcarNo)));

        setState(() {
          srcars.addAll(tempSrcars);
        });
      }
    } catch (e) {
      debugPrint('e=$e');
    }
  }
}
