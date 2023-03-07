import 'package:flutter/material.dart';
import 'package:mortgage_calculator/service/formulas.dart';

class AmortizationTable extends StatefulWidget {
  const AmortizationTable({Key? key}) : super(key: key);

  @override
  State<AmortizationTable> createState() => _AmortizationTableState();
}

class _AmortizationTableState extends State<AmortizationTable> {
  // List<List>? myList = calculateAmortizationTable(425000, 5, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(1),
        child: ListView(
          children: [
            _createDataTable(),
          ],
        ),
      ),
    );
  }
}

DataTable _createDataTable() {
  return DataTable(
    columns: _createColumn(),
    rows: _createRow(),
    dividerThickness: 3.5,
    // dataRowHeight: 80,
    showBottomBorder: true,
  );
}

List<DataColumn> _createColumn() {
  return [
    DataColumn(
        label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(
        label:
            Text('Principal', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(
        label: Text('Interest', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(
        label: Text('Outstanding Balance',
            style: TextStyle(fontWeight: FontWeight.bold))),
  ];
}

List<DataRow> _createRow() {
  return [
    DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('Flutter Basics')),
      DataCell(Text('David John')),
      DataCell(Text('asdasd John'))
    ]),
    DataRow(cells: [
      DataCell(Text('#101')),
      DataCell(Text('Dart Internals')),
      DataCell(Text('Alex Wick')),
      DataCell(Text('asdasd John')),
    ])
  ];
}
