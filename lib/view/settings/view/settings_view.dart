import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/enums/app_theme_enum.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/widget_extension.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/notifier/theme_notifer.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
        viewModel: SettingsViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SettingsViewModel viewModel) =>
            Scaffold(
                body: Padding(
              padding: context.paddingLow,
              child: CustomScrollView(slivers: [
                buildSliverAppBar(context),
                buildUserCard(context, viewModel).toSliver,
                SizedBox(height: context.lowValue).toSliver,
                buildCardCore(context, viewModel).toSliver,
                SizedBox(height: context.lowValue).toSliver,
                buildAboutCard(context, viewModel).toSliver,
              ]),
            )));
  }

  Widget buildCardHeader(BuildContext context, SettingsViewModel viewModel,
      {required List<Widget> array, required String title}) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingLow,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Divider(),
        ...array,
      ],
    ));
  }

  Widget buildAboutCard(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel,
        array: [
          Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: viewModel.navigateToContribution,
                    leading: Icon(Icons.favorite),
                    title: Text(LocaleKeys.settings_settings_contrubitors.tr()),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                  ListTile(
                    onTap: viewModel.navigateToFakeContribution,
                    leading: Icon(Icons.home),
                    title: Text(LocaleKeys.settings_settings_home.tr()),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                  )
                ],
              ),
              color: context.colors.primaryVariant)
        ],
        title: LocaleKeys.settings_settings_aboutUs.tr());
  }

  Widget buildCardCore(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel,
        array: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: viewModel.navigateToContribution,
                  leading: Icon(Icons.invert_colors),
                  title: Text(LocaleKeys.settings_settings_theme.tr()),
                  subtitle: Text(LocaleKeys.settings_settings_themeSub.tr()),
                  trailing: IconButton(
                      onPressed: viewModel.changeAppTheme,
                      icon: context.watch<ThemeNotifier>().currenThemeEnum ==
                              AppThemes.LIGHT
                          ? Icon(Icons.nightlight)
                          : Icon(Icons.wb_sunny)),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.language_sharp),
                  title: Text(LocaleKeys.settings_settings_langSettings.tr()),
                  trailing: Observer(builder: (_) {
                    return DropdownButton<Locale>(
                        items: [
                          DropdownMenuItem(
                              child: Text(LanguageManager
                                  .instance.trLocale.countryCode!
                                  .toUpperCase()),
                              value: LanguageManager.instance.trLocale),
                          DropdownMenuItem(
                              child: Text(LanguageManager
                                  .instance.enLocale.countryCode!
                                  .toUpperCase()),
                              value: LanguageManager.instance.enLocale)
                        ],
                        onChanged: viewModel.changeAppLocalization,
                        value: viewModel.appLocale
                        // value: viewModel.current,
                        );
                  }),
                )
              ],
            ),
            color: context.colors.primaryVariant,
          )
        ],
        title: LocaleKeys.settings_settings_app.tr());
  }

  Card buildUserCard(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      child: SizedBox(
        height: context.height * 0.1,
        child: Row(
          children: [
            Padding(
              padding: context.paddingLow,
              child: CircleAvatar(
                child: Text(viewModel.userModel.shortName),
                backgroundColor: context.colors.error,
              ),
            ),
            Spacer(),
            Text(viewModel.userModel.fullName),
            Spacer(
              flex: 7,
            )
          ],
        ),
      ),
      color: context.colors.primaryVariant,
    );
  }

  // NestedScrollView buildNestedScrollView() {
  //   return NestedScrollView(
  //       headerSliverBuilder: (context, innerBoxIsScrolled) {
  //         return [buildSliverAppBar(context)];
  //       },
  //       body: Text("d"));
  // }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          title: Text(
            LocaleKeys.settings_settings_title.tr(),
            style: Theme.of(context).textTheme.headline5,
          ),
          centerTitle: false),
    );
  }
}
