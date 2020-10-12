import 'package:flutter/material.dart';
import 'package:xchangeconnection/bloc/listings/listings_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xchangeconnection/src/screens/login_screen.dart';
import 'package:xchangeconnection/src/widgets/listing_card.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class MyListingPage extends StatefulWidget {
  final String user_id;
  MyListingPage(this.user_id);
  @override
  _MyListingPageState createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage> {
  @override
  Widget build(BuildContext context) {
    final Size _mediaSize = MediaQuery.of(context).size;
    BlocProvider.of<ListingsBloc>(context).add(MyListingsInitial());
    if (widget.user_id == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "You need to be logged in first to create or manage listings.",
                textAlign: TextAlign.center,
                style: Typograph.bodyTextBlackGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: Text(
                    "Login me now",
                    style: Typograph.mediumTextWhite,
                  ),
                  color: ColorsPalette.accentRed,
                  height: 50,
                  minWidth: _mediaSize.width,
                  splashColor: ColorsPalette.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ],
        ),
      );
    } else {
      return buildBlocBuilder();
    }
  }

  BlocBuilder<ListingsBloc, ListingsState> buildBlocBuilder() {
    return BlocBuilder<ListingsBloc, ListingsState>(
      builder: (context, state) {
        if (state is MyListingsLoaded) {
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
        } else if (state is NoAllListings) {
          return Center(
            child: Text(
              state.message,
              style: Typograph.bodyTextBlack,
            ),
          );
        } else if (state is MyListingsLoading) {
          BlocProvider.of<ListingsBloc>(context)
              .add(MylistingLoad(widget.user_id));
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
