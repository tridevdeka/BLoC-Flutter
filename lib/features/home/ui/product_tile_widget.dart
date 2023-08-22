import 'package:bloc_state_management_flutter/features/home/models/home_product_data.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;

  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(productDataModel.imageUrl), fit: BoxFit.cover)),
          ),
          const SizedBox(height: 20,),
          Text(productDataModel.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text(productDataModel.description),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${productDataModel.price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
