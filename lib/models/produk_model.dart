class ProdukModel {
  final String image;
  final String name;
  final int price;
  final double rating;
  final int sold;

  ProdukModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.rating,
      required this.sold});
}

List<ProdukModel> produkPopuler = [
  ProdukModel(
    image: "assets/images/ProdukPopuler1.png",
    name: "Cetak XBanner",
    price: 80000,
    rating: 4.6,
    sold: 84,
  ),
  ProdukModel(
    image: "assets/images/ProdukPopuler2.png",
    name: "Plakat Akrilik",
    price: 750000,
    rating: 4.5,
    sold: 24,
  ),
];

List<ProdukModel> produkLainnyaa = [
  ProdukModel(
    image: "assets/images/produk1.png",
    name: "Cetak XBanner",
    price: 90000,
    rating: 4.6,
    sold: 84,
  ),
  ProdukModel(
    image: "assets/images/produk2.png",
    name: "Cetak XBanner",
    price: 100000,
    rating: 4.6,
    sold: 84,
  ),
  ProdukModel(
    image: "assets/images/produk3.png",
    name: "Cetak XBanner",
    price: 70000,
    rating: 4.6,
    sold: 84,
  ),
  ProdukModel(
    image: "assets/images/produk4.png",
    name: "Cetak XBanner",
    price: 120000,
    rating: 4.6,
    sold: 84,
  ),
  ProdukModel(
    image: "assets/images/produk5.png",
    name: "Cetak XBanner",
    price: 160000,
    rating: 4.6,
    sold: 84,
  ),
  ProdukModel(
    image: "assets/images/produk6.png",
    name: "Cetak XBanner",
    price: 85000,
    rating: 4.6,
    sold: 84,
  ),
];
