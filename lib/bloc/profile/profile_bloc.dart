import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject/bloc/profile/profile_event.dart';
import 'package:miniproject/bloc/profile/profile_state.dart';
import 'package:miniproject/data/models/profile_model.dart';
import 'package:miniproject/data/repositories/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileInitialState());

  ProfileState get initialState => ProfileInitialState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetProfile) {
      yield ProfileLoadingState();
      try {
        ProfileModel profile = await profileRepository.getProfile();
        yield ProfileLoadedState(profile: profile);
      } catch (e) {
        yield ProfileErrorState(message: e.toString());
      }
    }
  }
}
