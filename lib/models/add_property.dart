class AddProperty {
  String? name;
  String? status;
  String? type;
  String? amenities;
  String? elevatoraccess;
  String? parking;
  List<String> kitchenappliances;
  List<String> laundryfacilities;
  List<String> heatingtype;
  List<String> coolingtype;
  List<String> watersupply;
   List<String> neighborhoodinformation;
  String? securitysystems;
  List<String>
      electricitysupply; // Changed from String? to List<String> neighborhoodinformation
  int livingRooms; // Initialize with a default value
  int bedrooms; // Initialize with a default value
  int bathrooms; // Initialize with a default value
  int kitchens; // Initialize with a default value
  int balconies; // Initialize with a default value
  String? builtYear;

  AddProperty(
      {this.name,
      this.status,
      this.type,
      this.amenities,
      this.elevatoraccess,
      this.parking,
      this.kitchenappliances = const [],
      this.laundryfacilities = const [],
      this.heatingtype = const [],
      this.coolingtype = const [],
      this.watersupply = const [],
      this.neighborhoodinformation = const [],
      this.securitysystems,
      this.electricitysupply =
          const [], // Initialize with an empty list parking
      this.livingRooms = 0, // Default value
      this.bedrooms = 0, // Default value
      this.bathrooms = 0, // Default value
      this.kitchens = 0, // Default value
      this.balconies = 0, // Default value
      this.builtYear});
}
