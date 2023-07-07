import 'package:test_app/data/post_repository.dart';
import 'package:test_app/domain/post.dart';

class PostUseCase {
  final PostRepository repository;

  PostUseCase({required this.repository});

  Future<List<Post>> fetchPosts() async {
    final results = await repository.fetchPosts();
    return results.map((json) => Post.fromJson(json)).take(20).toList();
  }
}
