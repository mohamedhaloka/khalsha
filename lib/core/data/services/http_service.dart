import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../local_storage/lang_locale.dart';
import '../local_storage/user_local.dart';

class HttpService extends GetxService {
  String? useToken, lang;
  bool? userType;
  HttpService(Dio dio, {this.lang, this.useToken, this.userType}) {
    _dio = dio;
    _dio.options.baseUrl = websiteUrl;
  }

  static const websiteUrl = 'https://khalshaa.asdevsop.com/api/';
  static const imageUrl =
      'https://api-mtawreed.tattbiqat.com/uploadFolder/original/';

  late Dio _dio;

  Future<dio.Response> post(String endPoint, dio.FormData data) async {
    log(websiteUrl + endPoint, name: 'URL');
    log(data.fields.toString(), name: 'BODY');

    var response = await _dio.post(
      websiteUrl + endPoint,
      data: data,
      options: Options(headers: _header),
    );
    return response;
  }

  Future<dio.Response> get(endPoint) async {
    log('URL ${websiteUrl + endPoint}');

    var response = await _dio.get(
      websiteUrl + endPoint,
      options: Options(headers: _header),
    );

    return response;
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
    var response = await _dio.get(
      imageUrl + url,
      options: dio.Options(
          responseType: dio.ResponseType.bytes, followRedirects: false),
    );
    File file = File(fullPath);
    var raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  }

  Future<dio.FormData> prepareImagesFromFilesList(File imageFile) async {
    dio.FormData formData = dio.FormData.fromMap({});

    try {
      formData.files.addAll([
        MapEntry(
          "file",
          await dio.MultipartFile.fromFile(imageFile.path),
        ),
      ]);
    } catch (_) {}
    return formData;
  }

  Map<String, String> get _header => {
        'Authorization': 'Bearer ${useToken ?? UserDataLocal.instance.token}',
        'lang': lang ?? Lang.instance.langCode,
        'Accept': 'application/json',
      };
}
