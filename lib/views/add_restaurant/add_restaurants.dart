import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/request/restaurant_request.dart';
import 'package:untitled/viewmodels/restaurant_viewmodel.dart';

import '../../data/response/status.dart';

class AddRestaurant extends StatefulWidget {
  AddRestaurant({Key? key, this.data, this.isUpdate}) : super(key: key);
  dynamic data;
  bool? isUpdate;

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  var imageFile;
  var restaurantViewModel = RestaurantViewModel();
  var imageId;
  var nameController = TextEditingController();
  var categoryController = TextEditingController();
  var discountController  = TextEditingController();
  var deliveryFeeController = TextEditingController();
  var deliveryTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.isUpdate!){
      nameController.text = widget.data.attributes.name;
      categoryController.text = widget.data.attributes.category;
      deliveryTimeController.text = widget.data.attributes.deliveryTime.toString();
      deliveryFeeController.text = widget.data.attributes.deliveryFee.toString();
      discountController.text = widget.data.attributes.discount.toString();
      imageId = widget.data.attributes.picture.data.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChangeNotifierProvider(
                create: (context) => restaurantViewModel,
                child: Consumer<RestaurantViewModel>(builder: (context, viewModel, _) {

                  if(viewModel.image.status == Status.COMPLETE) {
                    imageId = viewModel.image.data!.id;
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
                            child: widget.isUpdate! ?
                             Image.network(
                               'https://cms.istad.co${widget.data.attributes.picture.data.attributes.url}'
                             )
                            : Image.network(
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
              const SizedBox(height: 10),
              ChangeNotifierProvider(
                create: (context) => restaurantViewModel,
                child: Consumer<RestaurantViewModel>(
                  builder: (context, viewModel, _) {
                    if(viewModel.restaurants.status == Status.COMPLETE){
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Post Success')));
                      });
                    }
                    return ElevatedButton(
                      onPressed: (){
                        postRestaurant(widget.isUpdate!);
                      },
                      child: widget.isUpdate! ? const Text('Update') : const Text('Save')
                  );}
                ),
              )
            ],
          ),
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

  void postRestaurant(isUpdate) {
    print('image id :: $imageId');
    var requestBody = Data(
      name: nameController.text,
      category: categoryController.text,
      discount: int.parse(discountController.text),
      deliveryFee: double.parse(deliveryFeeController.text),
      deliveryTime: int.parse(deliveryTimeController.text),
      picture: imageId.toString()
    );
    if(isUpdate){
      restaurantViewModel.putRestaurant(requestBody, widget.data.id);
    }else{
      restaurantViewModel.postRestaurant(requestBody);
    }
  }
}
