// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  ProductTemplate get productTemplate => throw _privateConstructorUsedError;
  CategorySettings get settings => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String? icon,
      String? image,
      String? parentId,
      ProductTemplate productTemplate,
      CategorySettings settings,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});

  $ProductTemplateCopyWith<$Res> get productTemplate;
  $CategorySettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? icon = freezed,
    Object? image = freezed,
    Object? parentId = freezed,
    Object? productTemplate = null,
    Object? settings = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      productTemplate: null == productTemplate
          ? _value.productTemplate
          : productTemplate // ignore: cast_nullable_to_non_nullable
              as ProductTemplate,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CategorySettings,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductTemplateCopyWith<$Res> get productTemplate {
    return $ProductTemplateCopyWith<$Res>(_value.productTemplate, (value) {
      return _then(_value.copyWith(productTemplate: value) as $Val);
    });
  }

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategorySettingsCopyWith<$Res> get settings {
    return $CategorySettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String? icon,
      String? image,
      String? parentId,
      ProductTemplate productTemplate,
      CategorySettings settings,
      @TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime updatedAt});

  @override
  $ProductTemplateCopyWith<$Res> get productTemplate;
  @override
  $CategorySettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? icon = freezed,
    Object? image = freezed,
    Object? parentId = freezed,
    Object? productTemplate = null,
    Object? settings = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      productTemplate: null == productTemplate
          ? _value.productTemplate
          : productTemplate // ignore: cast_nullable_to_non_nullable
              as ProductTemplate,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as CategorySettings,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      this.icon,
      this.image,
      this.parentId,
      required this.productTemplate,
      required this.settings,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? icon;
  @override
  final String? image;
  @override
  final String? parentId;
  @override
  final ProductTemplate productTemplate;
  @override
  final CategorySettings settings;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, description: $description, icon: $icon, image: $image, parentId: $parentId, productTemplate: $productTemplate, settings: $settings, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.productTemplate, productTemplate) ||
                other.productTemplate == productTemplate) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, icon,
      image, parentId, productTemplate, settings, createdAt, updatedAt);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
          {required final String id,
          required final String name,
          required final String description,
          final String? icon,
          final String? image,
          final String? parentId,
          required final ProductTemplate productTemplate,
          required final CategorySettings settings,
          @TimestampConverter() required final DateTime createdAt,
          @TimestampConverter() required final DateTime updatedAt}) =
      _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get icon;
  @override
  String? get image;
  @override
  String? get parentId;
  @override
  ProductTemplate get productTemplate;
  @override
  CategorySettings get settings;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get updatedAt;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductTemplate _$ProductTemplateFromJson(Map<String, dynamic> json) {
  return _ProductTemplate.fromJson(json);
}

/// @nodoc
mixin _$ProductTemplate {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<CustomField> get fields => throw _privateConstructorUsedError;

  /// Serializes this ProductTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductTemplateCopyWith<ProductTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTemplateCopyWith<$Res> {
  factory $ProductTemplateCopyWith(
          ProductTemplate value, $Res Function(ProductTemplate) then) =
      _$ProductTemplateCopyWithImpl<$Res, ProductTemplate>;
  @useResult
  $Res call({String id, String name, List<CustomField> fields});
}

/// @nodoc
class _$ProductTemplateCopyWithImpl<$Res, $Val extends ProductTemplate>
    implements $ProductTemplateCopyWith<$Res> {
  _$ProductTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<CustomField>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductTemplateImplCopyWith<$Res>
    implements $ProductTemplateCopyWith<$Res> {
  factory _$$ProductTemplateImplCopyWith(_$ProductTemplateImpl value,
          $Res Function(_$ProductTemplateImpl) then) =
      __$$ProductTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, List<CustomField> fields});
}

