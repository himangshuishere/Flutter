import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expense_manager/models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({Key? key, required this.transaction, required this.deleteTx }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColor;
  
  @override
  void initState(){
    const availableColors = [
      Colors.red,
      Colors.indigo,
      Colors.blue,
      Colors.purple,

    ];
    _bgColor = availableColors[Random().nextInt(4)];
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _bgColor,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('Rs. ${widget.transaction.amount}')),
                      ),
                    ),
                    title: Text(
                      widget.transaction.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(widget.transaction.date)),
                    trailing: MediaQuery.of(context).size.width > 420
                        ? FlatButton.icon(
                            onPressed: () => widget.deleteTx(widget.transaction.id),
                            icon: Icon(Icons.delete),
                            label: Text("Delete"),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            onPressed: () => widget.deleteTx(widget.transaction.id),
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                          )),
              );
  }
}