import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocode/geocode.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';

import 'package:cacapp/util/enumerations.dart';
import 'package:cacapp/util/preferences.dart';
import 'package:cacapp/widget/i18n_dropdown.dart';
import 'package:cacapp/util/geo.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String route = 'profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Preferences prefs = Preferences();

  late String _username;
  late String _municipality;
  late int _poops;
  late int _points;

  List<DropdownMenuItem<DropdownElement>>? _languages;
  DropdownElement? _language;

  TextEditingController municipalityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _username = 'asegurpe';
    _municipality = 'Sant Vicenc de Castellet';
    _poops = 0;
    _points = 0;

    initLanguages();
  }

  void initLanguages() {
    DropdownElement dummy = DropdownElement(id: 0, text: 'Dummy', values: {});

    _language = dummy;
    _languages = [
      DropdownMenuItem<DropdownElement>(
        value: dummy,
        child: Center(child: Text(dummy.text)),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    _initData(context);

    final double? _height = MediaQuery.of(context).size.height / 25;

    municipalityController.addListener(() {
      // Haz algo aqui
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset('assets/images/button/back.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(AppLocalizations.of(context)!.profile.capitalize()),
            IconButton(
              icon: Image.asset('assets/images/button/logout.png'),
              onPressed: () => _showLogoutDialog(context),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('assets/images/user.png'),
                      width: 100,
                    ),
                    SizedBox(height: _height),
                    Text('$_username'),
                    const SizedBox(height: 10),
                    Text('($_municipality)'),
                    SizedBox(height: _height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 40,
                          child: Image(
                            image: AssetImage('assets/images/town.png'),
                          ),
                        ),
                        const SizedBox(width: 40),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () => _showMunicipalityDialog(context),
                            child: Text('Select'),
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 40,
                          child: Image(
                            image: AssetImage('assets/images/marker.png'),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Text(
                          AppLocalizations.of(context)!.number_of_poops(_poops),
                        ),
                      ],
                    ),
                    SizedBox(height: _height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 40,
                          child: Image(
                            image: AssetImage('assets/images/button/cup.png'),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Text(
                          AppLocalizations.of(context)!
                              .number_of_points(_points),
                        ),
                      ],
                    ),
                    SizedBox(height: _height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: SizedBox(
                            height: 40,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/button/language.png'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                        SizedBox(
                          width: 130,
                          child: I18nDropdown(
                            items: _languages,
                            item: _language,
                            onChanged: (DropdownElement? newVal) async {
                              _language = newVal;
                              String? code = _language!.values['code'];
                              if (code == null) {
                                CacApp.setLocale(context, null);
                              } else {
                                CacApp.setLocale(context, Locale(code));
                              }
                              prefs.languageCode = code;
                              _initData(context);
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: _height),
                ElevatedButton(
                  onPressed: () => _showDeleteDialog(context),
                  child: Text('Delete account'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red, onPrimary: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Center(child: Text('Logout')),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 100,
            child: Center(child: Text('Are you sure you want to logout?')),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('login'));
              },
              child: Text(AppLocalizations.of(context)!.confirm.capitalize()),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Center(
              child: Text(
            'Delete account',
            style: TextStyle(color: Colors.red),
          )),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 150,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Are you sure you want to delete your account?'),
                Text(
                    'Remember that once deleted, all your data will be erased and cannot be recovered.'),
              ],
            )),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.delete.capitalize(),
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showMunicipalityDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Center(
              child: Text(
            'Select municipality',
          )),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 150,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  controller: municipalityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Municipality name',
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    getPosition().then((po) async {
                      GeoCode geoCode = GeoCode();
                      Address address = await geoCode.reverseGeocoding(
                          latitude: po.latitude, longitude: po.longitude);
                      municipalityController.text = address.city ?? '';
                      setState(() {});
                    });
                  },
                  child: Text(
                      AppLocalizations.of(context)!.automatic.capitalize()),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green, onPrimary: Colors.white),
                )
              ],
            )),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _municipality = municipalityController.text;
                setState(() {});
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
              ),
            ),
          ],
        );
      },
    );
  }

  void _initData(BuildContext context) {
    DropdownElement? l;
    List<DropdownElement> language = Enumerations(context: context).language;
    initLanguages();
    _languages!.addAll(language.map((value) {
      if (prefs.languageCode == value.values['code']) {
        l = value;
      }
      return DropdownMenuItem<DropdownElement>(
        value: value,
        child: Center(child: Text(value.text)),
      );
    }).toList());
    _languages!.removeAt(0);
    _language = l ?? _languages!.first.value;

    _getLocation();

    setState(() {});
  }

  void _getLocation() async {
    GeoCode geoCode = GeoCode();

    try {
      // Address address = await geoCode.reverseGeocoding(
      //     latitude: 41.670012, longitude: 1.858614);
      // print('Address ${address.city}');
    } catch (e) {
      print(e);
    }
  }

  Future<LatLng> getPosition() async {
    Position p = await GeoUtils.determinePosition();
    return LatLng(p.latitude, p.longitude);
  }
}
