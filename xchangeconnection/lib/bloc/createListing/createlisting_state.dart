part of 'createlisting_bloc.dart';

abstract class CreatelistingState extends Equatable {
  const CreatelistingState();

  @override
  List<Object> get props => [];
}

class CreatelistingInitial extends CreatelistingState {}

class ImageUploaded extends CreatelistingState {}

class ImagePickedState extends CreatelistingState {
  final PickedFile imageFile;
  const ImagePickedState(this.imageFile);

  @override
  List<Object> get props => [imageFile];
}

class NoImageState extends CreatelistingState {
  final String noImage = "assets/images/no_image.png";

  @override
  List<Object> get props => [noImage];
}

class UpdateImageState extends CreatelistingState {
  final String imageLink;
  const UpdateImageState(this.imageLink);

  @override
  List<Object> get props => [imageLink];
}

class ListingCreatedState extends CreatelistingState {
  final String message;
  const ListingCreatedState(this.message);

  @override
  List<Object> get props => [message];
}

class FailedCreateListing extends CreatelistingState {
  final String message;
  const FailedCreateListing(this.message);

  @override
  List<Object> get props => [message];
}
