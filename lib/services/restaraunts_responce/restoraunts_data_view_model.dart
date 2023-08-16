class RestorauntsDataViewModel {
  int? id;
  String? name;
  String? description;
  String? address;
  String? timeOpening;
  String? timeClosed;
  int? ownerId;

  RestorauntsDataViewModel(
      {this.id,
      this.name,
      this.description,
      this.address,
      this.timeOpening,
      this.timeClosed,
      this.ownerId});
  RestorauntsDataViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    timeOpening = json['timeOpening'];
    timeClosed = json['timeClosed'];
    ownerId = json['ownerId'];
  }
}
