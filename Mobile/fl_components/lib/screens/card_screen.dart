import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Card widget")),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              imageURL:
                  "https://c4.wallpaperflare.com/wallpaper/430/896/23/one-piece-roronoa-zoro-hd-wallpaper-preview.jpg",
              cardTitle: "Zoro 1",
            ),
            SizedBox(
              height: 30,
            ),
            CustomCardType2(
              imageURL:
                  "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/89feec74-8db3-4822-9478-dcf6509d1fdf/d94ntdb-060adb47-d6cb-4a92-a842-1211bcd018ff.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzg5ZmVlYzc0LThkYjMtNDgyMi05NDc4LWRjZjY1MDlkMWZkZlwvZDk0bnRkYi0wNjBhZGI0Ny1kNmNiLTRhOTItYTg0Mi0xMjExYmNkMDE4ZmYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ai0kdODzMXodDTjd0Aw4r5VTDVbGcFqLBPo-Jb1rqXM",
            ),
            SizedBox(
              height: 30,
            ),
            CustomCardType2(
              imageURL:
                  "https://www.vobss.com/wp-content/uploads/2021/10/zoro-wallpaper-vobss.jpg",
              cardTitle: "Zoro 3",
            )
          ],
        ));
  }
}
