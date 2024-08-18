import 'package:flutter/material.dart';
import 'package:shared_task/shared.dart';

class ThemeTask extends StatefulWidget {
  const ThemeTask({super.key});

  @override
  State<ThemeTask> createState() => _ThemeTaskState();
}

class _ThemeTaskState extends State<ThemeTask> {
  var cache = CacheHelper();

  bool? switchval;
  @override
  @override
  void initState() {
    var rd = cache.getData(key: 'saved');
    if (rd != null) {
      switchval = rd;
    } else {
      switchval = false;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: switchval == false ? Colors.white : Colors.black,
      body: Center(
        child: Switch(
          value: switchval!,
          onChanged: (value) {
            setState(() {
              switchval = value;
              cache.setData(key: 'saved', value: switchval);
            });
          },
        ),
      ),
    );
  }
}
