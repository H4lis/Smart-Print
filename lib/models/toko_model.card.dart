class TokoModel {
  final String image;
  final String name;
  final String description;
  final double rating;
  final int sold;
  final String alamat;
  final String alamatDetail;

  TokoModel(
      {required this.image,
      required this.name,
      required this.description,
      required this.rating,
      required this.sold,
      required this.alamat,
      required this.alamatDetail});
}

List<TokoModel> tokoTerdekat = [
  TokoModel(
      image: "assets/images/Toko1.png",
      name: "Vandis Printing",
      description: "Percetakan & Banner custom hadiah, ganci, tumbler, plakat",
      rating: 4.6,
      sold: 34,
      alamat: "Jl. Saumata Indah",
      alamatDetail: "12, Somba Opu Gowa, Sulawesi Selatan"),
  TokoModel(
      image: "assets/images/Toko2.png",
      name: "CetakSukaSuka",
      description:
          "Cetak/cutting sticker a3+ undangan, kalender, buku/nota, kemasan, banner, huruf timbul, paperbag",
      rating: 4.6,
      sold: 34,
      alamat: "Jl. Sungai Saddang",
      alamatDetail: "Baru 11C Makassar Sulawesi Selatan"),
];
