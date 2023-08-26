import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Design_Two extends StatelessWidget {
  static const String title = 'Profile UI';

  const Design_Two({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const MyUIDesign(title: title),
    );
  }
}

class MyUIDesign extends StatefulWidget {
  final String title;

  const MyUIDesign({super.key, required this.title});

  @override
  State<MyUIDesign> createState() => _MyUIDesignState();
}

class _MyUIDesignState extends State<MyUIDesign> {
  
  Future<bool?> Warning(BuildContext context) async => showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Warning !!!'),
      content: const Text('Do You Want to Close This App?'),
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: () => Navigator.pop(context, false),
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () => Navigator.pop(context, true),
        )
      ],
    )
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final showPop = await Warning(context);

        return showPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(widget.title, style: const TextStyle(color: Colors.black),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(60.0),
                        color: Colors.white
                        ),
                      ),
                      Positioned(
                        bottom: 2.0,
                        right: 8.0,
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add_a_photo_outlined, color: Colors.white,size: 13.0,),
                            onPressed: () {}
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 90.0),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Your Name',
                      suffixIcon: Icon(Icons.check),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Your Email',
                      suffixIcon: Icon(Icons.check),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  const TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Set Your About',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 70.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize:const Size(180.0, 50.0)
                    ),
                    child: const Text('Submit'),
                    onPressed: () {}
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
Future<bool?> Warning(BuildContext context) async => showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: Text('Confirmation Message :'),
            titlePadding: EdgeInsets.only(left: 15.0, top: 15.0),
            content: Text('Do You want to Exit this App?\nClick Below'),
            //contentTextStyle: TextStyle(fontSize: 45.0),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.black),
                  )),
              SizedBox(width: 40.0),
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final ShowPop = await Warning(context);
        return ShowPop ?? false;
      },
      child: Scaffold(
*/