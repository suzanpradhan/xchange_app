part of 'updateprofile_bloc.dart';

abstract class UpdateprofileEvent extends Equatable {
  const UpdateprofileEvent();

  @override
  List<Object> get props => [];
}

class CountrySelect extends UpdateprofileEvent {}

class CountrySelected extends UpdateprofileEvent {
  final CountryModel countryModel;
  const CountrySelected({this.countryModel});

  @override
  List<Object> get props => [countryModel];
}

class GetUserProfile extends UpdateprofileEvent {
  final String userID;
  const GetUserProfile(this.userID);

  @override
  List<Object> get props => [userID];
}

class UpdateProfile extends UpdateprofileEvent {
  final String userID;
  final UserModel userModel;
  const UpdateProfile(this.userModel, this.userID);

  @override
  List<Object> get props => [userModel, userID];
}

class UserProfilePlace extends UpdateprofileEvent {}

class UserProfileDataLoaded extends UpdateprofileEvent {}
