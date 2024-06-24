import 'package:flutter/material.dart';
import 'package:task14/data/const_string.dart';
import 'package:task14/domain /entity/photo_entity.dart';
import 'package:task14/domain /entity/photos_state_entity.dart';


class DetailedScreen extends StatefulWidget {
  final PhotosStateEntity initState;
  const DetailedScreen ({super.key, required this.initState});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}
class _DetailedScreenState extends State<DetailedScreen> {
  late final PageController pageController;
  late double _currentPageValue;

  final double _scaleFactor = 0.8;

  @override
  void initState(){
    super.initState();
    pageController =
        PageController(initialPage: widget.initState.indexInitPhoto , viewportFraction: 0.8)
          ..addListener(_listenToPageController);
    _currentPageValue =  widget.initState.indexInitPhoto.toDouble();
  }

  @override
  void dispose(){
    pageController
      ..removeListener(_listenToPageController)
      ..dispose();
    super.dispose();
  }

  void _listenToPageController(){
    double page = pageController.page ?? 0;

    setState(() {
      _currentPageValue = page;
    });
  }

  @override
  Widget build(BuildContext context){
    final photos = widget.initState.photos;
    const sumPadding = 40 + 72;
    final heightPageView = MediaQuery.sizeOf(context).height - kToolbarHeight - sumPadding;

    return Scaffold(
      appBar: AppBar(
        leading: const _BackButtons(),
        actions: [
          _PhotosIndicator(
            numberOfPhotos: photos.length,
            numberCurrentPhotos: _currentPageValue.round() + 1
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 70),
        child: PageView.builder(
          controller: pageController,
          itemCount: widget.initState.photos.length,
          itemBuilder: (_, index) {
            final photo = photos[index];
            Matrix4 matrix = Matrix4.identity();
            var scale = 0.8;

            if (index == _currentPageValue.floor() ||
                index == _currentPageValue.floor() + 1 ||
                index == _currentPageValue.floor() - 1) {
              scale = 1 - (_currentPageValue - index).abs() * (1 - _scaleFactor);
            }
           var transform = heightPageView * (1 - scale) / 2;
           matrix = Matrix4.diagonal3Values(1.0, scale, 1.0)
            ..setTranslationRaw(0, transform, 0);

           return Transform(
             transform:  matrix,
             child:  _PhotoFullScreenWidget(
               photo: photo,
               tag: index == _currentPageValue.floor() ? photo.imageUrl : null,
             ),
           );
          },
        ),
      ),
    );
  }
}

class _PhotoFullScreenWidget extends StatelessWidget {
  final PhotoEntity photo;
  final String? tag;

  const _PhotoFullScreenWidget({required this.photo, required this.tag});

  @override
  Widget build(BuildContext context){
    final imageWidget = Image.network(
      photo.imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null
          ),
        );
      },
      errorBuilder: (_, error, stackTrace) => const Center(child: Text(ConstString.longErrorString, style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900, fontSize: 20),)),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AspectRatio(
        aspectRatio: 1 / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: tag == null
              ? imageWidget
              : Hero(
            tag: photo.imageUrl,
            child: imageWidget,
          ),
        ),
      ),
    );
  }
}


class _PhotosIndicator extends StatelessWidget {
  final int numberCurrentPhotos;
  final int numberOfPhotos;

  const _PhotosIndicator({
    required this.numberCurrentPhotos,
    required this.numberOfPhotos,
});
  @override
  Widget build(BuildContext context){
    final themeText = Theme.of(context).textTheme.titleLarge;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text.rich(
          TextSpan(
            text: '$numberCurrentPhotos',
            style: themeText?.copyWith(color: Colors.black),
            children: [
              TextSpan(
                text: '/ $numberOfPhotos',
                style: themeText?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
    );
  }
}

class _BackButtons extends StatelessWidget {
  const _BackButtons();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}