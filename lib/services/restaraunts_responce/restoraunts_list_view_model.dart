import 'package:restaraunts/services/restaraunts_responce/restoraunts_data_view_model.dart';

class RestorauntsListViewModel {
  bool? error;
  String? msg;
  List<RestorauntsDataViewModel>? actionsData;

  RestorauntsListViewModel({this.error, this.msg, this.actionsData});
  RestorauntsListViewModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['message'];
    actionsData = (json['data'] as List)
        .map((final element) => RestorauntsDataViewModel.fromJson(element))
        .toList();
  }
}
