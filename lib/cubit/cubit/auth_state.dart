part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User? user;

  const AuthSuccess({required this.user});
}

final class AuthError extends AuthState {
  final String errorMessage;

  const AuthError({required this.errorMessage});

}
