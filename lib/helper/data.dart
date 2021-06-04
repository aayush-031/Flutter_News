import 'package:my_news/model/category_model.dart';

List<CategoryModel> getCatagories(){
   List<CategoryModel> category =new List<CategoryModel>();
   CategoryModel categoryModel =new CategoryModel();

   //1.
   categoryModel.categoryName ="Business";
   categoryModel.imageurl="https://images.unsplash.com/photo-1556761175-5973dc0f32e7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1490&q=80";
   category.add(categoryModel);


   categoryModel =new CategoryModel();

    //2.
   categoryModel.categoryName ="Technology";
   categoryModel.imageurl="https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
   category.add(categoryModel);
   categoryModel =new CategoryModel();


   //3.
   categoryModel.categoryName ="Sports";
   categoryModel.imageurl="https://images.unsplash.com/photo-1587280501635-68a0e82cd5ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
   category.add(categoryModel);
   categoryModel =new CategoryModel();


   //4.
   categoryModel.categoryName ="Health";
   categoryModel.imageurl="https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80";
   category.add(categoryModel);
   categoryModel =new CategoryModel();


   //5.
   categoryModel.categoryName ="General";
   categoryModel.imageurl="https://images.unsplash.com/photo-1493612276216-ee3925520721?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80";
   category.add(categoryModel);

   return category;
}
