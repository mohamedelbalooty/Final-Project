import 'package:final_project/app_approach/view/shared_view/home_view.dart';
import 'package:final_project/constants.dart';
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
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [KMainColor, KGradientColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.81,
              margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1),
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
                    title: 'لنبدأ رحلتنا معاً',
                    description:
                    'مع توصيلة، يمكنك الوصول إلى أي مكان بكل سهولة إذا كنت متجهاً لإنجاز بعض مهام عملك في المدينة أو كنت تقضي عطلة في مدينة أخرى',
                  ),
                  buildOnboardDescription(
                    context: context,
                    img: 'assets/images/photos/Asset 2.png',
                    title: 'تحقق من السائق اينما كان',
                    description:
                    'تعرَّف على المزيد من المعلومات حول كيفية إجراء المشاوير من خلال تطبيق توصيلة',
                  ),
                  buildOnboardDescription(
                    context: context,
                    img: 'assets/images/photos/Asset 3.png',
                    title: 'تتبع رحلتك الان',
                    description: 'يمكنك تتبُّع وصولك على الخريطة, ثم انتظر عند موقع الالتقاء',
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 0, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List<Widget>.generate(_numPages, (int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 20),
                        height: (index == _currentPage) ? 12 : 8,
                        width: (index == _currentPage) ? 12 : 8,
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: (index == _currentPage)
                                ? KOrangeColor
                                : Colors.black.withOpacity(0.4)),
                      );
                    }),
                  ),
                  Row(
                    children: [
                      _currentPage != 0
                          ? InkWell(
                          onTap: () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: buildOnboardButton(
                              icon: Icons.arrow_back,
                              iconColor: KMainColor,
                              buttonColor: Colors.deepOrangeAccent))
                          : Text(''),
                      SizedBox(
                        width: 5,
                      ),
                      _currentPage != _numPages - 1
                          ? InkWell(
                          onTap: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: buildOnboardButton(
                              icon: Icons.arrow_forward,
                              iconColor: KOrangeColor,
                              buttonColor: KMainColor))
                          : InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                builder: (context) => HomeViewShared()));
                          },
                          child: buildOnboardButton(
                              icon: Icons.done,
                              iconColor: KOrangeColor,
                              buttonColor: KMainColor)),
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
    );
  }
}
