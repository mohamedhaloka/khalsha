import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:khalsha/core/data/source/local/lang_locale.dart';
import 'package:khalsha/core/data/source/local/user_local.dart';
import 'package:path_provider/path_provider.dart';

class HttpService extends GetxService {
  HttpService(dio.Dio dio) {
    _dio = dio;
    _dio.options.baseUrl = baseURL;
  }

  static const websiteURL = 'https://khlasha.com/';
  static const baseURL = 'https://khlasha.com/api/';
  static const fileBaseURL = '';
  static const userType = 'importer';

  late dio.Dio _dio;

  Future<dio.Response> post(String endPoint, dio.FormData data) async {
    log(baseURL + endPoint, name: 'URL');
    log(data.fields.toString(), name: 'BODY');
    log(data.fields.length.toString(), name: 'BODY');
    log(data.files.length.toString(), name: 'BODY');

    var response = await _dio.post(
      baseURL + endPoint,
      data: data,
      options: dio.Options(headers: header),
    );
    _unAuthorizedUser(response);

    return response;
  }

  Future<dio.Response> put(String endPoint, Map<String, dynamic> data) async {
    log(baseURL + endPoint, name: 'URL');
    log(data.toString(), name: 'BODY');
    log(data.length.toString(), name: 'BODY');

    var response = await _dio.put(
      baseURL + endPoint,
      data: data,
      options: dio.Options(
        contentType: 'application/x-www-form-urlencoded',
        headers: header,
      ),
    );
    _unAuthorizedUser(response);

    return response;
  }

  void _unAuthorizedUser(dio.Response response) {
    if (response.data['message'] == 'Unauthenticated.') {}
  }

  Future<File> download(String url) async {
    log('DOWNLOAD URL $url');
    var tempDir = await getTemporaryDirectory();
    String fullPath = '${tempDir.path}/${url.split('/').last}';
    log('File name $fullPath');
    bool isExist = await File(fullPath).exists();

    if (isExist) {
      return File(fullPath);
    }
    log(fileBaseURL + url, name: 'FILE URL');
    var response = await _dio.get(
      fileBaseURL + url,
      options: dio.Options(
        responseType: dio.ResponseType.bytes,
        followRedirects: false,
      ),
    );
    File file = File(fullPath);
    var raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  }

  Future<dio.Response> get(endPoint) async {
    log('URL ${baseURL + endPoint}');
    var response = await _dio.get(
      baseURL + endPoint,
      options: dio.Options(headers: header),
    );
    return response;
  }

  static Map<String, String> get header => {
        'Authorization': 'Bearer ${UserDataLocal.instance.token}',
        'lang': Lang.instance.langCode,
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      };
}
