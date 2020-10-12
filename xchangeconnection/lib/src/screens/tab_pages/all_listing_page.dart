import 'package:flutter/material.dart';
import 'package:xchangeconnection/bloc/listings/listings_bloc.dart';
import 'package:xchangeconnection/models/listing_model.dart';
import 'package:xchangeconnection/src/widgets/listing_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class AllListingPage extends StatefulWidget {
  @override
  _AllListingPageState createState() => _AllListingPageState();
}

class _AllListingPageState extends State<AllListingPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ListingsBloc>(context).add(AllListingsInitial());
    return BlocBuilder<ListingsBloc, ListingsState>(
      builder: (context, state) {
        if (state is AllListingsLoaded) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  ...state.listingModelList
                      .map((index) => ListingCard(index))
                      .toList()
                ],
              ),
            ),
          );
        } else if (state is AllListingsLoading) {
          BlocProvider.of<ListingsBloc>(context).add(AllListingLoad());
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: CircularProgressIndicator(
                backgroundColor: ColorsPalette.white,
                valueColor: AlwaysStoppedAnimation(ColorsPalette.accentRed),
              )),
            ],
          );
        } else if (state is NoAllListings) {
          return Center(
            child: Text(
              state.message,
              style: Typograph.bodyTextBlack,
            ),
          );
        } else {
          return Center(
            child: Text(
              "No Listings",
              style: Typograph.bodyTextBlack,
            ),
          );
        }
      },
    );
  }
}
