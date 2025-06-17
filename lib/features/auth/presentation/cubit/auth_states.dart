abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthSuccessState extends AuthStates {}

class AuthErrorState extends AuthStates {
  AuthErrorState(this.error);

  final String error;
}

class AuthLoadingState extends AuthStates {}
