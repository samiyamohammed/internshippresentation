import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_bloc.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_event.dart';
import 'package:real_estate_marketplace/bloc/property_bloc/add_property_state.dart';

class AddPropertyPage6 extends StatelessWidget {
  AddPropertyPage6({super.key});
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
                                            'Kitchen Appliances',
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
                                                label: const Text('Stove'),
                                                selected: state
                                                    .property.kitchenappliances
                                                    .contains('Stove'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertyKitchenappliancesChanged(
                                                              'Stove'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state.property
                                                          .kitchenappliances
                                                          .contains('Stove')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                              ChoiceChip(
                                                label:
                                                    const Text('Refrigerator'),
                                                selected: state
                                                    .property.kitchenappliances
                                                    .contains('Refrigerator'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertyKitchenappliancesChanged(
                                                              'Refrigerator'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state.property
                                                          .kitchenappliances
                                                          .contains(
                                                              'Refrigerator')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ChoiceChip(
                                                label: const Text('Microwave'),
                                                selected: state
                                                    .property.kitchenappliances
                                                    .contains('Microwave'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertyKitchenappliancesChanged(
                                                              'Microwave'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state.property
                                                          .kitchenappliances
                                                          .contains('Microwave')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                              ChoiceChip(
                                                label: const Text('Dishwasher'),
                                                selected: state
                                                    .property.kitchenappliances
                                                    .contains('Dishwasher'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertyKitchenappliancesChanged(
                                                              'Dishwasher'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state.property
                                                          .kitchenappliances
                                                          .contains(
                                                              'Dishwasher')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                                            'laundry Facilities',
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
                                                label: const Text('Washer'),
                                                selected: state
                                                    .property.laundryfacilities
                                                    .contains('Washer'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertylaundryfacilitiesChanged(
                                                              'Washer'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state.property
                                                          .laundryfacilities
                                                          .contains('Washer')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                              ChoiceChip(
                                                label:
                                                    const Text('Laundry Room'),
                                                selected: state
                                                    .property.laundryfacilities
                                                    .contains('Laundry Room'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertylaundryfacilitiesChanged(
                                                              'Laundry Room'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state.property
                                                          .laundryfacilities
                                                          .contains(
                                                              'Laundry Room')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ChoiceChip(
                                                label: const Text('Dryer'),
                                                selected: state
                                                    .property.laundryfacilities
                                                    .contains('Dryer'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertylaundryfacilitiesChanged(
                                                              'Dryer'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state.property
                                                          .laundryfacilities
                                                          .contains('Dryer')
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
                                            'Heating Type',
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
                                                label: const Text('Gas'),
                                                selected: state
                                                    .property.heatingtype
                                                    .contains('Gas'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertyheatingtypeChanged(
                                                              'Gas'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state
                                                          .property.heatingtype
                                                          .contains('Gas')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                              ChoiceChip(
                                                label: const Text('Electric'),
                                                selected: state
                                                    .property.heatingtype
                                                    .contains('Electric'),
                                                onSelected: (selected) {
                                                  context
                                                      .read<AddPropertyBloc>()
                                                      .add(
                                                          AddPropertyheatingtypeChanged(
                                                              'Electric'));
                                                },
                                                selectedColor:
                                                    const Color.fromARGB(
                                                        255, 91, 53, 175),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                labelStyle: TextStyle(
                                                  color: state
                                                          .property.heatingtype
                                                          .contains('Electric')
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                showCheckmark: false,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                                      const SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              context.go('/addproperty5');
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
                                              context.go('/addproperty7');
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
