import 'dart:math';

class Images {
  ///----------------- Brand -----------------------------------//
  static String logoIcon = 'assets/images/logo/logo_icon_dark.png';

  ///----------------- Dummy Image -----------------------------------//

  static List<String> avatars = List.generate(
      12, (index) => 'assets/images/dummy/avatar-${index + 1}.jpg');

  static List<String> squareImages =
      List.generate(15, (index) => 'assets/images/dummy/${index + 1}.jpg');

  static List<String> landscapeImages =
      List.generate(4, (index) => 'assets/images/dummy/l${index + 1}.jpg');

  static List<String> portraitImages =
      List.generate(3, (index) => 'assets/images/dummy/p${index + 1}.jpg');

  static List<String> dashboard = List.generate(
      6, (index) => 'assets/images/dummy/dashboard-${index + 1}.jpg');

  static List<String> fileManager = List.generate(
      2, (index) => 'assets/images/dummy/fileManager-${index + 1}.jpg');

  static List<String> landing = List.generate(
      3, (index) => 'assets/images/dummy/landing-${index + 1}.jpg');

  static List<String> social = List.generate(
      5, (index) => 'assets/images/dummy/social-${index + 1}.jpg');

  static List<String> product =
      List.generate(7, (index) => 'assets/images/dummy/h${index + 1}.jpg');

  static List<String> login =
      List.generate(6, (index) => 'assets/images/dummy/login${index + 1}.jpg');

  static List<String> nft =
      List.generate(1, (index) => 'assets/images/dummy/nft.jpg');

  static List<String> cartoon =
      List.generate(8, (index) => 'assets/images/dummy/m${index + 1}.jpg');

  static List<String> cartoonBackground =
      List.generate(8, (index) => 'assets/images/dummy/a${index + 1}.jpg');

  static String ethLogoIcon = 'assets/images/nft/ethereum-eth-logo.png';

  static List<String> shoppingImage = List.generate(
      10, (index) => 'assets/images/shopping_images/photo${index + 1}.jpg');

  /// Food
  static String fruits = 'assets/images/food/fruits.jpg';
  static String fruitsJuice = 'assets/images/food/fruit_juice.jpg';
  static String veggies = 'assets/images/food/veggies.jpg';

  static String randomImage(List<String> images) {
    return images[Random().nextInt(images.length)];
  }
}
