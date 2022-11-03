import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class imagesApi extends StatefulWidget {
  @override
  _imagesApiState createState() => _imagesApiState();
}

class _imagesApiState extends State<imagesApi> {
  List? data;
  List imagesUrl = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<String> fetchDataFromApi() async {
    var jsonData = await http.get(Uri.parse(
        "https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json"));
    var fetchData = jsonDecode(jsonData.body);

    setState(() {
      data = fetchData;
      for (var element in data!) {
        imagesUrl.add(element['url']);
      }
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('List Of Images'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: imagesUrl.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            imagesUrl[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
