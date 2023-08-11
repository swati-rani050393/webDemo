
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webservice/network/api.dart';



class AddAuthor extends StatefulWidget {
  @override
  _AddAuthorState createState() => _AddAuthorState();
}

class AddAuthorState {
}

class _AddAuthorState extends State<AddAuthor> {
  String authorName;
  final GlobalKey<ScaffoldState> _scafKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scafKey,
      appBar: AppBar(
        title: Text('New Author'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Author name', labelText: 'Author Name'),
                onChanged: (value) {
                  setState(() {
                    authorName = value;
                  });
                },
              ),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  API.createAuthor(authorName).then((author) =>
                      ScaffoldMessenger.of(context).
                      showSnackBar( SnackBar( content: Text( 'new author with id ${author.id} has been created'),
                        duration: Duration(milliseconds: 300), ), ));



                },

              )
              ,
            ],
          ),
        ),
      ),
    );
  }
}
