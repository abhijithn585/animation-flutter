import 'package:animation/constants/data.dart';
import 'package:animation/view/details_page.dart';
import 'package:animation/view/widget/title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    slideAnimation =
        Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TextTitile(),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final datas = data[index];
                  return SlideTransition(
                    position: slideAnimation,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsPage(data: datas),
                            ));
                          },
                          child: Row(
                            children: [
                              Hero(
                                tag: datas.id!,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(datas.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("${datas.name}")
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   controller.forward();
      // }),
    );
  }
}
