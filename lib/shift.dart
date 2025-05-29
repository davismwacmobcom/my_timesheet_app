
import 'package:flutter/material.dart';

class Shift {
  final DateTime date;
  final String location;
  final String subLocation;
  final int distance;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final double hourlyRate;
  final double totalPay;
  final int hours;
  final String county;
  final bool isPremium;
  final bool isNightShift;
  final String? imageUrl;

  Shift({
    required this.date,
    required this.location,
    required this.subLocation,
    required this.distance,
    required this.startTime,
    required this.endTime,
    required this.hourlyRate,
    required this.totalPay,
    required this.hours,
    required this.county,
    this.isPremium = false,
    this.isNightShift = false,
    this.imageUrl,
  });
}