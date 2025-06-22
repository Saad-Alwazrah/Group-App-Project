part of 'navbar_bloc.dart';

@immutable
sealed class NavbarEvent {}

final class NavbarIndexChanged extends NavbarEvent {
  final int index;

  NavbarIndexChanged(this.index);
}
