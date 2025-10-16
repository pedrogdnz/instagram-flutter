import 'package:flutter/material.dart';
import 'package:instagram/models/story.dart';

class StoryItem extends StatefulWidget {
  final Story story;
  final VoidCallback likeItem;
  final VoidCallback editItem;

  const StoryItem({
    super.key,
    required this.story,
    required this.likeItem,
    required this.editItem,
  });

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Stack(
            children: [
              // Círculo com texto — ao tocar, edita
              GestureDetector(
                onTap: widget.editItem,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amberAccent,
                  ),
                  child: Center(
                    child: Text(
                      widget.story.texto,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),

              // Botão de curtir
              Positioned(
                bottom: -10,
                right: -10,
                child: IconButton(
                  icon: Icon(
                    widget.story.liked ? Icons.favorite : Icons.favorite,
                    color: widget.story.liked ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    widget.likeItem();
                    setState(() {}); // atualiza o estado local
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            widget.story.titulo,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
