import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:untitled/viewmodels/restaurant_viewmodel.dart';

import '../../data/response/status.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({Key? key}) : super(key: key);

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  var imageFile;
  var restaurantViewModel = RestaurantViewModel();
  var imageId;
  var nameController, categoryController,
      discountController, deliveryFeeController,
      deliveryTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: (context) => restaurantViewModel,
              child: Consumer<RestaurantViewModel>(builder: (context, viewModel, _) {
                // if(imageFile != null) {
                //   print('image url ${viewModel.image.data!.url}');
                // }

                if(viewModel.image.status == Status.COMPLETE) {
                  imageId = viewModel.image.data!.id;
                  print('image id ${viewModel.image.data!.id}');
                  print('image url ${viewModel.image.data!.url}');
                }else if(viewModel.image.status == Status.LOADING){
                  return const SizedBox(
                      width: 300,
                      height: 250,
                      child: Center(child: CircularProgressIndicator()));
                }

                return InkWell(
                    onTap: () {
                      _getImageFromSource();
                    },
                    child: imageFile == null
                        ? SizedBox(
                          width: 300,
                          height: 250,
                          child: Image.network(
                              'https://www.onlylondon.properties/application/modules/themes/views/default/assets/images/image-placeholder.png',
                              width: 300,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                        )
                        : Image.file(
                            imageFile,
                          width: 300,
                          height: 250,
                    )
                );
              }),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                )
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                  hintText: 'Category',
                  border: OutlineInputBorder(
                  )
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: discountController,
              decoration: const InputDecoration(
                  hintText: 'Discount',
                  border: OutlineInputBorder(
                  )
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: deliveryFeeController,
              decoration: const InputDecoration(
                  hintText: 'Fee',
                  border: OutlineInputBorder(
                  )
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: deliveryTimeController,
              decoration: const InputDecoration(
                  hintText: 'Time',
                  border: OutlineInputBorder(
                  )
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){},
                child: const Text('Save')
            )
          ],
        ),
      ),
    );
  }

  _getImageFromSource() async {
    var pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1900);

    if (pickedFile != null) {
      print("Image is picked");
      setState(() {
        imageFile = File(pickedFile.path);
      });
      restaurantViewModel.uploadImage(pickedFile.path);
    }
  }
}
