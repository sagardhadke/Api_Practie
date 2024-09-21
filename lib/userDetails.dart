import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MyUserDetails extends StatefulWidget {
  const MyUserDetails({super.key});
  @override
  State<MyUserDetails> createState() => _MyUserDetailsState();
}

class _MyUserDetailsState extends State<MyUserDetails> {
  Map<String, dynamic>? userResponse;
  void getUserDetails() async {
    var person =
        await http.get(Uri.parse("https://random-data-api.com/api/v2/users"));

    if (person.statusCode == 200) {
      var getUserDetailsApi = jsonDecode(person.body);
      userResponse = getUserDetailsApi;
      setState(() {});
      print(userResponse);
    } else {
      print("something went wrong");
    }
  }

  @override
  void initState() {
    getUserDetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String firstName = userResponse?["first_name"] ?? 'First Name';
    String lastName = userResponse?["last_name"] ?? 'Last Name';
    String fullName = firstName + " " + lastName;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "API User Info",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userResponse == null
                  ? CircularProgressIndicator()
                  : Center(
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(125)),
                          child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(userResponse!["avatar"]))),
                    ),
              userResponse == null
                  ? CircularProgressIndicator()
                  : Text(
                      fullName,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
              userResponse == null
                  ? CircularProgressIndicator()
                  : Text(userResponse!["username"],
                      style: GoogleFonts.roboto(
                          textStyle:
                              TextStyle(fontSize: 18, color: Colors.grey)))
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Icon(Icons.phone),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mobile",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      userResponse == null
                          ? CircularProgressIndicator()
                          : Text(
                              userResponse!["phone_number"],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(Icons.email_outlined),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      userResponse == null
                          ? CircularProgressIndicator()
                          : Text(
                              userResponse!["email"],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                Icon(Icons.date_range),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date of Birth",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      userResponse == null
                          ? CircularProgressIndicator()
                          : Text(
                              userResponse!["date_of_birth"],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    //here is my API code
                    setState(() {});
                    getUserDetails();
                  },
                  child: Text(
                    "Fetch Data",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15)),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
