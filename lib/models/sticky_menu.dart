class StickyMenu {
  late List<MainStickyMenu> mainStickyMenu;
  late List<OfferCodeBanner> offerCodeBanner;
  late String status;
  late String message;

  StickyMenu(
      {required this.mainStickyMenu, required this.offerCodeBanner, required this.status, required this.message});

  StickyMenu.fromJson(Map<String, dynamic> json) {
    if (json['main_sticky_menu'] != null) {
      mainStickyMenu = List.empty(growable: true);
      json['main_sticky_menu'].forEach((v) {
        mainStickyMenu.add(MainStickyMenu.fromJson(v));
      });
    }
    if (json['offer_code_banner'] != null) {
      offerCodeBanner =  List.empty(growable: true);
      json['offer_code_banner'].forEach((v) {
        offerCodeBanner.add(OfferCodeBanner.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main_sticky_menu'] =
        mainStickyMenu.map((v) => v.toJson()).toList();
    data['offer_code_banner'] =
        offerCodeBanner.map((v) => v.toJson()).toList();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class MainStickyMenu {
  late final String title;
  late final String image;
  late final String sortOrder;
 late final List<SliderImages> sliderImages;

  MainStickyMenu({required this.title, required this.image, required this.sortOrder, required this.sliderImages});

  MainStickyMenu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    if (json['slider_images'] != null) {
      sliderImages = List.empty(growable: true);
      json['slider_images'].forEach((v) {
        sliderImages.add(SliderImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['sort_order'] = sortOrder;
    data['slider_images'] = sliderImages.map((v) => v.toJson()).toList();
    return data;
  }
}

class SliderImages {
  late String title;
  late String image;
  late String sortOrder;
  late String cta;

  SliderImages({required this.title, required this.image, required this.sortOrder, required this.cta});

  SliderImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    cta = json['cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['sort_order'] = sortOrder;
    data['cta'] = cta;
    return data;
  }
}

class OfferCodeBanner {
 late String bannerImage;
  late String type;

  OfferCodeBanner({required this.bannerImage, required this.type});

  OfferCodeBanner.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_image'] = bannerImage;
    data['type'] = type;
    return data;
  }
}
