// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:foodie/ui/shared/app_colors.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';
import '../../viewmodels/application_view_model.dart';
import '../shared/ui_helpers.dart';
import '../widgets/app_button.dart';
import '../widgets/border_widget.dart';
import '../widgets/app_scaffold.dart';

class TrackOrderScreen extends StatefulWidget {
  static const routeName = '/app/order/track';

  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ApplicationViewModel>.withConsumer(
      viewModelBuilder: () => locator<ApplicationViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return AppScaffold(
          title: "Track Order 📦",
          trailing: const BorderWidget(
            padding: EdgeInsets.symmetric(horizontal: 9),
            child: Icon(FeatherIcons.bell),
          ),
          onBackTap: () => model.goBack(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/map.png",
                ),
                fit: BoxFit.contain,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 350,
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TimelineTheme(
                            data: TimelineThemeData(
                              lineColor: greyBg,
                              strokeWidth: 1,
                              itemGap: 0,
                            ),
                            child: Timeline(
                              indicatorSize: 35,
                              events: events,
                              isLeftAligned: true,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          verticalSpace(20),
                          SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              title: "Order Received",
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  child: Container(
                    width: 350,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const ListTile(
                        leading: CircleAvatar(backgroundColor: greyBg),
                        title: Text(
                          "Samuel",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text("Driver - EX 5760 IKJ"),
                        trailing: CircleAvatar(
                          backgroundColor: primaryColor,
                          child: Icon(Icons.call, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<TimelineEventDisplay> get events {
    List<Map<String, dynamic>> _evs = [
      {
        "title": "Delivery Address",
        "body": "Faculty of Sciences, University of Lagos",
        "icon": Icons.pin_drop_sharp,
      },
      {
        "title": "Estimated Delivery Time",
        "body": "25-30 Mins",
        "icon": Icons.timer_sharp,
      },
    ];

    List<TimelineEventDisplay> ev = [];

    for (var history in _evs) {
      ev.add(TimelineEventDisplay(
        child: ListTile(
          title: Text(
            history['title'],
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            history['body'],
          ),
          contentPadding: EdgeInsets.zero,
        ),
        indicatorSize: 60,
        indicator: Container(
          decoration: const BoxDecoration(
            color: greyBg,
            shape: BoxShape.circle,
          ),
          child: Icon(history['icon']),
        ),
      ));
    }

    return ev;
  }
}
