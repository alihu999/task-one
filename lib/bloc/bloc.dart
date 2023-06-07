import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/bloc/app_states.dart';
import 'package:project/user_repository.dart';

import 'app_events.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final useres = await _userRepository.getdata();
        emit(UserLoadedState(useres));
      } catch (e) {
        emit(UeserErrorState(e.toString()));
      }
    });
  }
}
