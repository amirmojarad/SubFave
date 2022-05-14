import 'package:flutter/material.dart';
import 'package:subfave/screens/config.dart';

class SubfaveAppBar extends StatelessWidget {
  const SubfaveAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300,
                height: 100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Subfave.",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(0.8),
                                  fontSize: 32),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Learn through movie subtitles",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .background
                                    .withOpacity(0.6),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              GestureDetector(
                onTap: currentTheme.changeTheme,
                child: Container(
                  child: Center(
                    child: Text(
                      currentTheme.isDark ? "Light" : "Dark",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.w400),
                    ),
                  ),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 8, left: 32, right: 32),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Divider(
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
          )
        ],
      ),
    );
  }
}
