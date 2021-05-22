import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Future<void> signIn() async {
    print('Authorized!');
}

Future<void> join(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyRegisterPage(title: "Регистрация")));
}

Future<void> goToProfile(BuildContext context, String login) async {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyProfilePage(title: "Профиль", login: login)));
}

class SwitchScreen extends StatefulWidget {  
  @override  
  SwitchClass createState() => new SwitchClass();  
}  
  
class SwitchClass extends State {  
  bool isSwitched = false;  
  var textValue = 'Студент';  
  
  void toggleSwitch(bool value) {  
    if (isSwitched == false)  
    {  
      setState(() {  
        isSwitched = true;  
        textValue = 'Организация';  
      });  
      print('Организация');  
    }  
    else  
    {  
      setState(() {  
        isSwitched = false;  
        textValue = 'Студент';  
      });  
      print('Студент');  
    }  
  }

  @override  
  Widget build(BuildContext context) {  
    return Row(mainAxisAlignment: MainAxisAlignment.center,  
        children: [Switch(  
              onChanged: toggleSwitch,  
              value: isSwitched
          ),  
          Text('$textValue', style: TextStyle(color: Colors.white))  
      ]);  
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klitch App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Klitch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyRegisterPage extends StatefulWidget {
  MyRegisterPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class MyProfilePage extends StatefulWidget {
  MyProfilePage({Key? key, required this.title, required this.login}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String login;

  @override
  _MyProfilePageState createState() => _MyProfilePageState(login: login);
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController loginController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        foregroundColor: Colors.white,
      ),
      body: Container(
      color: Colors.indigoAccent,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(40),
      child: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children:[
            Text("Имя пользователя", style: TextStyle(color: Colors.white)),
            Padding(child: TextField(controller: loginController, style: TextStyle(color: Colors.white)), padding: EdgeInsets.symmetric(vertical: 5)),
            Padding(child: Text("Пароль", style: TextStyle(color: Colors.white)), padding: EdgeInsets.symmetric(vertical: 5)),
            Padding(child: TextField(style: TextStyle(color: Colors.white)), padding: EdgeInsets.symmetric(vertical: 5)),
            Padding(child: ElevatedButton(
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)),
              child: Text('Войти'),
              onPressed: () { goToProfile(context, loginController.text); },
            ), padding: EdgeInsets.symmetric(vertical: 15)),
            Padding(child:
            Text("Еще не пользуетесь Klitch?",
            style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.symmetric(vertical: 15)),
             Padding(child: ElevatedButton(
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)),
              child: Text('Зарегистрироваться'),
              onPressed: () { join(context); },
            ), padding: EdgeInsets.symmetric(vertical: 15)),
            Center(child:
            Padding(child:
            Text("Добро пожаловать! Используя тиндер-механику карточек со свайпами, проект позволяет студентам находить единомышленников, помощников и команды для мероприятий",
            style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.symmetric(vertical: 15))),
          ],
        )
      )
    ));
  }
}

class _MyRegisterPageState extends State<MyRegisterPage> {

  TextEditingController loginController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyRegisterPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Container(
      color: Colors.indigoAccent,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(40),
      child: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children:[
            Text("Имя пользователя", style: TextStyle(color: Colors.white)),
            Padding(child: TextField(controller: loginController, style: TextStyle(color: Colors.white)), padding: EdgeInsets.symmetric(vertical: 5)),
            Padding(child: Text("Пароль", style: TextStyle(color: Colors.white)), padding: EdgeInsets.symmetric(vertical: 5)),
            Padding(child: TextField(style: TextStyle(color: Colors.white)), padding: EdgeInsets.symmetric(vertical: 5)),
            SwitchScreen(),
            Padding(child: ElevatedButton(
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)),
              child: Text('Зарегистрироваться'),
              onPressed: () { goToProfile(context, loginController.text); },
            ), padding: EdgeInsets.symmetric(vertical: 15))
          ],
        )
      )
    ));
  }
}

class _MyProfilePageState extends State<MyProfilePage> {

  _MyProfilePageState({required this.login}) : super();

  String login;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyRegisterPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Container(
      color: Colors.indigoAccent,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(40),
      child: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children:[
            Center(child: Text("Вы успешно авторизовались в системе под именем пользователя " + login + "!", style: TextStyle(color: Colors.white)))
          ],
        )
      )
    ));
  }
}
