import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:nisrankingtop/api/api.dart';

class UserApi {
  static UserApi? _instance;

  factory UserApi() => _instance ??= UserApi._();
 
  UserApi._();

  Future<Map<String, dynamic>> getApiKey(String iin, String password) async {
    var response = await Api().dio.post('api.php?request=getuserapikey',
        data: new FormData.fromMap({"iin": iin, "password": password}));
    // try convert response.data to map. If it is not possible, return null
    try {
      var data = json.decode(response.data);
      // It checks if the response contains the keys `apiKey` and `userId`. If it does, it returns the
      // value of `apiKey` and `userId`.
      if (data.containsKey('apiKey') && data.containsKey('id')) {
        return {'apiKey':data['apiKey'],'userId':data['id']};
      }
    } on FormatException {
      return {};
    }
    return {};
  }
  
  Future<Map<String, dynamic>> getUserInfoByIIN(String iin) async {
    var unescape = new HtmlUnescape();
    var response = await Api().dio.post('api.php?request=getuserinfo',
        data: new FormData.fromMap({"iin": iin}));
    // return unescape.convert(json.decode(response.data));
    try {
      var data = json.decode(response.data);

      if (data.containsKey('userData')) {
        // return {} if data['userData'] is string
        if (data['userData'] is String) {
          return {};
        }
        var tmpdt = data['userData'];

        // if tmpdt contains userId, iin, name, gradeId keys return
        if (tmpdt.containsKey('userId') &&
            tmpdt.containsKey('iin') &&
            tmpdt.containsKey('name') &&
            tmpdt.containsKey('gradeId') &&
            tmpdt.containsKey('gradeName') &&
            tmpdt.containsKey('shanyraqId') &&
            tmpdt.containsKey('shanyraqName') &&
            tmpdt.containsKey('leaderId')) {
          if (tmpdt['leaderId'] == tmpdt['userId']) {
            tmpdt['shanyraqRole'] = "leader";
          } else {
            tmpdt['shanyraqRole'] = "member";
          }
          return {
            "id": tmpdt['userId'],
            "iin": tmpdt['iin'],
            "name": tmpdt['name'],
            "gradeId": tmpdt['gradeId'],
            "gradeName": tmpdt['gradeName'],
            "shanyraqId": tmpdt['shanyraqId'],
            "shanyraqName": tmpdt['shanyraqName'],
            "shanyraqRole": tmpdt['shanyraqRole'],
            // "ministry": unescape.convert(tmpdt['ministry']),
            // "scores": tmpdt['scores'],
          };
        }
        return {};
      }
    } on FormatException {
      return {};
    }
    return {};
  }

  Future<dynamic> getUserInfoById(String id) async {
    var unescape = new HtmlUnescape();
    var response = await Api().dio.post('api.php?request=getuserinfo',
        data: new FormData.fromMap({"userId": id}));
    // print(response.data);
    // return unescape.convert(json.decode(response.data));
    try {
      var data = json.decode(response.data);

      if (data.containsKey('userData')) {
        // return {} if data['userData'] is string
        if (data['userData'] is String) {
          return {};
        }
        var tmpdt = data['userData'];

        // if tmpdt contains userId, iin, name, gradeId keys return
        if (tmpdt.containsKey('userId') &&
            tmpdt.containsKey('iin') &&
            tmpdt.containsKey('name') &&
            tmpdt.containsKey('gradeId') &&
            tmpdt.containsKey('gradeName') &&
            tmpdt.containsKey('shanyraqId') &&
            tmpdt.containsKey('shanyraqName') &&
            tmpdt.containsKey('leaderId') &&
            tmpdt.containsKey('scores') &&
            tmpdt.containsKey('studentsTop')) {
          if (tmpdt['leaderId'] == tmpdt['userId']) {
            tmpdt['shanyraqRole'] = "leader";
          } else {
            tmpdt['shanyraqRole'] = "member";
          }
          return {
            "id": tmpdt['userId'],
            "iin": tmpdt['iin'],
            "name": tmpdt['name'],
            "gradeId": tmpdt['gradeId'],
            "gradeName": tmpdt['gradeName'],
            "shanyraqId": tmpdt['shanyraqId'],
            "shanyraqName": tmpdt['shanyraqName'],
            "shanyraqRole": tmpdt['shanyraqRole'],
            "scores": tmpdt['scores'],
            "studentsTop": tmpdt['studentsTop'],
            // "ministry": unescape.convert(tmpdt['ministry']),
            // "scores": tmpdt['scores'],
          };
        }
        return {};
      }
    } on FormatException {
      return {};
    }
    return {};
  }
}
