import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // istediğimiz değerler arasında seçim yaptırıyoruz parlaklık veya ses kontrolündeki gibi
  // slider ın ilerlemesini takip edebilmemiz için bir tane double değişkene ihtiyacımız var
  double ilerleme = 50.0; // başlangıç değerimiz bu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Sonuç : ${ilerleme.toInt()}"),  // slider yapısı gereği sayıyı ondalıklı veriyor, istersek dönüştürüp kullanabiliriz elbette
            Slider(
              max: 100.0,
              min: 0.0,
              value: ilerleme, // anlık değer
              activeColor: Colors.indigoAccent,
              inactiveColor: Colors.red, // aktif olmayan renk
              onChanged: (double i){
                setState(() {
                  ilerleme = i; // ilerleme değerini anlık olarak almış olacağız
                });
              },
            ),
            ElevatedButton(
              child: Text("Göster"),
              onPressed: (){
                print("Slider ilerleme : ${ilerleme.toInt()}");
              },
            ),
          ],
        ),
      ),

    );
  }
}
