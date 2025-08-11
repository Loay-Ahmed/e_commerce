import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  static const String _languageKey = 'selected_language';
  String _currentLanguage = "ar";

  String get currentLanguage => _currentLanguage;
  // bool get isRTL => _currentLanguage == "ar";

  Future<void> initCurrentLanguage() async {
    try {
      final pref = await SharedPreferences.getInstance();
      _currentLanguage = pref.getString(_languageKey) ?? 'ar';
      emit(LocalizationChanged());
    } catch (e) {
      emit(LocalizationChangedError());
    }
  }

  Future<void> toggleLanguage() async {
    final newLanguage = _currentLanguage == 'en' ? 'ar' : 'en';
    await changeLanguage(newLanguage);
  }

  Future<void> changeLanguage(String languageCode) async {
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.setString(_languageKey, languageCode);
      _currentLanguage = languageCode;
      emit(LocalizationChanged());
    } catch (e) {
      // Handle error
      emit(LocalizationChangedError());
    }
  }

  bool isRTL() {
    return _currentLanguage == "ar";
  }
}
