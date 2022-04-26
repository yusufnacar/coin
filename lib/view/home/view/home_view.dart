import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/notifier/state_provider.dart';
import '../../../product/components/tab_bar_element.dart';
import '../../../product/components/table_header.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  Widget buildScaffoldBody(BuildContext context, HomeViewModel viewModel) {
    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: context.colors.background,
            appBar: buildAppBar(context, viewModel),
            body: buildTable(
              context,
              viewModel,
            ),
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context, HomeViewModel viewModel) {
    return AppBar(
        bottom: TabBar(
            onTap: (value) {
              viewModel.selectedTabIndex = value;
              viewModel.searchController!.text = "";
            },
            tabs: [Tab(text: "All"), Tab(text: "Spot"), Tab(text: "Future")]),
        title: Container(
          alignment: Alignment.center,
          width: context.width * 0.5,
          height: context.height * 0.1,
          child: Image.asset(
            ImageConstants.splashImage,
          ),
        ));
  }

  Widget buildTable(BuildContext context, HomeViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingNormal,
          child: Container(
              alignment: Alignment.centerLeft,
              width: context.width * 0.5,
              child: buildTextFormField(context, viewModel)),
        ),
        ListTile(
          textColor: Colors.white,
          title: Row(
            children: [
              Observer(builder: (_) {
                return TableHeader(
                    name: "Symbol",
                    ontap: () {
                      viewModel.changeTableHeader(0);
                    },
                    isSort: viewModel.isSortedBySymbol,
                    icon: viewModel.icon);
              }),
              Observer(builder: (_) {
                return TableHeader(
                  name: "Last Price",
                  ontap: () {
                    viewModel.changeTableHeader(1);
                  },
                  isSort: viewModel.isSortedByLastPrice,
                  icon: viewModel.icon,
                );
              }),
              Observer(builder: (_) {
                return TableHeader(
                  name: "Volume",
                  ontap: () {
                    viewModel.changeTableHeader(2);
                  },
                  isSort: viewModel.isSortedByVolume,
                  icon: viewModel.icon,
                );
              }),
            ],
          ),
        ),
        buildTabBar(context, viewModel)
      ],
    );
  }

  Widget buildTextFormField(BuildContext context, HomeViewModel viewModel) {
    return TextField(
      onChanged: (value) {
        print(value.isEmpty);
        viewModel.fetchAllSearchQuery(value);
      },
      controller: viewModel.searchController,
      decoration: InputDecoration(
          fillColor: Colors.grey,
          prefixIcon: Icon(Icons.search, color: Colors.black)),
    );
  }

  Container buildTabBar(BuildContext context, HomeViewModel viewModel) {
    return Container(
        color: Colors.blueGrey,
        height: context.height * 0.6,
        child: Consumer(builder: (context, StateProvider provider, _) {
          if (provider.status == ServiceRequestStatus.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.status == ServiceRequestStatus.Success) {
            return buildTabBarView(viewModel);
          } else {
            return Center(child: Text("No data reachable"));
          }
        }));
  }

  TabBarView buildTabBarView(HomeViewModel viewModel) {
    return TabBarView(children: [
      TabBarElement(
        isSpot: false,
        isAll: true,
        viewModel: viewModel,
        coin: viewModel.coins,
      ),
      TabBarElement(
        isSpot: true,
        isAll: false,
        viewModel: viewModel,
        coin: viewModel.spotCoins,
      ),
      TabBarElement(
          isSpot: false,
          isAll: false,
          viewModel: viewModel,
          coin: viewModel.futuresCoins),
    ]);
  }
}
