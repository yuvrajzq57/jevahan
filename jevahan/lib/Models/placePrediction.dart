class PlacePrediction {
  late String secondary_text;
  late String main_text;
  late String place_id;

  PlacePrediction(
      {required this.secondary_text,
      required this.main_text,
      required this.place_id});

  PlacePrediction.fromJson(Map<String, dynamic> json) {
    place_id = json["place_id"];
    main_text = json["structured_formatting"]["main_text"];
    place_id = json["structured_formatting"]["place_id"];
  }
}
