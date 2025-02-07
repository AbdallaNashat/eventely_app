import 'package:flutter/material.dart';

class EventsData {
  String id;
  String name;
  String image;
  IconData? icon;

  EventsData({
    required this.id,
    required this.name,
    required this.image,
    this.icon});

  static List<EventsData> categories = [
    EventsData(
      id: "book_club",
      name: "Book Club",
      image: "assets/images/events/Book Club (8).png",
      icon: Icons.menu_book,
    ),
    EventsData(
      id: "sport",
      name: "Sport",
      image: "assets/images/events/Sport.png",
      icon: Icons.directions_bike,
    ),
    EventsData(
      id: "birthday",
      name: "Birthday",
      image: "assets/images/events/Birthday.png",
      icon: Icons.cake,
    ),
    EventsData(
      id: "gaming",
      name: "Gaming",
      image: "assets/images/events/Gaming.png",
      icon: Icons.videogame_asset,
    ),
    EventsData(
      id: "holiday",
      name: "Holiday",
      image: "assets/images/events/Holiday.png",
      icon: Icons.beach_access,
    ),
    EventsData(
      id: "exhibition",
      name: "Exhibition",
      image: "assets/images/events/Exhibition.png",
      icon: Icons.art_track,
    ),
    EventsData(
      id: "eating",
      name: "Eating",
      image: "assets/images/events/Eating.png",
      icon: Icons.fastfood,
    ),
    EventsData(
      id: "meeting",
      name: "Meeting",
      image: "assets/images/events/Meeting.png",
      icon: Icons.business_center,
    ),
    EventsData(
      id: "work_shop",
      name: "Work Shop",
      image: "assets/images/events/WorkShop.png",
      icon: Icons.build,
    ),
  ];
}
