import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:poisha/app/modules/home/views/widgets/item_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Sample data for grid items
    final List<Map<String, String>> gridItems = [
      {'icon': 'assets/icons/income.png', 'title': 'Income', 'amount': '5000'},
      {'icon': 'assets/icons/spending-money.png', 'title': 'Expense', 'amount': '3000'},
      {'icon': 'assets/icons/save-time.png', 'title': 'Saving', 'amount': '2000'},
      {'icon': 'assets/icons/income.png', 'title': 'Budget', 'amount': '8000'},
      {'icon': 'assets/icons/income.png', 'title': 'Loan', 'amount': '1500'},
      {'icon': 'assets/icons/spending-money.png', 'title': 'Tax', 'amount': '500'},
      {'icon': 'assets/icons/save-time.png', 'title': 'Bills', 'amount': '2500'},
      {'icon': 'assets/icons/income.png', 'title': 'Food', 'amount': '1200'},
    ];

    return Scaffold(
        body: SafeArea(
            child:Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: size.height * 0.36,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    )
                    ,child:Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding:  EdgeInsets.zero,
                          leading: Transform.scale(
                            scale: 1.2,
                            child: Image.asset(
                              'assets/icons/logo_icon.png',
                              errorBuilder:(context, error, stackTrace) {
                                return const Icon(Icons.image,size: 50,);
                              },),
                          ),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/login');
                                },
                                child: Icon(
                                    Icons.notifications,
                                    color: Theme.of(context).colorScheme.onPrimary),

                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                'assets/icons/logo_ico.png',
                                errorBuilder:(context, error, stackTrace) {
                                  return Icon(Icons.image,size: 50,
                                      color: Theme.of(context).colorScheme.onPrimary);
                                },),
                            ],
                          ),
                          onTap: () {},
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ItemWidget(
                              icon: 'assets/icons/income.png',
                              title: 'Income',
                              amount: '10000',
                              textColor: Theme.of(context).colorScheme.secondary,),
                            ItemWidget(
                              icon: 'assets/icons/spending-money.png',
                              title: 'Expence',
                              amount: '10000',
                              textColor: Theme.of(context).colorScheme.secondary,),
                            ItemWidget(
                              icon: 'assets/icons/save-time.png',
                              title: 'Saving',
                              amount: '10000',
                              textColor: Theme.of(context).colorScheme.secondary,),

                          ],
                        )




                      ],
                    ),
                  ),),
                ),
                Positioned(
                  top: size.height * 0.3,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text("All Feature"),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: gridItems.length,
                            itemBuilder: (context, index) {
                              return ItemWidget(
                                icon: gridItems[index]['icon']!,
                                title: gridItems[index]['title']!,
                                textColor: Theme.of(context).colorScheme.primary,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )

        )
    );
  }
}