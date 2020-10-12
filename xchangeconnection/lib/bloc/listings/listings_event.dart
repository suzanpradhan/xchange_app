part of 'listings_bloc.dart';

abstract class ListingsEvent extends Equatable {
  const ListingsEvent();

  @override
  List<Object> get props => [];
}

class AllListingsInitial extends ListingsEvent {}

class MyListingsInitial extends ListingsEvent {}

class AllListingLoad extends ListingsEvent {}

class MylistingLoad extends ListingsEvent {
  final String userId;
  const MylistingLoad(this.userId);

  @override
  List<Object> get props => [userId];
}

class AllListingClicked extends ListingsEvent {
  final ListingModel listingModel;
  const AllListingClicked({this.listingModel});

  @override
  List<Object> get props => [listingModel];
}

class MyListingClicked extends ListingsEvent {
  final ListingModel listingModel;
  const MyListingClicked({this.listingModel});

  @override
  List<Object> get props => [listingModel];
}

class UpdateProfilePage extends ListingsEvent {
  final String userID;
  const UpdateProfilePage(this.userID);

  @override
  List<Object> get props => [userID];
}
