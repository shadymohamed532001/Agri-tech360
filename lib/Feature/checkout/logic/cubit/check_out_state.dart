part of 'check_out_cubit.dart';

sealed class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}

final class CheckOutLoading extends CheckOutState {}

final class CheckOutSuccess extends CheckOutState {}

final class CheckOutError extends CheckOutState {
  final String error;
  CheckOutError(this.error);
}
