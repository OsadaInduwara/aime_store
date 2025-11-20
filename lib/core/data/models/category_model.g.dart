// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String?,
      image: json['image'] as String?,
      parentId: json['parentId'] as String?,
      productTemplate: ProductTemplate.fromJson(
          json['productTemplate'] as Map<String, dynamic>),
      settings:
          CategorySettings.fromJson(json['settings'] as Map<String, dynamic>),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'image': instance.image,
      'parentId': instance.parentId,
      'productTemplate': instance.productTemplate,
      'settings': instance.settings,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

_$ProductTemplateImpl _$$ProductTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductTemplateImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => CustomField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductTemplateImplToJson(
        _$ProductTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fields': instance.fields,
    };

_$CustomFieldImpl _$$CustomFieldImplFromJson(Map<String, dynamic> json) =>
    _$CustomFieldImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      type: json['type'] as String,
      required: json['required'] as bool? ?? false,
      placeholder: json['placeholder'] as String?,
      options: json['options'] as List<dynamic>?,
      validation: json['validation'] as Map<String, dynamic>?,
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      grouping: json['grouping'] as String?,
    );

Map<String, dynamic> _$$CustomFieldImplToJson(_$CustomFieldImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': instance.type,
      'required': instance.required,
      'placeholder': instance.placeholder,
      'options': instance.options,
      'validation': instance.validation,
      'displayOrder': instance.displayOrder,
      'grouping': instance.grouping,
    };

_$CategorySettingsImpl _$$CategorySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$CategorySettingsImpl(
      isActive: json['isActive'] as bool? ?? true,
      requiresApproval: json['requiresApproval'] as bool? ?? false,
      allowCustomPricing: json['allowCustomPricing'] as bool? ?? false,
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      isPopular: json['isPopular'] as bool? ?? false,
      allowsCustomFields: json['allowsCustomFields'] as bool? ?? true,
      maxProductsPerStore:
          (json['maxProductsPerStore'] as num?)?.toInt() ?? 1000,
    );

Map<String, dynamic> _$$CategorySettingsImplToJson(
        _$CategorySettingsImpl instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'requiresApproval': instance.requiresApproval,
      'allowCustomPricing': instance.allowCustomPricing,
      'displayOrder': instance.displayOrder,
      'isPopular': instance.isPopular,
      'allowsCustomFields': instance.allowsCustomFields,
      'maxProductsPerStore': instance.maxProductsPerStore,
    };
