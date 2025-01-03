import 'package:teste_clicker/data/models/value_modifier_model.dart';
import 'package:teste_clicker/data/services/value_modifier_service.dart';

class ValueModifierRepository {
  final ValueModifierService service;

  const ValueModifierRepository(this.service);

  Future<List<ValueModifierModel>> getValueModifiers() async {
    return service.getModifiers();
  }

  Future<void> addValueModifier(ValueModifierModel modifier) async {
    return service.addModifier(modifier);
  }
}
