import 'package:examui/AllScreen/CartScreen.dart';
import 'package:examui/ProductMapOfData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(15)),
         Padding(
           padding: const EdgeInsets.all(18.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               InkWell(
                 onTap:()
    {
        Navigator.pop(context);
    },
                   child: Icon(Icons.arrow_back_ios,size: 30,)),
               InkWell(onTap: () {
                 setState(() {
                   Navigator.of(context).pushNamed("/add");
                 });
               },
                 child: Icon(Icons.favorite_border,size: 30,)),
             ],
           ),
         ),
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(productData[indexselect]['image']),
                fit: BoxFit.cover,
                opacity: 0.7
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("1.No Shoes",style: TextStyle(fontSize:20 ,fontWeight: FontWeight.w500,letterSpacing: 2,color: Colors.white),),
                  Text(productData[indexselect]['name'],style: TextStyle(fontSize:50 ,fontWeight: FontWeight.w900,letterSpacing: 2,color: Colors.white),),
                  Text((productData[indexselect]['price']).toString(),style: TextStyle(fontSize:30 ,fontWeight: FontWeight.w700,letterSpacing: 2,color: Colors.white),),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
                SizedBox(height: 50,),
                Text(productData[indexselect]["dec"]),
                SizedBox(height: 10,),
                Text("Size",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(size.length, (index) => Container(
                  margin: EdgeInsets.all(15),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(size[index]),
                  ),
                )),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 50)),
          GestureDetector(
            onTap: () {
                Navigator.of(context).pushNamed("/add");
                int x=0;

                   if(x==0)
                     {
                       cartList.add(productData[indexselect]);
                       x=1;
                     }
                   else
                     {
                       cartList[indexselect]['qty']++;
                     }
            },
            child: Container(
              height: 80,
              width: 900,
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Add To Cart",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
List size=[
  '25','28','13','10','5','7'
];