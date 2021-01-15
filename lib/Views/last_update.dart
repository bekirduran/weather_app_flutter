import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Views/mystyle.dart';

class LastUpdate extends StatelessWidget {
String updateTime;
LastUpdate({@required this.updateTime});
  @override
  Widget build(BuildContext context) {
  var date = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    
    return Text("Last Update ${date.format(context)}",);
  }
}
