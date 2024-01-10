import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nst_app/bloc/styling_bloc/styling_bloc.dart';
import 'package:nst_app/constants/styles_constants.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/output_screen_bar.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/style_bar.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/style_name_tag.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/style_page_bar.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/styling_loading_animation.dart';

class StylingPage extends StatefulWidget {
  final String? contentImageUrl;
  const StylingPage({
    super.key,
    required this.contentImageUrl,
  });

  @override
  State<StylingPage> createState() => _StylingPageState();
}

class _StylingPageState extends State<StylingPage> {
  final _styleName = ValueNotifier<String>('Original');

  String? displayImageUrl;

  @override
  void initState() {
    super.initState();
    displayImageUrl = widget.contentImageUrl;
  }

  void _onStyleChanged(String? value) {
    _styleName.value = value!;
  }

  @override
  Widget build(BuildContext context) {
    double blur = 0;
    int currentBarIndex = 0;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(children: [
                BlocBuilder<StylingBloc, StylingState>(
                  builder: (context, state) {
                    if (state is StylingLoading) {
                      blur = 5;
                    }
                    if (state is StylingSuccess) {
                      blur = 0;
                      displayImageUrl = state.outputImageUrl;
                    }
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: blur,
                          sigmaY: blur,
                        ),
                        child: Image.file(
                          File(displayImageUrl!),
                          width: double.infinity,
                          height: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StyleNameTag(
                      styleName: ValueNotifier('Van Gogh'),
                    ),
                  ),
                ),
              ]),
            ),
            BlocBuilder<StylingBloc, StylingState>(
              builder: (context, state) {
                if (state is StylingInitial) {
                  currentBarIndex = 0;
                }
                if (state is StylingLoading) {
                  currentBarIndex = 1;
                }
                if (state is StylingSuccess) {
                  currentBarIndex = 2;
                }
                return IndexedStack(
                  alignment: Alignment.center,
                  index: currentBarIndex,
                  sizing: StackFit.loose,
                  children: [
                    stylePageBottomColumn(),
                    stylingLoadingAnimation(),
                    const OutputScreenBar(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget stylePageBottomColumn() {
    return Column(
      children: [
        StyleBar(
          styles: styles,
          onStyleChanged: _onStyleChanged,
        ),
        StylePageMainBar(
          generateButtonOnTap: () {
            context.read<StylingBloc>().add(StylingRequested(
                contentImageUrl: displayImageUrl!, styleImageUrl: ""));
          },
        ),
      ],
    );
  }

  Widget stylingLoadingAnimation() {
    return const StylingLoadingAnimation(
      selectedStyleImageUrl: 'assets/van_gogh.jpg',
    );
  }
}
