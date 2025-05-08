import 'package:udece_app/src/domain/entities/commons/location.dart';

class Ride {
  String uuid;
  Location origin;
  String destination;
  String originDetails;
  String destinationDetails;
  String departureTime;
  String departureDate;
  int pricePerPerson;
  int availableSeats;
  bool expressTrip;
  String expressTripPrice;
  int totalSeats;
  int reservationsCount;
  List<String> passengers;
  String user;
  String statusJourney;

  Ride({
    required this.uuid,
    required this.origin,
    required this.destination,
    required this.originDetails,
    required this.destinationDetails,
    required this.departureTime,
    required this.departureDate,
    required this.pricePerPerson,
    required this.availableSeats,
    required this.expressTrip,
    required this.expressTripPrice,
    required this.totalSeats,
    required this.reservationsCount,
    required this.passengers,
    required this.user,
    required this.statusJourney,
  });
}

/**
 * import { Base } from "../common";

export enum JourneyStatus {
  WAITING = "WAITING",
  IN_PROGRESS = "IN_PROGRESS",
  COMPLETED = "COMPLETED",
}

export interface Location {
  city: string;
  location: {
    latitude: number;
    longitude: number;
  };
}

export interface Journey extends Base {
  origin: Location;
  destination: Location;
  originDetails: string;
  destinationDetails: string;
  departureTime: string;
  departureDate: string;
  pricePerPerson: number;
  availableSeats: number;
  expressTrip: boolean;
  expressTripPrice?: string;
  totalSeats: number; // Total de cupos disponibles
  reservationsCount: number; // Número de reservas
  passengers?: string[];
  user: string;

  statusJourney: JourneyStatus; // Estado del viaje
}

 */
