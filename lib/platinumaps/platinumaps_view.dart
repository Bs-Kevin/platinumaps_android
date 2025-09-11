import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

part 'android_platinumaps_view.dart';
part 'ios_platinumaps_view.dart';

const nativeViewType = "jp.co.bravesoft.platinumaps/platinumaps_view";
const nativeViewCreationParams = {"pm_path": "japan100"};

class PlatinumapsView extends StatelessWidget {
  const PlatinumapsView({super.key});

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return const AndroidPlatinumapsView();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const IosPlatinumapsView();
    }
    return Text('$defaultTargetPlatform is not yet supported by this plugin');
  }
}
