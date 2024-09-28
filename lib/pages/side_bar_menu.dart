import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200, // Adjust height as needed
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/city_skyline.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  icon: const Icon(Icons.wb_sunny, color: Colors.white),
                  onPressed: () {
                    // Implement day/night toggle functionality
                  },
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement Sign In functionality
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: const BorderSide(color: Colors.orange),
                    ),
                  ),
                  child: const Text('Sign In'),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 10),
                _buildDrawerItem(Icons.settings, "Settings", () {
                  context.push('/settings');
                }),
                _buildDrawerItem(Icons.add_box, "Add Property", () {
                  context.push('/addproperty');
                }),
                _buildDrawerItem(Icons.help_outline, "FAQs", () {
                  context.push('/faq');
                }),
                _buildDrawerItem(Icons.info_outline, "About Us", () {
                  context.push('/aboutus');
                }),
                _buildDrawerItem(Icons.share, "Share App", () {
                  // Implement sharing functionality here
                }),
                _buildDrawerItem(Icons.star_rate, "Rate App", () {
                  // Implement rate app functionality here
                }),
                _buildDrawerItem(Icons.support_agent, "Help and Support", () {
                  context.push('/help_support');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
      title: Text(
        title,
        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      onTap: onTap,
    );
  }
}
