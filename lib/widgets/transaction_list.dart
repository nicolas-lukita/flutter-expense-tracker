import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(children: <Widget>[
                  Text(
                    'No transactions',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ]);
              })
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      trailing: MediaQuery.of(context).size.width > 360
                          ? FlatButton.icon(
                              label: Text('Delete'),
                              icon: Icon(Icons.delete),
                              textColor: Theme.of(context).errorColor,
                              onPressed: () => deleteTx(transactions[index].id),
                            )
                          : IconButton(
                              onPressed: () => deleteTx(transactions[index].id),
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                            ),
                      leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: FittedBox(
                                child: Text('\$${transactions[index].amount}')),
                          )),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMEd().format(transactions[index].date)),
                    ),
                  );
                  // return Card(
                  //   child: Row(
                  //     children: <Widget>[
                  //       Container(
                  //         margin: EdgeInsets.symmetric(
                  //             vertical: 10, horizontal: 15),
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //                 color: Theme.of(context).primaryColor,
                  //                 width: 2)),
                  //         padding: EdgeInsets.all(10),
                  //         child: Text(
                  //           "\$${transactions[index].amount.toStringAsFixed(0)}",
                  //           style: TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.bold,
                  //               color: Theme.of(context).primaryColor),
                  //         ),
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             transactions[index].title,
                  //             style: Theme.of(context).textTheme.title,
                  //           ),
                  //           Text(
                  //             DateFormat.yMMMMEEEEd()
                  //                 .format(transactions[index].date),
                  //             style: TextStyle(
                  //               fontSize: 17,
                  //               color: Colors.grey,
                  //             ),
                  //           )
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // );
                },
                itemCount: transactions.length,
              ));
  }
}
