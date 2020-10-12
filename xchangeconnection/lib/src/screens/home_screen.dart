import 'package:flutter/material.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/bloc/listings/listings_bloc.dart';
import 'package:xchangeconnection/src/screens/create_listings.dart';
import 'package:xchangeconnection/src/screens/login_screen.dart';
import 'package:xchangeconnection/src/screens/manage_profile_screen.dart';
import 'package:xchangeconnection/src/screens/tab_pages/all_listing_page.dart';
import 'package:xchangeconnection/src/screens/tab_pages/my_listing_page.dart';
import 'package:xchangeconnection/utils/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String user_id;
  HomeScreen(this.user_id);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListingsBloc(ApiRepo()),
      child: HomeScreenStateful(
        user_id: user_id,
      ),
    );
  }
}

class HomeScreenStateful extends StatefulWidget {
  final String user_id;
  HomeScreenStateful({this.user_id});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenStateful> {
  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    rebuildAllChildren(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsPalette.white,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColorsPalette.white,
            elevation: 5,
            title: Image.asset(
              "assets/images/logo.png",
              height: 32,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    if (widget.user_id != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ManageProfileScreen(widget.user_id);
                      }));
                    } else {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: ColorsPalette.greyMedium,
                      size: 32,
                    ),
                    radius: 16,
                    backgroundColor: ColorsPalette.white,
                  ),
                ),
              )
            ],
            bottom: TabBar(
              indicatorColor: ColorsPalette.accentRed,
              labelColor: ColorsPalette.blackGrey,
              tabs: [
                Tab(
                  text: 'All Listings',
                ),
                Tab(
                  text: 'My Listings',
                ),
              ],
            )),
        body: TabBarView(
            children: [AllListingPage(), MyListingPage(widget.user_id)]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (widget.user_id == null) {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return CreateListingScreen(userID: widget.user_id);
              }));
            }
          },
          backgroundColor: ColorsPalette.white,
          foregroundColor: ColorsPalette.accentRed,
          child: Icon(Icons.create),
        ),
      ),
    );
  }
}
