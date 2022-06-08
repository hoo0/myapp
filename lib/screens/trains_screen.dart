import 'package:flutter/material.dart';

import '../services/schedule_service.dart';
import '../models/train.dart';
import '../widgets/train_tile.dart';
import '../widgets/error_message.dart';

class TrainsScreen extends StatefulWidget {
  const TrainsScreen({Key? key, this.args}) : super(key: key);

  final dynamic args;

  @override
  State<TrainsScreen> createState() => _TrainsScreenState();
}

class _TrainsScreenState extends State<TrainsScreen> {
  ScrollController scrollController = ScrollController();

  final List<Train> trains = [];
  var title = '';
  var result = '';
  var message = '';

  var loading = false;
  var running = false;
  var lastPage = false;

  @override
  void initState() {
    setTitle(widget.args);
    callService(widget.args);

    scrollController.addListener(() {
      // setState(() {
      //   title = '${floor2(scrollController.position.maxScrollExtent)} : ${floor2(scrollController.position.pixels)}';
      // });

      if (scrollController.position.pixels > 0 && scrollController.position.pixels > scrollController.position.maxScrollExtent + 50) {
        moreData();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return trains.isNotEmpty ? mainWidget(context) : errorWidget(context);
  }

  Widget errorWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ErrorMessage(message: message),
    );
  }

  Widget mainWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.separated(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // physics: BouncingScrollPhysics(),
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: trains.length + 1,
        itemBuilder: (context, index) {
          //empty
          if (trains.isEmpty) {
            return Container(color: Colors.green);
          }
          //last item
          else if (index == trains.length) {
            if (lastPage) {
              return Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Text('-', style: TextStyle(color: Colors.blue)),
              );
            } else {
              //Not the last page, return to a loading window
              return Visibility(
                visible: loading,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  child: const SizedBox(width: 24.0, height: 24.0, child: CircularProgressIndicator(strokeWidth: 2.0)),
                ),
              );
            }
          } else {
            return TrainTile(train: trains[index]);
          }
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1, height: 1),
      ),
    );
  }

  void moreData() {
    if (loading || lastPage) return;

    setState(() {
      loading = true;
    });

    debugPrint("push up");

    var args = Map<String, dynamic>.from(widget.args); // deep copy
    args['dptTm'] = trains[trains.length - 1].dptTm; // 마지막 열차의 시간으로 조회한다

    Future.delayed(Duration(seconds: 1)).then((e) {
      callService(args);
    });
  }

  Future<void> callService(Map<String, dynamic> args) async {
    if (running) return;
    running = true;

    try {
      var scheduleData = await ScheduleService.getSchedule(
        trnGpCd: args['trnGpCd'],
        dptDt: args['dptDt'],
        dptTm: args['dptTm'],
        dptStn: args['dptStn'],
        arvStn: args['arvStn'],
      );
      // debugPrint("scheduleData=$scheduleData");

      setState(() {
        result = scheduleData['strResult'];
        message = scheduleData['h_msg_txt'];
        // debugPrint('result=$result message=$message');
      });

      if (scheduleData['h_next_pg_flg'] == 'N') {
        setState(() {
          lastPage = true;
        });
        debugPrint('lastPage');
      }

      var trnInfos = scheduleData['trn_infos']['trn_info'] as List;
      var lastIndex = trains.length - 1;

      trnInfos.map((trnInfo) {
        /* 열차리스트를 거꾸로 검색하면서, 같은 열차번호는 추가하지 않는다. */
        var sameTrain = false;
        for (var i = lastIndex; i >= 0; i--) {
          if (Train.convertTrnNo(trnInfo['h_trn_no']) == trains[i].trnNo) {
            sameTrain = true;
            break;
          }
        }

        if (sameTrain == false) {
          setState(() {
            trains.add(Train.createByTrnInfo(trnInfo));
          });
        }
      }).toList();
    } catch (e) {
      debugPrint('e=$e');
    }

    running = false;

    Future.delayed(Duration(seconds: 1)).then((e) {
      setState(() {
        loading = false;
        debugPrint('loading false');
      });
    });
  }

  setTitle(Map<String, dynamic> args) {
    var _dptDt = args['dptDt'].substring(4, 6) + '/' + args['dptDt'].substring(6, 8);
    var _dptTm = args['dptTm'].substring(0, 2) + ':' + args['dptTm'].substring(2, 4);

    title = '$_dptDt $_dptTm ${args['dptStn']} ${args['arvStn']}';
  }
}
