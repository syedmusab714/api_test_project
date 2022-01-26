import 'dart:convert';

import 'package:api_test/Models/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  _ApiTestState createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  ApiDataModel _apiData = ApiDataModel();
  List data = [];
  var baseUrl = "sub.dev.healthsolutions.com.pk";

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
      ),
      body: Container(
        height: _height * 1,

        child: Center(
          // child: ListView.builder(?
          //   itemCount: ,
          // itemBuilder: (context, index){
          //   return
          child: Text(
            _apiData.result!.availabilityStatus.toString(),
            // );
            // },
          ),
        ),
        // child: SingleChildScrollView(
        //   child: ListView.builder(
        //       itemCount: ,// Todo: implement
        //       itemBuilder: (context, index){
        //     return Container();
        //   }),
        // ),
      ),
    );
  }

  Future<ApiDataModel> _getData() async {
    Map<String, String> headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDJkYmE2MThjZTYxNzk0NjkwYTVmNzQzOTlkYmM0Mzk0Njk4NzA4ZGE2MTIyMmRjYmJkNjI2MjA5MjJjNGRkZjM3OWQ1ZDIzMzM5OTE3MDYiLCJpYXQiOjE2NDMxODUwMjIsIm5iZiI6MTY0MzE4NTAyMiwiZXhwIjoxNjc0NzIxMDIyLCJzdWIiOiI5NjU4Iiwic2NvcGVzIjpbXX0.lkPAccoQoaPUFogjVDBzv7POAwn5R3V3dvxc0qxoFKjkVyD5TYaH-ccrz55iBkHJWa8iV5Hhsh-L3-E68bUvdWdPFmGRMSMUseEGwWnmSyXXs_322kxy_qUckFAQycN9d_LqG_-e75TLqciRfxueFTc7FdqHJiQUYd_rzZXkTevAb75O_DYrKIVKKvFJPHfDY6l0MKbB8P7WJTrGAU6gJeMUbLiDOcBVwEuFX5d7ezL-qOusKc3rEnVoN-LuBZNWkOP3WjAsJJ93QytolJiitZ0_7h42wkxuOmtMZVri5XCAgIQH_4UYXs0RdldZzMWD9mScgDDBRSU4_RY7VavxXwce-APKefIEwaqjzjYwsh0d8vjalyVHqkFyP0eTtITesm_32SAgMJJa_TmjG0tGdS1eWi_FBDqGDxEhSxTkl4w2M27abgy319iRPOMk22T0fht0xUjrcfQiP6K_WSnd7GfsrutgOg35I5dbyJuRDMfHdJ8L8c3UkRJg86mcjRI6BOyT1uXX92xh-YUkSTj05SnD5-CUEs-c7aPMiRYPufwKnJYx42814rZ4eBW5IiM0MRqQpHSYOnY_F-tdyHNBBLqekzNJNv9QkV2M0AXLLt1y8Pt33sU5ffGQ6AvAulx4R32_nt_ydwNhLRnAc9xlgIWKbHyT52BVAv_8uUtmHqA',
      'X-Requested-With': 'XMLHttpRequest'
    };

    final response = await http.get(
      Uri.http(
        baseUrl,
        '/public/api/status_view/9658',
      ),
      headers: headers,
    );

    // setState(() {
    var data = jsonDecode(response.body);

    ApiDataModel apiData = ApiDataModel.fromJson(data);
    // });

    debugPrint(response.body);

    if (response.statusCode == 200) {
      debugPrint(_apiData.result!.availabilityStatus);
      debugPrint(_apiData.message);
      debugPrint(_apiData.status.toString());
    } else {
      throw Exception('error');
    }

    return _apiData;
  }
}
