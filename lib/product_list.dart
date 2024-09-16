
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:shoppingcart/cart_model.dart';
import 'package:shoppingcart/cart_provider.dart';
import 'package:shoppingcart/cart_screen.dart';
import 'package:shoppingcart/db_helper.dart';


class ProductListScreen extends StatefulWidget {

   const ProductListScreen({Key? key}) : super(key: key);
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  DBHelper? dbHelper = DBHelper();

  List<String> productName = ['Matte Lipstick' , 'Liquid Lipstick' , 'Mascara' , 'Makeup Brushes' , 'Eyeshadow Palette' , 'Perfume Set' , 'Nail Polish Set' , 'Makeup Set' , 'Glitter Set' , 'Blush Palette'];
  List<String> productUnit = ['3gm' , '20ml' , '10ml' , '9Pieces' , '1Piece' , '20ml' , '10ml' , '5Pieces' , '20ml' , '10gm'];
  List<int> productPrice = [10, 20, 36, 40, 50, 60, 70, 80, 90, 10];
  List<String> productImage = [
    'https://images.unsplash.com/photo-1542452255191-c85a98f2c5d1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bWFrZXVwJTIwcHJvZHVjdHN8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1635263282145-253319c75fd4?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDUzfHxtYWtldXAlMjBwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1650664370914-f026578ec2a4?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzc0fHxtYWtldXAlMjBwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1654764293117-2cfc5150c560?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDM4fHxtYWtldXAlMjBwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1677087454529-ba70fefe7d57?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjV8fG1ha2V1cCUyMHByb2R1Y3RzfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1587304946976-cbbbafce2133?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTU5fHxtYWtldXAlMjBwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1599948128020-9a44505b0d1b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG5haWwlMjBwb2xpc2h8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1557205465-f3762edea6d3?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1ha2V1cCUyMHByb2R1Y3RzfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1641677914790-bc9e2bc8e5e1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDg4fHxtYWtldXAlMjBwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1643168343047-f1056f97e555?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDcxfHxtYWtldXAlMjBwcm9kdWN0c3xlbnwwfHwwfHx8MA%3D%3D'
  ];


  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Beauty Product List', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Center(
              child: badges.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child){
                    return Text(value.getCounter().toString(), style: TextStyle(color: Colors.white),);
                  },
                ),
                badgeAnimation: badges.BadgeAnimation.rotation(
                  animationDuration: Duration(milliseconds: 300),
                ),
                child: Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
          SizedBox(width: 20,)
        ],
      ),

      body: Column(
        children: [
          Expanded(child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              height: 100,
                              width: 100,
                              image: NetworkImage(productImage[index].toString()),),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productName[index].toString(),
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Text(productUnit[index].toString() + " " + r"$" + productPrice[index].toString(),
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: (){
                                        dbHelper!.insert(
                                          Cart(id: index,
                                              productId: index.toString(),
                                              productName: productName[index].toString(),
                                              initialPrice: productPrice[index],
                                              productPrice: productPrice[index],
                                              quantity: 1,
                                              unitTag: productUnit[index].toString(),
                                              image: productImage[index].toString())
                                        ).then((value){
                                          print('Product is added to cart');
                                          cart.addTotalPrice(double.parse(productPrice[index].toString()));
                                          cart.addCounter();
                                        }).onError((error, stackTrace){
                                          print(error.toString());
                                        });
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.pink[300],
                                        borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Center(
                                            child: Text('Add to Cart', style: TextStyle(color: Colors.white),)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),


                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
          ),
        ],
      )

    );
  }
}






