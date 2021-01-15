import 'package:flutter/material.dart';

class SearchCity extends StatefulWidget {

  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        title: Text("Weather App",style: TextStyle(color: Colors.black54),),
        centerTitle: true,
      ),
      body: Container(
        child: Form(child:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                  style: BorderStyle.solid,
                ),
              ),
              suffixIcon: InkWell(child: Icon(Icons.search),
              onTap: (){
                print(_textEditingController.text);
                Navigator.pop(context,_textEditingController.text);
              },),
                 hintText: "Search City",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.amber,
                  style: BorderStyle.solid,
                ),
              ),
            ),

          ),
        )
        ),
      ),
    );
  }
}
