import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quantumapp/Auth/fauth.dart';
import 'package:quantumapp/screens/account.dart';
import 'package:quantumapp/services/services.dart';
import 'package:quantumapp/models/Product_model.dart';
import '../models/article_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> _productModel;
  List<String> _categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModel = await ApiService().getProducts();
    _categories = await ApiService().getCategories();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Widget dealsOfTheday() {
    return Container(
      child: Wrap(
        children: _productModel
            .map((iteam) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      height: 150,
                      width: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              color: Colors.grey,
                              height: 100,
                            ),
                          ),
                          Text(iteam.title)
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget categoryWidget() {
    return Container(
        height: 160,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      height: 150,
                      width: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                              ),
                              height: 100,
                            ),
                          ),
                          Text(_categories[index].toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Spacer(),
              Container(
                child: Text(
                  "Products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer()
            ],
          ),
          SizedBox(height: 25),
          Container(
              height: 50,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Deals of the Day",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "VIEW ALL",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ),
                ],
              )),
          dealsOfTheday(),
          Container(
              height: 50,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "VIEW ALL",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ),
                ],
              )),
          categoryWidget(),
        ],
      ),
    );
  }
}
