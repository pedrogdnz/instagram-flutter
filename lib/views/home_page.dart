import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/models/story.dart';
import 'package:instagram/views/add_post.dart';
import 'package:instagram/itens/post_item.dart';
import 'package:instagram/itens/story_item.dart';
import 'package:instagram/views/add_story.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> _posts = [
    Post(titulo: "Pedroca", texto: "The programer", curtido: false),
    Post(titulo: "Gugu Liberato", texto: "Livre forever", curtido: true),
    Post(titulo: "Sasah", texto: "Cobradora", curtido: false)
  ];

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

  void addStory() async {
    final result = await Navigator.push<Story>(
      context,
      MaterialPageRoute(builder: (context) => const AddStory()),
    );

    if (result != null) {
      setState(() {
        _stories.add(result);
      });
    }
  }

  void editStory(Story story) async {
    final result = await Navigator.push<Story>(
      context,
      MaterialPageRoute(builder: (context) => AddStory(story: story)),
    );

    if (result != null) {
      setState(() {
        final index = _stories.indexOf(story);
        if (index != -1) {
          _stories[index] = result;
        }
      });
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Derogram")),
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _stories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Botão "Você"
                  return GestureDetector(
                    onTap: addStory,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('images/foto_perfil.jpg'),
                                backgroundColor: Colors.grey,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.lightGreen,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Text("Você"),
                        ],
                      ),
                    ),
                  );
                } else {
                  // Inverter a ordem dos stories, deixando o mais recente por primeiro (depois do botão)
                  final reverseIndex = _stories.length - index;
                  final story = _stories[reverseIndex];

                  return GestureDetector(
                    onLongPress: () => deleteStory(reverseIndex),
                    child: StoryItem(
                      story: story,
                      likeItem: () => curtirStory(reverseIndex),
                      editItem: () => editStory(story),
                    ),
                  );
                }
              },

            ),
          ),

          // Posts
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final reverseIndex = _posts.length - 1 - index;
                return PostItem(
                  post: _posts[reverseIndex],
                  deleteItem: () => deletePost(reverseIndex),
                  likeItem: () => curtirPost(reverseIndex),
                );
              },
            ),
          ),
        ],
      ),

      // Botão flutuante fora do body
      floatingActionButton: FloatingActionButton(
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
    );
  }
}
