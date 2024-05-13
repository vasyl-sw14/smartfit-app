/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Workout type in your schema. */
@immutable
class Workout extends Model {
  static const classType = const _WorkoutModelType();
  final String id;
  final ExerciseType? _exerciseType;
  final String? _userId;
  final Status? _processing_status;
  final List<int>? _results_bottom;
  final List<int>? _results_top;
  final List<int>? _estimation_top;
  final List<int>? _estimation_bottom;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  WorkoutModelIdentifier get modelIdentifier {
      return WorkoutModelIdentifier(
        id: id
      );
  }
  
  ExerciseType get exerciseType {
    try {
      return _exerciseType!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Status get processing_status {
    try {
      return _processing_status!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<int>? get results_bottom {
    return _results_bottom;
  }
  
  List<int>? get results_top {
    return _results_top;
  }
  
  List<int>? get estimation_top {
    return _estimation_top;
  }
  
  List<int>? get estimation_bottom {
    return _estimation_bottom;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Workout._internal({required this.id, required exerciseType, required userId, required processing_status, results_bottom, results_top, estimation_top, estimation_bottom, createdAt, updatedAt}): _exerciseType = exerciseType, _userId = userId, _processing_status = processing_status, _results_bottom = results_bottom, _results_top = results_top, _estimation_top = estimation_top, _estimation_bottom = estimation_bottom, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Workout({String? id, required ExerciseType exerciseType, required String userId, required Status processing_status, List<int>? results_bottom, List<int>? results_top, List<int>? estimation_top, List<int>? estimation_bottom}) {
    return Workout._internal(
      id: id == null ? UUID.getUUID() : id,
      exerciseType: exerciseType,
      userId: userId,
      processing_status: processing_status,
      results_bottom: results_bottom != null ? List<int>.unmodifiable(results_bottom) : results_bottom,
      results_top: results_top != null ? List<int>.unmodifiable(results_top) : results_top,
      estimation_top: estimation_top != null ? List<int>.unmodifiable(estimation_top) : estimation_top,
      estimation_bottom: estimation_bottom != null ? List<int>.unmodifiable(estimation_bottom) : estimation_bottom);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Workout &&
      id == other.id &&
      _exerciseType == other._exerciseType &&
      _userId == other._userId &&
      _processing_status == other._processing_status &&
      DeepCollectionEquality().equals(_results_bottom, other._results_bottom) &&
      DeepCollectionEquality().equals(_results_top, other._results_top) &&
      DeepCollectionEquality().equals(_estimation_top, other._estimation_top) &&
      DeepCollectionEquality().equals(_estimation_bottom, other._estimation_bottom);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Workout {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("exerciseType=" + (_exerciseType != null ? enumToString(_exerciseType)! : "null") + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("processing_status=" + (_processing_status != null ? enumToString(_processing_status)! : "null") + ", ");
    buffer.write("results_bottom=" + (_results_bottom != null ? _results_bottom!.toString() : "null") + ", ");
    buffer.write("results_top=" + (_results_top != null ? _results_top!.toString() : "null") + ", ");
    buffer.write("estimation_top=" + (_estimation_top != null ? _estimation_top!.toString() : "null") + ", ");
    buffer.write("estimation_bottom=" + (_estimation_bottom != null ? _estimation_bottom!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Workout copyWith({ExerciseType? exerciseType, String? userId, Status? processing_status, List<int>? results_bottom, List<int>? results_top, List<int>? estimation_top, List<int>? estimation_bottom}) {
    return Workout._internal(
      id: id,
      exerciseType: exerciseType ?? this.exerciseType,
      userId: userId ?? this.userId,
      processing_status: processing_status ?? this.processing_status,
      results_bottom: results_bottom ?? this.results_bottom,
      results_top: results_top ?? this.results_top,
      estimation_top: estimation_top ?? this.estimation_top,
      estimation_bottom: estimation_bottom ?? this.estimation_bottom);
  }
  
  Workout.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _exerciseType = enumFromString<ExerciseType>(json['exerciseType'], ExerciseType.values),
      _userId = json['userId'],
      _processing_status = enumFromString<Status>(json['processing_status'], Status.values),
      _results_bottom = (json['results_bottom'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _results_top = (json['results_top'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _estimation_top = (json['estimation_top'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _estimation_bottom = (json['estimation_bottom'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'exerciseType': enumToString(_exerciseType), 'userId': _userId, 'processing_status': enumToString(_processing_status), 'results_bottom': _results_bottom, 'results_top': _results_top, 'estimation_top': _estimation_top, 'estimation_bottom': _estimation_bottom, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'exerciseType': _exerciseType, 'userId': _userId, 'processing_status': _processing_status, 'results_bottom': _results_bottom, 'results_top': _results_top, 'estimation_top': _estimation_top, 'estimation_bottom': _estimation_bottom, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<WorkoutModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<WorkoutModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField EXERCISETYPE = QueryField(fieldName: "exerciseType");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField PROCESSING_STATUS = QueryField(fieldName: "processing_status");
  static final QueryField RESULTS_BOTTOM = QueryField(fieldName: "results_bottom");
  static final QueryField RESULTS_TOP = QueryField(fieldName: "results_top");
  static final QueryField ESTIMATION_TOP = QueryField(fieldName: "estimation_top");
  static final QueryField ESTIMATION_BOTTOM = QueryField(fieldName: "estimation_bottom");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Workout";
    modelSchemaDefinition.pluralName = "Workouts";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Workout.EXERCISETYPE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Workout.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Workout.PROCESSING_STATUS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Workout.RESULTS_BOTTOM,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.int))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Workout.RESULTS_TOP,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.int))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Workout.ESTIMATION_TOP,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.int))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Workout.ESTIMATION_BOTTOM,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.int))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _WorkoutModelType extends ModelType<Workout> {
  const _WorkoutModelType();
  
  @override
  Workout fromJson(Map<String, dynamic> jsonData) {
    return Workout.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Workout';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Workout] in your schema.
 */
@immutable
class WorkoutModelIdentifier implements ModelIdentifier<Workout> {
  final String id;

  /** Create an instance of WorkoutModelIdentifier using [id] the primary key. */
  const WorkoutModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'WorkoutModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is WorkoutModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}