part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}



class ThemeChanged extends ThemeState {
  final Color themeData;

  ThemeChanged({@required this.themeData});



}


