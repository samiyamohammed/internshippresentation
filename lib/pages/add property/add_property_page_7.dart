import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_bloc.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_event.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_state.dart';

class AddPropertyPage7 extends StatelessWidget {
  AddPropertyPage7({super.key});
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
                                        'For Furnished or semi-furnished',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const SizedBox(height: 10),
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
                                            'Cooling Type',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ChoiceChip(
                                                label: const Text('AC'),
                                                selected: state
                                                    .property.coolingtype
                                                    .contains('AC'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertycoolingtypeChanged(
                                                              'AC'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state
                                                          .property.coolingtype
                                                          .contains('AC')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                              ChoiceChip(
                                                label: const Text('Central'),
                                                selected: state
                                                    .property.coolingtype
                                                    .contains('Central'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertycoolingtypeChanged(
                                                              'Central'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state
                                                          .property.coolingtype
                                                          .contains('Central')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
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
                                            'Water Supply',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ChoiceChip(
                                                label: const Text('Municipal'),
                                                selected: state
                                                    .property.watersupply
                                                    .contains('Municipal'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertywatersupplyChanged(
                                                              'Municipal'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state
                                                          .property.watersupply
                                                          .contains('Municipal')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                              ChoiceChip(
                                                label: const Text('Well'),
                                                selected: state
                                                    .property.watersupply
                                                    .contains('Well'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertywatersupplyChanged(
                                                              'Well'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state
                                                          .property.watersupply
                                                          .contains('Well')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
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
                                            'Electricity Supply',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ChoiceChip(
                                                label:
                                                    const Text('Single Phase '),
                                                selected: state
                                                    .property.electricitysupply
                                                    .contains('Single Phase '),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertyelectricitysupplyChanged(
                                                              'Single Phase '));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state.property
                                                          .electricitysupply
                                                          .contains(
                                                              'Single Phase ')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                              ChoiceChip(
                                                label:
                                                    const Text(' Three Phase'),
                                                selected: state
                                                    .property.electricitysupply
                                                    .contains(' Three Phase'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertyelectricitysupplyChanged(
                                                              ' Three Phase'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state.property
                                                          .electricitysupply
                                                          .contains(
                                                              ' Three Phase')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
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
                                              context.go('/addproperty6');
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
                                              // if (numberofbalconyController
                                              //         .text.isNotEmpty &&
                                              //     builtinController
                                              //         .text.isNotEmpty) {
                                              context.go('/addproperty8');
                                              // } else {
                                              //   ScaffoldMessenger.of(context)
                                              //       .showSnackBar(
                                              //     const SnackBar(
                                              //       content: Text(
                                              //           'Please fill in all required fields.'),
                                              //     ),
                                              //   );
                                              // }
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
