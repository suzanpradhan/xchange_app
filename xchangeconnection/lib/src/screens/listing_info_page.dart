import 'package:flutter/material.dart';
import 'package:xchangeconnection/models/listing_model.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class ListingInfoPage extends StatefulWidget {
  final ListingModel listingModel;
  ListingInfoPage(this.listingModel);
  @override
  _ListingInfoPageState createState() => _ListingInfoPageState();
}

class _ListingInfoPageState extends State<ListingInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPalette.white,
      appBar: AppBar(
        elevation: 5,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorsPalette.blackGrey,
          ),
        ),
        title: Text(
          widget.listingModel.title,
          style: Typograph.mediumTextBlack,
        ),
        backgroundColor: ColorsPalette.white,
      ),
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.listingModel.image),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.listingModel.title,
                    style: Typograph.mediumTextBlack,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.listingModel.description,
                    style: Typograph.bodyTextBlackGrey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Contact Details",
                    style: Typograph.mediumTextBlack,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: ColorsPalette.accentRed,
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          "Name :",
                          style: Typograph.bodyTextGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.listingModel.name ?? "",
                            style: Typograph.bodyTextBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          "Address :",
                          style: Typograph.bodyTextGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.listingModel.address ?? "",
                            style: Typograph.bodyTextBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          "Phone :",
                          style: Typograph.bodyTextGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.listingModel.phone ?? "",
                            style: Typograph.bodyTextBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          "Website :",
                          style: Typograph.bodyTextGrey,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              widget.listingModel.website ?? "",
                              style: Typograph.bodyTextBlack,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          "Email :",
                          style: Typograph.bodyTextGrey,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              widget.listingModel.email ?? "",
                              style: Typograph.bodyTextBlack,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
