import 'package:flutter/material.dart';

const webmodeUrl = 'https://dalgona-prssx.run.goorm.io/zenith/api/proxy';

const device = 'AD';
const version = '991231001';
// const key = '';
const baseUrl = 'https://dev2.letskorail.com/classes';

const mtitBaseUrl = 'https://appdev2.letskorail.com';
const mtitVersion = '170602';
const mtitWctNo = '24001';
const mtitCgPsId = '000000';
const mtitTrnsSysId = 'RM'; //RM

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const List<Map<String, String>> trnGpCdList = [
  {
    '109': '전체'
  },
  {
    '100': 'KTX'
  },
  {
    '101': '새마을'
  },
  {
    '102': '무궁화'
  },
];

const Map<String, String> trnGpCdMap = {
  '100': 'K',
  '101': '새',
  '102': '무',
  '104': '누',
  '107': 'K산',
  '108': 'I새',
  '201': '관',
  '202': '관',
  '203': '관',
  '204': '관',
  '205': '관',
  '206': '관',
  '207': '관',
};

enum seatType { alpha, number }
