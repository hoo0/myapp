import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime get currentDate {
    return DateTime.now();
  }

  TimeOfDay get currentTime {
    return TimeOfDay.now();
  }

  DateTime selectDate = DateTime.now();
  TimeOfDay selectTime = TimeOfDay.now();

  final dptStnController = TextEditingController();
  final arvStnController = TextEditingController();

  String trnGpCd = '109';

  @override
  void initState() {
    loadStns();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(''), actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          )
        ]),
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
                      onPressed: changeStns,
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
                    saveStns();

                    Navigator.pushNamed(
                      context,
                      '/trains',
                      arguments: {
                        'trnGpCd': trnGpCd,
                        'dptDt': dptDt,
                        'dptTm': dptTm,
                        'dptStn': dptStnController.text,
                        'arvStn': arvStnController.text,
                      },
                    );
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
      initialDate: selectDate, // Refer step 1
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );
    if (picked != null && picked != selectDate) {
      setState(() {
        selectDate = picked;
        if (dptDt == DateFormat('yyyyMMdd').format(currentDate)) {
          selectTime = currentTime;
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

  void loadStns() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      setState(() {
        dptStnController.text = prefs.getString('dptStn') ?? '서울';
        arvStnController.text = prefs.getString('arvStn') ?? '부산';
        trnGpCd = prefs.getString('trnGpCd') ?? '109';
      });
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
    }
  }

  void saveStns() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('dptStn', dptStnController.text);
    await prefs.setString('arvStn', arvStnController.text);
    await prefs.setString('trnGpCd', trnGpCd);
  }

  void changeStns() async {
    var dptStn = dptStnController.text;
    var arvStn = arvStnController.text;

    setState(() {
      dptStnController.text = arvStn;
      arvStnController.text = dptStn;
    });
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('autoLogin', 'N');
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
