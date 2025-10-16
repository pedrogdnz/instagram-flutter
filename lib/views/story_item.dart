import 'package:flutter/material.dart';
import 'package:instagram/models/story.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  const StoryItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    story.titulo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    story.texto,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Icon(
                    story.liked ? Icons.favorite : Icons.favorite_border,
                    size: 16,
                    color: story.liked ? Colors.red : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
