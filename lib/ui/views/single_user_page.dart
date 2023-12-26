import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app_flutter/data/model/home_model.dart';
import 'package:demo_app_flutter/data/model/user_model.dart';
import 'package:demo_app_flutter/ui/bloc/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_files/app_colors.dart';
import '../bloc/user_bloc/user_bloc.dart';
import '../bloc/user_bloc/user_event.dart';

class SingleUserPage extends StatelessWidget {
  final UserLoadedState? state;
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? imageurl;

  SingleUserPage({
    super.key,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.imageurl,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    String? userId = id.toString();
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "USER DETAILS",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            letterSpacing: 5.0,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_home_work),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: height * 0.45,
                        width: width * 0.99,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            imageurl ?? "",
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                  child: SpinKitCircle(
                                    color: AppColors.blue,
                                    size: 50,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Card(
                          elevation: 7,
                          color: Color(0xFF6E409B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 5, left: 10, right: 10),
                            width: height * .40,
                            height: width * .22,
                            child: Column(
                              children: [
                                Container(
                                  width: width * .7,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "$firstName $lastName",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white.withOpacity(0.7),
                                        ),
                                      ),
                                      Text(
                                        userId,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: width * 0.7,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.email,
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            size: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            email ?? "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 25,
                        child: Chip(
                          padding: const EdgeInsets.fromLTRB(-2, -2, -2, -2),
                          label: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back_ios_sharp),
                          ),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.grey.withOpacity(0.9),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 25,
                        child: Chip(
                          padding: const EdgeInsets.fromLTRB(-2, -2, -2, -2),
                          label: InkWell(
                            onTap: () {},
                            child: const Icon(Icons.bookmark_border_rounded),
                          ),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.grey.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink.withOpacity(0.5),
                            elevation: 12,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0), // Button border radius
                            ),
                          ),
                          onPressed: () {
                            createUser(
                              id: id,
                              email: email,
                              firstName: firstName,
                              lastName: lastName,
                              avatar: imageurl,
                            );
                            Future.delayed(const Duration(seconds: 2));
                            showSnackbar(context, 'Data Added Successfully');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Add",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 14),
                              Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 30, right: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 12,
                            primary: Colors.black.withOpacity(0.5),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0), // Button border radius
                            ),
                          ),
                          onPressed: () {
                            updateUser(
                              id: id,
                              email: email,
                              firstName: firstName,
                              lastName: lastName,
                              avatar: imageurl,
                            );
                            Future.delayed(const Duration(seconds: 2));
                            showSnackbar(context, 'Data Updated Successfully');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Edit",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 14),
                              Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 30, right: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 12,
                            primary: Colors.green.withOpacity(0.5),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0), // Button border radius
                            ),
                          ),
                          onPressed: () {
                            deleteUser();
                            Future.delayed(const Duration(seconds: 2));
                            showSnackbar(context, 'Data Deleted Successfully');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Delete",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 14),
                              Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Button border radius
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 14),
                  Icon(
                    Icons.verified_user,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future createUser({
  int? id,
  String? email,
  String? firstName,
  String? lastName,
  String? avatar,
}) async {
  final docUser =
      FirebaseFirestore.instance.collection('user-details').doc('my-id');

  int? personId = int.tryParse(docUser.id);

  final user = Datum(
    id: id,
    email: email,
    firstName: firstName,
    lastName: lastName,
    avatar: avatar,
  );
  final json = user.toJson();
  await docUser.set(json);
}

Future updateUser({
  int? id,
  String? email,
  String? firstName,
  String? lastName,
  String? avatar,
}) async {
  final docUser =
      FirebaseFirestore.instance.collection('user-details').doc('my-id');

  docUser.update({
    'firstName': 'Shivam',
    'first_name': 'Rohit',
  });
}

Future deleteUser() async {
  final docUser =
      FirebaseFirestore.instance.collection('user-details').doc('my-id');
  docUser.delete();
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2), // Set the duration
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Perform some action when the user clicks on the action button
        },
      ),
    ),
  );
}
