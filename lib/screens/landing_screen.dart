import 'package:flutter/material.dart';
import 'package:realestateapp/sample_data.dart';
import 'package:realestateapp/utils/custom_func.dart';
import 'package:realestateapp/utils/widget_func.dart';
import '../custom_widgets/Icon_button.dart';
import '../utils/constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    const double padding = 25;
    final ThemeData themeData = Theme.of(context);
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // addVerticalSpace(padding),
            Padding(
              padding: const EdgeInsets.all(padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  IconBorder(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.menu,
                      color: colorBlack,
                    ),
                  ),
                  IconBorder(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.settings,
                      color: colorBlack,
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(padding - 15),
            Padding(
              padding: sidePadding,
              child: Text(
                'City',
                style: themeData.textTheme.bodyText2,
              ),
            ),
            addVerticalSpace(10),
            Padding(
              padding: sidePadding,
              child: Text(
                'San Francisco',
                style: themeData.textTheme.headline1,
              ),
            ),
            const Padding(
              padding: sidePadding,
              child: Divider(
                height: padding,
                color: colorGrey,
              ),
            ),
            SingleChildScrollView(
              // padding: sidePadding,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: ["<\$220,000", "For Sale", "3-4 Beds", ">1000 sqft"]
                    .map((filter) => ChoiceOption(text: filter))
                    .toList(),
              ),
            ),
            addVerticalSpace(10),
            Expanded(
              child: Padding(
                padding: sidePadding,
                child: ListView.builder(
                    itemCount: mockdata.length,
                    itemBuilder: (context, index) {
                      return EstateItemBox(
                        itemData: mockdata[index],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  const ChoiceOption({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colorGrey.withAlpha(20),
      ),
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class EstateItemBox extends StatelessWidget {
  const EstateItemBox({super.key, this.itemData});

  final dynamic itemData;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(itemData['image'])),
                const Positioned(
                  top: 15,
                  right: 15,
                  child: IconBorder(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.favorite_border,
                      color: colorBlack,
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  formatCurrency(itemData["amount"]),
                  style: themeData.textTheme.headline1,
                ),
                addHorizontalSpace(10),
                Text(
                  itemData["address"],
                  style: themeData.textTheme.bodyText2,
                ),
              ],
            ),
            addVerticalSpace(10),
            Text(
              "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft ",
              style: themeData.textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
