// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnboardingModel {
   OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
  
  String image;
  String title;
  String description;
 
}

// SafeArea(
//               bottom: false,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 150.0, left: 50, right: 30),
//                 child: ListView(
//                   children: [
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Center(
//                       child: RichText(
//                           text: TextSpan(
//                               text: 'D',
//                               style: GoogleFonts.nunitoSans(
//                                   color: MyColors.primaryColor,
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.w600),
//                               children: <TextSpan>[
//                             TextSpan(
//                               text: 'aily Reminder',
//                               style: GoogleFonts.nunitoSans(
//                                   color: Colors.black,
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ])),
//                     ),
//                     addVerticalSpace(88),
//                     AppText(
//                       text: 'SIGN IN',
//                       size: 24,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     addVerticalSpace(60),
//                     InputField(
//                       textController: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       labelText: 'E-mail',
                      
//                       obscure: false,
//                     ),
//                     addVerticalSpace(50),
//                     InputField(
//                       obscure: _secureText,
//                       textController: _passwordControler,
//                       keyboardType: TextInputType.text,
//                       labelText: 'Password',
//                       suffixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               _secureText = !_secureText;
//                             });
//                           },
//                           icon: Icon(
//                             _secureText ? 
//                             Icons.visibility : Icons.visibility_off,
                           
//                           )),
//                     ),
//                     Row(
//                       children: [
//                         Text('Forgot Password?'),
//                         addHorizontalSpace(0),
//                         TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             'click here',
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ),
//                       ],
//                     ),
//                     addVerticalSpace(50),
//                     CustomButton(onpressed: () {}, text: 'Log In'),
//                     addVerticalSpace(56),
//                     Row(
//                       children: [
//                         AppLargeText(text: 'not yet a member?'),
//                         addHorizontalSpace(8),
//                         InkWell(
//                           onTap: () {},
//                           child: Container(
//                             height: 30.sp,
//                             width: 30.sp,
//                             decoration: BoxDecoration(
//                               color: MyColors.primaryColor,
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                             child:
//                                 Icon(Icons.add, color: Colors.white, size: 26),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),