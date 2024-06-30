import 'package:flutter/material.dart';
import 'package:new_test_task15/domain/usecases/get_result_usecase.dart';
import 'package:new_test_task15/presentation/widgets/loader_widget.dart';
import 'package:shake/shake.dart';
import '../../utils/custom_colors.dart';
import '../../utils/images.dart';
import 'background_widget.dart';

class BallScreen extends StatefulWidget {
  final GetResultUseCase getResultUseCase;

  const BallScreen({super.key, required this.getResultUseCase});

  @override
  State<BallScreen> createState() => _BallScreenState();
}

class _BallScreenState extends State<BallScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  );
  late final AnimationController _secondController;
  late final Animation<double> _animationSecond;
  late ShakeDetector detector;

  String? _message;
  bool _isLoading = false;
  bool _hasError = false;

  @override
  void initState() {
    _secondController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
    _animationSecond = CurvedAnimation(
      parent: _secondController,
      curve: Curves.easeIn,
    );
    detector = ShakeDetector.waitForStart(
      onPhoneShake: () async {
        await _getAnswer();
      },
    );
    detector.startListening();
    super.initState();
  }

  Future<void> _getAnswer() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      final res = await widget.getResultUseCase();
      setState(() {
        _message = res.reading;
        _isLoading = false;
      });
      await Future.delayed(const Duration(seconds: 10));
      setState(() {
        _message = null;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    detector.stopListening();
    _controller.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundWidget(
          child: _isLoading
              ? const Center(child: LoaderWidget())
              : _message != null
              ? _buildSuccessScreen(_message!, context)
              : _hasError
              ? _buildErrorScreen(context)
              : _buildInitialScreen(context),
        ),
      ),
    );
  }

  Widget _buildInitialScreen(BuildContext context) {
    _secondController.forward();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.colorBackground,
            CustomColors.colorBackgroundSecond,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: FadeTransition(
              opacity: _animationSecond,
              child: InkWell(
                child: Image.asset(
                  Images.backgroundImage,
                  fit: BoxFit.fitWidth,
                ),
                onTap: () async {
                  _secondController.addStatusListener((status) async {
                    if (status == AnimationStatus.dismissed) {
                      await _getAnswer();
                    }
                  });
                  _secondController.reverse();
                },
              ),
            ),
          ),
          Text(
            'Нажмите на шар \nили потрясите телефон',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessScreen(String reading, BuildContext context) {
    _controller.forward(from: 0.0);
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Text(
          reading,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildErrorScreen(BuildContext context) {
    return Center(
      child: Text(
        'Error. Try again',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.red,
        ),
      ),
    );
  }
}
