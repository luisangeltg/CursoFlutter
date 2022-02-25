import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliderScreen"),
      ),
      body: Column(children: [
        Slider.adaptive(
          min: 50,
          max: 400,
          activeColor: AppTheme.primary,
          divisions: 10,
          value: _sliderValue,
          onChanged: _sliderEnable
              ? (value) {
                  _sliderValue = value;
                  print("Value: $_sliderValue");
                  setState(() {});
                }
              : null,
        ),
        Checkbox(
            value: _sliderEnable,
            onChanged: (value) {
              _sliderEnable = value ?? true;
              setState(() {});
            }),
        CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text("Habilitar slider"),
            value: _sliderEnable,
            onChanged: (value) {
              _sliderEnable = value ?? true;
              setState(() {});
            }),
        Switch(
            activeColor: AppTheme.primary,
            value: _sliderEnable,
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {});
            }),
        SwitchListTile.adaptive(
            title: const Text("Habilitar botón"),
            activeColor: AppTheme.primary,
            value: _sliderEnable,
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {});
            }),
        SingleChildScrollView(
          child: Image(
              width: _sliderValue,
              fit: BoxFit.contain,
              image: NetworkImage(
                  "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/89feec74-8db3-4822-9478-dcf6509d1fdf/d94ntdb-060adb47-d6cb-4a92-a842-1211bcd018ff.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzg5ZmVlYzc0LThkYjMtNDgyMi05NDc4LWRjZjY1MDlkMWZkZlwvZDk0bnRkYi0wNjBhZGI0Ny1kNmNiLTRhOTItYTg0Mi0xMjExYmNkMDE4ZmYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ai0kdODzMXodDTjd0Aw4r5VTDVbGcFqLBPo-Jb1rqXM")),
        )
      ]),
    );
  }
}
