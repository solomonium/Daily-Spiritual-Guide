import 'package:spiritual_daily_guide/exports.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Spiritual Daily Guide'),
          ),
          drawer: Drawer(
            child: ListView(
              children: const [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(child: Text('Drawer Header')),
                ),
                ListTile(
                  title: Text('Jeremy'),
                  subtitle: Text('example@gmail.com'),
                  leading: CircleAvatar(backgroundColor: Colors.purpleAccent),
                )
              ],
            ),
          ),
          backgroundColor: Colors.blueAccent.withOpacity(0.4),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLargeText(text: 'Hi, Jeremy!'),
                addVerticalSpace(10),
                AppText(text: 'Let the Holy Spirit inspire you today!'),
                addVerticalSpace(20),
                MyCard(
                  width: double.infinity,
                  height: 250,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: "Word for Today:",
                                size: 18,
                                color: Colors.black54,
                              ),
                              AppLargeText(
                                text: DateFormat("dd-MMM-yyyy")
                                    .format(DateTime.now()),
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          addVerticalSpace(5),
                          SizedBox(
                            width: 300,
                            height: 150,
                            child: Center(
                              child: AppText(
                                  size: 18,
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
                            ),
                          ),
                          addVerticalSpace(10),
                          Align(
                            alignment: Alignment.center,
                            child: AppLargeText(
                              text: 'Tap to Read Anchor Text: Gen 1 vs 1',
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                addVerticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: MyCard(
                      width: 150,
                      height: 100,
                      child: Column(),
                    )),
                    addHorizontalSpace(20),
                    Expanded(
                        child: MyCard(
                      width: 150,
                      height: 100,
                      child: Column(),
                    ))
                  ],
                ),
                addVerticalSpace(10),
                AppLargeText(
                  text: 'Plans for Today',
                  size: 18,
                )
              ],
            ),
          )),
    );
  }
}
