import 'package:teste_clicker/data/models/value_modifier_model.dart';

class ValueModifierService {
  List<ValueModifierModel> modifiers = [];

  Future<List<ValueModifierModel>> getModifiers() async {
    return modifiers;
  }

  Future<void> addModifier(ValueModifierModel modifier) async {
    modifiers.add(modifier);
  }
}
