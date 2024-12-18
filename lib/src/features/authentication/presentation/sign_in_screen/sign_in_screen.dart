import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import '/src/utils/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/btn_widget.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_strings.dart';
import '../../../dashboard_screen/presentation/dashboard_screen.dart';
import '../../../dashboard_screen/provider/dashboard_provider.dart';
import '../../model/login_model.dart';
import '../../model/user_detail_model.dart';
import '../../provider/auth_provider.dart';
import '../Components/lower_widget.dart';
import '../Components/middle_part.dart';
import '../Components/top_widget.dart';

class SignInScreen extends StatefulWidget {
  final String? orgType;

  const SignInScreen({super.key, this.orgType});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userEdtTxtCntr = TextEditingController();
  final TextEditingController passwordEdtTxtCntr = TextEditingController();
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    loadUserData();
    // Subscribe to the connectivity changes
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    // Initialize connectivity status
    initConnectivity();
  }

  @override
  void dispose() {
    // Cancel the subscription when the widget is disposed
    _connectivitySubscription.cancel();
    super.dispose();
  }

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            child: ListView(
              shrinkWrap: true,
              children: List.generate(_connectionStatus.length, (index) {
                if (_connectionStatus[index] == ConnectivityResult.none) {
                  return noInternetWidget();
                } else {
                  return loginScreenWidget();
                }
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginScreenWidget() {
    return SizedBox(
      height: 780.h,
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TopWidget(),
              MiddlePart(
                userEdtTxtCntr: userEdtTxtCntr,
                passwordEdtTxtCntr: passwordEdtTxtCntr,
                validatorFuncUserEdtTxt: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                validatorFuncPasswordEdtTxt: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  if (authProvider.isLoading &&
                      authProvider.userDetail?.token != null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return BtnWidget(
                      btnTitle: AppString.login,
                      btnFunc: () {
                        if (_formKey.currentState!.validate()) {
                          loginFunc(context, authProvider);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(AppString.pleaseTryAgain),
                            ),
                          );
                        }
                      },
                    );
                  }
                },
              ),
              const LowerPart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget noInternetWidget() {
    return SizedBox(
      height: 780.h,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_wifi_connected_no_internet_4,
            size: 50,
          ),
          Text("Oops,Looks Like there's no Internet Connection")
        ],
      ),
    );
  }

  void loginFunc(BuildContext context, AuthProvider authProvider) async {
    UserDetail? userDetail = await authProvider.loginUser(
      LoginModel(
        username: userEdtTxtCntr.text,
        password: passwordEdtTxtCntr.text,
        deviceName: "YourDeviceName",
      ),
    );
    if (userDetail != null && authProvider.userDetail?.representative != null) {
      if (authProvider.rememberUsername) {
        LocalStorageManager.saveData(
            AppConstants.userName, userEdtTxtCntr.text);
      }
      if (context.mounted) {
        loadData(
            orgType: authProvider.userDetail?.representative!.orgType,
            orgId: authProvider.userDetail?.representative!.orgType == "ufpo"
                ? authProvider.userDetail?.representative!.ufpo!.id.toString()
                : authProvider.userDetail?.representative!.rmg!.id.toString(),
            context: context);
        Provider.of<DashboardProvider>(context, listen: false)
            .setSelectedIndex(0);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => DashBoardScreen(
              orgType: authProvider.userDetail?.representative!.orgType,
            ),
          ),
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  loadUserData() async {
    var userName =
        await LocalStorageManager.readData(AppConstants.userName) ?? "";
    String userDetailName = "$userName";
    if (userDetailName == "") {
      userEdtTxtCntr.clear();
    } else {
      userEdtTxtCntr.text = userDetailName;
      Provider.of<AuthProvider>(context, listen: false)
          .setRememberUsername(true);
    }
  }

  void loadData({String? orgType, String? orgId, BuildContext? context}) async {
    context!
        .read<DashboardProvider>()
        .fetchAvailableQuantityList(orgType: "$orgType", orgID: "$orgId");
    context
        .read<DashboardProvider>()
        .fetchDistributionQuantityList(orgType: "$orgType", orgID: "$orgId");
  }
}
