import 'package:get/get.dart';

class LocalizationLabels extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {"su": "Poudel"},
        'np_NP': {"su": "पौडेल"}
      };
}


// Translation that lies on firebase
/*
{
  "en_US": {
    "su": "Subarna"
  },
  "np_NP": {
    "su": "सुबर्ण"
  }
}
*/