import 'package:flutter/material.dart';
import 'package:expense_manager/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('Rs. ${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(transactions[index].title, style: Theme.of(context).textTheme.headline6,),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(onPressed: ()=> deleteTx(transactions[index].id), icon:Icon(Icons.delete), color: Theme.of(context).errorColor,)
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
