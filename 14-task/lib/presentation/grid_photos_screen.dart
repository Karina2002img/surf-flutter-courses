import 'package:flutter/material.dart';
import 'package:task14/domain /entity/photo_entity.dart';
import 'package:task14/main.dart';
import 'package:task14/presentation/detailed_screen.dart';
import 'package:union_state/union_state.dart';
import 'package:task14/domain /entity/photos_state_entity.dart';
import 'package:task14/data/const_string.dart';

class GridPhotosScreen extends StatefulWidget {
  const GridPhotosScreen({super.key});

  @override
  State<GridPhotosScreen> createState() => _GridPhotosScreen();
}
class _GridPhotosScreen extends State<GridPhotosScreen> {
  final screenState = UnionStateNotifier<List<PhotoEntity>>.loading();

  @override
  void initState(){
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      /// Имитация загрузки данных
      await Future.delayed(const Duration(seconds: 1));
      final data = await photosRepository.getPhotos();
      screenState.content(data);
    } on Exception catch (e) {
      screenState.failure(e);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Image(image: AssetImage(ConstString.logo)),
      ),
      body: UnionStateListenableBuilder<List<PhotoEntity>>(
        unionStateListenable: screenState,
        loadingBuilder: (_, __) => const _LoadingWidget(),
        builder: (_, state) =>
              state.isNotEmpty ? _ContentWidget(data: state) : const _EmptyWidget(),
          failureBuilder: (_, __, ___) => const _ErrorWidget(),
      )
    );
  }
}

class _LoadingWidget extends StatelessWidget{
  const _LoadingWidget ();

  @override
  Widget build(BuildContext context){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget ();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(ConstString.errorString),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget ();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(ConstString.emptyString),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  final List<PhotoEntity> data;
  const _ContentWidget ({required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 3,
        ),
        itemCount: data.length,
        itemBuilder: (_, i) => _PhotoWidget(
          indexSelectedPhoto: i,
          photoList: data,
        ),
    );
  }
}

class _PhotoWidget extends StatelessWidget{
  final int indexSelectedPhoto;
  final List<PhotoEntity> photoList;
  const _PhotoWidget ({required this.indexSelectedPhoto, required this.photoList});

  @override
  Widget build(BuildContext context) {
    final imageUrl = photoList[indexSelectedPhoto].imageUrl;

    return Center(
      child: GestureDetector(
        onTap: () => _onTap(context, indexInitPhoto: indexSelectedPhoto),
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (_, error, stackTrace) => const Center(child: Image(image: AssetImage(ConstString.errorLogo))),
            ),
          ),
        ),
      ),
    );
  }
  void _onTap(BuildContext context, {required int indexInitPhoto}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailedScreen(
          initState: PhotosStateEntity(
            indexInitPhoto: indexInitPhoto,
            photos: photoList,
          ),
        ),
      ),
    );
  }
}

