import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/semantics.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/models/listing_model.dart';
import 'package:xchangeconnection/models/user_model.dart';

part 'listings_event.dart';
part 'listings_state.dart';

class ListingsBloc extends Bloc<ListingsEvent, ListingsState> {
  final ApiRepo apiRepo;
  ListingsBloc(this.apiRepo) : super(ListingsInitial());

  @override
  Stream<ListingsState> mapEventToState(
    ListingsEvent event,
  ) async* {
    if (event is AllListingsInitial) {
      yield AllListingsLoading();
    }
    if (event is MyListingsInitial) {
      yield MyListingsLoading();
    }
    if (event is AllListingLoad) {
      try {
        List<ListingModel> _responseModelDataList =
            await apiRepo.getAllListings();
        if (_responseModelDataList.length <= 0) {
          yield NoAllListings("No listings.");
        } else {
          yield AllListingsLoaded(listingModelList: _responseModelDataList);
        }
      } catch (message) {
        yield NoAllListings(message.toString());
      }
    }
    if (event is MylistingLoad) {
      try {
        List<ListingModel> _responseModelDataList =
            await apiRepo.getMyListings(event.userId);
        if (_responseModelDataList.length <= 0) {
          yield NoMyListings("No listings.");
        } else {
          yield MyListingsLoaded(listingModelList: _responseModelDataList);
        }
      } catch (message) {
        yield NoMyListings(message.toString());
      }
    }
    if (event is UpdateProfilePage) {
      final _userData = await apiRepo.getUserProfile(event.userID);
      yield UpdateProfilePgaeState(_userData);
    }
  }
}
