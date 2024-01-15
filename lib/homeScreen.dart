import "package:flutter/material.dart";
import "package:flutter_e_commerce_application_1/myCart.dart";
import "package:flutter_e_commerce_application_1/selected_provider.dart";
import "package:provider/provider.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> price = [
    31000,
    250000,
    67000,
    23000,
    24750,
    10000,
    10002,
    11999,
    24999,
    30750,
    23999,
    19999,
    12400,
    18379,
    2500
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        backgroundColor: Colors.orangeAccent,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCartScreen()));
              },
              child: Icon(Icons.shopping_cart)),
          SizedBox(width: 50)
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Consumer<SelectedItemProvider>(
                    builder: (context, value, child) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                            radius: 50,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/iphone${index + 1}.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text("MobilePhone ${index + 1}"),
                          subtitle: Text("Rs. ${price[index]}"),
                          trailing: IconButton(
                              icon: value.selectedItem.contains(index)
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.done,
                                                color: Colors.blue,
                                              )),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                value.removeItem(index);
                                              },
                                              icon: value.selectedItem
                                                      .contains(index)
                                                  ? Icon(Icons.remove,
                                                      color: Colors.red)
                                                  : Icon(Icons.shopping_cart))
                                        ])
                                  : const Icon(Icons.shopping_cart),
                              onPressed: () {
                                value.addItem(index);
                              })));
                });
              }),
        )
      ]),
    );
  }
}
