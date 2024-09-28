import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_bloc.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_event.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_state.dart';

class AddPropertyPage5 extends StatelessWidget {
  AddPropertyPage5({super.key});
  final TextEditingController builtinController = TextEditingController();
  final TextEditingController numberofbalconyController =
      TextEditingController();

  void dispose() {
    // Clean up the controllers when the widget is disposed
    builtinController.dispose();
    numberofbalconyController.dispose();
    //super.dispose();
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
                                height: 100), // Add spacing below appBar
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
                                      const Text(
                                        'Price Information',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Average Price per Square meter (For Sale)',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: 318,
                                            height: 35,
                                            child: TextField(
                                              controller: builtinController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    '1205 Birr/msq', // Corrected the label text
                                                labelStyle: const TextStyle(
                                                    color: Colors.grey),
                                                filled: true,
                                                fillColor: Colors.grey[200],
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Selling Price ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: 318,
                                            height: 35,
                                            child: TextField(
                                              controller:
                                                  numberofbalconyController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    '3,377,000 Birr', // Corrected the label text
                                                labelStyle: const TextStyle(
                                                    color: Colors.grey),
                                                filled: true,
                                                fillColor: Colors.grey[200],
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Buttons Row
                                      const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Computing price',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: 318,
                                            height: 35,
                                            child: TextField(
                                              controller:
                                                  numberofbalconyController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    '3,377,000 Birr', // Corrected the label text
                                                labelStyle: const TextStyle(
                                                    color: Colors.grey),
                                                filled: true,
                                                fillColor: Colors.grey[200],
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Monthly Rent (if applicable)',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: 318,
                                            height: 35,
                                            child: TextField(
                                              controller:
                                                  numberofbalconyController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    '20,000 Birr/ Month', // Corrected the label text
                                                labelStyle: const TextStyle(
                                                    color: Colors.grey),
                                                filled: true,
                                                fillColor: Colors.grey[200],
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Features & Amenities',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Wrap(
                                        spacing: 50,
                                        children: [
                                          ChoiceChip(
                                            label:
                                                const Text('Fully Furnished'),
                                            selected:
                                                state.property.amenities ==
                                                    'Fully Furnished',
                                            onSelected: (selected) {
                                              context.read<AddPropertyBloc>().add(
                                                  AddPropertyAmenitiesChanged(
                                                      'Fully Furnished'));
                                            },
                                            selectedColor: const Color.fromARGB(
                                                255, 91, 53, 175),
                                            backgroundColor: Colors.grey[200],
                                            labelStyle: TextStyle(
                                              color: state.property.amenities ==
                                                      'Fully Furnished'
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                            showCheckmark: false,
                                          ),
                                          ChoiceChip(
                                            label: const Text('Semi-Furnished'),
                                            selected:
                                                state.property.amenities ==
                                                    'Semi-Furnished',
                                            onSelected: (selected) {
                                              context.read<AddPropertyBloc>().add(
                                                  AddPropertyAmenitiesChanged(
                                                      'Semi-Furnished'));
                                            },
                                            selectedColor: const Color.fromARGB(
                                                255, 91, 53, 175),
                                            backgroundColor: Colors.grey[200],
                                            labelStyle: TextStyle(
                                              color: state.property.amenities ==
                                                      'Semi-Furnished'
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                            showCheckmark: false,
                                          ),
                                          ChoiceChip(
                                            label: const Text('UnFurnished'),
                                            selected:
                                                state.property.amenities ==
                                                    'UnFurnished',
                                            onSelected: (selected) {
                                              context.read<AddPropertyBloc>().add(
                                                  AddPropertyAmenitiesChanged(
                                                      'UnFurnished'));
                                            },
                                            selectedColor: const Color.fromARGB(
                                                255, 91, 53, 175),
                                            backgroundColor: Colors.grey[200],
                                            labelStyle: TextStyle(
                                              color: state.property.amenities ==
                                                      'UnFurnished'
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
                                              context.go('/addproperty4');
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
                                          // ElevatedButton(
                                          //   onPressed: () {
                                          //     // Check if all required fields are filled
                                          //     if (numberofbalconyController
                                          //             .text.isNotEmpty &&
                                          //         builtinController
                                          //             .text.isNotEmpty) {
                                          //       context.go('/addproperty5');
                                          //     } else {
                                          //       ScaffoldMessenger.of(context)
                                          //           .showSnackBar(
                                          //         const SnackBar(
                                          //           content: Text(
                                          //               'Please fill in all required fields.'),
                                          //         ),
                                          //       );
                                          //     }
                                          //   },
                                          //   style: ElevatedButton.styleFrom(
                                          //     foregroundColor: Colors.white,
                                          //     backgroundColor:
                                          //         const Color(0xFF4B6CB7),
                                          //     padding:
                                          //         const EdgeInsets.symmetric(
                                          //             horizontal: 24.0,
                                          //             vertical: 12.0),
                                          //     shape: RoundedRectangleBorder(
                                          //       borderRadius:
                                          //           BorderRadius.circular(40.0),
                                          //     ),
                                          //   ),
                                          //   child: const Text('Next'),
                                          // ),
                                          ElevatedButton(
                                            onPressed: (state.property.amenities
                                                        ?.isNotEmpty ??
                                                    false)
                                                ? () {
                                                    if (state.property
                                                            .amenities ==
                                                        'Fully Furnished') {
                                                      context
                                                          .go('/addproperty6');
                                                    } else if (state.property
                                                            .amenities ==
                                                        'Semi-Furnished') {
                                                      context
                                                          .go('/addproperty6');
                                                    } else if (state
                                                            .property.type ==
                                                        'UnFurnished') {
                                                      context
                                                          .go('/addproperty9');
                                                    }
                                                  }
                                                : () {
                                                    // Show a message if validation fails
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                            'Please complete all fields before proceeding.'),
                                                      ),
                                                    );
                                                  },
                                            // ignore: sort_child_properties_last
                                            child: const Text('Next'),
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor: const Color(
                                                  0xFF4B6CB7), // Purple button color
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24.0,
                                                      vertical: 12.0),
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
                              ),
                            ),
                            const SizedBox(height: 350), // Add bottom spacing
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
