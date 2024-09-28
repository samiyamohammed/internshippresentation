// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_bloc.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_event.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_state.dart';

class AddPropertyPagecom extends StatelessWidget {
  const AddPropertyPagecom({super.key});

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
                                    'For Commercial',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: [
                                      _buildPropertyTypeChip(
                                          context, state, 'Office Bd.'),
                                      _buildPropertyTypeChip(
                                          context, state, 'Retail Shop'),
                                      _buildPropertyTypeChip(
                                          context, state, 'Restaurant'),
                                      _buildPropertyTypeChip(
                                          context, state, 'Warehouse'),
                                      _buildPropertyTypeChip(
                                          context, state, 'Factory'),
                                      _buildPropertyTypeChip(
                                          context, state, 'Other'),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  TextField(
                                    onChanged: (value) {
                                      // handle "Other" type text field input if needed
                                    },
                                    decoration: InputDecoration(
                                      labelText:
                                          'Write here if you choose Other',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFF7F7F7),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 12.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          context.go('/addproperty');
                                        },
                                        child: const Text('Previous'),
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: const Color.fromARGB(
                                              255, 57, 115, 223),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 24),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Validate the user input
                                          if (state.property.type?.isNotEmpty ??
                                              false) {
                                            if (state.property.type ==
                                                    'Other' &&
                                                (state.otherAnswer?.isEmpty ??
                                                    true)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Please provide your answer for "Other".'),
                                                ),
                                              );
                                            } else {
                                              context.go('/addproperty3');
                                            }
                                          } else {
                                            // Show a SnackBar if no type is selected
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Please select a property type.'),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text('Next'),
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: const Color.fromARGB(
                                              255, 57, 115, 223),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 24),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(), // Ensures that the column expands
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

  Widget _buildPropertyTypeChip(
      BuildContext context, AddPropertyState state, String label) {
    bool isSelected = state.property.type == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        context.read<AddPropertyBloc>().add(AddPropertyTypeChanged(label));
      },
      selectedColor: const Color(0xFF5B35AF), // Purple when selected
      backgroundColor: Colors.grey[200], // Light grey when not selected
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
      showCheckmark: false,
    );
  }
}
