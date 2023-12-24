part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpSucess extends SignUpState {
  final AuthModel registerModel;

  const SignUpSucess({required this.registerModel});

  get loginModel => null;
}

final class SignUpLoading extends SignUpState {}

final class SignUpError extends SignUpState {
  final String errorMessage;

  const SignUpError({required this.errorMessage});
}

final class SignUpChangepasswordvisabilty extends SignUpState {}
