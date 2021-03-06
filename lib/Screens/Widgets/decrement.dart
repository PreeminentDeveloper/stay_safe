import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_safe/State_Management/counter_bloc.dart';

class DecrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);

    return FlatButton.icon(
      onPressed: () => counterBloc.decrement(),
      icon: Icon(Icons.add),
      label: Text("Remove")
    );
  }
}