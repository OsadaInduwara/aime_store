// lib/core/data/models/category_model.dart
import 'user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    required String description,
    String? icon,
    String? image,
    String? parentId,
    required ProductTemplate productTemplate,
    required CategorySettings settings,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}

@freezed
class ProductTemplate with _$ProductTemplate {
  const factory ProductTemplate({
    required String id,
    required String name,
    @Default([]) List<CustomField> fields,
  }) = _ProductTemplate;

  factory ProductTemplate.fromJson(Map<String, dynamic> json) => _$ProductTemplateFromJson(json);
}

@freezed
class CustomField with _$CustomField {
  const factory CustomField({
    required String id,
    required String label,
    required String type,
    @Default(false) bool required,
    String? placeholder,
    List<dynamic>? options,
    Map<String, dynamic>? validation,
    @Default(0) int displayOrder,
    String? grouping,
  }) = _CustomField;

  factory CustomField.fromJson(Map<String, dynamic> json) => _$CustomFieldFromJson(json);
}

@freezed
class CategorySettings with _$CategorySettings {
  const factory CategorySettings({
    @Default(true) bool isActive,
    @Default(false) bool requiresApproval,
    @Default(false) bool allowCustomPricing,
    @Default(0) int displayOrder,
    @Default(false) bool isPopular,
    @Default(true) bool allowsCustomFields,
    @Default(1000) int maxProductsPerStore,
  }) = _CategorySettings;

  factory CategorySettings.fromJson(Map<String, dynamic> json) => _$CategorySettingsFromJson(json);
}
