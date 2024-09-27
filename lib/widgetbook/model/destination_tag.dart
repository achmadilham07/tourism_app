import 'package:flutter/widgets.dart';
import 'package:tourism_app/destinations/model/destination.dart';
import 'package:tourism_app/widgetbook/widgetbook.dart';

final Destination bandaNeiraDestination = Destination(
  id: 123,
  name: "Banda Neira",
  description:
      "Banda Neira menawarkan keindahan alam yang menakjubkan. Pulau-pulau di sekitarnya dikelilingi oleh air laut yang jernih dan berwarna biru kehijauan. Snorkeling dan menyelam di perairan ini akan memperkenalkan Anda pada keanekaragaman hayati bawah laut yang memukau, termasuk terumbu karang yang indah dan ikan-ikan warna-warni. Jangan lewatkan pula Gunung Api, sebuah gunung berapi yang menjulang tinggi dan dapat diakses dengan mendaki. Dari puncaknya, Anda akan disuguhi panorama luar biasa dari kepulauan ini. Banda Neira adalah tempat di mana sejarah dan keindahan alam berkumpul, menjadikannya destinasi wisata yang mempesona bagi para pengunjung yang mencari petualangan dan keunikan.",
  address: "Kepulauan Banda, Maluku",
  longitude: 129.9167,
  latitude: -4.5333,
  like: 103,
  image:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Bandaneira-0039.JPG/1600px-Bandaneira-0039.JPG",
);

final Destination danauTobaDestination = Destination(
  id: 2,
  name: "Danau Toba",
  description:
      "Danau Toba adalah lokasi letusan gunung berapi super masif berkekuatan VEI 8 sekitar 69.000 sampai 77.000 tahun yang lalu yang memicu perubahan iklim global. Metode penanggalan terkini menetapkan bahwa 74.000 tahun yang lalu lebih akurat. Letusan ini merupakan letusan eksplosif terbesar di Bumi dalam kurun 25 juta tahun terakhir. Menurut teori bencana Toba, letusan ini berdampak besar bagi populasi manusia di seluruh dunia; dampak letusan menewaskan sebagian besar manusia yang hidup waktu itu dan diyakini menyebabkan penyusutan populasi di Afrika timur tengah dan India sehingga memengaruhi genetika populasi manusia di seluruh dunia sampai sekarang.",
  address: "Kota Pematang Siantar, Sumatera Utara",
  longitude: 98.8932576,
  latitude: 2.6540427,
  like: 12,
  image:
      "https://cdn.pixabay.com/photo/2016/12/09/11/51/lake-toba-1894746_960_720.jpg",
);

final Destination bromoDestination = Destination(
  id: 3,
  name: "Gunung Bromo",
  description:
      "Gunung Bromo (dari bahasa Sanskerta: Brahma, salah seorang Dewa Utama dalam agama Hindu) atau dalam bahasa Tengger dieja \"Brama\", adalah sebuah gunung berapi aktif di Jawa Timur, Indonesia. Gunung ini memiliki ketinggian 2.329 meter di atas permukaan laut dan berada dalam empat wilayah kabupaten, yakni Kabupaten Probolinggo, Kabupaten Pasuruan, Kabupaten Lumajang, dan Kabupaten Malang. Gunung Bromo terkenal sebagai objek wisata utama di Jawa Timur. Sebagai sebuah objek wisata, Bromo menjadi menarik karena statusnya sebagai gunung berapi yang masih aktif. Gunung Bromo termasuk dalam kawasan Taman Nasional Bromo Tengger Semeru.\n\nBentuk tubuh Gunung Bromo bertautan antara lembah dan ngarai dengan kaldera atau lautan pasir seluas sekitar 10 kilometer persegi. Ia mempunyai sebuah kawah dengan garis tengah ± 800 meter (utara-selatan) dan ± 600 meter (timur-barat). Sedangkan daerah bahayanya berupa lingkaran dengan jari-jari 4 km dari pusat kawah Bromo.",
  address: "Podokoyo, Tosari, Pasuruan",
  longitude: 112.9355026,
  latitude: -7.9424931,
  like: 88,
  image:
      "https://images.unsplash.com/photo-1505993597083-3bd19fb75e57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1354&q=80",
);

final Destination bunakenDestination = Destination(
  id: 4,
  name: "Bunaken",
  description:
      "Bunaken adalah sebuah pulau seluas 8,08 km² di Teluk Manado, yang terletak di utara pulau Sulawesi, Indonesia. Pulau ini merupakan bagian dari kota Manado, ibu kota provinsi Sulawesi Utara, Indonesia. Pulau Bunaken dapat di tempuh dengan kapal cepat (speed boat) atau kapal sewaan dengan perjalanan sekitar 30 menit dari pelabuhan kota Manado. Di sekitar pulau Bunaken terdapat taman laut Bunaken yang merupakan bagian dari Taman Nasional Bunaken. Taman laut ini memiliki biodiversitas kelautan salah satu yang tertinggi di dunia. Selam scuba menarik banyak pengunjung ke pulau ini. Secara keseluruhan taman laut Bunaken meliputi area seluas 75.265 hektare dengan lima pulau yang berada di dalamnya, yakni Pulau Manado Tua (Manarauw), Pulau Bunaken, Pulau Siladen, Pulau Mantehage berikut beberapa anak pulaunya, dan Pulau Naen. Meskipun meliputi area 75.265 hektare, lokasi penyelaman (diving) hanya terbatas di masing-masing pantai yang mengelilingi kelima pulau itu.",
  address: "Bunaken, Kabupaten Minahasa, Sulawesi Utara.",
  longitude: 124.7601806,
  latitude: 1.6231908,
  like: 60,
  image:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Sunset_at_Bunaken_Island%2C_Sulawesi%2C_2016.jpg/800px-Sunset_at_Bunaken_Island%2C_Sulawesi%2C_2016.jpg",
);

final destinations = [
  bandaNeiraDestination,
  danauTobaDestination,
  bromoDestination,
  bunakenDestination,
];

Destination customDestination(BuildContext context) {
  return Destination(
    id: 123,
    name: context.knobs.string(
      label: "Name",
      initialValue: bandaNeiraDestination.name,
    ),
    description: context.knobs.string(
      label: "Description",
      initialValue: bandaNeiraDestination.description,
      maxLines: 4,
    ),
    address: context.knobs.string(
      label: "Address",
      initialValue: bandaNeiraDestination.address,
    ),
    longitude: context.knobs.double.input(
      label: "Longitude",
      initialValue: bandaNeiraDestination.longitude,
    ),
    latitude: context.knobs.double.input(
      label: "Latitude",
      initialValue: bandaNeiraDestination.latitude,
    ),
    like: context.knobs.int.slider(
      label: "Likes",
      initialValue: bandaNeiraDestination.like,
      min: 1,
      max: 9999,
    ),
    image: context.knobs.list(
      label: "Image",
      options: listOfPhoto
          .map(
            (tag) => tag.photoUrl,
          )
          .toList(),
      initialOption: bandaNeiraDestination.image,
      labelBuilder: (url) =>
          listOfPhoto.firstWhere((tag) => tag.photoUrl == url).name,
    ),
  );
}
