import 'package:flutter/material.dart';
import 'package:harta_bendahara/model/catatan.dart';


class BorangCatatan extends StatefulWidget {
  const BorangCatatan({super.key, required this.inputCatatan});
final void Function(String title, double spend, DateTime date, Category category) inputCatatan;

  @override
  State<BorangCatatan> createState() => _BorangCatatanState();
}

class _BorangCatatanState extends State<BorangCatatan> {
final _textController = TextEditingController();
final  _decimalController = TextEditingController();
DateTime? _savedDate;
Category _categorySelect = Category.education;

void _inputDate() async {
  final now = DateTime.now();
final firstDate = DateTime(now.year - 1, now.month, now.day);  //representing a year before is the minimum of recording a catatan
final selectedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: firstDate, lastDate: now);
setState(() {
  _savedDate = selectedDate;
});

}

void _checkErrorBeforeSubmit(){
  final amountToBeEvaluated = double.tryParse(_decimalController.text); 
  final isInvalid = amountToBeEvaluated == null || amountToBeEvaluated <= 0;

if (_textController.text.trim().isEmpty || isInvalid || _savedDate == null){
showDialog(context: context, builder: (ctx) => AlertDialog(
  title: const Text("Error Input"),
  content: const Text(" Please make sure that the information that you giving is valid"),
  actions: [
    TextButton(onPressed: (){
      Navigator.pop(ctx);
    }, child: const Text("Ok"))
  ],
));
return;
}
else {
  widget.inputCatatan(_textController.text,amountToBeEvaluated,_savedDate!,_categorySelect);
 Navigator.pop(context);
}

}



@override
  void dispose(){
  _textController.dispose();
  _decimalController.dispose();
    super.dispose();
}

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return  SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
          child: Column( //based on the form structure
            children: [
              TextField(
              controller: _textController,
                maxLength: 50,
               decoration: const InputDecoration(
                label: Text("Item"),
               ),
              ),
              const SizedBox(height: 2,),
              Row(
                children: [
              
              Expanded(
                child: TextField(
                  controller: _decimalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "RM: ",
                    label: Text("Jumlah"),
                  ),
              
                ),
              ),
             const  SizedBox(width: 16,),
              Expanded (
             child: Row(
              mainAxisAlignment: MainAxisAlignment.end, //basically we tell dart to put the widget of the rightmost side of the screen
              crossAxisAlignment: CrossAxisAlignment.center, // basically we tell dart to put the widget in the center vertically
              children: [
                Text(_savedDate == null ? "No date selected" : formatter.format(_savedDate!)),
                IconButton(onPressed: _inputDate, icon: const Icon(Icons.calendar_month))
              ],
              ),
              )
        
        
        
         ], 
          ),
          const SizedBox(height: 15,),
              Row(
                children: [
        
                  DropdownButton(
                    value: _categorySelect,
                    items: Category.values.map((category) => 
                  DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                    
                     ),).toList(), 
                     
                     onChanged: (value) {
                            if(value == null){
                                return;
                            }           
        setState(() {
         
          _categorySelect = value;
        });
        
        
                  }
                  ),
                  const Spacer(),
                  ElevatedButton(onPressed: _checkErrorBeforeSubmit, child: const Text("Simpan Catatan")),
                  TextButton(onPressed: () { Navigator.pop(context);},child: const Text("batal")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}