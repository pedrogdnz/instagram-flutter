import 'package:flutter/material.dart';
import 'package:instagram/views/add_post.dart';
import 'package:instagram/views/post_item.dart';
import 'package:instagram/views/story_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _posts = ['post 1', 'post 2', 'post 3', 'post 4'];

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
                return PostItem(texto: _posts[index]);
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
                  _posts.add(result[0]);
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
