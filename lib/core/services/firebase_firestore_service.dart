import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventely/model/event_model.dart';

class FirebaseFirestoreService {
  static CollectionReference<EventDataModel> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter<EventDataModel>(
          fromFirestore: (snapshot, _) =>
              EventDataModel.fromFirestore(snapshot.data()!),
          toFirestore: (eventModel, _) => eventModel.toFirestore(),
        );
  }

  static Future<bool> createNewEvent(EventDataModel eventData) async {
    try {
      final collectionRef = getCollectionRef();
      var docRef = collectionRef.doc();

      eventData.eventId = docRef.id;
      docRef.set(eventData);
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  readEvents() {
    final collectionRef = getCollectionRef();
  }

  static Future<List<EventDataModel>> getDataFromFirestore() async {
    var collectionRef = getCollectionRef();
    QuerySnapshot<EventDataModel> data = await collectionRef.get();
    List<EventDataModel> eventDataList = data.docs.map((element) {
      return element.data();
    }).toList();

    return eventDataList;

  }

  static Stream<QuerySnapshot<EventDataModel>> getStreamData(
      String categoryName) {
    var collectionRef = getCollectionRef().where(
      "eventCategory",
      isEqualTo: categoryName,
    );

    return collectionRef.snapshots();
  }

  static Stream<QuerySnapshot<EventDataModel>> getStreamFavoriteData() {
    var collectionRef = getCollectionRef().where(
      "isFavorite",
      isEqualTo: true,
    );

    return collectionRef.snapshots();
  }

  static Future<bool> deleteEvent(EventDataModel data) async {
    try {
      var collectionRef = getCollectionRef();
      var docRef = collectionRef.doc(data.eventId);
      docRef.delete();

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  static Future<bool> updateEvent(EventDataModel data) async {
    try {
      var collectionRef = getCollectionRef();
      var docRef = collectionRef.doc(data.eventId);
      docRef.update(
        data.toFirestore(),
      );

      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }
}
