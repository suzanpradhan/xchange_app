import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/models/country_model.dart';
import 'package:xchangeconnection/models/user_model.dart';

part 'updateprofile_event.dart';
part 'updateprofile_state.dart';

class UpdateprofileBloc extends Bloc<UpdateprofileEvent, UpdateprofileState> {
  final ApiRepo apiRepo;
  UpdateprofileBloc(this.apiRepo) : super(UpdateprofileInitial());

  @override
  Stream<UpdateprofileState> mapEventToState(
    UpdateprofileEvent event,
  ) async* {
    if (event is GetUserProfile) {
      final _userData = await apiRepo.getUserProfile(event.userID);
      yield GotUserProfileState(_userData);
    } else if (event is UserProfileDataLoaded) {
      yield UserProfileDataLoadedState();
    } else if (event is CountrySelected) {
      yield CountrySelectedState(event.countryModel);
    }

    // if (event is UserProfilePlace) {
    //   yield UserDataPlacedState();
    // } else if (event is UpdateProfile) {
    //   try {
    //     final _successMessage =
    //         await apiRepo.updateProfile(event.userID, event.userModel);
    //     yield UserDataUpdatedState(_successMessage);
    //   } catch (message) {
    //     yield UserUpdateError(message.toString());
    //   }
    // }
  }
}
