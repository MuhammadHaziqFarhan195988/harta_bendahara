import 'package:flutter/material.dart';
import 'package:harta_bendahara/architecture/borang_catatan.dart';
import 'package:harta_bendahara/architecture/chart/chart.dart';
import 'package:harta_bendahara/model/catatan.dart';
import 'package:harta_bendahara/architecture/senarai/senarai_catatan.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final List<Catatan> _inputCatatan = [
    //we're going to hard code some values now
    Catatan(
        title: "nasi ikan stim",
        spend: 12,
        date: DateTime.now(),
        category: Category.food),
    Catatan(
        title: "drone",
        spend: 47,
        date: DateTime.now(),
        category: Category.technology),
  ];

void _addCatatan(){
showModalBottomSheet(
  isScrollControlled: true,
  context: context,
  builder: (ctx) =>  BorangCatatan(inputCatatan: _saveCatatan,));

}
void _saveCatatan(String title, double spend, DateTime date, Category category ){
  setState(() {
    _inputCatatan.add(Catatan(title: title, spend: spend, date: date, category: category));
   
  });
  
}

void _deleteCatatan(Catatan catatan){
  final catatanIndex = _inputCatatan.indexOf(catatan);
  setState(() {
    _inputCatatan.remove(catatan);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        duration:const Duration(seconds: 3),
        content:  const Text("Catatan telah dipadamkan"),
        action: SnackBarAction(label: "Undo", onPressed: (){
          setState(() {
            _inputCatatan.insert(catatanIndex, catatan);
          });
        }),
        )
      );
  });
}


  @override
  Widget build(BuildContext context) {
   final width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        
        actions: [
          IconButton(onPressed: _addCatatan, icon: const Icon(Icons.add))
        ],
        title: const Text(
          "Catatan Bendahara",
        ),
      ),
      body: width < 600 ?  Column(
        children: [
          Chart(belanja: _inputCatatan), //chart.dart
          Expanded(
            child: _inputCatatan.isNotEmpty ?
            SenaraiCatatan(
              inputCatatan: _inputCatatan,
              deleteCatatan: _deleteCatatan,
              ) :
             const Center(child:  Text("Whoosh did you heard that tumbleweed?")), // if there is not list then run this line
              ), 
              
        ],
      ) : Row(children: [
          Expanded(child: Chart(belanja: _inputCatatan)), //chart.dart
          Expanded(
            child: _inputCatatan.isNotEmpty ?
            SenaraiCatatan(
              inputCatatan: _inputCatatan,
              deleteCatatan: _deleteCatatan,
              ) :
             const Center(child:  Text("Whoosh did you heard that tumbleweed?")), // if there is not list then run this line
              ), 
      ]),
    );
  }
}
