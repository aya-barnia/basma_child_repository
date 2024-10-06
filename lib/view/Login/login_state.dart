abstract class LoginState {}

class LoginInitial extends LoginState{}

class LoginLoading extends LoginState{}

class LoginLoaded extends LoginState{
  final String message;
  LoginLoaded({required this.message});


}
class LoginLoadError extends LoginState{

  final String message;
  LoginLoadError({required this.message});

}