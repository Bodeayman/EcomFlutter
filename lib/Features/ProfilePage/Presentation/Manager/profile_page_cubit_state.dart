part of 'profile_page_cubit_cubit.dart';

@immutable
sealed class ProfilePageCubitState {}

final class ProfilePageCubitInitial extends ProfilePageCubitState {}

final class ProfilePageCubitSuccess extends ProfilePageCubitState {
  final String email;
  final String name;
  ProfilePageCubitSuccess(this.email, this.name);
}

final class ProfilePageCubitLoading extends ProfilePageCubitState {}
