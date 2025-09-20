import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();

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
              controller: _postController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entre com seu post';
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
                  Navigator.pop(context, [_postController.text]);
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
