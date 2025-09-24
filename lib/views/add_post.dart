import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloPostController = TextEditingController();
  final TextEditingController _textoPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Post"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Adicione o título do seu post',
              ),
              controller: _tituloPostController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entre com seu post';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Adicione a descrição do seu post',
              ),
              controller: _textoPostController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entre com seu texto';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Salvando")));
                  Navigator.pop(
                    context,
                    Post(
                      titulo: _tituloPostController.text,
                      texto: _textoPostController.text,
                      curtido: false,
                    ),
                  );
                }
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
