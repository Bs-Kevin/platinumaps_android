import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const platformViewType = "com.example.platinumaps_app/pm-webview";
const platformViewCreationParams = {"pm_path": "japan100"};

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(children: [Expanded(child: PmWebView())]),
    );
  }
}

class PmWebView extends StatelessWidget {
  const PmWebView({super.key});

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return const PmWebViewAndroid();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const PmWebViewIos();
    }
    return Text('$defaultTargetPlatform is not yet supported by this plugin');
  }
}

class PmWebViewAndroid extends StatelessWidget {
  const PmWebViewAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: platformViewType,
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<TapGestureRecognizer>(() => TapGestureRecognizer()),
            Factory<LongPressGestureRecognizer>(
              () => LongPressGestureRecognizer(),
            ),
            Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
            Factory<HorizontalDragGestureRecognizer>(
              () => HorizontalDragGestureRecognizer(),
            ),
            Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()),
          },
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (params) {
        return PlatformViewsService.initSurfaceAndroidView(
            id: params.id,
            viewType: params.viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: platformViewCreationParams,
            creationParamsCodec: const StandardMessageCodec(),
            onFocus: () {
              params.onFocusChanged(true);
            },
          )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }
}

class PmWebViewIos extends StatelessWidget {
  const PmWebViewIos({super.key});

  @override
  Widget build(BuildContext context) {
    return const UiKitView(
      viewType: platformViewType,
      layoutDirection: TextDirection.ltr,
      creationParams: platformViewCreationParams,
      creationParamsCodec: StandardMessageCodec(),
    );
  }
}
