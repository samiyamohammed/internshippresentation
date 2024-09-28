// ignore_for_file: unused_import, sort_child_properties_last, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:real_estate_marketplace/bloc/BottomNavigationBloc.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/bloc/profile_bloc/profile_bloc.dart';
import 'package:real_estate_marketplace/bloc/profile_bloc/profile_event.dart';
import 'package:real_estate_marketplace/bloc/profile_bloc/profile_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_marketplace/models/demo_users.dart';
import 'package:real_estate_marketplace/widgets/bottom_navigation.dart';

// ignore: use_key_in_widget_constructors
class ProfilePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/home');
            },
          ),
          title: const Text('Profile'),
          actions: [
            TextButton(
              onPressed: () {
                // Handle save action
              },
              child: const Text(
                'SAVE',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'delete') {
                  _confirmdelete(context);
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Delete Profile'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              _nameController.text = state.name;
              _emailController.text = state.email;
              _phoneNumberController.text = state.phonenumber;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(state.image),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              color: Colors.grey,
                              onPressed: () {
                                _pickImageFromGallery(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 91, 53, 175),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 91, 53, 175),
                                ),
                                onPressed: () {
                                  // Handle edit action
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Full Name',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                //initialValue: state.name,
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Password',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                  initialValue: '••••••••••••',
                                  obscureText: true,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  onTap: () {
                                    _showPasswordDialog(context);
                                    _showPasswordDialog(context);
                                  }),
                              const SizedBox(height: 16),
                              const Text(
                                'Email',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                //initialValue: state.email,
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Phone Number',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              InternationalPhoneNumberInput(
                                initialValue: PhoneNumber(
                                  dialCode: '+251',
                                  phoneNumber: state.phonenumber,
                                ),
                                onInputChanged: (PhoneNumber number) {
                                  _phoneNumberController.text =
                                      number.phoneNumber ?? '';
                                },
                                selectorConfig: const SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                  showFlags: true,
                                ),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                textFieldController: TextEditingController()
                                  ..text = state.phonenumber,
                                formatInput: true,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: true,
                                ),
                                inputDecoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                inputBorder: const OutlineInputBorder(),
                                onSaved: (PhoneNumber number) {
                                  // Handle phone number save
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ListTile(
                      title: const Text('Recently Viewed Properties'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to recently viewed properties page
                      },
                    ),
                    ListTile(
                      title: const Text('Need Help?'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to help page
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: () {
                        _confirmLogout(context);
                      },
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: const Text(
                        'Log Out',
                        style: TextStyle(color: Colors.red),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                builder: (context, state) {
          int currentIndex = 4;
          if (state is BottomNavigationUpdated) {
            currentIndex = state.selectedIndex;
          }

          return BottomNavigation(
            currentIndex: currentIndex,
            onItemSelected: (index) {
              context.read<ProfileBloc>().add(UpdateProfilePage(index: index));
              switch (index) {
                case 0:
                  context.go('/home'); // Navigate to Home Page
                  break;
                case 1:
                  context.go('/favorite'); // Navigate to Favorite Page
                  break;
                case 2:
                  context.go('/chat'); // Navigate to Chat Page
                  break;
                case 3:
                  context.go('/notifications'); // Navigate to Notification Page
                  break;
                case 4:
                  context.go('/profile'); // Stay in Profile Page
                  break;
              }
            },
          );
        }));
  }

  void _confirmdelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cancel,
                size: 48,
                color: Color.fromARGB(255, 243, 33, 33),
              ),
              SizedBox(height: 16),
              Text(
                'Are you sure you want to delete your account/profile?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                  ),
                ),
                TextButton(
                  child: const Text('Confirm'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _confirmDeleteProfile(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteProfile(BuildContext context) {
    //final profileBloc = BlocProvider.of<ProfileBloc>(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cancel_outlined,
                size: 48,
                color: Colors.blue,
              ),
              SizedBox(height: 16),
              Text(
                'Your account will be deactivated immediately.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'You will have 3 weeks to reactivate your account. After 3 weeks, your account and all associated data will be permanently deleted.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                  ),
                ),
                TextButton(
                  child: const Text('Confirm'),
                  onPressed: () {
                    // Tell the backend to deactivate the profile
                    Navigator.of(context).pop();
                    //profileBloc.add(DeactivateAccount());
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

void _confirmLogout(BuildContext context) {
  final profileBloc = BlocProvider.of<ProfileBloc>(context);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.logout,
              size: 48,
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            Text(
              'Are you sure you want to log out from your account?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                ),
              ),
              TextButton(
                child: const Text('Confirm'),
                onPressed: () {
                  Navigator.of(context).pop();
                  profileBloc.add(LogOutUser());
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void _showPasswordDialog(BuildContext context) {
  final TextEditingController passwordController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Current Password'),
        content: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Current Password'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              String enteredPassword = passwordController.text;
              _validatePassword(context, enteredPassword);
            },
            child: const Text('Submit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}

void _showNewPasswordDialog(BuildContext context) {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter New Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'New Password'),
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Confirm Password'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              final newPassword = _newPasswordController.text;
              final confirmPassword = _confirmPasswordController.text;

              _changePassword(context, newPassword, confirmPassword);
              Navigator.of(context).pop();
            },
            child: const Text('Submit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}

void _validatePassword(BuildContext context, String password) {
  bool isValid = _checkPassword(password);

  if (isValid) {
    _showNewPasswordDialog(context);
  } else {
    print('Invalid password');
  }
}

// Dummy validation function
bool _checkPassword(String password) {
  // to be replaced later on by the actual code of password checking
  return password == "1234567890";
}

void _changePassword(
    BuildContext context, String newPassword, String confirmPassword) {
  if (newPassword == confirmPassword && newPassword.isNotEmpty) {
    print('Password changed successfully!');
    Navigator.of(context).pop();
  } else {
    print('Passwords do not match or are empty!');
  }
}

void _pickImageFromGallery(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    print('Picked image path: ${pickedFile.path}');
    //IMAGE SETTING AS PROFILE CODE
  } else {
    print('No image selected.');
  }
}
