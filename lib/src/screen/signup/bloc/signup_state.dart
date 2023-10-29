part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoaded extends SignupState {
   final TextEditingController? textEditingController;
  final int pageIndex;
  final double progress;
  final List? imageList;
  final List<String> genderList;
  final List<String> professionList;
  final List<String> forLookingList;
  final List<String> interestList;
  final PageController pageController;

  SignupLoaded({
    required this.pageController,
    required this.progress,
     this.textEditingController,
    this.imageList,
    this.genderList = const ['Woman', 'Man', 'Nonbinary'],
    this.forLookingList = const [
      'Relationship',
      'Something Casual',
      'Not Sure yet',
      'Prefer not to say'
    ],
    this.professionList = const [
      'Student',
      'Self Employed',
      'Working Professional',
      'Entrepreneur',
      'Freelancer'
    ],
    this.interestList = const [
      'Running',
      'Yoga',
      'Dance',
      'Workaholic',
      'Clubs',
      'Games',
      'Cooking',
      'Outing',
      'Singing',
      'Foodie',
      'photography'
    ],
    required this.pageIndex,
  });

  SignupLoaded copyWith({
    bool? otpLoading,
    bool? verifyOtpLoading,
    bool? goToLoginPage,
    int? pageIndex,
    double? progress,
    int? selectedGenderIndex,
    bool? isChecked,
    List? imageList,
    List<String>? genderList,
    List<String>? professionList,
    List<String>? forLookingList,
    List<String>? interestList,
    PageController? pageController,
    TextEditingController? textEditingController,
  }) {
    return SignupLoaded(
      textEditingController: textEditingController ?? this.textEditingController,
      progress: progress ?? this.progress,
      pageIndex: pageIndex ?? this.pageIndex,
      imageList: imageList ?? this.imageList,
      genderList: genderList ?? this.genderList,
      professionList: professionList ?? this.professionList,
      forLookingList: forLookingList ?? this.forLookingList,
      interestList: interestList ?? this.interestList,
      pageController: pageController ?? this.pageController,
    );
  }
}

class GoLoginState extends SignupState{}

class SignupError extends SignupState {
  final String message;

  SignupError({required this.message});

  @override
  String toString() => 'HomePageStateError';
}
