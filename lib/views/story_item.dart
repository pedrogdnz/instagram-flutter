import 'package:flutter/material.dart';
import 'package:instagram/models/story.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(story.titulo),
        subtitle: Text(story.texto),
        leading: Icon(
          story.liked ? Icons.favorite : Icons.favorite_border,
          color: story.liked ? Colors.amber : null,
        ),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        contentPadding: const EdgeInsets.all(6.0),
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
