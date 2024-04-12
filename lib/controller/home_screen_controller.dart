import 'dart:convert';

import 'package:api_model_conversion_jan/model/api_res_model.dart';
import 'package:api_model_conversion_jan/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List<StudentModel> studentModelList = [];
  RestModel? resModel;

  var myData;
  Map<String, dynamic> studentMap = {
    "data": [
      {
        "name": "asdfgh",
        "place": "123456789",
        "age": 3,
        "ph": "23456789",
        "batch": "cvbnm,",
      },
      {
        "name": "John Doe",
        "place": "987654321",
        "age": 20,
        "ph": "9876543210",
        "batch": "xyz",
      },
      {
        "name": "Jane Smith",
        "place": "456789123",
        "age": 25,
        "ph": "1234567890",
        "batch": "abc",
      },
      {
        "name": "shiahb",
        "place": "456789123",
        "age": 25,
        "ph": "1234567890",
        "batch": "abc"
      },
      // Add more data here as needed
    ]
  };

// write funciton to convert the map into a model class

  convertTomodel() {
    // studentModel = StudentModel.fromJson(studentMap);
    // studentModelList = studentMap
    //     .map((e) => StudentModel(
    //         age: e["age"],
    //         batch: e["batch"],
    //         name: e["name"],
    //         ph: e["ph"],
    //         place: e["place"]))
    //     .toList();
    StudentRestModel res = StudentRestModel.fromJson(studentMap);
    studentModelList = res.studentList ?? [];
  }

  //get data form api
  Future getData() async {
    //url
    Uri url = Uri.parse("https://reqres.in/api/users?page=2");

    // calling api get mehtod
    var res = await http.get(url);
    //checking status code
    if (res.statusCode == 200) {
      print(res.body);
//converting json
      var convertedData = jsonDecode(res.body);
      myData = convertedData;
      resModel = RestModel.fromJson(convertedData);
    } else {
      print("Failed");
    }
  }
}
