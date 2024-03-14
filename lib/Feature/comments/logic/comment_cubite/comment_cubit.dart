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
        emit(AddCommentSuccess(comments: comments));
      },
    );
  }

  TextEditingController commentsController = TextEditingController();
}
