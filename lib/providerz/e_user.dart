import 'package:commerce/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class UserModelState extends Equatable {
  final Username? user;

  UserModelState({this.user});

  @override
  List<Object?> get props => [user];

  @override
  bool get stringify => true;

  UserModelState copyWith({
    Username? user,
  }) {
    return UserModelState(
      user: user ?? this.user,
    );
  }
}

class UserModelNotifier extends StateNotifier<UserModelState> {
  UserModelNotifier() : super(UserModelState());

  void setUser(Username newUser) {
    state = state.copyWith(user: newUser);
  }
}
