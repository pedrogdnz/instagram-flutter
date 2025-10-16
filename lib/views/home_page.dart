import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/models/story.dart';
import 'package:instagram/views/add_post.dart';
import 'package:instagram/views/post_item.dart';
import 'package:instagram/views/story_item.dart';
import 'package:instagram/views/add_story.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> _posts = [];

  final List<Story> _stories = [
    Story(titulo: "Viagem", texto: "Praia", liked: true),
    Story(titulo: "Comida", texto: "Lanche", liked: false),
    Story(titulo: "Estudo", texto: "Flutter", liked: true),
    Story(titulo: "Trabalho", texto: "Muito trabalho", liked: false),
    Story(titulo: "Esporte", texto: "Futebol", liked: true),
    Story(titulo: "Música", texto: "Rock", liked: false),
    Story(titulo: "Cinema", texto: "Filme", liked: true),
    Story(titulo: "Natureza", texto: "Trilha", liked: false),
    Story(titulo: "Arte", texto: "Quadro", liked: true),
    Story(titulo: "Tecnologia", texto: "Gadget", liked: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Derogram")),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _stories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddStory(),
                              ),
                            );
                            if (result != null) {
                              setState(() {
                                _stories.add(result);
                              });
                            }
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300,
                            ),
                            child: const Icon(Icons.add, size: 35),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Adicionar",
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: StoryItem(
                    story: _stories[_stories.length - index - 1],
                  ),
                );
              },
            ),
          ),

          // Posts
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostItem(
                  post: _posts[_posts.length - 1 - index],
                  deleteItem: () => deletePost(_posts.length - index - 1),
                  likeItem: () => curtirPost(_posts.length - index - 1),
                );
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

  void curtirPost(int index) {
    setState(() {
      _posts[index].curtido = !_posts[index].curtido;
    });
  }

  void deletePost(int index) {
    setState(() {
      _posts.removeAt(index);
    });
  }

  void curtirStory(int index) {
    setState(() {
      _stories[index].liked = !_stories[index].liked;
    });
  }

  void deleteStory(int index) {
    setState(() {
      _stories.removeAt(index);
    });
  }
}
