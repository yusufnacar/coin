import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/notifier/state_provider.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {});
    Future.delayed(const Duration(seconds: 3)).then((value) {
      navigation.navigateToPageClear(path: NavigationConstants.HOME);
    });
  }
}
