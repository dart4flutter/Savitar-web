import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:f_web/common/theme.dart';
import 'package:f_web/widgets/card_tile.dart';
import 'package:f_web/widgets/chart_card_tile.dart';
import 'package:f_web/widgets/comment_widget.dart';
import 'package:f_web/widgets/profile_Widget.dart';
import 'package:f_web/widgets/project_widget.dart';
import 'package:f_web/widgets/quick_contact.dart';
import 'package:f_web/widgets/responsive_widget.dart';
import 'package:f_web/widgets/sidebar_menu..dart';

class DashBoard extends StatelessWidget {
  static const String routeName = '/dashboard';
  final String username;
  final String email;
  DashBoard({Key key, this.username,this.email}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    print(_media);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 800) {
          return Center(
            child: Text("küçük"),
          );
        } else if (constraints.maxWidth <= 1280 &&
            constraints.maxWidth >= 800) {
          return Center(
            child: Text("ddede"),
          );
        } else if (constraints.maxWidth >= 1280) {
          return Material(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ResponsiveWidget.isLargeScreen(context)
                    ?SideBarMenu(username: username != null ? username : "guest",email: email != null ? email : "guest@guest.com",)
                    : Container(),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 55,
                        width: _media.width,
                        child: AppBar(
                          elevation: 4,
                          centerTitle: true,
                          title: Text(
                            "Flutter Dashboard Web",
                          ),
                          automaticallyImplyLeading: false,
                          backgroundColor: drawerBgColor,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 20),
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            CardTile(
                                              iconBgColor: Colors.orange,
                                              cardTitle: "Booking",
                                              icon: Icons.flight_takeoff,
                                              subText: "Todays",
                                              mainText: "230",
                                            ),
                                            SizedBox(width: 20),
                                            CardTile(
                                              iconBgColor: Colors.pinkAccent,
                                              cardTitle: "Website Visits",
                                              icon: Icons.show_chart,
                                              subText:
                                              "Tracked from Google Analytics",
                                              mainText: "3.560",
                                            ),
                                            SizedBox(width: 20),
                                            CardTile(
                                              iconBgColor: Colors.green,
                                              cardTitle: "Revenue",
                                              icon: Icons.home,
                                              subText: "Last 24 Hours",
                                              mainText: "2500",
                                            ),
                                            SizedBox(width: 20),
                                            CardTile(
                                              iconBgColor:
                                              Colors.lightBlueAccent,
                                              cardTitle: "Followors",
                                              icon: Icons.unfold_less,
                                              subText: "Last 24 Hours",
                                              mainText: "112",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                ChartCardTile(
                                                  cardColor: Color(0xFF7560ED),
                                                  cardTitle: "Bandwidth usage",
                                                  subText: "March 2017",
                                                  icon: Icons.pie_chart,
                                                  typeText: "50 GB",
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                ChartCardTile(
                                                  cardColor: Color(0xFF25C6DA),
                                                  cardTitle: "Download count",
                                                  subText: "March 2017",
                                                  icon: Icons.cloud_upload,
                                                  typeText: "35487",
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            ProjectWidget(media: _media),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  QuickContact(media: _media)
                                ],
                              ),
                            ),
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CommentWidget(media: _media),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ProfileWidget(media: _media),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}


