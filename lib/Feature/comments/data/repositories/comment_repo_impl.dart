import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/comments/data/datasources/comment_data_sources.dart';
import 'package:smartsoil/Feature/comments/domain/repositories/comment_repo.dart';
import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';

import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class CommentRepoImpl extends CommentRepo {
  final CommentDataSources commentDataSources;

  CommentRepoImpl({required this.commentDataSources});

  @override
  Future<Either<Failure, List<CommentModel>>> addComment(
      {required String comment, required int productId}) async {
    try {
      final commentModel = await commentDataSources.addComment(
        comment: comment,
        productId: productId,
      );
      return right(commentModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
