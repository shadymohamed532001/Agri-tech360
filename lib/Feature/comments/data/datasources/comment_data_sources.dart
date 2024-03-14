import 'package:smartsoil/Feature/comments/data/models/comment_model.dart';

abstract class CommentDataSources {
  Future<List<CommentModel>> addComment({
    required String comment,
    required int productId,
  }); // need to add time of the comment  ;
}
