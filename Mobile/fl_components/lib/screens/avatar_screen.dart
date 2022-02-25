import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Avatars"), actions: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: const CircleAvatar(
            child: Text("LT"),
            backgroundColor: Colors.indigo,
          ),
        )
      ]),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage(
              "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/89feec74-8db3-4822-9478-dcf6509d1fdf/d94ntdb-060adb47-d6cb-4a92-a842-1211bcd018ff.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzg5ZmVlYzc0LThkYjMtNDgyMi05NDc4LWRjZjY1MDlkMWZkZlwvZDk0bnRkYi0wNjBhZGI0Ny1kNmNiLTRhOTItYTg0Mi0xMjExYmNkMDE4ZmYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ai0kdODzMXodDTjd0Aw4r5VTDVbGcFqLBPo-Jb1rqXM"),
        ),
      ),
    );
  }
}
