import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_network/constants/api_url.dart';
import 'package:http_network/services/network_helper_dio.dart';

const url = 'http://10.0.2.2:8080';
const token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNSIsImF1dGgiOiJST0xFX1VTRVIiLCJleHAiOjE2NDI0MTc1NjN9.mEjRnsmOs65S3308xbWMFdeyviMGyaKVuDV1FkP9bXq012Mx-YdC-xF13J-GmPB5Us8ceihi5UycucpIi1kOKA';

class NetworkExample extends StatefulWidget {

  @override
  _NetworkExampleState createState() => _NetworkExampleState();
}

class _NetworkExampleState extends State<NetworkExample> {
  late NetworkHelperDio dio;
  @override
  void initState() {
    super.initState();
    dio = NetworkHelperDio(url, token); // 화면 로드시 기본 url과 토큰을 헤더에 담은 Dio 생성
  }

  // GET
  void getProfile() async {
    Response response = await dio.get(ApiUrl.PROFILE);
    print(response);
    return ;
  }

  // POST with data
  void login() async {
    Response response = await dio.post(
        ApiUrl.LOGIN,
        {
          "email": 'client@client.com',
          "password": 'client'
        }
    );
    print(response);
    return;
  }

  // POST with formdata
  void enquiry() async {
    Map<String, dynamic> data = {
      "endDay": '20220101',
      "content": 'content',
      "enquiryType": 'CUSTOMS',
      "customsService": "TYPE1",
      "forwarderService": "TYPE1",
      "carrierService": "TYPE1",
      "enquiryStatus": "OPEN"
    };
    var jsonData = json.encode(data);
    MultipartFile multipartJson = MultipartFile.fromString(jsonData, filename:"", contentType: MediaType('application', 'json'));

    var formData = FormData.fromMap({
      'data': multipartJson,
      'file': [
        await MultipartFile.fromFileSync('./s7.jpg', filename: 's7.jpg'),
        await MultipartFile.fromFileSync('./s7.jpg', filename: 's7.jpg'),
      ]
    });
    
    Response response = await dio.postForm(ApiUrl.ENQUIRY, formData);
    print(response);
    return;
  }

  // PATCH
  void patchProfile() async {
    Response response = await dio.patch(ApiUrl.PROFILE, {
      'contact': '01012341234',
      'name': 'new name',
    });
    print(response);
    return;
  }

  // DELETE
  void deleteMember() async {
    Response response = await dio.delete(ApiUrl.MEMBER, {
      'email': 'string@string.com',
      'password': 'string',
    });
    print(response);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      getProfile();
                    },
                    child: Text(
                      "GET",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: Text(
                        "POST\ndata",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      enquiry();
                    },
                    child: Text(
                        "POST\nformdata",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      patchProfile();
                    },
                    child: Text(
                        "PATCH",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      deleteMember();
                    },
                    child: Text(
                        "DELETE",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // BlueButton(title: "DELETE", function: deleteMember,)
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
}


