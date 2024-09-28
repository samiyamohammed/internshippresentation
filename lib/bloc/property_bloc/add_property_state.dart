import 'package:real_estate_marketplace/models/add_property.dart';

class AddPropertyState {
  final AddProperty property;
  final String? otherAnswer;
  AddPropertyState({
    required this.property,
    this.otherAnswer,
  });

  // CopyWith method to update specific fields in the state  neighborhoodinformation
  AddPropertyState copyWith({
    String? name,
    String? status,
    String? type,
    String? amenities,
    String? elevatoraccess,
    String? parking,
    List<String>? kitchenappliances,
    List<String>? laundryfacilities,
    List<String>? heatingtype,
    List<String>? coolingtype,
    List<String>? watersupply,
    List<String>? electricitysupply,
    List<String>? neighborhoodinformation,
    String? securitysystems,
    String? otherAnswer,
    int? livingRooms,
    int? bedrooms,
    int? bathrooms,
    int? kitchens,
  }) {
    return AddPropertyState(
      property: AddProperty(
        name: name ?? property.name,
        status: status ?? property.status,
        type: type ?? property.type,
        amenities: amenities ?? property.amenities,
        elevatoraccess: elevatoraccess ?? property.elevatoraccess,
        parking: parking ?? property.parking,
        kitchenappliances: kitchenappliances ?? property.kitchenappliances,
        laundryfacilities: laundryfacilities ?? property.laundryfacilities,
        heatingtype: heatingtype ?? property.heatingtype,
        coolingtype: coolingtype ?? property.coolingtype,
        watersupply: watersupply ?? property.watersupply,
        electricitysupply: electricitysupply ?? property.electricitysupply,
        securitysystems: securitysystems ?? property.securitysystems,
        neighborhoodinformation:
            neighborhoodinformation ?? property.neighborhoodinformation,
        livingRooms: livingRooms ?? property.livingRooms,
        bedrooms: bedrooms ?? property.bedrooms,
        bathrooms: bathrooms ?? property.bathrooms,
        kitchens: kitchens ?? property.kitchens,
        builtYear: property.builtYear,
        balconies: property.balconies,
      ),
      otherAnswer: otherAnswer ?? this.otherAnswer,
    );
  }
}
