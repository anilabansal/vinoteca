
import 'package:flutter/material.dart';
import 'package:vinoteca_app/common/utils/common_colors.dart';
import 'package:vinoteca_app/common/utils/common_strings.dart';
import '../app_common_widgets/common_toolbar.dart';
import 'favorite_helper.dart';

class FavoriteWineView extends StatelessWidget {
  const FavoriteWineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              children: [
                CommonToolbarSuffix(toolText: AppConstants.favorite,rightWidget: const Padding(
                  padding: EdgeInsets.only(right:10.0,),
                  child: Icon(Icons.search,color: orangeEBA868,),
                )),
                const Expanded(child: FavListView())
              ],
            )
        )
    );
  }
}
