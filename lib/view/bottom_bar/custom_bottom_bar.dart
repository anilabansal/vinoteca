//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
// import 'package:vinoteca_app/common/utils/common_colors.dart';
// import 'package:vinoteca_app/database/app_database.dart';
// import 'package:vinoteca_app/view/app_common_widgets/common_all_widget.dart';
// import '../../controller/bottom_bar/bottom_bar_controller.dart';
// import '../app_common_widgets/common_image_widget.dart';
//
//
// class CustomBottomBar extends StatelessWidget {
//   CustomBottomBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BottomBarController>(builder: (controller){return StylishBottomBar(
//         items: [
//           AnimatedBarItems(
//               icon: commonImage("asset/images/bottom_bar/img_home_grey.png"),
//               selectedIcon: commonImage("asset/images/bottom_bar/img_home_orange.png"),
//               title: const Text('')),
//           AnimatedBarItems(
//               icon: commonImage("asset/images/bottom_bar/img_shop_grey.png"),
//               selectedIcon: commonImage("asset/images/bottom_bar/img_shop_orange.png"),
//               title: const Text('')),
//           AnimatedBarItems(
//               icon: commonImage("asset/images/bottom_bar/img_setting_grey.png"),
//               selectedIcon: commonImage("asset/images/bottom_bar/img_setting_orange.png"),
//               title: const Text('')),
//           AnimatedBarItems(
//               icon:profileImage(false),
//               selectedIcon: profileImage(true),
//               title: const Text('')),
//         ],
//         iconSize: 32,
//         hasNotch: true,
//         fabLocation: StylishBarFabLocation.center,
//         opacity: 0.3,
//         currentIndex: controller.selectedIndex,
//         onTap: (index) {
//           controller.onClickOption(index!);
//         }
//     );});
//   }
//
//
//   Widget commonImage(image){
//     return Container(
//       width: 40,
//       height: 40,
//       padding: const EdgeInsets.all(5),
//       child: Image.asset(image),
//     );
//   }
//
//   Widget profileImage(isSelected){
//     return Container(
//       height: 30,
//       width: 30,
//       padding: isSelected?  const EdgeInsets.all(2.0) : EdgeInsets.zero,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(color: isSelected ? orangeDC571F : Colors.white)
//       ),
//       child: Container(
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.white,
//         ),
//         child: GetBuilder<AppLocalStorage>(
//           builder: (controller){
//             return controller.isProfileCreated ? CircularImageView(imageHeight: 50,imageWidth: 50,image: controller.userDetail!.profilePic) : CircularImageView(imageHeight: 50,imageWidth: 50);
//           },
//         )
//       ),
//     );
//   }
//
//
// }
