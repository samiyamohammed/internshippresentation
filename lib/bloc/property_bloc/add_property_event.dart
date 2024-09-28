// abstract class AddPropertyEvent {}

// // Event for updating the property name
// class AddPropertyNameChanged extends AddPropertyEvent {
//   final String name;
//   AddPropertyNameChanged(this.name);
// }

// // Event for updating the property status
// class AddPropertyStatusChanged extends AddPropertyEvent {
//   final String status;
//   AddPropertyStatusChanged(this.status);
// }

// // Event for updating the property type
// class AddPropertyTypeChanged extends AddPropertyEvent {
//   final String type;
//   AddPropertyTypeChanged(this.type);
// }

// // Event for saving the draft of the property
// class SaveAddPropertyDraft extends AddPropertyEvent {}
abstract class AddPropertyEvent {}

// Event for updating the property name
class AddPropertyNameChanged extends AddPropertyEvent {
  final String name;
  AddPropertyNameChanged(this.name);
}

// Event for updating the property status
class AddPropertyStatusChanged extends AddPropertyEvent {
  final String status;
  AddPropertyStatusChanged(this.status);
}

// Event for updating the property type
class AddPropertyTypeChanged extends AddPropertyEvent {
  final String type;
  AddPropertyTypeChanged(this.type);
}

//event for updating amenities type
class AddPropertyAmenitiesChanged extends AddPropertyEvent {
  final String amenities;
  AddPropertyAmenitiesChanged(this.amenities);
}

class AddPropertyelevatoraccessChanged extends AddPropertyEvent {
  final String elevatoraccess;
  AddPropertyelevatoraccessChanged(this.elevatoraccess);
}

class AddPropertyparkingChanged extends AddPropertyEvent {
  final String parking;
  AddPropertyparkingChanged(this.parking);
}

class AddPropertyKitchenappliancesChanged extends AddPropertyEvent {
  final String kitchenappliances;
  AddPropertyKitchenappliancesChanged(this.kitchenappliances);
}

class AddPropertylaundryfacilitiesChanged extends AddPropertyEvent {
  final String laundryfacilities;
  AddPropertylaundryfacilitiesChanged(this.laundryfacilities);
}

class AddPropertyheatingtypeChanged extends AddPropertyEvent {
  final String heatingtype;
  AddPropertyheatingtypeChanged(this.heatingtype);
}

class AddPropertycoolingtypeChanged extends AddPropertyEvent {
  final String coolingtype;
  AddPropertycoolingtypeChanged(this.coolingtype);
}

class AddPropertywatersupplyChanged extends AddPropertyEvent {
  final String watersupply;
  AddPropertywatersupplyChanged(this.watersupply);
}

class AddPropertyelectricitysupplyChanged extends AddPropertyEvent {
  final String electricitysupply;
  AddPropertyelectricitysupplyChanged(this.electricitysupply);
}

class AddPropertysecuritysystemsChanged extends AddPropertyEvent {
  final String securitysystems;
  AddPropertysecuritysystemsChanged(this.securitysystems);
}

class AddPropertyneighborhoodinformationChanged extends AddPropertyEvent {
  final String neighborhoodinformation;
  AddPropertyneighborhoodinformationChanged(this.neighborhoodinformation);
}

// Event for saving the draft of the Kitchenappliances property  neighborhoodinformation
class SaveAddPropertyDraft extends AddPropertyEvent {}

// Event for incrementing living rooms
class IncrementLivingRooms extends AddPropertyEvent {}

// Event for decrementing living rooms
class DecrementLivingRooms extends AddPropertyEvent {}

// Event for incrementing living rooms
class IncrementBedRooms extends AddPropertyEvent {}

// Event for decrementing living rooms
class DecrementBedRooms extends AddPropertyEvent {}

// Event for incrementing living rooms
class IncrementBathRooms extends AddPropertyEvent {}

// Event for decrementing living rooms
class DecrementBathRooms extends AddPropertyEvent {}

// Event for incrementing living rooms
class IncrementKitchen extends AddPropertyEvent {}

// Event for decrementing living rooms
class DecrementKitchen extends AddPropertyEvent {}
