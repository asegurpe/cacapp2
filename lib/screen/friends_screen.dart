import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';
import 'package:cacapp/model/models.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  static const String route = 'friends';

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
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
            Text(AppLocalizations.of(context)!.friends.capitalize()),
            IconButton(
              icon: Image.asset('assets/images/button/loupe.png'),
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
    );
  }

  List<Widget> _getReports(BuildContext context) {
    List<User> reports = [
      User(
        id: '1',
        name: 'User 1',
        friendship: Friendship.friend,
      ),
      User(
        id: '2',
        name: 'User 2',
        friendship: Friendship.waiting,
      ),
      User(
        id: '3',
        name: 'User 3',
        friendship: Friendship.pending,
      ),
      User(
        id: '4',
        name: 'User 4',
        friendship: Friendship.friend,
      ),
      User(
        id: '5',
        name: 'User 5',
        friendship: Friendship.waiting,
      ),
      User(
        id: '6',
        name: 'User 6',
        friendship: Friendship.pending,
      ),
    ];

    return reports.map((user) {
      // if (report.picture.isEmpty) {
      return Dismissible(
        key: Key('${user.id}'),
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text(user.name),
                subtitle: _getSubtitle(user),
                leading: _getLeading(user),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ],
          ),
        ),
        direction: _getDirection(user),
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

  DismissDirection _getDirection(User user) {
    switch (user.friendship) {
      case Friendship.waiting:
        return DismissDirection.horizontal;
      case Friendship.pending:
        return DismissDirection.startToEnd;
      case Friendship.friend:
        return DismissDirection.startToEnd;
    }
  }

  Widget _getLeading(User user) {
    String image = 'assets/images/button/friend.png';
    switch (user.friendship) {
      case Friendship.waiting:
        image = 'assets/images/button/hi.png';
        break;
      case Friendship.pending:
        image = 'assets/images/button/apply.png';
        break;
      case Friendship.friend:
        image = image;
        break;
    }
    return Image(height: 30, image: AssetImage(image));
  }

  Widget _getSubtitle(User user) {
    String subtitle = 'Friend since 01/01/2021';
    switch (user.friendship) {
      case Friendship.waiting:
        subtitle = 'Waiting your acceptance';
        break;
      case Friendship.pending:
        subtitle = 'Pending confirmation';
        break;
      case Friendship.friend:
        subtitle = subtitle;
        break;
    }
    return Text(subtitle);
  }
}
