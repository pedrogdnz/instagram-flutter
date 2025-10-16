import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';

class AddPost extends StatefulWidget {
  final Post? post;

  const AddPost({super.key, this.post});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloPostController = TextEditingController();
  final TextEditingController _textoPostController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _tituloPostController.text = widget.post!.titulo;
      _textoPostController.text = widget.post!.texto;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            widget.post == null
                ? const Text("Adicionar Post")
                : const Text("Editar Post"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Salvando"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        behavior: SnackBarBehavior.floating,
                        width: 350.0,
                      ),
                    );

                    if (widget.post == null) {
                      Post novoPost = Post(
                        titulo: _tituloPostController.text,
                        texto: _textoPostController.text,
                        curtido: false,
                      );
                      Navigator.pop(context, novoPost);
                    } else {
                      widget.post?.titulo = _tituloPostController.text;
                      widget.post?.texto = _textoPostController.text;
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
