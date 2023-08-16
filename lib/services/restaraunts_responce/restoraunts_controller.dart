import 'package:get/get.dart';
import 'package:restaraunts/services/restaraunts_responce/restoraunts_data_view_model.dart';
import 'package:restaraunts/services/restaraunts_responce/restoraunts_repository.dart';

class RestorauntsController extends GetxController {
  final RestorauntsRepository _repository = RestorauntsRepository();
  RxBool isLoadingGetAllRestoraunts = false.obs, hasError = false.obs;
  final String errorMessage = 'повторите попытку';
  RxList<RestorauntsDataViewModel> restoraunts =
      <RestorauntsDataViewModel>[].obs;
  Future<void> getAllRestoraunts() async {
    isLoadingGetAllRestoraunts(true);
    final resultOrException = await _repository.getAllRestoraunts();
    resultOrException.fold(
        (left) => {isLoadingGetAllRestoraunts(false), hasError(true)},
        (data) => {isLoadingGetAllRestoraunts(false), restoraunts(data)});
  }

  Future<void> onRefresh() async {
    hasError(false);
    restoraunts.clear();
    await getAllRestoraunts();
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    getAllRestoraunts();
  }
}
