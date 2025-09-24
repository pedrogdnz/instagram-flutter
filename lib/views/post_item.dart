import 'package:flutter/material.dart';
import '/models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading:
            post.curtido 
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
        title: Text(post.titulo),
        subtitle: Text(post.texto),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        contentPadding: const EdgeInsets.all(6.0),
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
