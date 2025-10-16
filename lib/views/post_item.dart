import 'package:flutter/material.dart';
import '/models/post.dart';
import 'package:instagram/views/add_post.dart';

class PostItem extends StatefulWidget {
  final Post post;

  final Function() deleteItem;

  final Function() likeItem;

  const PostItem({
    super.key,
    required this.post,
    required this.deleteItem,
    required this.likeItem,
  });

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            widget.post.curtido ? Icons.favorite : Icons.favorite_border,
            color: widget.post.curtido ? Colors.red : null,
          ),
          onPressed: widget.likeItem,
        ),
        title: Text(widget.post.titulo),
        subtitle: Text(widget.post.texto),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        contentPadding: const EdgeInsets.all(6.0),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPost(post: widget.post)),
                );
                setState(() {});
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(icon: const Icon(Icons.delete), onPressed: widget.deleteItem),
          ],
        ),
      ),
    );
  }
}
