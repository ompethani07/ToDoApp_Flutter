

import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:todoapp/data/data.dart";
import "package:todoapp/utils/To_Do_tile.dart";
import "package:todoapp/utils/dilogue_box.dart";
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box("mybox");
  ToDoDatabse db = ToDoDatabse();
  final _controller = TextEditingController();

@override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
      db.createInitalData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  //check box chnaged
  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.toDoList[index][1] = ! db.toDoList[index][1];
    });
    db.upadteDatabse();
  }

  //save task
 void saveNewTask(){
    setState(() {
      if(_controller.text.length!=0) {
        db.toDoList.add([_controller.text, false]);
        db.upadteDatabse();
      }
      _controller.clear();
    });
    Navigator.of(context).pop();
 }

//cancel task
  void CancelTask(){
    Navigator.of(context).pop();
    _controller.clear();
  }

  //create new task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DilogueBox(controller: _controller,onSave: saveNewTask,onCancel: CancelTask,);
    });
    db.upadteDatabse();
  }

  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
      db.upadteDatabse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.yellow[200],
      appBar: AppBar(
        title:Center(
            child: Text("To Do App",
              style: TextStyle(fontWeight: FontWeight.w600,fontSize:22),
            ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0,right: 20),
        child: Transform.scale(
          scale: 1.4,
          child: FloatingActionButton(
              onPressed:createNewTask,
            child: Transform.scale(
                scale: 1.3,
                child: Icon(Icons.add)),
            shape: CircleBorder(),
            clipBehavior: Clip.antiAlias,
            backgroundColor: Colors.yellow,

          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
         return ToDoTile(taskName: db.toDoList[index][0], taskComplete: db.toDoList[index][1], onChanged: (value)=>checkBoxChanged(value,index),deleteFunction: (context) => deleteTask(index),);
        },
      ),
    );
  }
}
