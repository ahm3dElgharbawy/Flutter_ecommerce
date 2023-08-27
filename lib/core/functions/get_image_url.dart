import 'package:ecommerce/links.dart';

String getImageUrl(String dirName,String imageName){
  return "${Links.imagesPath}/$dirName/$imageName";
}