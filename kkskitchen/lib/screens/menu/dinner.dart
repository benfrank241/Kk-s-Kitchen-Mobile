import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kkskitchen/screens/storage/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:google_fonts/google_fonts.dart';

class Dinner extends StatefulWidget {
  const Dinner({Key? key}) : super(key: key);

  @override
  _DinnerState createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg'],
                );

                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No file selected.'),
                    ),
                  );
                  return;
                }

                final path = results.files.single.path!;
                final fileName = results.files.single.name;

                storage
                    .uploadFile(path, fileName)
                    .then((value) => print('Done'));
              },
              child: Text('Upload File'),
            ),
          ),
          // FutureBuilder(
          //     future: storage.listFiles(),
          //     builder: (BuildContext context,
          //         AsyncSnapshot<firebase_storage.ListResult> snapshot) {
          //       if (snapshot.connectionState == ConnectionState.done &&
          //           snapshot.hasData) {
          //         return Container(
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           height: 50,
          //           child: ListView.builder(
          //             scrollDirection: Axis.horizontal,
          //             shrinkWrap: true,
          //             itemCount: snapshot.data!.items.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: ElevatedButton(
          //                   onPressed: () {},
          //                   child: Text(snapshot.data!.items[index].name),
          //                   ),
          //               );
          //             })
          //         );
          //       }
          //       if (snapshot.connectionState == ConnectionState.waiting ||
          //           !snapshot.hasData) {
          //         return CircularProgressIndicator();
          //       }
          //       return Container();
          //     }),
          FutureBuilder(
              future: storage.downloadURL('havana.jpg'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: 'To be implemented');
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 300,
                          height: 150,
                          child: Image.network(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Rice Cakes',
                        style: GoogleFonts.yanoneKaffeesatz(textStyle: TextStyle(color: Color.fromARGB(255, 184, 145, 227))),
                        textScaleFactor: 1.7,
                      )
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              }),
          FutureBuilder(
              future: storage.downloadURL('cookie.jpg'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: 'To be implemented');
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 300,
                          height: 150,
                          child: Image.network(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Bubble Tea',
                        style: GoogleFonts.yanoneKaffeesatz(textStyle: TextStyle(color: Color.fromARGB(255, 184, 145, 227))),
                        textScaleFactor: 1.7,
                      )
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              }),
              FutureBuilder(
              future: storage.downloadURL('IMG_1521.JPG'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: 'To be implemented');
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          width: 300,
                          height: 150,
                          child: Image.network(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Fried Chicken',
                        style: GoogleFonts.yanoneKaffeesatz(textStyle: TextStyle(color: Color.fromARGB(255, 184, 145, 227))),
                        textScaleFactor: 1.7,
                      )
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              })
        ],
      ),
    );
  }
}
