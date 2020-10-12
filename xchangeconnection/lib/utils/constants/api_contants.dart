import 'dart:convert';

class ApiConstants {
  static final apiKey = "api_key";
  static final apiValue = "jhzy6s79b0flui51";
  static final apiUsername = "admin";
  static final apiPassword = "2fk51nrl36wo";
  static final apiAuthType = "Basic Auth";
  static final String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$apiUsername:$apiPassword'));
  static final userSignUp =
      "https://xchangeconnection.com/authentication/signup";
  static final userLogin = "https://xchangeconnection.com/authentication/login";
  static final changePassword =
      "https://xchangeconnection.com/authentication/password/id/";
  static final getUser =
      "https://xchangeconnection.com/authentication/user/get/id/";
  static final editUser =
      "https://xchangeconnection.com/authentication/user/edit/id/";
  static final getAllCountry = "https://xchangeconnection.com/country";
  static final eetCountry = "https://xchangeconnection.com/country/id";
  static final getAllListings = "https://xchangeconnection.com/listing";
  static final getListings = "https://xchangeconnection.com/listing/id/";
  static final getUserListings = "https://xchangeconnection.com/listing/uid/";
  static final postUserListing = "https://xchangeconnection.com/listing/uid/";
}
