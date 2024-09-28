import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_bloc.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_event.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_state.dart';

class AddPropertyPage4 extends StatelessWidget {
  AddPropertyPage4({super.key});
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
                                        'Number of Rooms',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      // First row: Country and Region
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                //width:
                                                //    120, // Increase width to accommodate number and arrows side by side
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  'Living Rooms',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 30),
                                              Container(
                                                width:
                                                    120, // Increase width to accommodate number and arrows side by side
                                                height:
                                                    50, // Adjust height as needed
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          '${state.property.livingRooms}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                20, // Adjust size as needed
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1, // Divider width
                                                      height: double.infinity,
                                                      color: Colors
                                                          .grey, // Divider color
                                                    ),
                                                    // ignore: sized_box_for_whitespace
                                                    Container(
                                                      width:
                                                          40, // Set width for the arrows container
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      AddPropertyBloc>()
                                                                  .add(
                                                                      IncrementLivingRooms());
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              size:
                                                                  24, // Adjust size as needed
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              if (state.property
                                                                      .livingRooms >
                                                                  0) {
                                                                context
                                                                    .read<
                                                                        AddPropertyBloc>()
                                                                    .add(
                                                                        DecrementLivingRooms());
                                                              }
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              size:
                                                                  24, // Adjust size as needed
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          height:
                                              25), // Reduced gap between rows
                                      // Second row: Woreda and City
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    135, // Increase width to accommodate number and arrows side by side
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  'Bedrooms',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 30),
                                              Container(
                                                width: 120,
                                                height:
                                                    50, // Adjust height as needed
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          '${state.property.bedrooms}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                20, // Adjust size as needed
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1, // Divider width
                                                      height: double.infinity,
                                                      color: Colors
                                                          .grey, // Divider color
                                                    ),
                                                    // ignore: sized_box_for_whitespace
                                                    Container(
                                                      width:
                                                          40, // Set width for the arrows container
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      AddPropertyBloc>()
                                                                  .add(
                                                                      IncrementBedRooms());
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              size:
                                                                  24, // Adjust size as needed
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              if (state.property
                                                                      .bedrooms >
                                                                  0) {
                                                                context
                                                                    .read<
                                                                        AddPropertyBloc>()
                                                                    .add(
                                                                        DecrementBedRooms());
                                                              }
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              size:
                                                                  24, // Adjust size as needed
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          height:
                                              25), // Reduced gap between rows
                                      // Third row: Subcity and Address
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    135, // Increase width to accommodate number and arrows side by side
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  'Bathrooms',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 30),
                                              Container(
                                                width: 120,
                                                height:
                                                    50, // Adjust height as needed
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          '${state.property.bathrooms}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                20, // Adjust size as needed
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1, // Divider width
                                                      height: double.infinity,
                                                      color: Colors
                                                          .grey, // Divider color
                                                    ),
                                                    // ignore: sized_box_for_whitespace
                                                    Container(
                                                      width:
                                                          40, // Set width for the arrows container
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      AddPropertyBloc>()
                                                                  .add(
                                                                      IncrementBathRooms());
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              size:
                                                                  24, // Adjust size as needed
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              if (state.property
                                                                      .bathrooms >
                                                                  0) {
                                                                context
                                                                    .read<
                                                                        AddPropertyBloc>()
                                                                    .add(
                                                                        DecrementBathRooms());
                                                              }
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              size:
                                                                  24, // Adjust size as needed
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          height:
                                              25), // Reduced gap between rows
                                      // Google Maps Link
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    135, // Increase width to accommodate number and arrows side by side
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  'Kitchens',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 30),
                                              Container(
                                                width: 120,
                                                height:
                                                    50, // Adjust height as needed
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          '${state.property.kitchens}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                20, // Adjust size as needed
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1, // Divider width
                                                      height: double.infinity,
                                                      color: Colors
                                                          .grey, // Divider color
                                                    ),
                                                    // ignore: sized_box_for_whitespace
                                                    Container(
                                                      width:
                                                          40, // Set width for the arrows container
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      AddPropertyBloc>()
                                                                  .add(
                                                                      IncrementKitchen());
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              size:
                                                                  24, // Adjust size as needed
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              if (state.property
                                                                      .kitchens >
                                                                  0) {
                                                                context
                                                                    .read<
                                                                        AddPropertyBloc>()
                                                                    .add(
                                                                        DecrementKitchen());
                                                              }
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              size:
                                                                  24, // Adjust size as needed
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Other',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: 318,
                                            height:
                                                80, // Increased height for multiline text input
                                            child: TextField(
                                              //controller: mapsLinkController,
                                              maxLines:
                                                  null, // Allows unlimited lines
                                              keyboardType: TextInputType
                                                  .multiline, // Enables multiline keyboard
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Write about other rooms if there are any.',
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

                                      //const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Built in',
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
                                              keyboardType: TextInputType
                                                  .number, // Set the keyboard type to number
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly, // Allows only digits
                                              ],
                                              decoration: InputDecoration(
                                                labelText:
                                                    '2004', // Corrected the label text
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
                                            'Number of Balconies',
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
                                              keyboardType: TextInputType
                                                  .number, // Set the keyboard type to number
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly, // Allows only digits
                                              ],
                                              decoration: InputDecoration(
                                                labelText:
                                                    '2', // Corrected the label text
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

                                      const SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              context.go('/addproperty3');
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
                                          ElevatedButton(
                                            onPressed: () {
                                              // Check if all required fields are filled
                                              if (numberofbalconyController
                                                      .text.isNotEmpty &&
                                                  builtinController
                                                      .text.isNotEmpty) {
                                                context.go('/addproperty5');
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Please fill in all required fields.'),
                                                  ),
                                                );
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  const Color(0xFF4B6CB7),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24.0,
                                                      vertical: 12.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                            ),
                                            child: const Text('Next'),
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
