import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';

import 'package:cacapp/model/models.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  static const String route = 'ranking';

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  bool onlyFriends = true;
  bool ascending = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              Text(AppLocalizations.of(context)!.ranking.capitalize()),
              IconButton(
                icon: getSort(),
                onPressed: () {
                  setState(() {
                    ascending = !ascending;
                  });
                },
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset('assets/images/button/friends.png'))),
              Tab(
                icon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset('assets/images/button/group.png'),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              ListView(
                children: _getUsers(context),
              ),
              ListView(
                children: _getGroups(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Image getSort() {
    if (ascending) {
      return Image.asset('assets/images/button/up_arrow.png');
    }
    return Image.asset('assets/images/button/down_arrow.png');
  }

  List<Widget> _getUsers(BuildContext context) {
    List<User> reports = [
      User(
        id: '1',
        name: 'User 1',
        friendship: Friendship.friend,
        points: 10,
        gender: 0,
      ),
      User(
        id: '2',
        name: 'User 2',
        friendship: Friendship.waiting,
        points: 10,
        gender: 1,
      ),
      User(
        id: '3',
        name: 'User 3',
        friendship: Friendship.pending,
        points: 10,
        gender: 2,
      ),
      User(
        id: '4',
        name: 'User 4',
        friendship: Friendship.friend,
        points: 10,
        gender: 1,
      ),
      User(
        id: '5',
        name: 'User 5',
        friendship: Friendship.waiting,
        points: 10,
        gender: 1,
      ),
      User(
        id: '6',
        name: 'User 6',
        friendship: Friendship.pending,
        points: 10,
        gender: 0,
      ),
    ];

    return reports.map((user) {
      // if (report.picture.isEmpty) {
      return Card(
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(user.name),
                  Text('${user.points}'),
                ],
              ),
              leading: _getUserLeading(user),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _getUserLeading(User user) {
    String image = 'assets/images/user.png';
    switch (user.gender) {
      case 0:
        image = 'assets/images/man.png';
        break;
      case 1:
        image = 'assets/images/woman.png';
        break;
      case 2:
        image = image;
        break;
    }
    return Image(height: 30, image: AssetImage(image));
  }

  List<Widget> _getGroups(BuildContext context) {
    List<Group> groups = [
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

    return groups.map((group) {
      // if (report.picture.isEmpty) {
      return Card(
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(group.name),
                  Text('${group.points}'),
                ],
              ),
              leading: _getGroupLeading(group),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _getGroupLeading(Group group) {
    String image = 'assets/images/button/group.png';

    return Image(height: 30, image: AssetImage(image));
  }
}
