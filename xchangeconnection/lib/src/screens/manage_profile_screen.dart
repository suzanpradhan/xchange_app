import 'package:flutter/material.dart';
import 'package:xchangeconnection/api/methods/api_methods.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/bloc/updateProfile/updateprofile_bloc.dart';
import 'package:xchangeconnection/models/country_model.dart';
import 'package:xchangeconnection/models/user_model.dart';
import 'package:xchangeconnection/src/screens/change_password_page.dart';
import 'package:xchangeconnection/src/screens/home_screen.dart';
import 'package:xchangeconnection/src/screens/settings_screen.dart';
import 'package:xchangeconnection/src/widgets/custom_text_field.dart';
import 'package:xchangeconnection/utils/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageProfileScreen extends StatefulWidget {
  final String userID;
  ManageProfileScreen(this.userID);
  @override
  _ManageScreenState createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _memberNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _homePhone = TextEditingController();
  final TextEditingController _cellPhone = TextEditingController();
  final TextEditingController _workPhone = TextEditingController();
  final TextEditingController _company = TextEditingController();
  final TextEditingController _website = TextEditingController();
  final TextEditingController _position = TextEditingController();
  final TextEditingController _skype = TextEditingController();

  List<CountryModel> countryList = [
    CountryModel(countryID: "1", countryName: "Nothing")
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int initialCountryID;

  CountryModel selectedCountry;
  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  void initState() {
    super.initState();
    ApiRepo().getAllCountries().then((value) {
      countryList = value;
    });
    ApiRepo().getUserProfile(widget.userID).then((snapshot) {
      _firstNameController.text = snapshot.firstName;
      _middleNameController.text = snapshot.middleName;
      _lastNameController.text = snapshot.lastName;
      _addressController.text = snapshot.address;
      _cellPhone.text = snapshot.cellPhone;
      _cityController.text = snapshot.city;
      _company.text = snapshot.company;
      _homePhone.text = snapshot.homePhone;
      _position.text = snapshot.position;
      initialCountryID = int.parse(snapshot.countryID);
      _workPhone.text = snapshot.workPhone;
      _website.text = snapshot.website;
      _stateController.text = snapshot.state;
      _skype.text = snapshot.skpye;
      _memberNumberController.text = snapshot.member_code;
      _emailController.text = snapshot.email;
      _zipController.text = snapshot.zip;
    });
  }

  @override
  Widget build(BuildContext context) {
    rebuildAllChildren(context);
    final Size _mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsPalette.white,
      appBar: AppBar(
        elevation: 5,
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: ColorsPalette.blackGrey,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SettinsgsScreen(
                    userID: widget.userID,
                  );
                }));
              })
        ],
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
          "My Profile",
          style: TextStyle(color: ColorsPalette.blackGrey),
        ),
        backgroundColor: ColorsPalette.white,
      ),
      body: FutureBuilder(
          future: ApiRepo().getUserProfile(widget.userID),
          builder: (context, AsyncSnapshot<UserModel> snapshot) {
            return userProfileForm(context, _mediaSize, snapshot);
          }),
    );
  }

  SingleChildScrollView userProfileForm(BuildContext context, Size _mediaSize,
      AsyncSnapshot<UserModel> snapshot) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Personal Details",
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
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("First Name", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _firstNameController,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Middle Name", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _middleNameController,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Last Name", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _lastNameController,
              width: _mediaSize.width,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Account Details",
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
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Member Number", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              readOnly: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _memberNumberController,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Email", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              readOnly: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _emailController,
              width: _mediaSize.width,
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
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Address", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _addressController,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("City", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _cityController,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("State", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _stateController,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Zip", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _zipController,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Country", style: Typograph.bodyTextBlack),
            ),
            DropdownButton(
                hint: Text((initialCountryID == null)
                    ? "Select Country"
                    : countryList[initialCountryID - 1].countryName),
                items: countryList
                    .map((e) => DropdownMenuItem(
                          child: Text(e.countryName),
                          value: e,
                        ))
                    .toList(),
                value: selectedCountry,
                onChanged: (item) {
                  setState(() {
                    selectedCountry = item;
                    initialCountryID = null;
                  });
                }),
            // MaterialButton(
            //     elevation: 0,
            //     onPressed: () {
            //       showPopUpOption(context);
            //     },
            //     child: Row(
            //       children: [
            //         Text(
            //             (state is CountrySelectedState)
            //                 ? state.countryModel.countryName
            //                 : "Select Country",
            //             style: Typograph.bodyTextBlackGrey),
            //       ],
            //     ),
            //     color: ColorsPalette.white,
            //     height: 50,
            //     minWidth: _mediaSize.width,
            //     splashColor: ColorsPalette.white,
            //     shape: RoundedRectangleBorder(
            //         side: BorderSide(width: 1, color: ColorsPalette.blackGrey),
            //         borderRadius: BorderRadius.circular(8))),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Website", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _website,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Position", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _position,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Skype", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _skype,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Home Phone", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _homePhone,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Cell Phone", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _cellPhone,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text("Work Phone", style: Typograph.bodyTextBlack),
            ),
            CustomTextField(
              hintText: "",
              isfocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              textEditingController: _workPhone,
              width: _mediaSize.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: MaterialButton(
                  onPressed: () {
                    if (initialCountryID != null) {
                      setState(() {
                        selectedCountry = countryList[initialCountryID - 1];
                      });
                    }
                    if (selectedCountry == null) {
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text("Country not selected!")));
                    } else {
                      try {
                        ApiRepo()
                            .updateProfile(
                                widget.userID,
                                UserModel(
                                    address: _addressController.text,
                                    cellPhone: _cellPhone.text,
                                    city: _cityController.text,
                                    company: _company.text,
                                    countryID: (selectedCountry.countryID),
                                    firstName: _firstNameController.text,
                                    middleName: _middleNameController.text,
                                    lastName: _lastNameController.text,
                                    homePhone: _homePhone.text,
                                    position: _position.text,
                                    skpye: _skype.text,
                                    state: _stateController.text,
                                    website: _website.text,
                                    workPhone: _workPhone.text,
                                    zip: _zipController.text))
                            .then((value) {});
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Profile Updated!")));
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen(widget.userID)));
                      } catch (message) {
                        return Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                      }
                    }
                  },
                  child: Text("Update Profile", style: Typograph.bodyTextWhite),
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
    );
  }
}
