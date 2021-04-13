library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:practice_arch/model/product.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  Product,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
