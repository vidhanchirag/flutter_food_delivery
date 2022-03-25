class SliderModel{
  String image;
  String title;
  String description;


  // Constructor for variables
  SliderModel({required this.title, required this.description, required this.image});

  void setImage(String getImage){
    image = getImage;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDescription(String getDescription){
    description = getDescription;
  }

  String getImage(){
    return image;
  }

  String  getTitle(){
    return title;
  }
  String getDescription(){
    return description;
  }
}

// List created
List<SliderModel> getSlides(){

  List<SliderModel> slides = <SliderModel>[];

  // Item 1
  SliderModel sliderModel = new SliderModel(image: "assets/intro_screen_1.png", title: "All your favorites", description: "Order from the best local restaurants with\neasy, on-demand delivery.");
  slides.add(sliderModel);

  // Item 2
  sliderModel = new SliderModel(image: "assets/intro_screen_2.png", title: "All your favorites", description: "Order from the best local restaurants with\neasy, on-demand delivery.");
  slides.add(sliderModel);

  // Item 3
  sliderModel = new SliderModel(image: "assets/intro_screen_3.png", title: "Choose your food", description: "Easily find your type of food craving and\n you'll get delivery in wide range.");
  slides.add(sliderModel);

  return slides;
}