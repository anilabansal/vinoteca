





import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vinoteca_app/view/app_common_widgets/snackbar.dart';

import '../../common/utils/utilities.dart';
import '../../database/app_database.dart';
import 'webservices_constants.dart';


Future<dynamic> callPostApi(Map<String, dynamic> body, String endPoint,{String? token}) async {
  print('URL Request ------------------------------->\n ${WebServicesConstant.baseUrl+endPoint}');
  print('API Request ------------------------------->\n ${jsonEncode(body)}');

  var  headers;
  if(token!=null){
    headers = {
      "Content-Type": "application/json",
      "Authorization":"Bearer $token"
    };
  }else{
    headers = {
      "Content-Type": "application/json",
    };
  }



  print(
      'API Request Header ------------------------------->\n ${jsonEncode(headers)}');

  try {

    var request = http.Request('POST', Uri.parse(WebServicesConstant.baseUrl+endPoint));
    request.body = json.encode(body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {

      var responseString= await response.stream.bytesToString();
      print(responseString);
      return json.decode(responseString);

    }else if (response.statusCode == 401) {

     snackBarCommon("Server Error", "Your login session is expired. Please login again to continue.");

     AppLocalStorage().clearData();
     Get.offNamed("/login");
    }
    else {
      print(response.reasonPhrase);
    }

  } catch (e) {
    print('$e');

  }
}


Future<dynamic> callMultipartApi(Map<String, String> body,String token,String filePath,String fileName, String endPoint,
    ) async {
  print('URL Request ------------------------------->\n ${WebServicesConstant.baseUrl+endPoint}');
  print('API Request ------------------------------->\n ${jsonEncode(body)}');

  try {
    var request = new http.MultipartRequest("POST", Uri.parse(WebServicesConstant.baseUrl+endPoint));
    request.fields.addAll(body);
    if(token!=""){
      request.headers.addAll({"Authorization":"Bearer $token"});
    }

    if(filePath!=""){
      request.files.add(await http.MultipartFile.fromBytes(fileName,
        await File.fromUri(Uri.parse(filePath)).readAsBytes(),
        filename:"profile_${DateTime.now().microsecond}.png",
      ));
    }


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var responseString= await response.stream.bytesToString();
      print(responseString);
      return json.decode(responseString);

    }else if (response.statusCode == 401) {

      snackBarCommon("Server Error", "Your login session is expired. Please login again to continue.");

      AppLocalStorage().clearData();
      Get.offNamed("/login");
    }
    else {
      print(response.reasonPhrase);
    }

  } catch (e) {
    print('$e');
  }
}

Future<dynamic> callGetApi(Map<String, dynamic> body, String endPoint,
    {
      String? token,
      }) async {
  try {
    print('URL Request ------------------------------->url\n ${WebServicesConstant.baseUrl+endPoint}');
    var headers;
    if(token!=null){
      print('token ------------------>\n $token');
      headers = {
        "Authorization": 'Bearer $token',
      };
    }

    final response = await http.get(
      Uri.parse(WebServicesConstant.baseUrl+endPoint),
      headers: headers,
    );
    String finalResponse = response.body;

    if(response.statusCode==200){
      print('endPoint API request header ------------------>\n ${response.headers}');
      print('endPoint API response ------------------>\n $finalResponse');
      return jsonDecode(finalResponse);
    }else if (response.statusCode == 401) {

      snackBarCommon("Server Error", "Your login session is expired. Please login again to continue.");

      AppLocalStorage().clearData();
      Get.offNamed("/login");
    } else {
      print(response.reasonPhrase);
    }

  } catch (e) {
    print('$e');
  }


}



Future<dynamic> callPostApiPayments(Map<String, dynamic> body, String endPoint,{String? token}) async {
  print('URL Request ------------------------------->\n ${WebServicesConstant.sandboxSquareBaseUrl+endPoint}');
  print('API Request ------------------------------->\n ${jsonEncode(body)}');

  var  headers;

  if(token!=null){
    //Sandbox access token
    headers = {
      "Content-Type": "application/json",
      "Authorization":"Bearer $token",
      "Square-Version":convertDate()
    };
  }else{
    headers = {
      "Content-Type": "application/json",
    };
  }



  print(
      'API Request Header ------------------------------->\n ${jsonEncode(headers)}');

  try {

    var request = http.Request('POST', Uri.parse(WebServicesConstant.sandboxSquareBaseUrl+endPoint));
    request.body = json.encode(body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {

      var responseString= await response.stream.bytesToString();
      print(responseString);
      return json.decode(responseString);

    }
    else {
      print(response.reasonPhrase);
    }

  } catch (e) {
    print('$e');

  }
}


