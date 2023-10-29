import 'package:bloc_demo/app_route/app_router.dart';
import 'package:bloc_demo/src/screen/signup/bloc/signup_bloc.dart';
import 'package:bloc_demo/src/utils/app_assets.dart';
import 'package:bloc_demo/src/utils/app_colors.dart';
import 'package:bloc_demo/src/utils/extension/space.dart';
import 'package:bloc_demo/src/utils/extension/text_field_decorection_extension.dart';
import 'package:bloc_demo/src/utils/extension/text_style_extension.dart';
import 'package:bloc_demo/src/widgets/app_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return SignupBloc()..add(SignupInitEvent());
          },
          child: BlocConsumer<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is GoLoginState) {
                context.replaceNamed(loginView);
              }
            },
            builder: (context, state) {
              if (state is SignupLoaded) {
                return WillPopScope(
                  onWillPop: () {
                    onBackPressed(state, context);
                    return Future.value(false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        20.toSpace(),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.black26,
                            value: state.progress,
                            color: purpleColor,
                            minHeight: 12,
                          ),
                        ),
                        Expanded(child: _view(context, state)),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: purpleColor,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void onBackPressed(SignupLoaded state, BuildContext context) {
    if (state.pageIndex > 0) {
      state.pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      BlocProvider.of<SignupBloc>(context).add(GoPreviousPageEvent());
    } else {
      context.pop();
    }
  }

  Widget _view(BuildContext context, SignupLoaded state) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          bottom: 0,
          child: PageView(
            controller: state.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              signupOtpView(context, state),
              signupInfoView(context, state),
              signupUploadImageView(context, state),
              signupLikeToMeetView(context, state),
              signupLookingForView(context, state),
              signupInterestView(context, state),
              signupProfessionView(context, state),
              signupLocationView(context, state),
            ],
          ),
        ),
        if (state.pageIndex != 0)
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => onBackPressed(state, context),
                  child: RotatedBox(
                    quarterTurns: 90,
                    child: Image.asset(
                      AppAssets.nextIcon,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _goNextStep(state, context),
                  child: Image.asset(
                    AppAssets.nextIcon,
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget signupOtpView(
    BuildContext context,
    SignupLoaded state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 3),
        Text(
          'Sign Up',
          style: const TextStyle().bold.copyWith(fontSize: 30),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration()
                          .txtFieldStyle(hintText: '+91', labelName: ''),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 12,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration().txtFieldStyle(
                          hintText: 'Enter your phone number', labelName: ''),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                          name: 'Get OTP',
                          onPressed: () {

                          },
                          textSize: 20,
                          hPadding: 40,
                          vPadding: 10,
                        ),
              ),
              const SizedBox(height: 6),
              Text(
                'Enter OTP',
                style: const TextStyle().bold,
              ),
              const SizedBox(height: 10),
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                hintCharacter: '-',
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    selectedColor: txtFieldColor,
                    borderRadius: BorderRadius.circular(10),
                    selectedFillColor: txtFieldColor,
                    activeColor: txtFieldColor,
                    activeFillColor: txtFieldColor,
                    inactiveColor: txtFieldColor,
                    inactiveFillColor: txtFieldColor,
                    fieldOuterPadding: const EdgeInsets.only(right: 15),
                    fieldWidth: 60,
                    fieldHeight: 60),
                animationDuration: const Duration(milliseconds: 300),
                // backgroundColor: txtFieldColor,
                enableActiveFill: true,

                keyboardType: TextInputType.number,
                textStyle: const TextStyle().bold.copyWith(fontSize: 30),
                onCompleted: (v) {
                  if (kDebugMode) {
                    print('Completed');
                  }
                },
                onChanged: (value) {
                  // setState(() {
                  //   currentText = value;
                  // });
                },
                beforeTextPaste: (text) {
                  if (kDebugMode) {
                    print('Allowing to paste $text');
                  }
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: AppButton(
                    name: 'Signup',
                    onPressed: () => _goNextStep(state, context),
                    textSize: 20,
                    hPadding: 50,
                    vPadding: 10,
                  ),
                ),
              ),
              10.toSpace(),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<SignupBloc>(context)
                          .add(ClickOnLoginEvent());
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account?',
                            style: const TextStyle().medium.copyWith(),
                          ),
                          TextSpan(
                            text: ' Log in',
                            style: const TextStyle().bold.copyWith(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget signupInfoView(BuildContext context, SignupLoaded state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3),
          Text(
            'Sign Up',
            style: const TextStyle().bold.copyWith(fontSize: 30),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration()
                .txtFieldStyle(hintText: 'Name', labelName: ''),
          ),
          const SizedBox(height: 20),
          Text(
            'DOB?',
            style: const TextStyle().bold.copyWith(fontSize: 18),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration()
                      .txtFieldStyle(hintText: 'Day', labelName: ''),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration().txtFieldStyle(
                    hintText: 'Month',
                    labelName: '',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration().txtFieldStyle(
                    hintText: 'Year',
                    labelName: '',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: hintTxtColor),
                      ),
                      width: 24,
                      height: 24,
                    ),
                    const Icon(
                      Icons.check,
                      color: Colors.transparent,
                      size: 22,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Don’t show my age',
                style: const TextStyle().regular,
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Gender?',
            style: const TextStyle().bold.copyWith(
                  fontSize: 18,
                ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              state.genderList.length,
              (index) => radioBtn(
                index, true,
                state.genderList[index],
                state, context, () {},
              ),
            ),
          ),
          60.toSpace(),
        ],
      ),
    );
  }

  Widget signupUploadImageView(BuildContext context, SignupLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        Text(
          'Update your 3 photos',
          style: const TextStyle().bold.copyWith(fontSize: 30),
        ),
        Text(
          'More photos increase chances \nof matches',
          style: const TextStyle().regular,
        ),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 20,
            spacing: 20,
            children: List.generate(
                3, (index) => selectImageView(index, state, context)),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget signupLikeToMeetView(BuildContext context, SignupLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        Text(
          'Who would you like to meet',
          style: const TextStyle().bold.copyWith(fontSize: 30),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              state.genderList.length,
              (index) => radioBtn(
                index,
                false,
                state.genderList[index],
                state,
                context,
                () {

                },
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget signupLookingForView(BuildContext context, SignupLoaded state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Text(
            'What are you looking \nfor?',
            style: const TextStyle().bold.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                state.forLookingList.length,
                (index) => radioBtn(
                  index,
                  true,
                  state.forLookingList[index],
                  state,
                  context,
                  () {

                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget signupInterestView(BuildContext context, SignupLoaded state) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 30),
        Text(
          'Interests',
          style: const TextStyle().bold.copyWith(fontSize: 30),
        ),
        Text(
          'Select any 5 only',
          style: const TextStyle().regular,
        ),
        const SizedBox(height: 50),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: List.generate(
            state.interestList.length,
            (index) => interestView(index, state),
          ),
        ),
        30.toSpace(),
      ],
    );
  }

  Widget signupProfessionView(BuildContext context, SignupLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        Text(
          'Profession',
          style: const TextStyle().bold.copyWith(fontSize: 30),
        ),
        const SizedBox(height: 30),
        Column(
          children: List.generate(
            state.professionList.length,
            (index) => radioBtn(
              index,
              true,
              state.professionList[index],
              state,
              context,
              () {
              },
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget signupLocationView(BuildContext context, SignupLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        Text(
          'Location Access',
          style: const TextStyle().bold.copyWith(fontSize: 30),
        ),
        const Spacer(),
      ],
    );
  }

  Widget radioBtn(int index, bool isCircle, String name, SignupLoaded state,
      BuildContext context, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: purpleColor),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                  color:  Colors.white),
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              name,
              style: const TextStyle()
                  .bold
                  .copyWith(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectImageView(int index, SignupLoaded state, BuildContext context) {
    var isHaveImage = (state.imageList?.length ?? 0) > index;
    return InkWell(
      onTap: () {
        showMyPicker(context, state);
      },
      child: Container(
        width: 35,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: lightGreyColor,
        ),
        clipBehavior: Clip.antiAlias,
        child: !isHaveImage
            ? Icon(
                Icons.add_outlined,
                color: hintTxtColor,
              )
            : Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Image.file(
                      state.imageList?[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: whiteColor, shape: BoxShape.circle),
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.close_outlined,
                        color: hintTxtColor,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Widget interestView(int index, SignupLoaded state) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: lightGreyColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
      child: Text(
        state.interestList[index],
        style: const TextStyle().bold,
      ),
    );
  }

  void showMyPicker(
    BuildContext context,
    SignupLoaded state,) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _imgFromCameraAndGallery(false, state, context);
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _imgFromCameraAndGallery(true, state, context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future _imgFromCameraAndGallery(
      bool fromCamera, SignupLoaded state, BuildContext context) async {
    /*final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 100);
    if (pickedFile != null) {
      BlocProvider.of<SignupBloc>(context)
        ..add(AddImageEvent(file: File(pickedFile.path)));
      state.imageList?.add(pickedFile);
    }*/
  }
  void _goNextStep(SignupLoaded state, BuildContext context) {
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    BlocProvider.of<SignupBloc>(context).add(GoNextPageEvent());
  }
}
