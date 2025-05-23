import 'package:flutter/material.dart';
import 'package:sotong/choose_price.dart';
import 'choose_auto_ratio.dart';

void main() {
  runApp(const AlreadyPage());
}

class AlreadyPage extends StatelessWidget {
  const AlreadyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: GuideScreen());
  }
}

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  void _showConsultingPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 40,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SafeArea(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: SingleChildScrollView(child: ASotongConsultingOverlay()),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              Text('거의 다 왔어요!', style: _highlightStyle1()),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '이제 고정 수입을 바탕으로\n소통이 절약 비율과 기간을 설정하고,\n',
                      style: _defaultStyle(),
                    ),
                    TextSpan(text: '소통 컨설팅', style: _highlightStyle()),
                    TextSpan(text: '을 받을 준비가 되었나요?', style: _defaultStyle()),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => _showConsultingPopup(context),
                child: Text(
                  '소통 컨설팅이 뭐에요?',
                  style: TextStyle(
                    color: Color(0xFF0062FF),
                    fontSize: 14,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/sotong_a.png',
                    width: 260,
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // 버튼들이 일관되게 정렬되도록 수정
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 294,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0062FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChooseAutoRatioPage(), // ChooseAutoRatio 페이지로 이동
                            ),
                          );
                        },
                        child: const Text(
                          '준비 되었어요',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Pretendard Variable',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16), // 버튼 간격 추가
                    SizedBox(
                      width: 294,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChoosePricePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF4F4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          '제가 설정할래요',
                          style: TextStyle(
                            color: Color(0xFF9D9D9D),
                            fontSize: 17,
                            fontFamily: 'Pretendard Variable',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
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

  TextStyle _defaultStyle() {
    return const TextStyle(
      color: Color(0xFF231F1F),
      fontSize: 16,
      fontFamily: 'Pretendard Variable',
      fontWeight: FontWeight.w800,
      letterSpacing: -2,
      height: 1.4,
    );
  }

  TextStyle _highlightStyle() {
    return const TextStyle(
      color: Color(0xFF0062FF),
      fontSize: 17,
      fontFamily: 'Pretendard Variable',
      fontWeight: FontWeight.w500,
      height: 1.35,
      letterSpacing: -2,
    );
  }

  TextStyle _highlightStyle1() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontFamily: 'Pretendard Variable',
      fontWeight: FontWeight.w800,
      height: 1.35,
      letterSpacing: -2,
    );
  }
}

class ASotongConsultingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 304,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 닫기 버튼 영역
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.close, size: 24, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 12),

          // 본문 텍스트
          Text(
            '소통 컨설팅과 본인 선택 중\n무엇이 나에게 맞을까요?',
            style: TextStyle(
              color: const Color(0xFF0062FF),
              fontSize: 17,
              fontFamily: 'Pretendard Variable',
              fontWeight: FontWeight.w700,
              height: 1.3,
              letterSpacing: -2,
            ),
          ),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '목돈을 처음 모으시는 분들에게는\n', style: _defaultStyle()),
                TextSpan(text: '소통 컨설팅', style: _highlightStyle()),
                TextSpan(text: '이 유리합니다.\n\n', style: _defaultStyle()),
                TextSpan(text: '컨설팅에 들어가게 되면, ', style: _defaultStyle()),
                TextSpan(text: '설정한 기간 동안\n절약', style: _highlightStyle()),
                TextSpan(
                  text: '하는 것에 초점이 맞춰지게 되며,\n\n',
                  style: _defaultStyle(),
                ),
                TextSpan(text: '본인 선택의 경우 ', style: _defaultStyle()),
                TextSpan(
                  text: '설정한 기간 동안\n목표 금액을 모으는 것',
                  style: _highlightStyle(),
                ),
                TextSpan(text: '으로\n플랜이 진행됩니다.', style: _defaultStyle()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _defaultStyle() {
    return const TextStyle(
      color: Color(0xFF231F1F),
      fontSize: 16,
      fontFamily: 'Pretendard Variable',
      fontWeight: FontWeight.w800,
      letterSpacing: -2,
      height: 1.4,
    );
  }

  TextStyle _highlightStyle() {
    return const TextStyle(
      color: Color(0xFF0062FF),
      fontSize: 17,
      fontFamily: 'Pretendard Variable',
      fontWeight: FontWeight.w500,
      height: 1.35,
      letterSpacing: -2,
    );
  }
}
