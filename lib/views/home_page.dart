import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/models/story.dart';
import 'package:instagram/views/add_post.dart';
import 'package:instagram/views/post_item.dart';
import 'package:instagram/views/story_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> _posts = [];

  final List<Story> _stories = [
    Story(titulo: "Viagem", texto: "Fui para a praia", liked: true),
    Story(titulo: "Comida", texto: "Comi um lanche", liked: false),
    Story(titulo: "Estudo", texto: "Estudei Flutter", liked: true),
    Story(titulo: "Trabalho", texto: "Trabalhei muito", liked: false),
    Story(titulo: "Esporte", texto: "Joguei futebol", liked: true),
    Story(titulo: "Música", texto: "Ouvi rock", liked: false),
    Story(titulo: "Cinema", texto: "Assisti um filme", liked: true),
    Story(titulo: "Natureza", texto: "Fiz uma trilha", liked: false),
    Story(titulo: "Arte", texto: "Pintei um quadro", liked: true),
    Story(titulo: "Tecnologia", texto: "Comprei um gadget novo", liked: false),
  ];

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
                return StoryItem(story: _stories[_stories.length - index - 1]);
              },
            ),
          ),
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

  curtirPost(int index) {
    setState(() {
      _posts[index].curtido = !_posts[index].curtido;
    });
  }

  deletePost(int index) {
    setState(() {
      _posts.removeAt(index);
    });
  }
}
