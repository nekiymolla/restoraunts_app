class FavoritesDataViewModel {
  int? id;
  String? name;
  String? description;
  String? address;
  String? timeOpening;
  String? timeClosed;
  FavoritesDataViewModel(
      {this.id,
      this.name,
      this.description,
      this.address,
      this.timeOpening,
      this.timeClosed});
  FavoritesDataViewModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    address = json["address"];
    timeOpening = json["timeOpening"];
    timeClosed = json["timeClosed"];
  }
}
