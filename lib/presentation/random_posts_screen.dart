import 'package:flutter/material.dart';
import 'package:test_app/data/post_repository.dart';
import 'package:test_app/domain/usecases/post_usecase.dart';

class RandomPostsScreen extends StatelessWidget {
  final PostUseCase postUseCase = PostUseCase(repository: PostRepository());
  RandomPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JsonPlaceHolder'),
      ),
      body: FutureBuilder(
          future: postUseCase.fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data![index];
                    return ListTile(
                      leading: const Icon(Icons.newspaper),
                      title: Text(
                        post.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      subtitle: Text(
                        post.body,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
