import 'package:flutter/material.dart';
import 'package:instagram/models/story.dart';

class AddStory extends StatefulWidget {
  final Story? story;

  const AddStory({super.key, this.story});

  @override
  State<AddStory> createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloPostController = TextEditingController();
  final TextEditingController _textoPostController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.story != null) {
      _tituloPostController.text = widget.story!.titulo;
      _textoPostController.text = widget.story!.texto;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            widget.story == null
                ? const Text("Adicionar Story")
                : const Text("Editar Story"),
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
                  labelText: 'Adicione o título do seu story',
                ),
                controller: _tituloPostController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com seu story';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Adicione a descrição do seu story',
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

                    if (widget.story == null) {
                      Story novoStory = Story(
                        titulo: _tituloPostController.text,
                        texto: _textoPostController.text,
                        liked: false,
                      );
                      Navigator.pop(context, novoStory);
                    } else {
                      widget.story?.titulo = _tituloPostController.text;
                      widget.story?.texto = _textoPostController.text;
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
