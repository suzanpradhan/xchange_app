import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xchangeconnection/models/country_model.dart';
import 'package:xchangeconnection/models/listing_model.dart';
import 'package:xchangeconnection/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:xchangeconnection/models/register_model.dart';
import 'package:xchangeconnection/models/user_model.dart';
import 'package:xchangeconnection/utils/utilities.dart';
import 'package:http_parser/http_parser.dart';

class ApiMethods {
  Future<LoginModel> login(LoginModel _loginModel) async {
    final _response = await http.post(ApiConstants.userLogin,
        headers: <String, String>{
          'authorization': ApiConstants.basicAuth,
          'api_key': ApiConstants.apiValue
        },
        body: _loginModel.toJson());

    if (_response.statusCode == 200) {
      return LoginModel.fromJsonVerified(json.decode(_response.body));
    } else if (_response.statusCode == 401) {
      throw (json.decode(_response.body)['errors']);
    } else {
      throw ("User Authentication Problem");
    }
  }

  Future<String> register(RegisterModel _registerModel) async {
    final _response = await http.post(ApiConstants.userSignUp,
        headers: <String, String>{
          'authorization': ApiConstants.basicAuth,
          'api_key': ApiConstants.apiValue
        },
        body: _registerModel.toJson());

    if (_response.statusCode == 200) {
      return "User Created";
    } else {
      throw Exception("User cannot be created!");
    }
  }

  Future<List<ListingModel>> getAllListings() async {
    final _response = await http.get(
      ApiConstants.getAllListings,
      headers: <String, String>{
        'authorization': ApiConstants.basicAuth,
        'api_key': ApiConstants.apiValue
      },
    );

    if (_response.statusCode == 200) {
      final _responseBody = json.decode(_response.body);
      Iterable listData = _responseBody['response'];

      return listData
          .map((modelData) => ListingModel.fromJson(modelData))
          .toList();
    } else {
      throw ("No Listings.");
    }
  }

  Future<List<ListingModel>> getMyListings(String user_id) async {
    final _response = await http.get(
      ApiConstants.getUserListings + "$user_id",
      headers: <String, String>{
        'authorization': ApiConstants.basicAuth,
        'api_key': ApiConstants.apiValue
      },
    );

    if (_response.statusCode == 200) {
      return [ListingModel.fromJson(json.decode(_response.body)['response'])];
    } else {
      throw ("No Listings.");
    }
  }

  Future<String> createMyListings(
      ListingModel listingModel, String user_id, PickedFile pickedFile) async {
    Dio dio = Dio();
    debugPrint(pickedFile.path);
    String filename = pickedFile.path.split('/').last;
    FormData formData = FormData.fromMap({
      'title': listingModel.title,
      'name': listingModel.name,
      'address': listingModel.address,
      'description': listingModel.description,
      'email': listingModel.email,
      'phone': listingModel.phone,
      'web': listingModel.website,
      "userfile[]": await MultipartFile.fromFile(pickedFile.path,
          filename: filename, contentType: MediaType("image", "jpg")),
      'type': "image/jpg"
    });
    Response response = await dio.post(ApiConstants.postUserListing + user_id,
        data: formData,
        options: Options(headers: {
          'authorization': ApiConstants.basicAuth,
          'api_key': ApiConstants.apiValue
        }));

    if (response.statusCode == 200) {
      return "Listing created Sucessfully";
    } else {
      return ("Listing not created!");
    }
  }

  Future<UserModel> getUserProfile(String user_id) async {
    final _response = await http.get(
      ApiConstants.getUser + "$user_id",
      headers: <String, String>{
        'authorization': ApiConstants.basicAuth,
        'api_key': ApiConstants.apiValue
      },
    );

    if (_response.statusCode == 200) {
      return UserModel.fromJson(json.decode(_response.body)['response']);
    } else {
      throw ("No Listings.");
    }
  }

  Future<String> updateProfile(UserModel _userModel, String user_id) async {
    final _response = await http.put(ApiConstants.editUser + "$user_id",
        headers: <String, String>{
          'authorization': ApiConstants.basicAuth,
          'api_key': ApiConstants.apiValue
        },
        body: _userModel.toJson());

    if (_response.statusCode == 200) {
      return "User updated Sucessfully";
    } else {
      throw ("User not updated.");
    }
  }

  Future<List<CountryModel>> getAllCountries() async {
    final _response = await http.get(
      ApiConstants.getAllCountry,
      headers: <String, String>{
        'authorization': ApiConstants.basicAuth,
        'api_key': ApiConstants.apiValue
      },
    );

    if (_response.statusCode == 200) {
      final _responseBody = json.decode(_response.body);
      Iterable listData = _responseBody['response'];

      return listData
          .map((modelData) => CountryModel.fromJson(modelData))
          .toList();
    } else {
      throw ("No Country Found.");
    }
  }

  Future<String> changePassword(
      String newPassword, String oldPassword, String userID) async {
    final _response = await http.put(ApiConstants.changePassword + userID,
        headers: <String, String>{
          'authorization': ApiConstants.basicAuth,
          'api_key': ApiConstants.apiValue
        },
        body: {
          "current_password": oldPassword,
          "new_password": newPassword
        });

    if (_response.statusCode == 200) {
      return json.decode(_response.body)["message"];
    } else if (_response.statusCode == 400) {
      return "Invalid current Password";
    } else {
      return ("Password Change unsuccessful");
    }
  }
}
