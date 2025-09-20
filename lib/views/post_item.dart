import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.texto});
  final String texto;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(child: Text(texto, style: const TextStyle(fontSize: 20))),
      ),
    );
  }
}
