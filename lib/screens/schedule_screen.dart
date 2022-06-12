import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/controllers/schedule_controller.dart';
import 'package:myapp/providers/schedule_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime selectDate = DateTime.now();
  TimeOfDay selectTime = TimeOfDay.now();

  final dptStnController = TextEditingController();
  final arvStnController = TextEditingController();

  String trnGpCd = '109';

  @override
  void initState() {
    super.initState();

    ScheduleController.loadStns((dptStn, arvStn, trnGpCd) {
      setState(() {
        dptStnController.text = dptStn ?? '서울';
        arvStnController.text = arvStn ?? '부산';
        this.trnGpCd = trnGpCd ?? '109';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Schedule'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => ScheduleController.logout(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(0),
                child: Row(
                  children: [
                    VerticalDivider(width: 10),
                    InkWell(
                      onTap: () {
                        debugPrint('tap');
                        _showDatePicker(context);
                      },
                      child: Text(dateText),
                    ),
                    VerticalDivider(width: 10),
                    InkWell(
                      onTap: () {
                        debugPrint('tap');
                        _showTimePicker(context);
                      },
                      child: Text(timeText),
                    ),
                    VerticalDivider(width: 10),
                    Expanded(child: Container()),
                    Container(
                      // width: 100,
                      alignment: Alignment.centerRight,
                      child: DropdownButton(
                        // isExpanded: true,
                        value: trnGpCd,
                        items: trnGpCdList
                            .map((Map<String, String> item) => DropdownMenuItem(
                                  child: Text(item.values.first),
                                  value: item.keys.first,
                                ))
                            .toList(),
                        onChanged: (String? item) {
                          debugPrint('item=$item');
                          setState(() {
                            trnGpCd = item ?? '';
                          });
                        },
                      ),
                    ),
                    VerticalDivider(width: 10),
                  ],
                ),
              ),
              Divider(height: 10, thickness: 2),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        controller: dptStnController,
                        textAlign: TextAlign.center,
                        // decoration: InputDecoration(),
                      ),
                    ),
                    // VerticalDivider(width: 20, color: Colors.grey),
                    TextButton(
                      child: Icon(Icons.change_circle),
                      onPressed: () => ScheduleController.changeStns(dptStnController, arvStnController),
                    ),
                    Flexible(
                      child: TextField(
                        controller: arvStnController,
                        textAlign: TextAlign.center,
                        // decoration: InputDecoration(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScheduleController.saveStns(dptStnController.text, arvStnController.text, trnGpCd);

                    context.read<ScheduleProvider>().setScheduleProvider(
                          trnGpCd,
                          dptDt,
                          dptTm,
                          dptStnController.text,
                          arvStnController.text,
                        );

                    Navigator.pushNamed(context, '/trains');
                  },
                  child: Text('search'),
                ),
              ),
            ],
          ),
        ));
  }

  _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked != selectDate) {
      setState(() {
        selectDate = picked;
        if (dptDt == DateFormat('yyyyMMdd').format(DateTime.now())) {
          selectTime = TimeOfDay.now();
        } else {
          selectTime = TimeOfDay(hour: 0, minute: 0);
        }
      });
    }
  }

  _showTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectTime) {
      setState(() {
        selectTime = picked;
      });
    }
  }

  String get dateText {
    return DateFormat('yyyy.MM.dd').format(selectDate);
  }

  String get timeText {
    final now = DateTime.now();
    final datetime = DateTime(now.year, now.month, now.day, selectTime.hour, selectTime.minute);
    return DateFormat('HH:mm').format(datetime);
  }

  String get dptDt {
    return DateFormat('yyyyMMdd').format(selectDate);
  }

  String get dptTm {
    final now = DateTime.now();
    final datetime = DateTime(now.year, now.month, now.day, selectTime.hour, selectTime.minute);
    return DateFormat('HHmm').format(datetime);
  }
}
