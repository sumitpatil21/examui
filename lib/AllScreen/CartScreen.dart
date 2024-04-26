import 'package:examui/ProductMapOfData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios,size: 28,),
                  SizedBox(width: 120,),
                  Text("My Cart",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),)
                ],
              ),
            ),
          ),
         Expanded(
           child: SingleChildScrollView(
             child: Column(
             
               children: [
                 ...List.generate(cartList.length, (index) => Container(
                   margin: EdgeInsets.all(15),
                   height: 200,
                   width: double.infinity,
                   decoration: BoxDecoration(
                       color: Colors.black12,
                       borderRadius: BorderRadius.circular(15),
                       image: DecorationImage(
                         image: AssetImage(cartList[index]["image"]),
                         alignment: Alignment.bottomLeft,
                       )
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Row(
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text(productData[indexselect]['name'],style: TextStyle(fontSize:25 ,fontWeight: FontWeight.w500,letterSpacing: 2),),
                             Text("1.No Shoes",style: TextStyle(fontSize:25 ,fontWeight: FontWeight.w500,letterSpacing: 2),),
                             Text("Rs"+(productData[indexselect]['price']).toString(),style: TextStyle(fontSize:20 ,fontWeight: FontWeight.w500,letterSpacing: 2,color: Colors.orange),),
                           ],
                         ),
                         SizedBox(width: 200,),
                         Container(
                           height: 80,
                           width: 50,
                           decoration: BoxDecoration(
                             color: Colors.black,
                             borderRadius: BorderRadius.circular(15),
                           ),
                           child: InkWell(
                               onTap: () {
                                 setState(() {
                                   cartList.removeAt(index);
                                 });
                               },
                               child: Icon(Icons.delete,size: 30,color: Colors.white,)),
                         )
                       ],
                     ),
                   ),
                 ),
                 )
               ],
             ),
           ),
         ),
          Container(
            height: 200,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Total : "+"$total",style: TextStyle(fontSize:20 ,fontWeight: FontWeight.w500,letterSpacing: 2),),
                Text("Gst : "+"${total*18/100}",style: TextStyle(fontSize:20,fontWeight: FontWeight.w500,letterSpacing: 2),),
                Text("---------------------------------------------------------------------------------------------------"),

                InkWell(
                  onTap: () {
                    setState(() {
                      for(int i=0;i<cartList.length;i++)
                        {
                          total=total+(cartList[i]['price']);
                        }
                    });
                  },
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration:BoxDecoration (
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text("Total Price : "+"${total*18/100+total}",style: TextStyle(fontSize:20,fontWeight: FontWeight.w500,letterSpacing: 2),)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}