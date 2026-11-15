import 'package:auto_route/auto_route.dart';
import 'package:autocar/app/router/app_router.dart';
import 'package:autocar/core/di/injection.dart';
import 'package:autocar/core/preferences/shared_prefs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

import '../../shared/constants/asset_path.dart';

@RoutePage()
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _controller = PageController();
  int _page = 0;
  bool _saving = false;

  static const _pages = [
    (
      icon: AssetPath.onboardingMoney,
      title: 'Finansal Raporlarınızı\nİnceleyin',
      description: 'Tüm araç giderlerinizi tek yerde görün, harcamalarınızı net şekilde analiz edin.',
    ),
    (
      icon: AssetPath.onboardingMaintenance,
      title: 'Bakımlarınızı Hiç\nAksatmayın',
      description: 'Parçalarınızın ömrünü, mevsim hazırlıkları, vergi, sigorta ve muayene süreçlerini detaylıca takip edin.',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _next() async {
    if (_saving) return;
    if (_page == 0) {
      await _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    setState(() => _saving = true);
    try {
      await getIt<SharedPrefs>().completeOnboarding();
      if (!mounted) return;
      context.router.replaceAll([const MainRoute()]);
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kaydedilemedi. Lütfen tekrar deneyin.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF5F5F5),
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, viewport) {
          final width = viewport.maxWidth;
          final height = viewport.maxHeight;
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (page) => setState(() => _page = page),
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.59,
                            width: width,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned.fill(
                                  child: SvgPicture.asset(
                                    AssetPath.onboardingBackground,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.32,
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: SvgPicture.asset(page.icon),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.025),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                            ),
                            child: Text(
                              page.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: width * 0.083,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF080808),
                                height: 1.2,
                                letterSpacing: -width * 0.003,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.025),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.12,
                            ),
                            child: Text(
                              page.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: width * 0.043,
                                color: const Color(0xFF929292),
                                height: 1.15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: width * 0.027,
                    height: width * 0.027,
                    margin: EdgeInsets.symmetric(horizontal: width * 0.013),
                    decoration: BoxDecoration(
                      color: _page == index
                          ? const Color(0xFF080808)
                          : const Color(0xFF929292),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  width * 0.052,
                  height * 0.04,
                  width * 0.052,
                  height * 0.045,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _saving ? null : _next,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF080808),
                      foregroundColor: const Color(0xFFFFFFFF),
                      padding: EdgeInsets.symmetric(vertical: height * 0.018),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.04),
                      ),
                      textStyle: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: width * 0.043,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: Text(
                      _saving
                          ? 'Kaydediliyor…'
                          : (_page == 0 ? 'Devam Et' : 'Başla'),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
