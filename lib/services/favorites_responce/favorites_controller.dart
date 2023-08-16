import 'package:get/get.dart';
import 'package:restaraunts/services/favorites_responce/favorites_data_view_model.dart';
import 'package:restaraunts/services/favorites_responce/favorites_repository.dart';

class FavoritesController extends GetxController {
  final FavoritesRepository _repository = FavoritesRepository();
  RxBool isLoadingGetAllFavorites = false.obs, hasError = false.obs;
  final String errorMessage = 'повторите попытку';
  RxList<FavoritesDataViewModel> favorites = <FavoritesDataViewModel>[].obs;
  Future<void> getAllFavorites() async {
    isLoadingGetAllFavorites(true);
    final resultOrException = await _repository.getAllFavorites();
    resultOrException.fold(
        (left) => {isLoadingGetAllFavorites(false), hasError(true)},
        (data) => {isLoadingGetAllFavorites(false), favorites(data)});
  }

  Future<void> onRefresh() async {
    hasError(false);
    favorites.clear();
    await getAllFavorites();
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    getAllFavorites();
  }
}
