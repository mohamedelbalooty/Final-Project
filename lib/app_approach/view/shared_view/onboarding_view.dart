import 'package:final_project/widgets/shared_view_widgets/customOnBoardingButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customOnBoardingDescription.dart';
import 'package:flutter/material.dart';


class OnBoardingView extends StatefulWidget {
  static String id = 'OnBoardingView';
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0,);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height:MediaQuery.of(context).size.height *0.81,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,

                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;

                    });
                  },
                  children: <Widget>[
                    buildOnboardDescription(
                      context: context,
                      img: 'assets/images/photos/Asset 1.png',
                      title: "Let's get\nStarted",
                      description:
                      'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                    ),
                    buildOnboardDescription(
                      context: context,
                      img: 'assets/images/photos/Asset 2.png',
                      title: 'Taxi Driver\nTalking',
                      description:
                      'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                    ),
                    buildOnboardDescription(
                      context: context,
                      img: 'assets/images/photos/Asset 3.png',
                      title: 'Make a\nSuccess',
                      description:
                      'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List<Widget>.generate(_numPages, (int index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 20),
                          height: (index == _currentPage) ?12 : 8,
                          width: (index == _currentPage) ?12 : 8,
                          margin: EdgeInsets.symmetric(horizontal: 5.0,),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: (index == _currentPage) ? Colors.black : Colors.black.withOpacity(0.5)),
                        );
                      }),
                    ),
                    Row(
                      children: [
                        _currentPage !=0
                            ?
                        InkWell(
                            onTap: () {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child:
                           buildOnboardButton(icon: Icons.arrow_back,iconColor: Colors.black,buttonColor: Colors.white )
                        )
                            : Text(''),
                        SizedBox(
                          width: 5,
                        ),
                        _currentPage !=_numPages-1
                            ? InkWell(
                            onTap: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: buildOnboardButton(icon: Icons.arrow_forward,iconColor: Colors.yellow,buttonColor: Colors.black )
                        )
                            : InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, 'HomeView');
                            },
                            child: buildOnboardButton(icon: Icons.done,iconColor: Colors.yellow,buttonColor: Colors.black )),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
