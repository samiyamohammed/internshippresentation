// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_bloc.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_event.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_state.dart';
import 'package:image_picker/image_picker.dart'; // Add this import for image picking
import 'dart:io'; // Add this import to use File class

class AddPropertyPage10 extends StatefulWidget {
  const AddPropertyPage10({super.key});

  @override
  _AddPropertyPage10State createState() => _AddPropertyPage10State();
}

class _AddPropertyPage10State extends State<AddPropertyPage10> {
  final TextEditingController builtinController = TextEditingController();
  final TextEditingController numberofbalconyController =
      TextEditingController();

  File? _selectedImage; // Variable to store the selected image

  // Function to pick image from storage
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    builtinController.dispose();
    numberofbalconyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPropertyBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              context.go('/home');
            },
          ),
          titleSpacing: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AddPropertyBloc>(context)
                      .add(SaveAddPropertyDraft());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF4B6CB7),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                child: const Text(
                  'Save to Draft',
                  style: TextStyle(
                    color: Color(0xFF4B6CB7), // Purple text color
                  ),
                ),
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset:
            false, // Prevent keyboard from resizing the page
        body: BlocBuilder<AddPropertyBloc, AddPropertyState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 57, 115, 223),
                    Color.fromARGB(255, 91, 53, 175),
                  ], // Blue to Purple gradient
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                                height: 50), // Add spacing below appBar
                            const Text(
                              'Add Property',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                                height: 20), // Spacing between title and form
                            Expanded(
                              child: Center(
                                child: Container(
                                  width: 350,
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 20),
                                      Center(
                                        child: Container(
                                          width: 1000,
                                          height: 42,
                                          padding: const EdgeInsets.all(
                                              10), // Padding inside the box
                                          decoration: BoxDecoration(
                                            color: Colors.grey[
                                                200], // Background color of the box (optional)
                                            borderRadius: BorderRadius.circular(
                                                10), // Rounded corners
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255,
                                                  190,
                                                  187,
                                                  187), // Black border color
                                              // width: 2, // Border width
                                            ),
                                          ),

                                          child: const Text(
                                            'Media and Documentation',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),

                                          // Add Virtual Tour Section
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Add Virtual Tour',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              TextField(
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'View Virtual Tour Link',
                                                  labelStyle: const TextStyle(
                                                      color: Colors.grey),
                                                  filled: true,
                                                  fillColor: Colors.grey[200],
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),

                                          // Add Video Tour Section
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Add Video Tour',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.grey[200],
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Image and Play Button (Video Thumbnail)
                                                    GestureDetector(
                                                      onTap: () async {
                                                        // Open storage to choose a file
                                                        await _pickImage(); // Function that picks an image
                                                      },
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20), // Rounded corners for the image
                                                            child:
                                                                _selectedImage !=
                                                                        null
                                                                    ? Image
                                                                        .file(
                                                                        _selectedImage!,
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            200,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      )
                                                                    : Image
                                                                        .asset(
                                                                        'assets/images/Luxury_villa.png',
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            200,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .play_circle_fill,
                                                            color:
                                                                Colors.orange,
                                                            size: 50,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),

                                                    // Video Description
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Video Description',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            'Video Description',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              context.go('/addproperty9');
                                            },
                                            // ignore: sort_child_properties_last
                                            child: const Text('Previous'),
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 57, 115, 223),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 24),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              context.go('/addproperty11');
                                            },
                                            // ignore: sort_child_properties_last
                                            child: const Text('Next'),
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 57, 115, 223),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 24),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 40),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
