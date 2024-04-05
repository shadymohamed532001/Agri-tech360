part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileErrorState extends ProfileState {
  final String error;
  const ProfileErrorState({required this.error});
}
final class ProfileSuccessState extends ProfileState {
  final UserModel userData;
  const ProfileSuccessState({required this.userData});
}