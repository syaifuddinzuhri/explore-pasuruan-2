import 'package:miniproject/data/models/profile_model.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  ProfileModel profile;

  ProfileLoadedState({required this.profile});
}

class ProfileErrorState extends ProfileState {
  String message;

  ProfileErrorState({required this.message});
}
