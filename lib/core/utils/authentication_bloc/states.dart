abstract class AuthenticationState{}

class SignUpInitialState extends AuthenticationState{}

class SignUpLoadingState extends AuthenticationState{}

class SignUpSuccessState extends AuthenticationState{}

class SignUpErrorState extends AuthenticationState{
  final String error;
  SignUpErrorState(this.error);
}

class SignUpCreateUserSuccessState extends AuthenticationState{}

class SignUpCreateUserErrorState extends AuthenticationState{
  final String error;
  SignUpCreateUserErrorState(this.error);
}

class SignInInitialState extends AuthenticationState{}

class SignInLoadingState extends AuthenticationState{}

class SignInSuccessState extends AuthenticationState{}

class SignInErrorState extends AuthenticationState{
  final String error;
  SignInErrorState(this.error);
}

class ShowPasswordState extends AuthenticationState{}

class GetUserLoadingState extends AuthenticationState{}

class GetUserSuccessState extends AuthenticationState{}

class GetUserErrorState extends AuthenticationState{
  final String error;
  GetUserErrorState(this.error);
}

class UpdateUserDataLoadingState extends AuthenticationState{}

class UpdateUserDataSuccessState extends AuthenticationState{}

class UpdateUserDataErrorState extends AuthenticationState{
  final String error;
  UpdateUserDataErrorState(this.error);
}


class SignOutLoadingState extends AuthenticationState{}

class SignOutSuccessState extends AuthenticationState{}

class SignOutErrorState extends AuthenticationState{
  final String error;
  SignOutErrorState(this.error);
}
