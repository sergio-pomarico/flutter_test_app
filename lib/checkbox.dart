import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({this.title, this.isChecked, this.onPress, Key key})
      : super(key: key);

  final String title;
  final void Function(bool) onPress;
  final bool isChecked;

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  bool isOn = false;

  @override
  void initState() {
    setState(() {
      isOn = widget.isChecked;
    });
    super.initState();
  }

  void onChage(bool value) {
    isOn = value;
    widget.onPress(isOn);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Material(
                  child: Checkbox(
                    value: isOn,
                    onChanged: onChage,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.grey[500], fontSize: 18),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
