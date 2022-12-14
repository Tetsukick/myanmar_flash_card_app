import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:bintango_jp/config/color_config.dart';
import 'package:bintango_jp/config/size_config.dart';
import 'package:bintango_jp/gen/assets.gen.dart';
import 'package:bintango_jp/utils/common_text_widget.dart';
import 'package:bintango_jp/utils/shared_preference.dart';
import 'package:bintango_jp/utils/utils.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info/package_info.dart';

import '../utils/analytics/analytics_event_entity.dart';
import '../utils/analytics/analytics_parameters.dart';
import '../utils/analytics/firebase_analytics.dart';
import '../utils/my_inapp_browser.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  final _menuItemBarHeight = 60.0;
  bool _isSoundOn = true;

  @override
  void initState() {
    FirebaseAnalyticsUtils.analytics.setCurrentScreen(screenName: AnalyticsScreen.menu.name);
    loadSoundSetting();
    super.initState();
  }

  void loadSoundSetting() async {
    setState(() async => _isSoundOn = await PreferenceKey.isSoundOn.getBool());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(SizeConfig.mediumSmallMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.lottie.japanFlow,
              height: _menuItemBarHeight * 3,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: MenuItem.values.length,
              itemBuilder: (BuildContext context, int index) {
                final _menuItem = MenuItem.values[index];
                if (_menuItem == MenuItem.settingSound) {
                  return _switchSettingRow(_menuItem);
                }
                return _basicSettingRow(_menuItem);
              },
            ),
          ],
        )
      ),
    );
  }

  Widget _switchSettingRow(MenuItem menuItem) {
    return Card(
      child: InkWell(
        onTap: () async {
          analytics(menuItem.analyticsItem);
          _isSoundOn = !_isSoundOn;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: SizeConfig.mediumSmallMargin),
          height: _menuItemBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              menuItem.img,
              SizedBox(width: SizeConfig.smallMargin),
              TextWidget.titleBlackMediumBold(menuItem.title),
              Spacer(),
              Utils.soundSettingSwitch(value: _isSoundOn,
                onToggle: (val) {
                  analytics(menuItem.analyticsItem);
                  setState(() => _isSoundOn = val);
                  PreferenceKey.isSoundOn.setBool(val);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _basicSettingRow(MenuItem menuItem) {
    return Card(
      child: InkWell(
        onTap: () async {
          analytics(menuItem.analyticsItem);
          if (menuItem == MenuItem.licence) {
            final info = await PackageInfo.fromPlatform();
            showLicensePage(
              context: context,
              applicationName: info.appName,
              applicationVersion: info.version,
              applicationIcon: Assets.icon.appIcon.image(),
              applicationLegalese: "?????????????????????????????????",
            );
          } else if (menuItem == MenuItem.feedback) {
            final inAppReview = InAppReview.instance;
            if (await inAppReview.isAvailable()) {
              await inAppReview.requestReview();
            }
          }  else {
            setBrowserPage(menuItem.url);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: SizeConfig.mediumSmallMargin),
          height: _menuItemBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              menuItem.img,
              SizedBox(width: SizeConfig.smallMargin),
              TextWidget.titleBlackMediumBold(menuItem.title),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setBrowserPage(String url) async {
    MyInAppBrowser browser = new MyInAppBrowser();
    await browser.openUrlRequest(
      urlRequest: URLRequest(url: Uri.parse(url)),
      options: InAppBrowserClassOptions(
        crossPlatform: InAppBrowserOptions(
          toolbarTopBackgroundColor: const Color(0xff2b374d),
        ),
        android: AndroidInAppBrowserOptions(
          // Android??????????????????
        ),
        ios: IOSInAppBrowserOptions(
          // iOS??????????????????
            toolbarTopTintColor: const Color(0xff2b374d),
            closeButtonCaption: '?????????',
            closeButtonColor: Colors.white
        ),
      ),
    );
  }

  void analytics(MenuAnalyticsItem item, {String? others = ''}) {
    final eventDetail = AnalyticsEventAnalyticsEventDetail()
      ..id = item.id.toString()
      ..screen = AnalyticsScreen.lectureSelector.name
      ..item = item.shortName
      ..action = AnalyticsActionType.tap.name
      ..others = others;
    FirebaseAnalyticsUtils.eventsTrack(AnalyticsEventEntity()
      ..name = item.name
      ..analyticsEventDetail = eventDetail);
  }
}

enum MenuItem {
  settingSound,
  feedback,
  licence
}

extension MenuItemExt on MenuItem {
  String get title {
    switch (this) {
      case MenuItem.settingSound:
        return 'Sound Setting';
      case MenuItem.feedback:
        return 'Feedback';
      case MenuItem.licence:
        return 'License';
    }
  }

  String get url {
    switch (this) {
      case MenuItem.feedback:
        return 'https://docs.google.com/forms/d/e/1FAIpQLSddXsg9zlzk0Zd-Y_0n0pEfsK3U246OJoI0cQCOCVL7XyRWOw/viewform';
      default:
        return '';
    }
  }

  Widget get img {
    const _height = 24.0;
    const _width = 24.0;
    switch (this) {
      case MenuItem.settingSound:
        return Assets.png.soundOn64.image(height: _height, width: _width);
      case MenuItem.feedback:
        return Assets.png.feedback128.image(height: _height, width: _width);
      case MenuItem.licence:
        return Assets.png.licence128.image(height: _height, width: _width);
    }
  }

  MenuAnalyticsItem get analyticsItem {
    switch (this) {
      case MenuItem.settingSound:
        return MenuAnalyticsItem.soundSetting;
      case MenuItem.feedback:
        return MenuAnalyticsItem.feedback;
      case MenuItem.licence:
        return MenuAnalyticsItem.license;
    }
  }
}
