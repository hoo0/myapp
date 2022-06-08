import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

import '../constants.dart';
import 'network_service.dart';

const versionUrl = '/com.korail.mobile.common.stationinfo';
const stationUrl = '/com.korail.mobile.common.stationdata';

class StationService {
  static Map<String, dynamic> localVersion = {};
  static Map<String, dynamic> localStation = {};
  static Map<String, dynamic> newVersion = {};
  static Map<String, dynamic> newStation = {};
  static Map<String, dynamic> stationMap = {};

  static Future<void> getStation() async {
    /* {"map_version": "220314001","count": "265"} */
    newVersion = await NetworkService.getData('$baseUrl$versionUrl?Device=$device').then((response) => jsonDecode(response.data));
    debugPrint('getStation: newVersion=$newVersion');

    await _loadData();

    int iNewVersion = int.parse(newVersion['map_version'] ?? '0');
    int iLocalVersion = int.parse(localVersion['map_version'] ?? '0');
    debugPrint('getStation: iLocalVersion=$iLocalVersion iNewVersion=$iNewVersion');

    if (iLocalVersion < iNewVersion) {
      await _updateData();
      await _loadData();
    }
  }

  static Future<void> _updateData() async {
    newStation = await NetworkService.getData('$baseUrl$stationUrl?Device=$device').then((response) => jsonDecode(response.data));

    await _saveData();
  }

  static Future<void> _loadData() async {
    final LocalStorage storage = LocalStorage('station');
    await storage.ready;

    localVersion = await storage.getItem('version') ?? {};
    localStation = await storage.getItem('station') ?? {};
    // debugPrint('_loadData: localVersion=$localVersion');

    makeStationMap();
  }

  static Future<void> _saveData() async {
    final LocalStorage storage = LocalStorage('station');
    await storage.ready;

    await storage.setItem('version', newVersion);
    await storage.setItem('station', newStation);
  }

  static void makeStationMap() {
    if (localStation['stns'] != null && localStation['stns']['stn'] != null) {
      localStation['stns']['stn'].map((stn) {
        stationMap[stn['stn_cd']] = stn['stn_nm'];
      }).toList();
    }

    // debugPrint('makeStationMap: stationMap=$stationMap');
    debugPrint('makeStationMap: 0001=' + getStationName('0001'));
  }

  static String getStationName(String stationCode) {
    return stationMap[stationCode] ?? stationCode;
  }
}
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
