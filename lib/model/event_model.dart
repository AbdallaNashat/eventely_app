class EventDataModel {

  static const String collectionName = "EventsCollection";

   String eventId;
  final String eventTitle;
  final String eventDesc;
  final String eventCategory;
  final String eventImage;
  final DateTime eventDate;
  final bool isFavorite;

  EventDataModel(
      {
      this.eventId = "",
      required this.eventTitle,
      required this.eventDesc,
      required this.eventCategory,
      required this.eventImage,
      required this.eventDate,
      this.isFavorite = false});


 factory EventDataModel.fromFirestore(Map<String , dynamic> json) => EventDataModel(
    eventId: json["eventId"],
    eventTitle: json["eventTitle"],
    eventDesc: json["eventDesc"],
    eventCategory: json["eventCategory"],
    eventImage: json["eventImage"],
    eventDate: DateTime.fromMicrosecondsSinceEpoch(json["eventDate"]),
    isFavorite:  json["isFavorite"],
  );



  Map<String, dynamic> toFirestore() {
    return {
      "EventId": eventId,
      "EventTitle": eventTitle,
      "EventDesc": eventDesc,
      "EventCategory": eventCategory,
      "EventImage": eventImage,
      "EventDate": eventDate.millisecondsSinceEpoch,
      "IsFavorite": isFavorite,
    };
  }


}
