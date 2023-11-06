import 'package:mini_post_video/app/main_feature/domain/entities/meta_data_entity.dart';

class Metadata {
  String? currentPage;
  int? perPage;
  int? pageCount;
  int? totalCount;

  Metadata({
    this.currentPage,
    this.perPage,
    this.pageCount,
    this.totalCount,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentPage: json["current_page"],
        perPage: json["per_page"],
        pageCount: json["page_count"],
        totalCount: json["total_count"],
      );

  MetaDataEntity toEntity() => MetaDataEntity(
        currentPage: currentPage,
        perPage: perPage,
        pageCount: pageCount,
        totalCount: totalCount,
      );
}
