import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xchangeconnection/api/methods/api_methods.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/models/listing_model.dart';
import 'package:xchangeconnection/src/screens/home_screen.dart';
import 'package:xchangeconnection/src/widgets/custom_text_field.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class CreateListingScreen extends StatefulWidget {
  final String userID;
  CreateListingScreen({this.userID});
  @override
  _CreateListingScreenState createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PickedFile pickedImage;
  ApiRepo apiRepo;
  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final ImageSource source = ImageSource.gallery;
    final pickedFile = await _picker.getImage(source: source, imageQuality: 30);
    setState(() {
      pickedImage = pickedFile;
    });
  }

  Future<String> createListing(
      ListingModel listingModel, PickedFile selectPickedImage) async {
    final String successMessage = await ApiMethods()
        .createMyListings(listingModel, widget.userID, selectPickedImage);
    return successMessage;
  }

  @override
  Widget build(BuildContext context) {
    final Size _mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
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
            "My Listing",
            style: TextStyle(color: ColorsPalette.blackGrey),
          ),
          backgroundColor: ColorsPalette.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Image", style: Typograph.bodyTextBlack),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Container(
                        width: _mediaSize.width,
                        height: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: (pickedImage == null)
                                    ? AssetImage("assets/images/no_image.png")
                                    : FileImage(File(pickedImage.path))),
                            border: Border.all(
                                width: 1, color: ColorsPalette.greyMedium),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                          onPressed: () {
                            pickImage();
                          },
                          child: Text("Upload Image",
                              style: TextStyle(color: ColorsPalette.white)),
                          color: ColorsPalette.accentRed,
                          height: 40,
                          minWidth: 100,
                          splashColor: ColorsPalette.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 5),
                  child: Text("Title", style: Typograph.bodyTextBlack),
                ),
                CustomTextField(
                  hintText: "Title",
                  isfocus: true,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  textEditingController: _titleController,
                  width: _mediaSize.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 5),
                  child: Text("Name", style: Typograph.bodyTextBlack),
                ),
                CustomTextField(
                  hintText: "Name",
                  isfocus: true,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  textEditingController: _nameController,
                  width: _mediaSize.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 5),
                  child: Text("Address", style: Typograph.bodyTextBlack),
                ),
                CustomTextField(
                  hintText: "Address",
                  isfocus: true,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  textEditingController: _addressController,
                  width: _mediaSize.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 5),
                  child: Text("E-mail", style: Typograph.bodyTextBlack),
                ),
                CustomTextField(
                  hintText: "E-mail",
                  isfocus: true,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  textEditingController: _emailContoller,
                  width: _mediaSize.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 5),
                  child: Text("Phone", style: Typograph.bodyTextBlack),
                ),
                CustomTextField(
                  hintText: "Phone",
                  isfocus: true,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  textEditingController: _phoneController,
                  width: _mediaSize.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 5),
                  child: Text("Website", style: Typograph.bodyTextBlack),
                ),
                CustomTextField(
                  hintText: "Website",
                  isfocus: true,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  textEditingController: _websiteController,
                  width: _mediaSize.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 5),
                  child: Text("Description", style: Typograph.bodyTextBlack),
                ),
                CustomTextField(
                  hintText: "Description",
                  isfocus: true,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  textEditingController: _descriptionController,
                  width: _mediaSize.width,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: MaterialButton(
                      onPressed: () {
                        if (_titleController.text == "") {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Please enter title."),
                          ));
                        } else if (_emailContoller.text == "") {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Please enter email."),
                          ));
                        } else if (_nameController.text == "") {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Please enter name."),
                          ));
                        } else if (pickedImage == null) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Please upload photo."),
                          ));
                        } else {
                          debugPrint(pickedImage.path.toString());
                          try {
                            createListing(
                                    ListingModel(
                                        address: _addressController.text,
                                        description:
                                            _descriptionController.text,
                                        email: _emailContoller.text,
                                        name: _nameController.text,
                                        phone: _phoneController.text,
                                        title: _titleController.text,
                                        website: _websiteController.text),
                                    pickedImage)
                                .then((value) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(value != null ? value : ""),
                              ));
                              if (value == "Listing created Sucessfully") {
                                _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(content: Text(value)));
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreen(widget.userID)));
                              }
                            });
                          } catch (error) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text(error.toString()),
                            ));
                          }
                        }
                      },
                      child:
                          Text("Add Listing", style: Typograph.bodyTextWhite),
                      color: ColorsPalette.accentRed,
                      height: 50,
                      minWidth: _mediaSize.width,
                      splashColor: ColorsPalette.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ],
            ),
          ),
        ));
  }
}
