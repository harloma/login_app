import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController userController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  String _welcome ="";

  void _erase(){
    setState(() {
      userController.clear();
      passwordController.clear();
    });
  }

  void _showWelcome(){
    setState(() {
      if(userController.text.isNotEmpty && passwordController.text.isNotEmpty){
        _welcome = userController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        title: new Text('LOGIN'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () => debugPrint("MENU")),
        actions: [
          new IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () => debugPrint('PROFILE'))
        ],
      ),
      body: new Container(
          alignment: Alignment.topCenter,
          child: new ListView(
            children: [
              new Image.asset(
                'images/face.png',
                width: 90.0,
                height: 90.0,
                color: Colors.blue,
              ),
              new Container(
                height: 200.0,
                width: 400.0,
                color: Colors.white,
                child: new Column(
                  children: [
                    new TextField(
                      controller: userController,
                      decoration: new InputDecoration(
                          hintText: "USERNAME", icon: new Icon(Icons.person)),
                    ),
                    new TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: new InputDecoration(
                          hintText: 'PASSWORD', icon: Icon(Icons.lock)),
                    ),
                    new Padding(padding: new EdgeInsets.all(10.9)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new TextButton(
                          onPressed: _showWelcome,
                          child: new Text(
                            'LOGIN',
                            style: new TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                        ),
                        new TextButton(
                          onPressed: _erase,
                          child: new Text(
                            'CLEAR',
                            style: new TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                        )
                      ],
                    )
                  ],
                ),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text('WELCOME, $_welcome', textDirection:TextDirection.ltr, style: new TextStyle(fontSize: 15.9, fontWeight: FontWeight.w900),)
                  ],
                ),

            ],
          )),
    );
  }
}
