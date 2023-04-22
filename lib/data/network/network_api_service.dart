import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled/data/app_exception.dart';

import '../../models/response/image.dart';

class NetworkApiService {
  dynamic responseJson;

  Future postApi(String url, requestBody) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      return false;
    }

  }

  Future uploadImage(String url, file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('files', file));

    var response = await request.send();

    if (response.statusCode == 200) {
      final res = await response.stream.bytesToString();
      var imageList = imageModelFromJson(res);
      return imageList[0];
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future<dynamic> getApiResponse(String url) async{
    try{
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}

returnResponse(http.Response response) {
  // print('response status : ${response.statusCode}');
  switch(response.statusCode){
    case 200:
        print('response :: ${response.body}');
        return jsonDecode(response.body);
    case 400:
        throw FetchDataException('No internet connection');
  }
}