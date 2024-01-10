import 'package:flutter/material.dart';
import 'package:harta_bendahara/architecture/senarai/senarai_belanja.dart';
import 'package:harta_bendahara/model/catatan.dart';
// this file concerns about how the list of card is going to be rendered
class SenaraiCatatan extends StatelessWidget {
   const SenaraiCatatan({super.key, required this.inputCatatan, required this.deleteCatatan});
 final List<Catatan> inputCatatan;
 final void Function(Catatan catatan) deleteCatatan; //we use this datatype to accept a function which got pass by the parent widget

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemBuilder: (context, index) => 
    Dismissible(
      background:  Container(// convenient, we can customize the error visibility color
        color: Theme.of(context).colorScheme.error.withOpacity(1),//dark shade of red
        margin: Theme.of(context).cardTheme.margin,),//it uses a default value of margin which is 4.0 (all)
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