/// @nodoc
class __$$ProductTemplateImplCopyWithImpl<$Res>
    extends _$ProductTemplateCopyWithImpl<$Res, _$ProductTemplateImpl>
    implements _$$ProductTemplateImplCopyWith<$Res> {
  __$$ProductTemplateImplCopyWithImpl(
      _$ProductTemplateImpl _value, $Res Function(_$ProductTemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fields = null,
  }) {
    return _then(_$ProductTemplateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<CustomField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductTemplateImpl implements _ProductTemplate {
  const _$ProductTemplateImpl(
      {required this.id,
      required this.name,
      final List<CustomField> fields = const []})
      : _fields = fields;

  factory _$ProductTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<CustomField> _fields;
  @override
  @JsonKey()
  List<CustomField> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'ProductTemplate(id: $id, name: $name, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_fields));

  /// Create a copy of ProductTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductTemplateImplCopyWith<_$ProductTemplateImpl> get copyWith =>
      __$$ProductTemplateImplCopyWithImpl<_$ProductTemplateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductTemplateImplToJson(
      this,
    );
  }
}

abstract class _ProductTemplate implements ProductTemplate {
  const factory _ProductTemplate(
      {required final String id,
      required final String name,
      final List<CustomField> fields}) = _$ProductTemplateImpl;

  factory _ProductTemplate.fromJson(Map<String, dynamic> json) =
      _$ProductTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<CustomField> get fields;

  /// Create a copy of ProductTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductTemplateImplCopyWith<_$ProductTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomField _$CustomFieldFromJson(Map<String, dynamic> json) {
  return _CustomField.fromJson(json);
}

/// @nodoc
mixin _$CustomField {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  String? get placeholder => throw _privateConstructorUsedError;
  List<dynamic>? get options => throw _privateConstructorUsedError;
  Map<String, dynamic>? get validation => throw _privateConstructorUsedError;
  int get displayOrder => throw _privateConstructorUsedError;
  String? get grouping => throw _privateConstructorUsedError;

  /// Serializes this CustomField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomFieldCopyWith<CustomField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomFieldCopyWith<$Res> {
  factory $CustomFieldCopyWith(
          CustomField value, $Res Function(CustomField) then) =
      _$CustomFieldCopyWithImpl<$Res, CustomField>;
  @useResult
  $Res call(
      {String id,
      String label,
      String type,
      bool required,
      String? placeholder,
      List<dynamic>? options,
      Map<String, dynamic>? validation,
      int displayOrder,
      String? grouping});
}

/// @nodoc
class _$CustomFieldCopyWithImpl<$Res, $Val extends CustomField>
    implements $CustomFieldCopyWith<$Res> {
  _$CustomFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
    Object? required = null,
    Object? placeholder = freezed,
    Object? options = freezed,
    Object? validation = freezed,
    Object? displayOrder = null,
    Object? grouping = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      validation: freezed == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      grouping: freezed == grouping
          ? _value.grouping
          : grouping // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomFieldImplCopyWith<$Res>
    implements $CustomFieldCopyWith<$Res> {
  factory _$$CustomFieldImplCopyWith(
          _$CustomFieldImpl value, $Res Function(_$CustomFieldImpl) then) =
      __$$CustomFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String type,
      bool required,
      String? placeholder,
      List<dynamic>? options,
      Map<String, dynamic>? validation,
      int displayOrder,
      String? grouping});
}

/// @nodoc
class __$$CustomFieldImplCopyWithImpl<$Res>
    extends _$CustomFieldCopyWithImpl<$Res, _$CustomFieldImpl>
    implements _$$CustomFieldImplCopyWith<$Res> {
  __$$CustomFieldImplCopyWithImpl(
      _$CustomFieldImpl _value, $Res Function(_$CustomFieldImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
    Object? required = null,
    Object? placeholder = freezed,
    Object? options = freezed,
    Object? validation = freezed,
    Object? displayOrder = null,
    Object? grouping = freezed,
  }) {
    return _then(_$CustomFieldImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool,
      placeholder: freezed == placeholder
          ? _value.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      validation: freezed == validation
          ? _value._validation
          : validation // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      grouping: freezed == grouping
          ? _value.grouping
          : grouping // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomFieldImpl implements _CustomField {
  const _$CustomFieldImpl(
      {required this.id,
      required this.label,
      required this.type,
      this.required = false,
      this.placeholder,
      final List<dynamic>? options,
      final Map<String, dynamic>? validation,
      this.displayOrder = 0,
      this.grouping})
      : _options = options,
        _validation = validation;

  factory _$CustomFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomFieldImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String type;
  @override
  @JsonKey()
  final bool required;
  @override
  final String? placeholder;
  final List<dynamic>? _options;
  @override
  List<dynamic>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _validation;
  @override
  Map<String, dynamic>? get validation {
    final value = _validation;
    if (value == null) return null;
    if (_validation is EqualUnmodifiableMapView) return _validation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int displayOrder;
  @override
  final String? grouping;

  @override
  String toString() {
    return 'CustomField(id: $id, label: $label, type: $type, required: $required, placeholder: $placeholder, options: $options, validation: $validation, displayOrder: $displayOrder, grouping: $grouping)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality()
                .equals(other._validation, _validation) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.grouping, grouping) ||
                other.grouping == grouping));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      type,
      required,
      placeholder,
      const DeepCollectionEquality().hash(_options),
      const DeepCollectionEquality().hash(_validation),
      displayOrder,
      grouping);

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomFieldImplCopyWith<_$CustomFieldImpl> get copyWith =>
      __$$CustomFieldImplCopyWithImpl<_$CustomFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomFieldImplToJson(
      this,
    );
  }
}

abstract class _CustomField implements CustomField {
  const factory _CustomField(
      {required final String id,
      required final String label,
      required final String type,
      final bool required,
      final String? placeholder,
      final List<dynamic>? options,
      final Map<String, dynamic>? validation,
      final int displayOrder,
      final String? grouping}) = _$CustomFieldImpl;

