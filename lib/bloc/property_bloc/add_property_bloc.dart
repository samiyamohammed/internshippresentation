// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'add_property_event.dart';
// import 'add_property_state.dart';
// import 'package:real_estate_marketplace/models/add_property.dart';

// class AddPropertyBloc extends Bloc<AddPropertyEvent, AddPropertyState> {
//   AddPropertyBloc() : super(AddPropertyState(property: AddProperty())) {
//     // Handle AddPropertyNameChanged event
//     on<AddPropertyNameChanged>((event, emit) {
//       emit(state.copyWith(name: event.name));
//     });

//     // Handle AddPropertyStatusChanged event
//     on<AddPropertyStatusChanged>((event, emit) {
//       emit(state.copyWith(status: event.status));
//     });

//     // Handle AddPropertyTypeChanged event
//     on<AddPropertyTypeChanged>((event, emit) {
//       emit(state.copyWith(type: event.type));
//     });

// ignore_for_file: collection_methods_unrelated_type

//     // Handle SaveAddPropertyDraft event
//     on<SaveAddPropertyDraft>((event, emit) {
//       // Perform logic to save the draft
//       // ignore: avoid_print
//       print("Add Property draft saved: ${state.property}");
//       // No state change required unless saving has a UI impact
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_property_event.dart';
import 'add_property_state.dart';
import 'package:real_estate_marketplace/models/add_property.dart';

class AddPropertyBloc extends Bloc<AddPropertyEvent, AddPropertyState> {
  AddPropertyBloc() : super(AddPropertyState(property: AddProperty())) {
    // Handle AddPropertyNameChanged event  Kitchenappliances
    on<AddPropertyNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    // Handle AddPropertyStatusChanged event  Amenities
    on<AddPropertyStatusChanged>((event, emit) {
      emit(state.copyWith(status: event.status));
    });

    // Handle AddPropertyTypeChanged event
    on<AddPropertyTypeChanged>((event, emit) {
      emit(state.copyWith(type: event.type));
    });

    //Handle the features and amenities
    on<AddPropertyAmenitiesChanged>((event, emit) {
      emit(state.copyWith(amenities: event.amenities));
    });

    on<AddPropertyKitchenappliancesChanged>((event, emit) {
      final updatedAppliances =
          List<String>.from(state.property.kitchenappliances);
      if (updatedAppliances.contains(event.kitchenappliances)) {
        updatedAppliances.remove(event.kitchenappliances);
      } else {
        updatedAppliances.add(event.kitchenappliances);
      }
      emit(state.copyWith(kitchenappliances: updatedAppliances));
    });

    on<AddPropertylaundryfacilitiesChanged>((event, emit) {
      final updatedFacilities =
          List<String>.from(state.property.laundryfacilities);
      if (updatedFacilities.contains(event.laundryfacilities)) {
        updatedFacilities.remove(event.laundryfacilities);
      } else {
        updatedFacilities.add(event.laundryfacilities);
      }
      emit(state.copyWith(laundryfacilities: updatedFacilities));
    });

    on<AddPropertyheatingtypeChanged>((event, emit) {
      final updatedheatingtype = List<String>.from(state.property.heatingtype);
      if (updatedheatingtype.contains(event.heatingtype)) {
        updatedheatingtype.remove(event.heatingtype);
      } else {
        updatedheatingtype.add(event.heatingtype);
      }
      emit(state.copyWith(heatingtype: updatedheatingtype));
    });

    on<AddPropertycoolingtypeChanged>((event, emit) {
      final updatedcoolingtype = List<String>.from(state.property.coolingtype);
      if (updatedcoolingtype.contains(event.coolingtype)) {
        updatedcoolingtype.remove(event.coolingtype);
      } else {
        updatedcoolingtype.add(event.coolingtype);
      }
      emit(state.copyWith(coolingtype: updatedcoolingtype));
    });

    on<AddPropertywatersupplyChanged>((event, emit) {
      final updatedwatersupply = List<String>.from(state.property.watersupply);
      if (updatedwatersupply.contains(event.watersupply)) {
        updatedwatersupply.remove(event.watersupply);
      } else {
        updatedwatersupply.add(event.watersupply);
      }
      emit(state.copyWith(watersupply: updatedwatersupply));
    });

    on<AddPropertyelectricitysupplyChanged>((event, emit) {
      final updatedelectricitysupply =
          List<String>.from(state.property.electricitysupply);
      if (updatedelectricitysupply.contains(event.electricitysupply)) {
        updatedelectricitysupply.remove(event.electricitysupply);
      } else {
        updatedelectricitysupply.add(event.electricitysupply);
      }
      emit(state.copyWith(electricitysupply: updatedelectricitysupply));
    });

    on<AddPropertysecuritysystemsChanged>((event, emit) {
      emit(state.copyWith(securitysystems: event.securitysystems));
    });

    on<AddPropertyelevatoraccessChanged>((event, emit) {
      emit(state.copyWith(elevatoraccess: event.elevatoraccess));
    });

    on<AddPropertyparkingChanged>((event, emit) {
      emit(state.copyWith(parking: event.parking));
    });
    on<AddPropertyneighborhoodinformationChanged>((event, emit) {
      final updatedneighborhoodinformation =
          List<String>.from(state.property.neighborhoodinformation);
      if (updatedneighborhoodinformation
          .contains(event.neighborhoodinformation)) {
        updatedneighborhoodinformation.remove(event.neighborhoodinformation);
      } else {
        updatedneighborhoodinformation.add(event.neighborhoodinformation);
      }
      emit(state.copyWith(
          neighborhoodinformation: updatedneighborhoodinformation));
    });

    //securitysystems

    // Handle IncrementLivingRooms event
    on<IncrementLivingRooms>((event, emit) {
      emit(state.copyWith(livingRooms: state.property.livingRooms + 1));
    });

    // Handle DecrementLivingRooms event
    on<DecrementLivingRooms>((event, emit) {
      emit(state.copyWith(livingRooms: state.property.livingRooms - 1));
    });

    on<IncrementBedRooms>((event, emit) {
      emit(state.copyWith(bedrooms: state.property.bedrooms + 1));
    });

    // Handle DecrementLivingRooms event
    on<DecrementBedRooms>((event, emit) {
      emit(state.copyWith(bedrooms: state.property.bedrooms - 1));
    });

    on<IncrementBathRooms>((event, emit) {
      emit(state.copyWith(bathrooms: state.property.bathrooms + 1));
    });

    // Handle DecrementLivingRooms event
    on<DecrementBathRooms>((event, emit) {
      emit(state.copyWith(bathrooms: state.property.bathrooms - 1));
    });

    on<IncrementKitchen>((event, emit) {
      emit(state.copyWith(kitchens: state.property.kitchens + 1));
    });

    // Handle DecrementLivingRooms event
    on<DecrementKitchen>((event, emit) {
      emit(state.copyWith(kitchens: state.property.kitchens - 1));
    });

    // Handle SaveAddPropertyDraft event
    on<SaveAddPropertyDraft>((event, emit) {
      // Perform logic to save the draft
      // ignore: avoid_print
      print("Add Property draft saved: ${state.property}");
      // No state change required unless saving has a UI impact
    });
  }
}
