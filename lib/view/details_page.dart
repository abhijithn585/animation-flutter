import 'package:animation/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.data});
  DataModel data;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
          SizedBox(
              height: 300,
              width: 500,
              child: Image.asset(
                '${widget.data.image}',
                fit: BoxFit.cover,
              )),
          const SizedBox(height: 10),
          Text("${widget.data.description}",
              style: GoogleFonts.aBeeZee(fontSize: 20))
        ]))));
  }
}
