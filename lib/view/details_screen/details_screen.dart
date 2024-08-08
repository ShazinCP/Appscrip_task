import 'package:appscrip_task/controller/user_provider.dart';
import 'package:appscrip_task/helper/colors.dart';
import 'package:appscrip_task/constants/sizedboxes.dart';
import 'package:appscrip_task/view/details_screen/widgets/detail_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  String name;
  String username;
  String email;
  String street;
  String suite;
  String city;
  String zipcode;

  String lat;
  String lng;
  String phone;
  String website;
  String companyName;
  String catchPhrase;
  String bs;

  DetailsScreen({
    super.key,
    required this.city,
    required this.email,
    required this.lat,
    required this.lng,
    required this.name,
    required this.website,
    required this.username,
    required this.bs,
    required this.catchPhrase,
    required this.companyName,
    required this.phone,
    required this.street,
    required this.suite,
    required this.zipcode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DETAILS",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: cPrimaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<UserProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    cHeight10,
                    const CircleAvatar(
                      backgroundColor: cPrimaryColor,
                      radius: 65,
                      child: Icon(
                        Icons.account_circle,
                        size: 75,
                        color: cWhiteColor,
                      ),
                    ),
                    cHeight30,
                    DetailTile(keyValue: 'Name:', content: name),
                    cHeight10,
                    DetailTile(keyValue: 'Username:', content: username),
                    cHeight10,
                    DetailTile(keyValue: 'Email:', content: email),
                    cHeight10,
                    DetailTile(keyValue: 'Street:', content: street),
                    cHeight10,
                    DetailTile(keyValue: 'Suite:', content: suite),
                    cHeight10,
                    DetailTile(keyValue: 'City:', content: city),
                    cHeight10,
                    DetailTile(keyValue: 'Zipcode:', content: zipcode),
                    cHeight10,
                    DetailTile(keyValue: 'Lat:', content: lat),
                    cHeight10,
                    DetailTile(keyValue: 'Lng:', content: lng),
                    cHeight10,
                    DetailTile(keyValue: 'Phone:', content: phone),
                    cHeight10,
                    DetailTile(keyValue: 'Website:', content: website),
                    cHeight10,
                    DetailTile(keyValue: 'Company name:', content: companyName),
                    cHeight10,
                    DetailTile(keyValue: 'Cp:', content: catchPhrase),
                    cHeight10,
                    DetailTile(keyValue: 'Bs:', content: bs),
                    cHeight10,
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
