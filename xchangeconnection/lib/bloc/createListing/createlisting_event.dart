part of 'createlisting_bloc.dart';

abstract class CreatelistingEvent extends Equatable {
  const CreatelistingEvent();

  @override
  List<Object> get props => [];
}

class ImagePick extends CreatelistingEvent {}

class NoImageEvent extends CreatelistingEvent {}

class UpdateImageEvent extends CreatelistingEvent {
  final String imageLink;
  const UpdateImageEvent(this.imageLink);

  @override
  List<Object> get props => [imageLink];
}

class CreateListingClicked extends CreatelistingEvent {
  final PickedFile pickedfile;
  final String userId;
  final ListingModel listingModel;
  const CreateListingClicked({this.listingModel, this.pickedfile, this.userId});

  @override
  List<Object> get props => [listingModel, userId, pickedfile];
}
