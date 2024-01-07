import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd(); //this is essentially telling a date variable on how the date should be displayed, in which format?

 enum Category {luxury, technology, food, education}
 var uuid = const Uuid();

 const categoryIcon = {
Category.luxury : Icons.diamond,
Category.technology : Icons.computer_sharp,
Category.food : Icons.fastfood,
Category.education: Icons.book,
 };

class Catatan {
Catatan({
required this.title, 
required this.spend,
required this.date,
required this.category,
}): id = uuid.v4();



final String id;
final String title;
final double spend;
final DateTime date;
Category category;

String get formattedDate => formatter.format(date);   //less verbose function
}


class ExpenseBucket {

  ExpenseBucket({required this.category, required this.belanja});

  final Category category;
  final List<Catatan> belanja;


  double get totalExpenses { // nice to have a getter for convenience 
  double sum = 0;

  for(final catatan in belanja ) {

    sum+=catatan.spend;
  }

  return sum;
  }
}