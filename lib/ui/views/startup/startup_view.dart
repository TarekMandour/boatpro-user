import 'package:example/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:example/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      body: Stack(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Assets.images.logoSingle.image(),
          )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Assets.svg.wave.svg(fit: BoxFit.cover)),
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
