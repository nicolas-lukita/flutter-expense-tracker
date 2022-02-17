import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context)
        .pop(); //to close the most top screen (in this case is keyboard)
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  //onChanged: (val) {},
                  onSubmitted: (_) =>
                      _submitData, //submit when enter pressed (not working)
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  //onChanged: (val) {},
                  onSubmitted: (_) =>
                      _submitData, //submit when enter pressed (not working)
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(_selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Date: ${DateFormat.yMd().format(_selectedDate)}'),
                      ),
                      FlatButton(
                        onPressed: _presentDatePicker,
                        child: Text(
                          'Choose date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        textColor: Theme.of(context).primaryColorDark,
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  onPressed: _submitData,
                  child: Text(
                    "Add Transaction",
                    style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).textTheme.button.color),
                  ),
                )
              ],
            ),
          )),
    );
  }
}