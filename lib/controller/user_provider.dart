import 'package:appscrip_task/model/user_model.dart';
import 'package:appscrip_task/services/user_services.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // list of users
  List<UserModel>? _userList;
  List<UserModel>? get userList => _userList;
  
  UserServices userListServices = UserServices();
  TextEditingController searchController = TextEditingController();

  UserProvider() {
    fetchUsers(); // fetch users when the provider is initialized
  }

  // fetch users from api
  Future<void> fetchUsers() async {
    _isLoading = true; // set loading state to true
    _errorMessage = null; // reset error message
    notifyListeners();

    try {
      _userList = await userListServices.fetchUsers(); // fetch users and set the user list
    } catch (e) {
      _errorMessage = e.toString(); // set the error message if an error occurs
    } finally {
      _isLoading = false; // set loading state to false
      notifyListeners();
    }
  }

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }
}
