import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  var selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add New Task",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Tittle", labelStyle: TextStyle(fontSize: 30)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(fontSize: 30)),
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            "select time",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              openDatePicker();
            },
            child: Text(
              "${selectDate.year} ${selectDate.month} ${selectDate.day}",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Add Task",
              )),
        ],
      ),
    );
  }

  openDatePicker() async {
    var choosenDate = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (choosenDate != null) {
      selectDate = choosenDate;
      setState(() {});
    }
  }
}
