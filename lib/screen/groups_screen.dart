import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';

import 'package:cacapp/model/models.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  static const String route = 'groups';

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  bool onlyFriends = true;

  @override
  Widget build(BuildContext context) {
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
            Text(AppLocalizations.of(context)!.groups.capitalize()),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: _getReports(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  List<Widget> _getReports(BuildContext context) {
    List<Group> reports = [
      Group(
        id: '1',
        name: 'Group 1',
        relationship: Relationship.belong,
        points: 10,
      ),
      Group(
        id: '2',
        name: 'Group 2',
        relationship: Relationship.waiting,
        points: 10,
      ),
      Group(
        id: '3',
        name: 'Group 3',
        relationship: Relationship.guest,
        points: 10,
      ),
      Group(
        id: '4',
        name: 'Group 4',
        relationship: Relationship.waiting,
        points: 10,
      ),
      Group(
        id: '5',
        name: 'Group 5',
        relationship: Relationship.belong,
        points: 10,
      ),
      Group(
        id: '6',
        name: 'Group 6',
        relationship: Relationship.guest,
        points: 10,
      ),
    ];

    return reports.map((group) {
      // if (report.picture.isEmpty) {
      return Dismissible(
        key: Key('${group.id}'),
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text(group.name),
                subtitle: _getSubtitle(group),
                leading: _getLeading(group),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ],
          ),
        ),
        direction: _getDirection(group),
        background: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.delete, color: Colors.white),
                Text('Delete', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        secondaryBackground: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.check, color: Colors.white),
                Text('Confirm', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  DismissDirection _getDirection(Group group) {
    switch (group.relationship) {
      case Relationship.waiting:
        return DismissDirection.horizontal;
      case Relationship.guest:
        return DismissDirection.startToEnd;
      case Relationship.belong:
        return DismissDirection.startToEnd;
    }
  }

  Widget _getLeading(Group group) {
    String image = 'assets/images/button/group.png';
    // switch (group.relationship) {
    //   case Relationship.waiting:
    //     image = 'assets/images/button/hi.png';
    //     break;
    //   case Relationship.guest:
    //     image = 'assets/images/button/apply.png';
    //     break;
    //   case Relationship.belong:
    //     image = image;
    //     break;
    // }
    return Image(height: 30, image: AssetImage(image));
  }

  Widget _getSubtitle(Group group) {
    String subtitle = 'Belonging since 01/01/2021';
    switch (group.relationship) {
      case Relationship.waiting:
        subtitle = 'Waiting your acceptance';
        break;
      case Relationship.guest:
        subtitle = 'Pending confirmation';
        break;
      case Relationship.belong:
        subtitle = subtitle;
        break;
    }
    return Text(subtitle);
  }
}
