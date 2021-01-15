part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ChangeTheme extends ThemeEvent{
  final String weatherAbbr;
  ChangeTheme({@required this.weatherAbbr});
}
