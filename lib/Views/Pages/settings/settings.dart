import 'package:flutter/material.dart';
import 'package:play_turf/Views/Common%20Widgets/customlist.dart';
import 'package:play_turf/Views/constants.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool _toggled = true;
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Settings',
            style: kAppBarTitleStyle,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              children: const [
                // SwitchListTile(
                //   title: const Text(
                //     'Push Notification',
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                //   value: _toggled,
                //   onChanged: (bool value) {
                //     setState(() {
                //       _toggled = value;
                //     });
                //   },
                //   secondary: const Icon(
                //     Icons.notifications,
                //     color: Colors.black,
                //   ),
                // ),
                CustomListTile(
                  titleNew: 'Terms & Conditions',
                  leadingNew: Icons.library_books,
                ),
                CustomListTile(
                  titleNew: 'Privacy Policies',
                  leadingNew: Icons.lock,
                ),
                CustomListTile(
                  titleNew: 'About US',
                  leadingNew: Icons.info,
                )
              ],
            ),
            Column(
              children: const [
                Text('Version'),
                Text('1.0'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
