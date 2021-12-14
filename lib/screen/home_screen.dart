import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';

import 'package:cacapp/screen/friends_screen.dart';
import 'package:cacapp/screen/groups_screen.dart';
import 'package:cacapp/screen/info_screen_dart.dart';
import 'package:cacapp/screen/ranking_screen.dart';
import 'package:cacapp/widget/bottom_action_button.dart';
import 'package:cacapp/widget/main_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final CameraPosition puntoInicial = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const MainTopBar(
          totalReports: 10,
          totalReportsViewed: 23,
        ),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomActionButton(
                icon: 'friends.png',
                label: AppLocalizations.of(context)!.friends.capitalize(),
                color: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, FriendsScreen.route);
                },
                showNotification: false,
              ),
              BottomActionButton(
                icon: 'group.png',
                label: AppLocalizations.of(context)!.groups.capitalize(),
                color: Colors.purple,
                onPressed: () {
                  Navigator.pushNamed(context, GroupsScreen.route);
                },
                showNotification: false,
              ),
              BottomActionButton(
                icon: 'cup.png',
                label: AppLocalizations.of(context)!.ranking.capitalize(),
                color: Colors.yellow,
                onPressed: () {
                  Navigator.pushNamed(context, RankingScreen.route);
                },
                showNotification: false,
              ),
              BottomActionButton(
                icon: 'info.png',
                label: AppLocalizations.of(context)!.information.capitalize(),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, InfoScreen.route);
                },
                showNotification: false,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
