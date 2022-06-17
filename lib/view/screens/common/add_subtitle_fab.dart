import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:subfave/view/providers/upload.dart';
import 'package:subfave/view/screens/config.dart';

class AddSubtitleFloatingActionButton extends StatelessWidget {
  const AddSubtitleFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return FloatingActionButton(
      tooltip: "Add New Subtitle",
      onPressed: () async {
        showModalBottomSheet(
            context: context,
            builder: (value) {
              return Container(
                color: Colors.transparent,
                height: 400,
                width: width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Upload and generate subtitle file",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: SizedBox(
                              width: width,
                              child: const Divider(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(16),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () async {
                                  Upload upload = Upload();
                                  file = await upload.uploadSubtitle();
                                  Navigator.pushNamed(
                                    context,
                                    '/words',
                                  );
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 3,
                                    ),
                                  ),
                                  width: 300,
                                  child: Center(
                                    child: Text(
                                      "choose File",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              "after choosing subtitle file it returns generated words.",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Theme.of(context).dividerColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Icon(
        FeatherIcons.plus,
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
