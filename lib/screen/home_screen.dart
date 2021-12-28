import 'package:flutter/material.dart';
import 'package:cacapp/util/geo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';

import 'package:cacapp/screen/screens.dart';
import 'package:cacapp/widget/bottom_action_button.dart';
import 'package:cacapp/widget/main_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _controller;

  double _zoom = 17;
  CameraPosition _currentPosition =
      CameraPosition(target: LatLng(41.670012, 1.858614), zoom: 17);

  @override
  void initState() {
    super.initState();
    // getPosition().then((po) {
    //   var latLng = LatLng(po.latitude, po.longitude);
    //   _currentPosition = CameraPosition(target: latLng);
    //   _controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, _zoom));
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
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
        initialCameraPosition: _currentPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        mapToolbarEnabled: true,
        zoomControlsEnabled: true,
        myLocationEnabled: true,
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assets/images/button/place.png')),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<LatLng> getPosition() async {
    Position p = await GeoUtils.determinePosition();
    return LatLng(p.latitude, p.longitude);
  }
}
