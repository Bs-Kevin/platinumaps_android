part of "platinumaps_view.dart";

class IosPlatinumapsView extends StatelessWidget {
  const IosPlatinumapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const UiKitView(
      viewType: nativeViewType,
      layoutDirection: TextDirection.ltr,
      creationParams: nativeViewCreationParams,
      creationParamsCodec: StandardMessageCodec(),
    );
  }
}
