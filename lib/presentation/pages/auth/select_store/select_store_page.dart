import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:template/config/routes/route_path/app_routers.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/presentation/pages/auth/select_store/select_store_controller.dart';
import 'package:template/presentation/pages/auth/select_store/widgets/item_provider.dart';
import 'package:template/presentation/pages/auth/widgets/appbar_auth.dart';

class SelectStorePage extends GetView<SelectStoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarAuth(
        title: 'SELECT STORES'.tr,
        isShowLeading: false,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 26.h),
        _buildInput(),
        SizedBox(height: 26.h),
        Expanded(
          child: Obx(
            () => controller.isLoading
                ? Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  )
                : controller.listProvider.isEmpty
                    ? Center(
                        child: Text(
                          'No data',
                          style: AppText.text30.copyWith(
                            color: ColorResources.COLOR_464647,
                          ),
                        ),
                      )
                    : SmartRefresher(
                        controller: controller.refreshController,
                        onLoading: () =>
                            controller.getListProvider(isLoadMore: true),
                        enablePullDown: false,
                        enablePullUp: controller.isLoadMore,
                        child: ListView.separated(
                          itemCount: controller.listProvider.length,
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          itemBuilder: (BuildContext context, int index) {
                            return ItemProvider(
                              provider: controller.listProvider[index],
                              onTap: () {
                                sl<SharedPreferenceHelper>().setTimeZoneName(
                                    idTimeZoneName: controller
                                        .listProvider[index].timezoneApp!);
                                Get.toNamed(
                                  AppRoute.LOGIN,
                                  arguments: {
                                    'store': controller.listProvider[index],
                                  },
                                );
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10.h);
                          },
                        ),
                      ),
          ),
        ),
      ],
    );
  }

  Widget _buildInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Obx(
        () => TextFormField(
          controller: controller.searchController,
          focusNode: controller.focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 22,
            ),
            fillColor: ColorResources.COLOR_F6F6F7,
            filled: true,
            hintText: 'Search',
            hintStyle: AppText.text14.copyWith(
              color: ColorResources.COLOR_6D6D6D.withOpacity(0.8),
            ),
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    ImagesPath.icSearchInput,
                    width: 20.r,
                    height: 20.r,
                  ),
                ),
              ],
            ),
            suffixIcon: controller.searchKey.value.trim().isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.searchController.clear();
                          controller.searchKey.value = '';
                          controller.initSearch();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset(
                            ImagesPath.icClearSearch,
                            width: 20.r,
                            height: 20.r,
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
            isDense: true,
          ),
          style: AppText.text14,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (value) {},
          onChanged: (val) {
            controller.onChangeSearch();
          },
        ),
      ),
    );
  }
}
