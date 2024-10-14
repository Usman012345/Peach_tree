import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CashierMain extends StatefulWidget {
  const CashierMain({super.key});

  @override
  State<CashierMain> createState() => _CashierMainState();
}

class _CashierMainState extends State<CashierMain> {
  File? pickedImage; // Holds the picked image file
  final ImagePicker _picker = ImagePicker(); // For picking images

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path); // Update state with picked image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Main_background.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: SizedBox.expand(),
          ),

          // Username, Status, and Rank texts along with the image display area
          Transform.translate(
            offset: Offset(60, 120), // Custom x and y values for positioning
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UserName: ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20), // Add space between texts
                    Text(
                      "Status: ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20), // Add space between texts
                    Text(
                      "Rank: ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Space between texts and the image area
                Spacer(),

                // Image display area at the right of "Username"
                Transform.translate(
                  offset: Offset(-100, 0),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey[300], // Box background color
                    child: pickedImage != null
                        ? Image.file(pickedImage!,
                            fit: BoxFit.cover) // Display picked image
                        : Center(
                            child:
                                Text("No Image")), // Default text when no image
                  ),
                ),
              ],
            ),
          ),

          // Button to trigger image picker
          Transform.translate(
            offset: Offset(60, 300), // Custom x and y values for positioning
            child: ElevatedButton(
              onPressed: _pickImage,
              child: Text("Pick an Image"), // Button label
            ),
          ),
        ],
      ),

      appBar: AppBar(
        title: Text('Peach Tree'),
        elevation: 10,
        shadowColor:
            Colors.black.withOpacity(0.5), // Optional: Control the shadow color
        backgroundColor: Colors.grey,
        actions: [notification_icon()],
      ),

      drawer: Drawer_main(context), //Drawer
    );
  }

  Container notification_icon() {
    return Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Icon(Icons.notifications, size: 28));
  }

  Drawer Drawer_main(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              accountName: Text(
                "Cashier Name",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text("CashierEmail@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Text(
                  "C",
                  style: TextStyle(fontSize: 30.0, color: Colors.black),
                ), //Text
              ), //circleAvatar
            ),
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: const Text(' Receipt '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text(' Search '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text(' Add Products '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text(' Update Info '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_rounded),
            title: const Text(' Complaints and Issues '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
