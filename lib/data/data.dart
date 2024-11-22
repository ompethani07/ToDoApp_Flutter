import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ToDoDatabse{
  List toDoList=[
  ];

 final _myBox = Hive.box("mybox");
  void createInitalData(){
    toDoList=[
      ["wake up at 5",false],
      ["go to gym",false],
    ];
  }


  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  void upadteDatabse(){
  _myBox.put("TODOLIST", toDoList);
  }
}
