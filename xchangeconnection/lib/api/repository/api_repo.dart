import 'package:image_picker/image_picker.dart';
import 'package:xchangeconnection/api/methods/api_methods.dart';
import 'package:xchangeconnection/models/country_model.dart';
import 'package:xchangeconnection/models/listing_model.dart';
import 'package:xchangeconnection/models/login_model.dart';
import 'package:xchangeconnection/models/register_model.dart';
import 'package:xchangeconnection/models/user_model.dart';

class ApiRepo {
  Future<LoginModel> login(LoginModel _loginModel) =>
      ApiMethods().login(_loginModel);

  Future<String> register(RegisterModel _registerModel) =>
      ApiMethods().register(_registerModel);

  Future<List<ListingModel>> getAllListings() => ApiMethods().getAllListings();

  Future<List<ListingModel>> getMyListings(String user_id) =>
      ApiMethods().getMyListings(user_id);

  Future<String> createMyListing(
          String user_id, ListingModel listingModel, PickedFile pickedFile) =>
      ApiMethods().createMyListings(listingModel, user_id, pickedFile);

  Future<UserModel> getUserProfile(String userID) =>
      ApiMethods().getUserProfile(userID);
  Future<String> updateProfile(String userID, UserModel userModel) =>
      ApiMethods().updateProfile(userModel, userID);
  Future<List<CountryModel>> getAllCountries() =>
      ApiMethods().getAllCountries();
  Future<String> changePassword(
          String newPassword, String oldPassword, String userID) =>
      ApiMethods().changePassword(newPassword, oldPassword, userID);
}
