import 'package:flutter/material.dart';
import 'package:harta_bendahara/architecture/senarai/senarai_belanja.dart';
import 'package:harta_bendahara/model/catatan.dart';

class SenaraiCatatan extends StatelessWidget {
   const SenaraiCatatan({super.key, required this.inputCatatan, required this.deleteCatatan});
 final List<Catatan> inputCatatan;
 final void Function(Catatan catatan) deleteCatatan;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemBuilder: (context, index) => 
    Dismissible(
      background:  Container(
        color: Theme.of(context).colorScheme.error.withOpacity(1),//dark shade of red
        margin: Theme.of(context).cardTheme.margin,),
      onDismissed: (direction){
deleteCatatan(inputCatatan[index]);
      },
      key: ValueKey(inputCatatan[index]),
      child: Belanja(catatan: inputCatatan[index]), 
      
    ),
    itemCount: inputCatatan.length,
    );
  }
}