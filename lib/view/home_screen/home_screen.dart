import 'package:appscrip_task/helper/colors.dart';
import 'package:appscrip_task/constants/sizedboxes.dart';
import 'package:appscrip_task/view/details_screen/details_screen.dart';
import 'package:appscrip_task/controller/user_provider.dart';
import 'package:appscrip_task/widgets/list_shimmer_effect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        backgroundColor: cWhiteColor,
        title: const Text(
          'USERS',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: cPrimaryColor,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => userProvider.fetchUsers(), // refresh action to fetch users
        color: cPrimaryColor,
        child: Column(
          children: [
            cHeight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: userProvider.setSearchQuery, // updating search query
                controller: userProvider.searchController,
                style: const TextStyle(color: cBlackColor),
                cursorColor: cPrimaryColor,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      borderSide: BorderSide(
                        color: cBlackColor,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: cBlackColor,
                        )),
                    fillColor: cWhiteColor,
                    filled: true,
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: cGreyColor700,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 22,
                      color: cGreyColor700,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        userProvider.searchController.clear(); // clearing search input
                        userProvider.setSearchQuery(""); // resetting search query
                      },
                      icon: const Icon(CupertinoIcons.clear),
                      iconSize: 19,
                      color: cGreyColor700,
                    )),
              ),
            ),
            cHeight15,
            Consumer<UserProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return buildListShimmerEffect(); // display shimmer effect while loading
                } else if (provider.errorMessage != null) {
                  return Center(child: Text('Error: ${provider.errorMessage}')); // display error mesage
                } else if (provider.userList == null) {
                  return const Center(child: Text('No data available')); // display message if no data
                } else {
                 // filter user list based on search query
                  final userList = provider.userList!
                      .where((user) => user.name
                          .toLowerCase()
                          .contains(provider.searchQuery.toLowerCase()))
                      .toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        final user = userList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                city: user.city,
                                email: user.email,
                                lat: user.lat,
                                lng: user.lng,
                                name: user.name,
                                website: user.website,
                                username: user.username,
                                bs: user.bs,
                                catchPhrase: user.catchPhrase,
                                companyName: user.companyName,
                                phone: user.phone,
                                street: user.street,
                                suite: user.suite,
                                zipcode: user.zipcode,
                              ),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: cPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: cWhiteColor,
                                  child: Icon(
                                    Icons.person_2_rounded,
                                    color: cGreyColor,
                                    size: 30,
                                  ),
                                ),
                                title: Text(
                                  user.name,
                                  style: const TextStyle(color: cWhiteColor),
                                ),
                                subtitle: Text(
                                  user.email,
                                  style: const TextStyle(color: cWhiteColor),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
