import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/detail.dart';
import 'package:provider_example/form_provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
         ChangeNotifierProvider(
         create: (_) => FormProvider(),

       )
          ],
        child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(onPressed:() async {
         final res= await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Detail()),
          );
         if(res!=null){
           final provider=context.read<FormProvider>();
           provider.name=res["name"];
           provider.age=int.parse(res["age"]);
         }
        }, child: Text("add")),

        ElevatedButton(onPressed:() {
          final list=["Jho","Jana","Samat"];
          context.read<FormProvider>().list=list;
        }, child: Text("list"))
      ],),
      body: Column(
        children: [
          Selector<FormProvider, String>(
            selector: (_, provider) => provider.name,
             builder: (context, name, child) =>
                 Text(name)
        ),
          Selector<FormProvider, int>(
              selector: (_, provider) => provider.age,
              builder: (context, age, child) =>
                 Text(age.toString())
          ),
          Selector<FormProvider, List<String>>(
              selector: (_, provider) => provider.list,
              builder: (context, list, child) =>
                 Expanded(child:ListView.builder(itemCount: list.length,itemBuilder: (context,index)=>
                     Text(list[index])
                 ))
          )
        ],
      ),
    );
  }
}