  factory _CustomField.fromJson(Map<String, dynamic> json) =
      _$CustomFieldImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get type;
  @override
  bool get required;
  @override
  String? get placeholder;
  @override
  List<dynamic>? get options;
  @override
  Map<String, dynamic>? get validation;
  @override
  int get displayOrder;
  @override
  String? get grouping;

  /// Create a copy of CustomField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomFieldImplCopyWith<_$CustomFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategorySettings _$CategorySettingsFromJson(Map<String, dynamic> json) {
  return _CategorySettings.fromJson(json);
}

/// @nodoc
mixin _$CategorySettings {
  bool get isActive => throw _privateConstructorUsedError;
  bool get requiresApproval => throw _privateConstructorUsedError;
  bool get allowCustomPricing => throw _privateConstructorUsedError;
  int get displayOrder => throw _privateConstructorUsedError;

  /// Serializes this CategorySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategorySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategorySettingsCopyWith<CategorySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySettingsCopyWith<$Res> {
  factory $CategorySettingsCopyWith(
          CategorySettings value, $Res Function(CategorySettings) then) =
      _$CategorySettingsCopyWithImpl<$Res, CategorySettings>;
  @useResult
  $Res call(
      {bool isActive,
      bool requiresApproval,
      bool allowCustomPricing,
      int displayOrder});
}

/// @nodoc
class _$CategorySettingsCopyWithImpl<$Res, $Val extends CategorySettings>
    implements $CategorySettingsCopyWith<$Res> {
  _$CategorySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategorySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? requiresApproval = null,
    Object? allowCustomPricing = null,
    Object? displayOrder = null,
  }) {
    return _then(_value.copyWith(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresApproval: null == requiresApproval
          ? _value.requiresApproval
          : requiresApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCustomPricing: null == allowCustomPricing
          ? _value.allowCustomPricing
          : allowCustomPricing // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorySettingsImplCopyWith<$Res>
    implements $CategorySettingsCopyWith<$Res> {
  factory _$$CategorySettingsImplCopyWith(_$CategorySettingsImpl value,
          $Res Function(_$CategorySettingsImpl) then) =
      __$$CategorySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isActive,
      bool requiresApproval,
      bool allowCustomPricing,
      int displayOrder});
}

/// @nodoc
class __$$CategorySettingsImplCopyWithImpl<$Res>
    extends _$CategorySettingsCopyWithImpl<$Res, _$CategorySettingsImpl>
    implements _$$CategorySettingsImplCopyWith<$Res> {
  __$$CategorySettingsImplCopyWithImpl(_$CategorySettingsImpl _value,
      $Res Function(_$CategorySettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategorySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isActive = null,
    Object? requiresApproval = null,
    Object? allowCustomPricing = null,
    Object? displayOrder = null,
  }) {
    return _then(_$CategorySettingsImpl(
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresApproval: null == requiresApproval
          ? _value.requiresApproval
          : requiresApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCustomPricing: null == allowCustomPricing
          ? _value.allowCustomPricing
          : allowCustomPricing // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorySettingsImpl implements _CategorySettings {
  const _$CategorySettingsImpl(
      {this.isActive = true,
      this.requiresApproval = false,
      this.allowCustomPricing = false,
      this.displayOrder = 0});

  factory _$CategorySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorySettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool requiresApproval;
  @override
  @JsonKey()
  final bool allowCustomPricing;
  @override
  @JsonKey()
  final int displayOrder;

  @override
  String toString() {
    return 'CategorySettings(isActive: $isActive, requiresApproval: $requiresApproval, allowCustomPricing: $allowCustomPricing, displayOrder: $displayOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySettingsImpl &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.requiresApproval, requiresApproval) ||
                other.requiresApproval == requiresApproval) &&
            (identical(other.allowCustomPricing, allowCustomPricing) ||
                other.allowCustomPricing == allowCustomPricing) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isActive, requiresApproval,
      allowCustomPricing, displayOrder);

  /// Create a copy of CategorySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySettingsImplCopyWith<_$CategorySettingsImpl> get copyWith =>
      __$$CategorySettingsImplCopyWithImpl<_$CategorySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorySettingsImplToJson(
      this,
    );
  }
}

abstract class _CategorySettings implements CategorySettings {
  const factory _CategorySettings(
      {final bool isActive,
      final bool requiresApproval,
      final bool allowCustomPricing,
      final int displayOrder}) = _$CategorySettingsImpl;

  factory _CategorySettings.fromJson(Map<String, dynamic> json) =
      _$CategorySettingsImpl.fromJson;

  @override
  bool get isActive;
  @override
  bool get requiresApproval;
  @override
  bool get allowCustomPricing;
  @override
  int get displayOrder;

  /// Create a copy of CategorySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySettingsImplCopyWith<_$CategorySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
