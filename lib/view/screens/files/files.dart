import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/models/file.dart';
import 'package:subfave/controllers/files.dart';
import 'package:subfave/view/screens/common/appbar.dart';
import 'package:subfave/view/screens/common/drawer.dart';
import 'package:subfave/view/screens/common/left_side_menu.dart';
import 'package:subfave/view/screens/config.dart';

class FilesScreen extends StatelessWidget {
  FilesScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: _key,
      drawer: const SubfaveDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: Column(
                children: [
                  SubfaveAppBar(scaffoldKey: _key),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const LeftSideMenu(),
                      const Spacer(),
                      FutureBuilder(
                        future: context.read<FilesProvider>().getAllFiles(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var items = context.read<FilesProvider>().files;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 8),
                                  child: Text(
                                    "Your Subtitle Files",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ),
                                SizedBox(
                                  width: width - 300,
                                  child: Divider(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:16.0),
                                  child: SizedBox(
                                      width: width / 1.5,
                                      height: height / 1.1,
                                      child: ListView.builder(
                                          itemBuilder: (_, index) {
                                            return FileCardItem(
                                              onTap: () {
                                                file = items[index];
                                                Navigator.pushNamed(
                                                    context, '/words');
                                              },
                                              items: items,
                                              index: index,
                                            );
                                          },
                                          itemCount: items.length)),
                                ),
                              ],
                            );
                          } else {
                            return SizedBox(
                              width: width / 1.5,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        },
                      ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FileCardItem extends StatelessWidget {
  FileCardItem({
    Key? key,
    required this.onTap,
    required this.items,
    required this.index,
  }) : super(key: key);
  final int index;
  final List<File> items;
  GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 0.8,
          ),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[index].name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      items[index].words.length.toString(),
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
