import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
class HomeModel with _$HomeModel {

  factory HomeModel({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "imageUrl") final String? image,
    @JsonKey(name: "placeCount") final num? placeCount,
    @JsonKey(name: "shortDescription") final String? shortDescription,
    @JsonKey(name: "description") final String? description,

  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
}