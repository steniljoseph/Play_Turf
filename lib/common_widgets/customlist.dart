import 'package:flutter/material.dart';
import 'package:play_turf/constants.dart';

class CustomListTile extends StatelessWidget {
  final String? titleNew;
  final IconData leadingNew;
  final Function()? ontapNew;
  const CustomListTile(
      {Key? key,
      required this.titleNew,
      required this.leadingNew,
      this.ontapNew})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titleNew!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Icon(
        leadingNew,
        color:kBlackColor,
      ),
      onTap: ontapNew,
    );
  }
}