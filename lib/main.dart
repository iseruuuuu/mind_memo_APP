import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    //横
    DeviceOrientation.landscapeLeft,
    //横
    DeviceOrientation.landscapeRight
  ]);
  runApp(MyApp());
}

//TODO テキストフィールドの大きさ、位置設定　　　　　　　　　　　　　　達成！
//TODO  リストみたいにしてスクロールできるようにする。　　　　　　　 　達成！
//TODO  一つのリストを保存する。　　　　　　　　　　　　　　　　　　　　達成！！
//TODO  文字の位置　　　　　　　　　　　　　　　　　　　　　　　　　　　
//TODO  複数のリストを保存する。　　　　　　　　　　　　　　　　　　　　
//TODO  シェア機能をつけるかも？　　　　　　　　　　　　　　　　　　　　
//TODO  下のボタンでリストを増やす　　　　　　　　　　　　　　　　　　　
//TODO  キーボード調整　　　　　　　　　　　　　　　　　　　　　　　　　
//TODO  レスポンシブ対策　　　　　　　　　　　　　　　　　　　　　　　　

//TODO 部品を分けたい


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'あなたを変える何か'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  //List<Task> tasks = [];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String right = '今';
  String left = '逆';

  //データ編集用のコントローラ
  //１列目
  final iContoroller = TextEditingController();
  final iiContoroller = TextEditingController();
  //2列目
  final iiiContoroller = TextEditingController();
  final iiiiContoroller = TextEditingController();
  //3列目
  final iiiiiContoroller = TextEditingController();
  final iiiiiiContoroller = TextEditingController();
  var isLoaded = false;

  void initState() {
    super.initState();
    load();
  }

  //データロード用関数*3(loadRed, loadYellow, loadGreen)
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    iContoroller.text = prefs.getString('i');
    iiContoroller.text = prefs.getString('ii');
    iiiContoroller.text = prefs.getString('iii');
    iiiiContoroller.text = prefs.getString('iiii');
    iiiiiContoroller.text = prefs.getString('iiiii');
    iiiiiiContoroller.text = prefs.getString('iiiiii');
    setState(() {
      isLoaded = true;
    });
  }

  Future<void> save(key,text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, text);
  }

  void _incrementCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
    });
    await prefs.setInt('counter', _counter);
  }

  Future<int> _getPrefCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getInt('counter') ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    _getPrefCount().then((value) {
      setState(() {
        _counter = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            // TextFieldCell,
            //Text('$_counter'),
            //1列目
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 300,
                  child: TextField(
                    controller: iContoroller,
                    onChanged: (text) {save('i', text);},
                    style: TextStyle(fontSize: 20,color: Colors.red,height: 0.1,),
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: right, hintText: right,
                    ),
                  ),
                ),
                Icon(Icons.compare_arrows,size: 70,),
                Container(width: 300,
                  child: TextField(
                    controller: iiContoroller,
                    onChanged: (text) {save('ii', text);},
                    style: TextStyle(fontSize: 20,color: Colors.red,height: 0.5,),
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        labelText: left, hintText: left
                    ),
                  ),
                ),
              ],
            ),

            //2列目
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 300,
                  child: TextField(
                    controller: iiiContoroller,
                    onChanged: (text) {save('iii', text);},
                    style: TextStyle(fontSize: 20,color: Colors.red,height: 0.1,),
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        labelText: right, hintText: right
                    ),
                  ),
                ),
                Icon(Icons.compare_arrows,size: 70,),
                Container(width: 300,
                  child: TextField(
                    controller: iiiiContoroller,
                    onChanged: (text) {save('iiii', text);},
                    style: TextStyle(fontSize: 20,color: Colors.red,height: 0.5,),
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        labelText: left, hintText: left
                    ),
                  ),
                ),
              ],
            ),

            //3列目
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 300,
                  child: TextField(
                    controller: iiiiiContoroller,
                    onChanged: (text) {save('iiiii', text);},
                    style: TextStyle(fontSize: 20,color: Colors.red,height: 0.1,),
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        labelText: right, hintText: right
                    ),
                  ),
                ),
                Icon(Icons.compare_arrows,size: 70,),
                Container(width: 300,
                  child: TextField(
                    controller: iiiiiiContoroller,
                    onChanged: (text) {save('iiiiii', text);},
                    style: TextStyle(fontSize: 20,color: Colors.red,height: 0.5,),
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        labelText: left, hintText: left
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      //ここを押したら、テキストフィールドを増やす。
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



/*
Widget TextFieldCell = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    RightMemo,
    //    Icon(Icons.code),
    Icon(Icons.compare_arrows,size: 70,),
    LeftMemo,
  ],
);


Widget RightMemo = new Container(
  width: 300,
  child: TextField(
    style: TextStyle(
      fontSize: 20,color: Colors.red,height: 0.5,
    ),
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        // labelText: '入力してください（右）',
        // hintText: '入力してください（右）'
        hintText: ''
    ),
  ),
);

Widget LeftMemo = new Container(
  width: 300,
  child: TextField(
    style: TextStyle(
      fontSize: 20, color: Colors.blue,height: 0.5,
    ),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      // labelText: '入力してください（左）',
      // hintText: '入力してください（左）'
    ),
  ),
);



class Task {
  int id;
  String right;
  String left;

  Task({this.id,this.right,this.left});
}

 */