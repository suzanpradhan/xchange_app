import 'package:flutter/material.dart';
import 'package:xchangeconnection/bloc/updateProfile/updateprofile_bloc.dart';
import 'package:xchangeconnection/models/country_model.dart';
import 'package:xchangeconnection/utils/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomOptionMenu {
  final List<CountryModel> itemList;
  final String title;
  CountryModel selectedCountry;
  CustomOptionMenu({this.itemList, this.title});
  showPopUpOption(BuildContext buildContext) => showDialog(
      context: buildContext,
      builder: (context) => AlertDialog(
            title: Text('Select Your Religion'),
            content: SingleChildScrollView(
              child: Column(
                children: itemList
                    .map((e) => ListTile(
                          onTap: () {
                            BlocProvider.of<UpdateprofileBloc>(context)
                                .add(CountrySelected(countryModel: e));
                            Navigator.of(context).pop();
                          },
                          title: Text(
                            e.countryName,
                            style: Typograph.bodyTextBlackGrey,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ));
}
