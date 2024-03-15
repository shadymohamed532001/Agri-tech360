import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';
import 'package:smartsoil/Feature/comments/domain/repositories/comment_repo.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit({required this.commentRepo}) : super(CommentInitial());
  final CommentRepo commentRepo;

  Future<void> addComment({required int productId}) async {
    emit(AddCommentLoading());

    final adCommentEither = await commentRepo.addComment(
      comment: commentsController.text,
      productId: productId,
    );
    adCommentEither.fold(
      (failure) {
        log(failure.errMessage);
        emit(AddCommentError(error: failure.toString()));
      },
      (comments) async {
        emit(const AddCommentSuccess());
        getComments(productId: productId);
      },
    );
  }

  List<CommentModel> commentsList = [];
  Future<void> getComments({required int productId}) async {
    emit(GetCommentsLoading());
    final productEither = await commentRepo.getCommernts(
      productId: productId,
    );

    productEither.fold(
      (failure) {
        log(failure.errMessage.toString());
        emit(GetCommentsError(error: failure.errMessage.toString()));
      },
      (comments) {
        commentsList = comments;
        // print(commentsList[0].comment);
        // print(commentsList[0].commenter.fullName);

        emit(GetCommentsSuccess(comments: comments));
      },
    );
  }

  TextEditingController commentsController = TextEditingController();
}
