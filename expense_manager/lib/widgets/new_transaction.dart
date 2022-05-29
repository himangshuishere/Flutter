import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final amountController = TextEditingController();

  dynamic _selectedDate;

  

  void _submitData() {
    if (amountController.text.isEmpty){return;}
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0.0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null){
        return;
      }
      setState((){
      _selectedDate = pickedDate;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_) => _submitData(),
            // onChanged: (val) {
            //   titleInput = val;
            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
            // onChanged: (val) {
            //   amountInput = val;
            // },
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text((_selectedDate == null) ?'No Date Chosen!': 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                FlatButton(
                    onPressed: () => _presentDatePicker(),
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.white),
              )),
        ]),
      ),
    );
  }
}
