import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeChanged(themeData: Colors.white));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event,)async* {
    ThemeChanged newTheme;
    
    if (event is ChangeTheme){
      switch (event.weatherAbbr)
      {
        case"sn":case"sl":case"h":
           newTheme = ThemeChanged(themeData: Colors.white);
           break;
        case "t":case	"hr":case	"lr": case"s":
        newTheme = ThemeChanged(themeData:  Colors.blueGrey.shade200);
        break;
        case  "hc": case "lc":
        newTheme = ThemeChanged(themeData: Colors.grey);
        break;
        case  "c":
        newTheme = ThemeChanged(themeData:  Colors.orangeAccent.shade100);
      }
      yield newTheme;
    }
  }
}
