import 'package:flutter/material.dart';
import 'package:harta_bendahara/model/catatan.dart';

class Belanja extends StatelessWidget {
  const Belanja({super.key,required this.catatan});

  final Catatan catatan;

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
Text(catatan.title,
style: Theme.of(context).textTheme.titleLarge,),
const SizedBox(height: 4,),
Row(
  children: [
    Text("RM: ${catatan.spend.toString()}"),
    const Spacer(),

    Row(children: [
 Icon(categoryIcon[catatan.category]),
 const SizedBox(width: 8,),
 Text(catatan.formattedDate),
    ],)
  ],
),
        ]),
      ),
      
      );
  }
}