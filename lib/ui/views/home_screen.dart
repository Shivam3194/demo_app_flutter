import 'package:demo_app_flutter/ui/views/single_user_page.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/home_bloc/home_state.dart';
import 'full_image_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenLoadedState state;
  const HomeScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
          "USERS",
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
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: ListView.builder(
            itemCount: state.fieldData!.data!.length,
            itemBuilder: (context, index) {
              final item = state.fieldData!.data![index];
              final firstName = item.firstName ?? "";
              final lastName = item.lastName ?? "";
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingleUserPage(
                                imageurl: item.avatar,
                              ),
                            ));
                      },
                      child: Card(
                        elevation: 3,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: height * .40,
                          height: width * .22,
                          child: ListTile(
                            leading: InkWell(
                              onTap: () {
                                _showCircularImageDialog(
                                    context, item.avatar ?? "");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: item.avatar ?? "",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      child: const Center(
                                        child: SpinKitCircle(
                                          size: 50,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              '$firstName $lastName',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.pink,
                              ),
                            ),
                            subtitle: Text(
                              item.email ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void _showCircularImageDialog(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              child: const Center(
                child: SpinKitCircle(
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
          ),
        ),
      );
    },
  );
}
