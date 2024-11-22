import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatefulWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?) onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile({super.key, required this.taskName, required this.taskComplete,required this.onChanged,required this.deleteFunction});
  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion:StretchMotion(),
          children: [
            SlidableAction(onPressed: widget.deleteFunction,icon:Icons.delete,backgroundColor: Colors.red,borderRadius: BorderRadius.circular(5),),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Transform.scale(
                  scale: 1.5,
                  child: Checkbox(value: widget.taskComplete, onChanged: widget.onChanged,activeColor: Colors.black,)),
              const SizedBox(width: 4,),
              Flexible(
            child: Text(
              widget.taskName,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                decoration: widget.taskComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
              overflow : TextOverflow.ellipsis,
              maxLines: 4,
            ),)
            ],
          ),
          decoration: BoxDecoration(color: Colors.yellow[600],borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
