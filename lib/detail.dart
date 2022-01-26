import 'package:flutter/material.dart';

class  Detail extends StatelessWidget {
  var name_cntr=TextEditingController();
  var age_cntr=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context,{"name":name_cntr.text,"age":age_cntr.text});
        }, child: Text("OK"))
      ],
    ),
    body: Column(children: [
      Padding(padding: EdgeInsets.all(5),
      child:TextField(
        controller: name_cntr,
       decoration: InputDecoration(
        label:Text("name") ,
       border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(5))
      )
     ),),
      Padding(padding: EdgeInsets.all(5),
        child:TextField(
            controller: age_cntr,
            decoration: InputDecoration(
                label:Text("age") ,
                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(5))
            )
        ),),
     ],),
    );
  }
}
