import "package:flutter/material.dart";

void main() => runApp(MonApplication());

class MonApplication extends StatelessWidget {
  static final Color primaryColor = Color(0xFFb74093);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Bonjour App"), backgroundColor: primaryColor),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text("Bonjour", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: primaryColor) ),
                Text("Je suis Ross", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 30, color: primaryColor)),
                Image.network("https://assets.afcdn.com/story/20200420/2050167_w980h638c1cx670cy301cxt0cyt0cxb1280cyb720.jpg", height: 350,),
                BoutonContactezMoi()
              ],
            ),
          )
        )
      )
    );
  }
}

class BoutonContactezMoi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        child: Text("Contactez-moi !"),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Contactez-moi"),
              content: Text("Je suis joignable à l'IMT Atlantique")
            );
          }
        ),
        style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(MonApplication.primaryColor)
      )
    );
  }
}
