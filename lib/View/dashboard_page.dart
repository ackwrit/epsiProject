import 'package:flutter/material.dart';
import 'package:projectepsi/Controller/Background_controller.dart';
import 'package:projectepsi/View/image_ml.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  int indexCurrent = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          const BackgroundController(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: bodyPage()
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexCurrent,
        onTap: (newValue){
          setState(() {
            indexCurrent = newValue;
            _pageController.jumpToPage(newValue);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.label),label: "Traduction"),
          BottomNavigationBarItem(icon: Icon(Icons.library_add_outlined),label: "Image"),
        ],
      ),
    );
  }

  Widget bodyPage(){

    return PageView(
      onPageChanged: (newValue){
        setState(() {
          _pageController.jumpToPage(newValue);
          indexCurrent = newValue;
        });

      },
      controller: _pageController,
      children: const [
        Text("Affichage traduction"),
        ImageViewML()
      ],
    );
  }
}
