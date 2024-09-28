// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_bloc.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_event.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_state.dart';

class AddPropertyPage extends StatelessWidget {
  const AddPropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPropertyBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 107, 23, 124),
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
                                height: 120), // Add spacing below appBar
                            const Text(
                              'Add Property',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                                height: 40), // Spacing between title and form
                            Container(
                              width: 372,
                              padding: const EdgeInsets.all(16.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Full Information',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Name of the Property',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      context
                                          .read<AddPropertyBloc>()
                                          .add(AddPropertyNameChanged(value));
                                    },
                                    decoration: InputDecoration(
                                      labelText:
                                          'Type the name of the property',
                                      labelStyle: const TextStyle(
                                        color: Colors
                                            .grey, // Make the label text lighter
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(255, 247,
                                          247, 247), // Background color
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                          color: Colors.black, // Black border
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .black, // Black border when not focused
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .black, // Black border when focused
                                          width:
                                              1.5, // Thicker border when focused
                                        ),
                                      ),
                                      hintStyle: const TextStyle(
                                        color: Colors
                                            .grey, // Lighter color for hint text
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical:
                                            10.0, // Reduced vertical padding for a shorter box
                                        horizontal:
                                            12.0, // Adjust the horizontal padding
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Status',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 50,
                                    children: [
                                      ChoiceChip(
                                        label: const Text('For Sale'),
                                        selected:
                                            state.property.status == 'For Sale',
                                        onSelected: (selected) {
                                          context.read<AddPropertyBloc>().add(
                                              AddPropertyStatusChanged(
                                                  'For Sale'));
                                        },
                                        selectedColor: const Color.fromARGB(
                                            255, 91, 53, 175),
                                        backgroundColor: Colors.grey[200],
                                        labelStyle: TextStyle(
                                          color: state.property.status ==
                                                  'For Sale'
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        showCheckmark: false,
                                      ),
                                      ChoiceChip(
                                        label: const Text('For Rent'),
                                        selected:
                                            state.property.status == 'For Rent',
                                        onSelected: (selected) {
                                          context.read<AddPropertyBloc>().add(
                                              AddPropertyStatusChanged(
                                                  'For Rent'));
                                        },
                                        selectedColor: const Color.fromARGB(
                                            255, 91, 53, 175),
                                        backgroundColor: Colors.grey[200],
                                        labelStyle: TextStyle(
                                          color: state.property.status ==
                                                  'For Rent'
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        showCheckmark: false,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Type',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 50,
                                    children: [
                                      ChoiceChip(
                                        label: const Text('Residential'),
                                        selected: state.property.type ==
                                            'Residential',
                                        onSelected: (selected) {
                                          context.read<AddPropertyBloc>().add(
                                              AddPropertyTypeChanged(
                                                  'Residential'));
                                        },
                                        selectedColor: const Color.fromARGB(
                                            255, 91, 53, 175),
                                        backgroundColor: Colors.grey[200],
                                        labelStyle: TextStyle(
                                          color: state.property.type ==
                                                  'Residential'
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        showCheckmark: false,
                                      ),
                                      ChoiceChip(
                                        label: const Text('Commercial'),
                                        selected:
                                            state.property.type == 'Commercial',
                                        onSelected: (selected) {
                                          context.read<AddPropertyBloc>().add(
                                              AddPropertyTypeChanged(
                                                  'Commercial'));
                                        },
                                        selectedColor: const Color.fromARGB(
                                            255, 91, 53, 175),
                                        backgroundColor: Colors.grey[200],
                                        labelStyle: TextStyle(
                                          color: state.property.type ==
                                                  'Commercial'
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        showCheckmark: false,
                                      ),
                                      ChoiceChip(
                                        label: const Text('Lease'),
                                        selected:
                                            state.property.type == 'Lease',
                                        onSelected: (selected) {
                                          context.read<AddPropertyBloc>().add(
                                              AddPropertyTypeChanged('Lease'));
                                        },
                                        selectedColor: const Color.fromARGB(
                                            255, 91, 53, 175),
                                        backgroundColor: Colors.grey[200],
                                        labelStyle: TextStyle(
                                          color: state.property.type == 'Lease'
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        showCheckmark: false,
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
                                          // Previous button logic
                                        },
                                        child: const Text('Previous'),
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: const Color(
                                              0xFF4B6CB7), // Purple button color
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0, vertical: 12.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: (state.property.name
                                                        ?.isNotEmpty ??
                                                    false) &&
                                                (state.property.status
                                                        ?.isNotEmpty ??
                                                    false) &&
                                                (state.property.type
                                                        ?.isNotEmpty ??
                                                    false)
                                            ? () {
                                                if (state.property.type ==
                                                    'Commercial') {
                                                  context.go('/addpropertycom');
                                                } else if (state.property.type ==
                                                    'Residential') {
                                                  context
                                                      .go('/addpropertyres');
                                                } else if (state
                                                        .property.type ==
                                                    'Lease') {
                                                  context
                                                      .go('/addpropertylease');
                                                }
                                              }
                                            : () {
                                                // Show a message if validation fails
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Please complete all fields before proceeding.'),
                                                  ),
                                                );
                                              },
                                        child: const Text('Next'),
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: const Color(
                                              0xFF4B6CB7), // Purple button color
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0, vertical: 12.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
