import 'package:flutter/material.dart';
import 'package:xchangeconnection/models/listing_model.dart';
import 'package:xchangeconnection/src/screens/listing_info_page.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class ListingCard extends StatefulWidget {
  final ListingModel listingModel;
  ListingCard(this.listingModel);
  @override
  _ListingCardState createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageCache.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ListingInfoPage(widget.listingModel);
          }));
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: ColorsPalette.greyMedium,
                    blurRadius: 18,
                    spreadRadius: -2,
                    offset: Offset(0, 5))
              ],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                    widget.listingModel.image,
                  ))),
        ),
      ),
    );
  }
}
