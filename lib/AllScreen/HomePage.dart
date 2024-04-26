import 'package:examui/ProductMapOfData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.menu_outlined,size: 30,),
                ),
                SizedBox(width: 115,),
                Text("Rinex Shoes",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                SizedBox(width: 70,),
                Icon(Icons.notifications_active,size: 30,),
                SizedBox(width: 10,),
                Icon(Icons.favorite_border,size: 30,),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Icon(Icons.search_rounded,size: 30,),
                      SizedBox(width: 20,),
                      Text("search Your Item",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(1)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(cat.length, (index) => Container(
                    margin: EdgeInsets.all(12),
                    height:45,
                    width: 80,
                    decoration:BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text(cat[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white))),
                  ),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            Wrap(
              children: [
                ...List.generate(productData.length, (index) => InkWell(
                  onTap: () {
                    setState(() {
                      indexselect=index;
                      Navigator.of(context).pushNamed('/detail');
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(12),
                    height:300,
                    width: 200,
                    decoration:BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage(productData[index]["image"]),
                          fit: BoxFit.cover,
                          opacity: 0.7
                        ),
                        border: Border.all(
                          color: Colors.black,width: 1,
                        ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(productData[index]['name'],style: TextStyle(fontSize:25 ,fontWeight: FontWeight.w800,letterSpacing: 2,color: Colors.white),),
                        Text((productData[index]['price']).toString(),style: TextStyle(fontSize:25 ,fontWeight: FontWeight.w800,letterSpacing: 2,color: Colors.white),),
                      ],
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ) ,
    );
  }
}
List cat=[
  "All","Shoes","Cloth","Plants","Air",
];