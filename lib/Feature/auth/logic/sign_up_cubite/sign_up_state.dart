part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpSucess extends SignUpState {
  final UserModel registerModel;

  const SignUpSucess({required this.registerModel});

  @override
  List<Object> get props => [registerModel];
}

final class SignUpLoading extends SignUpState {}

final class SignUpError extends SignUpState {
  final String errorMessage;
  final FailureType failureType;

  const SignUpError({
    required this.errorMessage,
    this.failureType = FailureType.server,
  });

  @override
  List<Object> get props => [errorMessage, failureType];
}

final class SignUpChangepasswordvisabilty extends SignUpState {}

final class UploadImageErrorState extends SignUpState {
  final String errorMessage;

  const UploadImageErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class UploadImageFromGallerySuccessState extends SignUpState {
  final XFile image;

  const UploadImageFromGallerySuccessState({required this.image});

  @override
  List<Object> get props => [image.path];
}
