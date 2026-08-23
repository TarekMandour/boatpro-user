import 'package:example/ui/index.dart';
import 'bottom_nav_bar_viewmodel.dart';
import 'dart:ui' as ui;

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavBarViewModel>.reactive(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: kcWhiteColor,
          body: viewModel.getViewForIndex(viewModel.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: kcWhiteColor,
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.setIndex,
            unselectedItemColor: kcSecondaryColor,
            selectedItemColor: kcWhiteColor,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            iconSize: 1,
            items: [
              BottomNavigationBarItem(
                icon: RoundBarItem(
                  iconPath: Assets.svg.home.path,
                  label: translate(AppStrings.home),
                  isSelected: viewModel.isIndexSelected(0),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: RoundBarItem(
                  iconPath: Assets.svg.chat.path,
                  label: translate(AppStrings.chats),
                  isSelected: viewModel.isIndexSelected(1),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: RoundBarItem(
                  iconPath: Assets.svg.reservation.path,
                  label: translate(AppStrings.reservations),
                  isSelected: viewModel.isIndexSelected(2),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: RoundBarItem(
                  iconPath: Assets.svg.user.path,
                  label: translate(AppStrings.profile),
                  isSelected: viewModel.isIndexSelected(3),
                ),
                label: '',
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => locator<BottomNavBarViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (viewModel) async {
        viewModel.init();
      },
    );
  }
}

class RoundBarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;

  const RoundBarItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? kcSecondaryColor : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 0,
            child: SvgPicture.asset(
              iconPath,
              // ignore: deprecated_member_use
              color: isSelected ? kcWhiteColor : Colors.grey,
            ),
          ),
          horizontalSpaceTiny,
          Expanded(
            flex: 0,
            child: CustomText(
              title: label,
              textColor: isSelected ? kcWhiteColor : Colors.grey,
              fontSize: AppFontSize.font12,
            ),
          ),
        ],
      ),
    );
  }
}
