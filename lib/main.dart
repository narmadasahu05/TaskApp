import 'package:flutter/material.dart';
import 'package:taskapp/ItemModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController name=TextEditingController();

  
 List<ItemModel> itemList=[
   ItemModel("todo1",false),
    ItemModel("todo2s",false)
 ];
 bool isselect=false;
 
 
 List items=[];
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
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int i){
            return ListTile(
              title:  Container(
                color:(itemList[i].isSelected==true)? Colors.blue:Colors.red,
                child: Row(
                  children: [
                    Checkbox(
                      value: itemList[i].isSelected, onChanged: (value){
                      // v=isselect;
                      setState(() {
                        isselect=value!;
                        itemList[i].isSelected=value;
                      });
                      // items.add(value);
                      print(value);
                    }),
                    Text(
                    itemList[i].name,
                    style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            );
          }

        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title:  TextFormField(
                    controller: name,
                   
                    ),
                  content: const Text("You have raised a Alert Dialog Box"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                       setState(() {
                          ItemModel model =new ItemModel(name.text, false);
                        model.name = name.text;
                        model.isSelected = false;
                        itemList.add(model);
                       });
                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay",),
                      ),
                    ),
                  ],
                ),
              );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
