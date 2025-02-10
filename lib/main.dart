import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartprint/firebase_options.dart';
import 'package:smartprint/pages/login_page.dart';
import 'package:smartprint/pages/wrapper_page.dart';
import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Menunggu hasil status login
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SmartPrint App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: CircularProgressIndicator(), // Halaman Splash ketika memuat
          );
        }

        // Jika pengguna sudah login, arahkan ke halaman utama
        if (snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SmartPrint App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: WrapperPage(), // Halaman utama setelah login
          );
        }

        // Jika pengguna belum login, arahkan ke halaman login
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SmartPrint App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginPage(), // Halaman Login jika belum login
        );
      },
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _skip() {
    _pageController.animateToPage(
      2,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: <Widget>[
                _buildPage(
                  imagePath: 'assets/images/onboarding1.png',
                  title: 'Cepat Lapor, Siri’kangi Narkoba!',
                  description:
                      'Malukan Narkoba! Segera lapor demi kebaikan bersama! cukup dengan keterangan anda, info lokasi kejadian dan bukti foto atau video',
                ),
                _buildPage(
                  imagePath: 'assets/images/onboarding2.png',
                  title: 'LaporPak, Ewako Lawan Narkoba!',
                  description:
                      'Berantas Narkoba! Aplikasi ini dirancang untuk kemudahan Anda dalam melaporkan kegiatan mencurigakan terkait dengan narkoba',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _skip,
                child: Text(
                  'Lewati',
                  style: TextStyle(
                    color: _currentPage == 2 ? Colors.grey : Colors.blue,
                  ),
                ),
              ),
              Row(
                children: List<Widget>.generate(2, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.grey[300],
                    ),
                  );
                }),
              ),
              TextButton(
                onPressed: _nextPage,
                child: Text(
                  'Lanjut',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPage(
      {required String imagePath,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
