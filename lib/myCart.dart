import "package:flutter/material.dart";
import "package:flutter_e_commerce_application_1/selected_provider.dart";
import "package:provider/provider.dart";

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int sum = 0;
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
    final selectedProvider = Provider.of<SelectedItemProvider>(context);
    sum = 0;
    for (int index in selectedProvider.selectedItem) {
      sum += price[index];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("CART"),
        backgroundColor: Colors.greenAccent,
        /*actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyCartScreen()));
            },
            child: Icon(Icons.shopping_cart),
          ),
          SizedBox(width: 40),
        ],*/
      ),
      body: Consumer<SelectedItemProvider>(builder: (context, value, child) {
        sum = 0;
        for (int index in value.selectedItem) {
          sum += price[index];
        }
        return ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            if (value.selectedItem.contains(index)) {
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
                  title: Text("Smart Phone ${index + 1}"),
                  subtitle: Text("Rs. ${price[index]}"),
                ),
              );
            } else {
              return Container();
            }
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedProvider.clearAllItem();
          setState(() {
            sum = 0;
          });
        },
        child: Text("BUY"),
      ),
      bottomSheet: Text("Total Price Rs. ${sum}"),
    );
  }
}
