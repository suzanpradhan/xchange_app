part of 'listings_bloc.dart';

abstract class ListingsState extends Equatable {
  const ListingsState();

  @override
  List<Object> get props => [];
}

class ListingsInitial extends ListingsState {}

class AllListingsLoading extends ListingsState {}

class AllListingsLoaded extends ListingsState {
  final List<ListingModel> listingModelList;
  const AllListingsLoaded({this.listingModelList});

  @override
  List<Object> get props => [listingModelList];
}

class MyListingsLoading extends ListingsState {}

class MyListingsLoaded extends ListingsState {
  final List<ListingModel> listingModelList;
  const MyListingsLoaded({this.listingModelList});

  @override
  List<Object> get props => [listingModelList];
}

class NoAllListings extends ListingsState {
  final String message;
  const NoAllListings(this.message);

  @override
  List<Object> get props => [message];
}

class NoMyListings extends ListingsState {
  final String message;
  const NoMyListings(this.message);

  @override
  List<Object> get props => [message];
}

class UpdateProfilePgaeState extends ListingsState {
  final UserModel userModel;
  const UpdateProfilePgaeState(this.userModel);

  @override
  List<Object> get props => [userModel];
}
