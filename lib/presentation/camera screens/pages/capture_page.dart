import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nst_app/bloc/styling_bloc/styling_bloc.dart';
import 'package:nst_app/constants/route_constants.dart';
import 'package:nst_app/constants/styles_constants.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/capture_bar.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/style_bar.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/style_name_tag.dart';
import 'package:nst_app/presentation/camera%20screens/widgets/vertical_navbar.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;

  late ImagePicker imagePicker;

  XFile? _contentImage;

  // final _styles = styles;
  final _styleName = ValueNotifier<String>('Original');

  @override
  void initState() {
    super.initState();
    _startCamera();
  }

  void _startCamera() async {
    _cameras = await availableCameras();

    _cameraController = CameraController(
      _cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _onStyleChanged(String? value) {
    _styleName.value = value!;
  }

  Future<XFile?> _pickImageFromGallery() async {
    final selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    return selectedImage;
  }

  void _toggleCamera() async {
    int currentCameraIndex = _cameras.indexOf(_cameraController.description);
    int nextCameraIndex = (currentCameraIndex + 1) % _cameras.length;
    CameraDescription nextCamera = _cameras[nextCameraIndex];

    _cameraController = CameraController(nextCamera, ResolutionPreset.medium);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: CameraPreview(
        _cameraController,
        child: Center(
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: StyleNameTag(styleName: _styleName),
                  )),
              const Flexible(
                fit: FlexFit.loose,
                flex: 4,
                child: Align(
                  alignment: Alignment.topRight,
                  child: VerticalNavBar(),
                ),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Stack(
                  children: [
                    _buildBGGradient(),
                    Column(
                      children: [
                        //Style Bar
                        _buildStyleBar(),

                        //Capture Bar
                        _buildCaptureBar(),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBGGradient() {
    return const SizedBox(
      height: 300,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
          ),
        ),
        child: SizedBox.expand(),
      ),
    );
  }

  Widget _buildStyleBar() {
    return StyleBar(
      styles: styles,
      onStyleChanged: _onStyleChanged,
    );
  }

  Widget _buildCaptureBar() {
    final stylingReset = BlocProvider.of<StylingBloc>(context);
    return CaptureBar(
      onTapCaptureButton: () {
        _cameraController.takePicture().then((XFile? selectedImage) {
          if (mounted) {
            if (selectedImage != null) {
              stylingReset.add(StylingDeleted());
              context.pushNamed(RouteConstants.styling,
                  pathParameters: {"content": selectedImage.path});
            }
          }
        });
      },
      onTapGalleryButton: () {
        setState(() {
          _contentImage = _pickImageFromGallery() as XFile?;
        });
      },
      onTapToggleButton: _toggleCamera,
    );
  }
}
