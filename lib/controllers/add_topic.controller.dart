import 'package:get/state_manager.dart';
import 'package:getx_1/api/category.api.dart';
import 'package:getx_1/api/tag.api.dart';
import 'package:getx_1/controllers/auth.controller.dart';
import 'package:getx_1/models/category_list.dart';
import 'package:getx_1/models/tag.dart';

import 'package:jwt_decode/jwt_decode.dart';

class addTopicController extends GetxController {
  // CategoryList? categoryList;
  // Tag? tag;
  var userId;
  var cat = <CategoryListData>[].obs;
  var tag = <TagData>[].obs;
  Object? selectCategory;
  List<dynamic> selectTag = [];
  var selectedCategory = ''.obs;
  var selectedTag = ''.obs;
  var isDataLoading = true.obs;
  var hint = 'Select Category'.obs;

  @override
  Future<void> onInit() async {
    getCategoryList();
    getUserId();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getUserId() async {
    var token = await cacheService.readCache(key: 'accessToken');
    Map<String, dynamic> payload = Jwt.parseJwt(token.toString());
    userId = payload['id'];
    // userId = token;
    print(userId);
  }

  getCategoryList() async {
    try {
      final CategorylistData = await CategoryApi().GetCategoryList();
      cat.assignAll(CategorylistData);
      cat.refresh();
    } catch (e) {
    } finally {
      getTag();
    }
  }

  getTag() async {
    try {
      final TagsData = await TagApi().getTags();
      tag.assignAll(TagsData);
      tag.refresh();
    } catch (e) {
    } finally {
      isDataLoading(false);
    }
  }
}
