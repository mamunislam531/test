class SliderImageListModel {
  List<MySlider>? mySlider;

  SliderImageListModel({this.mySlider});

  SliderImageListModel.fromJson(Map<String, dynamic> json) {
    if (json['mySlider'] != null) {
      mySlider = <MySlider>[];
      json['mySlider'].forEach((v) {
        mySlider!.add(MySlider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mySlider != null) {
      data['mySlider'] = mySlider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MySlider {
  int? sliderId;
  String? sliderImage;

  MySlider({this.sliderId, this.sliderImage});

  MySlider.fromJson(Map<String, dynamic> json) {
    sliderId = json['Slider_id'];
    sliderImage = json['Slider_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Slider_id'] = sliderId;
    data['Slider_image'] = sliderImage;
    return data;
  }
}
