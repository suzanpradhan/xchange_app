import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/models/listing_model.dart';

part 'createlisting_event.dart';
part 'createlisting_state.dart';

class CreatelistingBloc extends Bloc<CreatelistingEvent, CreatelistingState> {
  final ApiRepo apiRepo;
  CreatelistingBloc(this.apiRepo) : super(CreatelistingInitial());

  @override
  Stream<CreatelistingState> mapEventToState(
    CreatelistingEvent event,
  ) async* {
    if (event is ImagePick) {
      final ImagePicker _picker = ImagePicker();
      final ImageSource source = ImageSource.gallery;
      final pickedFile = await _picker.getImage(source: source);
      yield ImagePickedState(pickedFile);
    }
    if (event is NoImageEvent) {
      yield NoImageState();
    }
    if (event is UpdateImageEvent) {
      yield UpdateImageState(event.imageLink);
    }
    if (event is CreateListingClicked) {
      try {
        final String successMessage = await apiRepo.createMyListing(
            event.userId, event.listingModel, event.pickedfile);
        yield ListingCreatedState(successMessage);
      } catch (message) {
        yield FailedCreateListing(message.toString());
      }
    }
  }
}
