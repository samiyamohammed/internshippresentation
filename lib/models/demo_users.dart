class Users {
  final String name;
  late final String password;
  final String email;
  final String image;
  final String status;
  final String phonenumber;
  final String bio;

  Users({
    required this.name,
    required this.password,
    required this.email,
    required this.image,
    required this.status,
    required this.phonenumber,
    required this.bio,
  });
}

List<Users> demousers = [
  Users(
    name: 'User 1',
    password: 'abc123@dot',
    email: 'myname2001@gmail.com',
    status: 'User',
    image: 'assets/images/profile_icon.png',
    phonenumber: '1234567890',
    bio: '',
  ),
  Users(
    name: 'User 2',
    password: 'def456@dot',
    email: 'myname1996@gmail.com',
    status: 'User',
    image: 'assets/images/profile_icon.png',
    phonenumber: '0987654321',
    bio: '',
  ),
  Users(
    name: 'User 3',
    password: 'ghi789@dot',
    email: 'myname1800@gmail.com',
    status: 'User',
    image: 'assets/images/profile_icon.png',
    phonenumber: '##########',
    bio: '',
  ),
  Users(
    name: 'Agent 1',
    password: 'agenty123!',
    email: 'agent101@gmail.com',
    status: 'Agent',
    image: 'assets/images/profile_icon.png',
    phonenumber: '94745373930',
    bio: 'Agent bio',
  ),
  Users(
    name: 'Agent 2',
    password: 'agenty123!',
    email: 'agent100@gmail.com',
    status: 'Agent',
    image: 'assets/images/profile_icon.png',
    phonenumber: '94745373930',
    bio: 'Agent bio',
  ),
];
// Mock function to fetch the logged-in user
Users getLoggedInUser(String email) {
  // Simulate fetching the logged-in user by email
  return demousers.firstWhere((user) => user.email == email);
}
