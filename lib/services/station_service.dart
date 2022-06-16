import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

import '../constants.dart';
import 'network_service.dart';

const versionUrl = '/com.korail.mobile.common.stationinfo';
const stationUrl = '/com.korail.mobile.common.stationdata';

class StationService {
  static late final LocalStorage storage;

  static Map<String, dynamic> localVersion = {};
  static Map<String, dynamic> localStation = {};
  static Map<String, dynamic> newVersion = {};
  static Map<String, dynamic> newStation = {};
  static Map<String, dynamic> stationMap = {};

  static Future<void> initStation() async {
    storage = LocalStorage('station');
    await storage.ready;

    await loadData();
    await checkAndUpdate();
    makeStationMap();
  }

  static Future<void> checkAndUpdate() async {
    await getStationVersion();

    int iNewVersion = int.parse(newVersion['map_version'] ?? '0');
    int iLocalVersion = int.parse(localVersion['map_version'] ?? '0');
    debugPrint('getStationVersion: iLocalVersion=$iLocalVersion iNewVersion=$iNewVersion');

    if (iLocalVersion < iNewVersion) {
      await getStationData();
      await saveData();
      await loadData();
    }
  }

  static Future<void> loadData() async {
    localVersion = await storage.getItem('version') ?? {};
    localStation = await storage.getItem('station') ?? {};
  }

  static Future<void> saveData() async {
    await storage.setItem('version', newVersion);
    await storage.setItem('station', newStation);
  }

  static Future<void> getStationVersion() async {
    newVersion = await NetworkService.getData2(
      '$baseUrl$versionUrl',
      {
        'Device': device,
      },
    ).then((response) => jsonDecode(response.data));
  }

  static Future<void> getStationData() async {
    newStation = await NetworkService.getData2(
      '$baseUrl$stationUrl',
      {
        'Device': device,
      },
    ).then((response) => jsonDecode(response.data));
  }

  static void makeStationMap() {
    if (localStation['stns'] != null && localStation['stns']['stn'] != null) {
      localStation['stns']['stn'].map((stn) {
        stationMap[stn['stn_cd']] = stn['stn_nm'];
      }).toList();
    }

    // debugPrint('makeStationMap: stationMap=$stationMap');
    debugPrint('makeStationMap test: 0001=' + getStationName('0001'));
  }

  static String getStationName(String stationCode) {
    return stationMap[stationCode] ?? stationCode;
  }
}
/* {"map_version": "220314001","count": "265"} */
/*
{
  stns: {
    stn: [
      {
        stn_cd: 0530, stn_nm: 가남, longitude: 127.5340237, latitude: 37.1969049, group: 1, popupMessage: , popupType: 0
      },
    ]
  }
}
 */
