import 'package:flutter/material.dart';
import 'package:flutter_application_1/latihan/text.box.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    //TODO: implement initstate
    super.initState();
    ambilData();
  }

  // function untuk menyimpan data ke shared preferences
  void simpanData()async {
    final p = await SharedPreferences.getInstance();
    await p.setBool("tema_gelap", isDark);
  }

  void ambilData()async{
    final p = await SharedPreferences.getInstance();
    setState(() {
      isDark = p.getBool("tema_gelap") ?? false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Latihan share preference",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: Text("Switch theme")),
        body: Center(
          child: SwitchListTile(
            title: Text("Tombol Tema"),
            value: isDark, 
            onChanged: (bool value){
              setState(() {
                isDark = value;
              });
              simpanData();
            },
            ),
          ),
        ),
      );
  }
}
