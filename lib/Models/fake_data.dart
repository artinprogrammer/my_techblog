import 'package:tec_blog/gen/assets.gen.dart';
import 'data_models.dart';

Map homePagePosterMap = {
  "imageAsset": Assets.images.programming.path,
  "writter": "ملیکا عزیزی",
  "date": "یک روز پیش",
  "title": "دوازده قدم برنامه نویسی یک دوره",
  "view": "251"
};
// blog fake data

List<HashTagModel> tagList = [
  HashTagModel(title: "جاوا"),
  HashTagModel(title: "کاتلین"),
  HashTagModel(title: "وب"),
  HashTagModel(title: "هوش مصنوعی"),
  HashTagModel(title: "iot"),
  HashTagModel(title: "دارت"),
];

List<BlogModel> blogList = [
  BlogModel(
      id: 1,
      imageUrl:
          "https://cdn1.epicgames.com/400347196e674de89c23cc2a7f2121db/offer/AC%20KINGDOM%20PREORDER_STANDARD%20EDITION_EPIC_Key_Art_Portrait_640x854-640x854-288120c5573756cb988b6c1968cebd86.png",
      title: "معرفی بازی اساسینز کرید والهالا",
      writter: "جواد تاجی",
      writterImageUrl:
          "https://bestprofilepictures.com/wp-content/uploads/2021/04/Cool-Profile-Picture-986x1024.jpg",
      date: "1 ساعت پیش",
      content: """
      اساسینز کرید والهالا (انگلیسی: Assassin's Creed: Valhalla) یک بازی ویدئویی در سبک اکشن-ماجراجویی، نقش‌آفرینی و مخفی‌کاری است که توسط یوبی‌سافت و ۱۴ استودیوی بازی‌سازی دیگر در سال ۲۰۲۰ برای سکوهای پلی‌استیشن ۴، پلی‌استیشن ۵، ایکس‌باکس وان، ایکس‌باکس سری ایکس، گوگل استدیا و مایکروسافت ویندوز منتشر شد.
این بازی بیست و یکمین قسمت از مجموعه بازی‌های اساسینز کرید و نهمین قسمت از مجموعه اصلی پس از بازی اساسینز کرید ادیسه محسوب می‌شود. داستان بازی در۸۷۳ میلادی و در زمان حملات وایکینگ‌ها به بریتانیا اتفاق می‌افتد. داستان و بسیاری از اتفاقات بازی در سرزمین‌های اسکاندیناوی و بریتانیا رخ می‌دهند. در این بازی همانند نسخهٔ قبلی خود امکان انتخاب بین دو شخصیت زن و مرد وجود دارد. به گفته سازندگان شخصیت اصلی اِیوُر نام دارد.
      """,
      views: "256")
];
