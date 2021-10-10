class PopularModel {
  String id;
  String name;
  String description;
  String location;
  String address;
  String open;
  String ticket;
  String image;

  PopularModel(this.id, this.name, this.description, this.location,
      this.address, this.open, this.ticket, this.image);
}

List<PopularModel> populars = popularData
    .map((item) => PopularModel(
        item['id'].toString(),
        item['name'].toString(),
        item['description'].toString(),
        item['location'].toString(),
        item['address'].toString(),
        item['open'].toString(),
        item['ticket'].toString(),
        item['image'].toString()))
    .toList();

var popularData = [
  {
    "id": "1",
    "name": "Jendela Langit",
    "description":
        "Jendela Langit Prigen merupakan inovasi baru wisata alam di Pasuruan yang menawarkan keindahan dan kenyamanan bagi wisatawan yang berkunjung. Panorama alam yang tersaji di wisata ini sangat mempesona, suasananya asri, serta dilengkapi dengan beragam spot foto Instagramable yang bikin betah liburan seharian di tempat wisata ini. Jendela Langit ini tergolong dalam daftar tempat wisata baru di Pasuruan. Hadir dengan konsep wisata alam perbukitan yang menawarkan pesona keindahan alam Gunung Arjuno menjadi ciri khas dan keindahan yang memanjakan mata. Siapa saja yang berada di tempat wisata ini pasti terpana dengan suguhan keindahan alamnya. Berada di lereng Gunung Arjuno dan Gunung Ringgit menjadikan tempat wisata ini memiliki suasana yang asri dan sejuk. Tentu cocok sekali tempat wisata ini dijadikan sebagai destinasi liburan.",
    "location": "Prigen, Pasuruan",
    "address": "Talunongko, Prigen, Pasuruan",
    "open": "24 jam",
    "ticket": "Rp. 10.000/orang",
    "image": "assets/images/jendelalangit.jpg",
  },
  {
    "id": "2",
    "name": "Taman Safari II Prigen",
    "description":
        "Ingin obyek wisata yang bisa dinikmati oleh seluruh keluarga termasuk anak-anak juga? Langsung saja berangkat ke Taman Safari Prigen yang namanya juga sudah terkenal tidak hanya se-Pasuruan namun se-Indonesia. Saat hari libur dan akhir pekan, sudah bisa dipastikan tempat ini akan ramai dengan wisatawan dari dalam maupun luar negeri. Tempat wisata ini mempunyai konsep yang sama dengan Taman Safari I. Anda dapat mengelilingi kawasan wisata Taman Safari Prigen II ini dengan menggunakan mobil pribadi atau juga bus wisata dan melihat secara langsung hewan-hewan yang dilepas bebas di kawasan ini. Udara yang ada di kawasan ini memang sejuk karena berada di lereng gunung Arjuna pada ketinggian 800 mdpl, tempat ini menjadi salah satu tempat yang nyaman untuk anda kunjungi bersama keluarga maupun teman-teman.",
    "location": "Prigen, Pasuruan",
    "address": "Desa Jatiarjo RT.12/RW.06, Prigen, Pasuruan, Jawa Timur 67157",
    "open": "Jam 08.00 - 19.00",
    "ticket": "Rp 70.000/orang",
    "image": "assets/images/tsi.jpg",
  },
  {
    "id": "3",
    "name": "Kedai Matanai",
    "description":
        "Matanai Coffee and Herbs Pasuruan – Pasuruan selalu menghadirkan tempat – tempat menarik untuk dikunjungi apalagi wisata kulinernya tentunya sangat menarik untuk mampir dan bersantai di tempat tersebut, kali ini kami akan menginformasikan ke Anda mengenai tempat ngopi atau wisata kuliner yang viral di kawasan Prigen, Pasuruan, Jawa Timur. Tentunya tempat ini dapat menjadi solusi akhir pekan Anda atau ngobrol santai bersama keluarga, teman maupun pasangan Anda.",
    "location": "Prigen, Pasuruan",
    "address": "Watuagung, Prigen, Pasuruan",
    "open": "Jam 07.00 - 00.00",
    "ticket": "-",
    "image": "assets/images/matanai.jpg",
  },
  {
    "id": "4",
    "name": "Tretes",
    "description":
        "Tempat wisata Tretes adalah sebuah kawasan wisata alam yang sering didatangi oleh para wisatawan baik dari dalam negeri maupun mancanegara. Obyek wisata ini lokasinya berada di kaki gunung Welirang dan juga gunung Arjuna. Jadi tidak heran jika kawasan ini memiliki udara yang sangat sejuk. Panorama yang memang sunguh elok dan udaranya yang segar merupakan daya tarik utama dari tempat wisata ini dan yang menjadikan kawasan ini terkenal serta banyak dikunjungi oleh para wisatawan.",
    "location": "Prigen, Pasuruan",
    "address": "Tretes, Prigen, Pasuruan",
    "open": "24 jam",
    "ticket": "-",
    "image": "assets/images/villa_tretes.jpg",
  },
];
