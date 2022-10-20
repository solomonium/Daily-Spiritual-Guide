import 'package:spiritual_daily_guide/models/onboarding_model.dart';

class OnboardingInfo {
  int selectedPage = 0;
  final List<OnboardingModel> onboardingDetails = [
    OnboardingModel(
        image: 'assets/slider1.png',
        title: 'Anywhere & Anytime',
        description: 'Read and complete your bible \n task anywhere and anytime.'),
    OnboardingModel(
        image: 'assets/slider2.png',
        title: 'Audio Feature',
        description:
            'With our audio feature you \n can now listen to  bible verses.'),
    OnboardingModel(
        image: 'assets/slider3.png',
        title: 'Set Reminder',
        description:
            'Set a reminder for a particular \n time to read day and night.'),
  ];

  String getImages(int index) {
    return onboardingDetails[index].image;
  }

  String getTitle(int index) {
    return onboardingDetails[index].title;
  }

  String getDescription(int index) {
    return onboardingDetails[index].description;
  }

  int getDetailsLength() {
    return onboardingDetails.length;
  }
}
