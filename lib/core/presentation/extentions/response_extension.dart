import 'dart:convert';

import 'package:dio/dio.dart';

extension ResponseErrorMessage on Response<dynamic>? {
  String? getErrorMessage() {
    if (this == null) return null;
    Map<String, dynamic> data = (this!.data as Map<String, dynamic>);
    if (data.containsKey('message') && !data.containsKey('type')) {
      return data['message'];
    }
    return json.encode(data);
  }
}
