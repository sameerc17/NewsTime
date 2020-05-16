import 'package:newstime/models/categorymodel.dart';

List<Categorymodel> getCategories() {
  List<Categorymodel> category = new List<Categorymodel>();

  Categorymodel categorymodel = new Categorymodel();
  categorymodel.imageurl =
      "https://images.unsplash.com/photo-1499438075715-fc23ef376ab9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorymodel.categoryName = "Sports";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.imageurl =
      "https://images.unsplash.com/photo-1510020407791-7f41b27d6f02?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorymodel.categoryName = "Health";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.imageurl =
      "https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorymodel.categoryName = "Technology";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.imageurl =
      "https://images.unsplash.com/photo-1521246493141-dcff41a31d07?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorymodel.categoryName = "Business";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.imageurl =
      "https://images.unsplash.com/photo-1540224871915-bc8ffb782bdf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorymodel.categoryName = "Entertainment";
  category.add(categorymodel);

  categorymodel = new Categorymodel();
  categorymodel.imageurl =
      "https://images.unsplash.com/photo-1576319155264-99536e0be1ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorymodel.categoryName = "Science";
  category.add(categorymodel);

  return category;
}
