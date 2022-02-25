import "package:flutter/material.dart";
import '../theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const ListTile(
          title: Text("Titulo"),
          subtitle: Text(
              "Reprehenderit occaecat aliquip sit sunt adipisicing nisi. Et ut enim eu proident fugiat laborum nisi sint qui esse."),
          leading: Icon(
            Icons.photo_album_outlined,
            color: AppTheme.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Cancel"),
              ),
              TextButton(onPressed: () {}, child: const Text("OK")),
            ],
          ),
        )
      ],
    ));
  }
}
