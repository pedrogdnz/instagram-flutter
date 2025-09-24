import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/views/add_post.dart';
import 'package:instagram/views/post_item.dart';
import 'package:instagram/views/story_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> _posts = [
    Post(titulo: "Pedro", texto: "Guerreiro Nato", curtido: true),
    Post(titulo: "Nicole", texto: "Burrinha", curtido: false),
  ];

  final List _stories = ['story 1', 'story 2', 'story 3', 'story 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Derogram")),

      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _stories.length,
              itemBuilder: (context, index) {
                return StoryItem(texto: _stories[index]);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostItem(post: _posts[_posts.length - 1 - index]);
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPost()),
              );
              if (result != null) {
                setState(() {
                  _posts.add(result);
                });
              }
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
