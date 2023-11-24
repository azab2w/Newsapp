import 'dart:ui';

class Category {
  String id;
  String title;
  String ImageName;
  Color color;
  Category(this.id, this.title, this.ImageName, this.color,);

  static List<Category> getAllCategory() {
    return [
      Category('business', 'Business', 'bussines.png' , Color(0xFFCF7E48)),
      Category('sports', 'Sports','sports.png' , Color(0xFFC91C22)),
      Category('general', 'General', 'environment.png' , Color(0xFF003E90)),
      Category('technology', 'Technology', 'technology-icon-png-4.jpg' , Color(0xFF4882CF)),
      Category('health', 'Health', 'health.png' , Color(0xFFED1E79)),
      Category('science', 'Science', 'science.png' , Color(0xFFF2D352)),
    ];
  }
}

