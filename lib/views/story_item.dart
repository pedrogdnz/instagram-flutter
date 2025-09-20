import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key, required this.texto});
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          shape: BoxShape.circle,
        ),
        child: Center(child: Text(texto, style: const TextStyle(fontSize: 20))),
      ),
    );
  }
}
