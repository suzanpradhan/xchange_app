part of 'updateprofile_bloc.dart';

abstract class UpdateprofileState extends Equatable {
  const UpdateprofileState();

  @override
  List<Object> get props => [];
}

class UpdateprofileInitial extends UpdateprofileState {}

class CountrySelectedState extends UpdateprofileState {
  final CountryModel countryModel;
  const CountrySelectedState(this.countryModel);

  @override
  List<Object> get props => [countryModel];
}

class GotUserProfileState extends UpdateprofileState {
  final UserModel userModel;
  const GotUserProfileState(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class UserDataUpdatedState extends UpdateprofileState {
  final String message;
  const UserDataUpdatedState(this.message);

  @override
  List<Object> get props => [message];
}

class UserUpdateError extends UpdateprofileState {
  final String message;
  const UserUpdateError(this.message);

  @override
  List<Object> get props => [message];
}

class UserDataPlacedState extends UpdateprofileState {}

class UserProfileDataLoadedState extends UpdateprofileState {}
