// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fast_foodie/shared/enums/availability.dart';

class PlaceModel {
  final String id;
  final String name;
  final int distance;
  final Availability availability;
  final LocationModel locationModel;
  final AddressModel addressModel;
  PlaceModel({
    required this.id,
    required this.name,
    required this.distance,
    required this.locationModel,
    required this.addressModel,
    required this.availability,
  });

  String? get getAddress => addressModel.address ?? addressModel.formattedAddress;

  PlaceModel copyWith({
    String? id,
    String? name,
    int? distance,
    Availability? availability,
    LocationModel? locationModel,
    AddressModel? addressModel,
  }) {
    return PlaceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      availability: availability ?? this.availability,
      distance: distance ?? this.distance,
      locationModel: locationModel ?? this.locationModel,
      addressModel: addressModel ?? this.addressModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fsq_id': id,
      'name': name,
      'distance': distance,
      'closed_bucket': availability.name,
      'geocodes': {'main': locationModel.toMap()},
      'location': addressModel.toMap(),
    };
  }

  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
      id: map['fsq_id'] as String,
      name: map['name'] as String,
      distance: map['distance'] as int,
      availability: Availability.values.firstWhere(
        (element) => element.name == map['closed_bucket'] as String,
        orElse: () => Availability.Unsure,
      ),
      locationModel: LocationModel.fromMap(map['geocodes']['main'] as Map<String, dynamic>),
      addressModel: AddressModel.fromMap(map['location'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceModel.fromJson(String source) => PlaceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlaceModel(id: $id, name: $name, distance: $distance, locationModel: $locationModel, addressModel: $addressModel)';
  }

  @override
  bool operator ==(covariant PlaceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.distance == distance &&
        other.locationModel == locationModel &&
        other.addressModel == addressModel;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ distance.hashCode ^ locationModel.hashCode ^ addressModel.hashCode;
  }
}

class LocationModel {
  final double latitude;
  final double longitude;
  LocationModel({
    required this.latitude,
    required this.longitude,
  });

  LocationModel copyWith({
    double? latitude,
    double? longitude,
  }) {
    return LocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) => LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocationModel(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}

class AddressModel {
  final String? address;
  final String? country;
  final String? crossStreet;
  final String? formattedAddress;
  final String? locality;
  final String? region;
  AddressModel({
    this.address,
    this.country,
    this.crossStreet,
    this.formattedAddress,
    this.locality,
    this.region,
  });

  AddressModel copyWith({
    String? address,
    String? country,
    String? crossStreet,
    String? formattedAddress,
    String? locality,
    String? region,
  }) {
    return AddressModel(
      address: address ?? this.address,
      country: country ?? this.country,
      crossStreet: crossStreet ?? this.crossStreet,
      formattedAddress: formattedAddress ?? this.formattedAddress,
      locality: locality ?? this.locality,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'country': country,
      'cross_street': crossStreet,
      'formatted_address': formattedAddress,
      'locality': locality,
      'region': region,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      country: map['country'] != null && map['country'].toString().isNotEmpty ? map['country'] as String : null,
      crossStreet: map['cross_street'] != null && map['cross_street'].toString().isNotEmpty ? map['cross_street'] as String : null,
      formattedAddress:
          map['formatted_address'] != null && map['formatted_address'].toString().isNotEmpty ? map['formatted_address'] as String : null,
      locality: map['locality'] != null && map['locality'].toString().isNotEmpty ? map['locality'] as String : null,
      region: map['region'] != null && map['region'].toString().isNotEmpty ? map['region'] as String : null,
      address: map['address'] != null && map['address'].toString().isNotEmpty ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(address: $address, country: $country, crossStreet: $crossStreet, formattedAddress: $formattedAddress, locality: $locality, region: $region)';
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.country == country &&
        other.crossStreet == crossStreet &&
        other.formattedAddress == formattedAddress &&
        other.locality == locality &&
        other.region == region;
  }

  @override
  int get hashCode {
    return address.hashCode ^ country.hashCode ^ crossStreet.hashCode ^ formattedAddress.hashCode ^ locality.hashCode ^ region.hashCode;
  }
}
