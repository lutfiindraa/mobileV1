import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'pemasukan.dart'; // Adjust the path as necessary

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  File? image; // File to store the selected image
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> openGallery() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  // Function to pick an image using the camera
  Future<void> openCamera() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: double.infinity,
          ),
          // Profile image closer to the white box
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.5, // Posisi gambar lebih dekat ke bawah
            left: 0,
            right: 0,
            child: image != null
                ? Image.file(
              image!,
              height: 900, // Adjust the height if needed
              fit: BoxFit.cover,
            )
                : Image.asset(
              'lib/aplikasi1/BrandAmbasadorCuy.png', // Ganti dengan path aset yang sesuai
              height: 200, // Adjust the height if needed
              fit: BoxFit.contain,
            ),
          ),
          // Content at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Teks utama
                  Text(
                    'Hidup Chill\nCuan Tetap Stabil!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Teks deskripsi
                  Text(
                    'Atur dan Kelola Duitlu\ndengan gampang pakai Aplikasi ini',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Tombol Ayo Mulai
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the HomePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pemasukan()),
                      );
                    },
                    child: Text(
                      'Ayo Mulai',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Floating action button to select the profile image
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: ((builder) => Container(
                height: 120,
                child: Column(
                  children: [
                    Text(
                      'Pilih Sumber Gambar',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.camera),
                          onPressed: () {
                            openCamera();
                            Navigator.pop(context);
                          },
                          label: Text('Kamera'),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.photo_library),
                          onPressed: () {
                            openGallery();
                            Navigator.pop(context);
                          },
                          label: Text('Galeri'),
                        ),
                      ],
                    )
                  ],
                ),
              )));
        },
        child: Icon(Icons.camera_alt),
        backgroundColor: Colors.green,
      ),
    );
  }
}
