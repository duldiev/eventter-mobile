// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/text_styles.dart';
import 'package:flutter_mobile/presentation/widgets/cards/interest_card.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: double.maxFinite,
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header5(title: "Выберите ваши интересы"),
                SizedBox(
                  height: 30,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                    InterestCard(
                      title: "Спорт",
                      imageTitle: "soccer-ball",
                    ),
                    InterestCard(
                      title: "Музыка",
                      imageTitle: "cassette",
                    ),
                    InterestCard(
                      title: "Танцы",
                      imageTitle: "disco-ball",
                    ),
                    InterestCard(
                      title: "Технологии",
                      imageTitle: "monitor",
                    ),
                    InterestCard(
                      title: "Наука",
                      imageTitle: "laboratory",
                    ),
                    InterestCard(
                      title: "Рок Музыка",
                      imageTitle: "rock-music",
                    ),
                    InterestCard(
                      title: "Вечеринки",
                      imageTitle: "confetti",
                    ),
                    InterestCard(
                      title: "Искусство",
                      imageTitle: "paint-palette-with-brush",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
