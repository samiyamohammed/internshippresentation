// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/BottomNavigationBloc.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/models/bannermodel.dart';
import 'package:real_estate_marketplace/models/demo_users.dart';
import 'package:real_estate_marketplace/pages/side_bar_menu.dart';
import '../../widgets/bottom_navigation.dart';
import '../../models/properties_list_model.dart';
import '../../widgets/property_card.dart';
import '../../models/featured_property_model.dart';
import '../../widgets/featured_property_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final BannerImage mockHomeBanner = BannerImage(
    imageUrl: 'assets/images/banner_image.png', // Mock data until API is ready
  );

  final Map<String, bool> selectedFilters = {
    'Commercial': false,
    'Apartment': false,
    'Villa': false,
    'Land': false,
    'Condo': false,
  };

  List<Property> filteredProperties = properties;
  List<FeaturedProperty> filteredFeaturedProperties = featuredPropertyList;
// Simulate logged-in user's email (This will come from actual authentication)
  String loggedInEmail = 'myname1996@gmail.com';
  late Users loggedInUser;
  @override
  void initState() {
    super.initState();
    // Fetch logged-in user from the model
    loggedInUser = getLoggedInUser(loggedInEmail);
    applyFilters();
  }

  void applyFilters() {
    setState(() {
      // Filter regular properties
      filteredProperties = properties.where((property) {
        if (selectedFilters.values.every((isSelected) => !isSelected)) {
          return true;
        }
        return selectedFilters.entries.any((filter) =>
            filter.value &&
            property.type.toLowerCase() == filter.key.toLowerCase());
      }).toList();

      // Filter featured properties
      filteredFeaturedProperties = featuredPropertyList.where((property) {
        if (selectedFilters.values.every((isSelected) => !isSelected)) {
          return true;
        }
        return selectedFilters.entries.any((filter) =>
            filter.value &&
            property.type.toLowerCase() == filter.key.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context.push('/profile');
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: loggedInUser != null
                          ? AssetImage(loggedInUser.image)
                          : const AssetImage(
                              'assets/images/default_profile_icon.png'),
                      radius: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      loggedInUser != null ? loggedInUser.name : 'Guest',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          centerTitle: false,
        ),
        drawer: const CustomDrawer(),
        drawerScrimColor: Colors.transparent,
        drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.5,
        body: GestureDetector(
          onTap: () {
            if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
              Navigator.of(context).pop();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    mockHomeBanner.imageUrl,
                    width: 429,
                    height: 147,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black87,
                        width: 2.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.go('/search');
                            },
                            child: const Text(
                              'Search by location or address',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.map_outlined, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 32,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: selectedFilters.keys.map((label) {
                        return _buildFilterChip(
                          _getIconForLabel(label),
                          label,
                          selectedFilters[label]!,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Featured Properties Section
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Featured Properties',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 164,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredFeaturedProperties.length > 5
                        ? 6 // 5 properties + 1 for the "See All" button
                        : filteredFeaturedProperties.length +
                            1, // Show "See All" even if fewer than 5
                    itemBuilder: (context, index) {
                      if (index == filteredFeaturedProperties.length ||
                          index == 5) {
                        return GestureDetector(
                          onTap: () {
                            context.go('/featuredProperties');
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle,
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blueAccent,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      // Display the featured property cards
                      return Container(
                        width: 193,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FeaturedPropertyCard(
                          property: filteredFeaturedProperties[index],
                          showStatusTag: true,
                        ),
                      );
                    },
                  ),
                ),

                // For Rent Section
                // For Rent Section
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'For Rent',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredProperties
                                .where(
                                    (property) => property.status == 'For Rent')
                                .length >
                            5
                        ? 6 // 5 properties + 1 for the "See All" button
                        : filteredProperties
                                .where(
                                    (property) => property.status == 'For Rent')
                                .length +
                            1, // Show "See All" even if fewer than 5
                    itemBuilder: (context, index) {
                      final rentProperties = filteredProperties
                          .where((property) => property.status == 'For Rent')
                          .toList();
                      if (index == rentProperties.length || index == 5) {
                        return GestureDetector(
                          onTap: () {
                            context.go('/rentProperties');
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle,
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blueAccent,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      // Display the For Rent property cards
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: PropertyCard(
                          property: rentProperties[index],
                          showStatusTag: false,
                        ),
                      );
                    },
                  ),
                ),

                // For Sale Section
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'For Sale',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredProperties
                                .where(
                                    (property) => property.status == 'For Sale')
                                .length >
                            5
                        ? 6 // 5 properties + 1 for the "See All" button
                        : filteredProperties
                                .where(
                                    (property) => property.status == 'For Sale')
                                .length +
                            1, // Show "See All" even if fewer than 5
                    itemBuilder: (context, index) {
                      final saleProperties = filteredProperties
                          .where((property) => property.status == 'For Sale')
                          .toList();

                      // Check if this is the last item, which will be the "See All" button
                      if (index == saleProperties.length || index == 5) {
                        return GestureDetector(
                          onTap: () {
                            // Implement navigation to the page with all "For Sale" properties
                            context.go('/saleProperties');
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle,
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blueAccent,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      // Display the For Sale property cards
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: PropertyCard(
                          property: saleProperties[index],
                          showStatusTag: false,
                        ),
                      );
                    },
                  ),
                ),

                // For Investment Section
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'For Investment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredProperties
                                .where((property) =>
                                    property.status == 'For Investment')
                                .length >
                            5
                        ? 6 // 5 properties + 1 for the "See All" button
                        : filteredProperties
                                .where((property) =>
                                    property.status == 'For Investment')
                                .length +
                            1, // Show "See All" even if fewer than 5
                    itemBuilder: (context, index) {
                      final investmentProperties = filteredProperties
                          .where(
                              (property) => property.status == 'For Investment')
                          .toList();

                      if (index == investmentProperties.length || index == 5) {
                        return GestureDetector(
                          onTap: () {
                            context.go('/investmentProperties');
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle,
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blueAccent,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      // Display the For Investment property cards
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: PropertyCard(
                          property: investmentProperties[index],
                          showStatusTag: false,
                        ),
                      );
                    },
                  ),
                ),

// add property section
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 91, 53, 175),
                        width: 1.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Property Deserves the Spotlight",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Reach more buyers. Showcase your home. Free and easy.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Implement add property functionality
                          },
                          icon: const Icon(Icons.add,
                              color: Color.fromARGB(255, 238, 235, 235)),
                          label: const Text(
                            "Add Property",
                            style: TextStyle(
                                color: Color.fromARGB(255, 226, 223, 223)),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 91, 53, 175),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        //bottom navigation bar
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            int currentIndex = 0;
            if (state is BottomNavigationUpdated) {
              currentIndex = state.selectedIndex;
            }

            return BottomNavigation(
              currentIndex: currentIndex,
              onItemSelected: (index) {
                context.read<HomeBloc>().add(HomeIndexChanged(index));
                switch (index) {
                  case 0:
                    context.go('/home');
                    break;
                  case 1:
                    context.go('/favorite');
                    break;
                  case 2:
                    context.go('/chat');
                    break;
                  case 3:
                    context.go('/notifications');
                    break;
                  case 4:
                    context.go('/profile');
                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }

  // Filter chip builder
  Widget _buildFilterChip(IconData icon, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FilterChip(
        avatar: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black54,
          size: 16,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
        selected: isSelected,
        selectedColor: const Color.fromARGB(255, 130, 63, 185),
        onSelected: (bool selected) {
          setState(() {
            selectedFilters[label] = selected;
          });
          applyFilters();
        },
      ),
    );
  }

  IconData _getIconForLabel(String label) {
    switch (label) {
      case 'Commercial':
        return Icons.business;
      case 'Apartment':
        return Icons.apartment;
      case 'Villa':
        return Icons.villa;
      case 'Land':
        return Icons.landscape;
      case 'Condo':
        return Icons.home_work;
      default:
        return Icons.home;
    }
  }
}
