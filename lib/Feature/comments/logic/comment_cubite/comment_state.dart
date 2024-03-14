part of 'comment_cubit.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

class AddCommentLoading extends CommentState {}

class AddCommentSuccess extends CommentState {
  final List<CommentModel> comments;

  const AddCommentSuccess({required this.comments});
}

class AddCommentError extends CommentState {
  final String error;
  const AddCommentError({required this.error});
}
