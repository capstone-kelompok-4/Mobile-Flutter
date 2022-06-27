import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../../constants/styles.dart';
import '../../widgets/custom_notification_snackbar.dart';

class CourseRequestFormScreen extends StatefulWidget {
  static const String routeName = '/course_request_form_screen';
  const CourseRequestFormScreen({Key? key}) : super(key: key);

  @override
  State<CourseRequestFormScreen> createState() => _CourseRequestFormScreenState();
}

class _CourseRequestFormScreenState extends State<CourseRequestFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _specialistController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final int _radioCourseValue = 1;
  final int _radioTrainingValue = 2;
  int _groupValue = 1;

  void _processRequest() {
    if (_formKey.currentState!.validate()) {
      CustomNotificationSnackbar(context: context, message: "Request berhasil dikirim");
    }
  }

  @override
  void initState() {
    _nameController.text = "Dave Christian";
    _emailController.text = "123345@company.com";
    _specialistController.text = "Designer";

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _specialistController.dispose();
    _titleController.dispose();
    _detailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          decoration:
              BoxDecoration(color: colorBlueDark, borderRadius: BorderRadius.circular(50.0)),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Request Form",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: colorTextBlue,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Full Name",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _nameController,
                  autocorrect: false,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "John Doe",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Nama wajib diisi";
                    }

                    if (value.length < 3) {
                      return "Nama tidak boleh kurang dari 3 karakter";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Your email",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _emailController,
                  autocorrect: false,
                  readOnly: true,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "12345@company.com",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Email wajib diisi";
                    }

                    if (value.length < 6) {
                      return "Email tidak boleh kurang dari 6 karakter";
                    }

                    if (!isEmail(value)) {
                      return "Email tidak valid";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Specialist",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _specialistController,
                  autocorrect: false,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: colorBlueLight,
                    filled: true,
                    hintText: "",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueLight, width: 0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueLight, width: 0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueLight, width: 0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Request Type",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Wrap(
                  spacing: 16.0,
                  runSpacing: 8.0,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _groupValue = _radioCourseValue;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  _groupValue == _radioCourseValue ? colorOrange : colorBlueDark),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                              value: _radioCourseValue,
                              groupValue: _groupValue,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              activeColor: colorOrange,
                              fillColor: MaterialStateProperty.all(
                                  _groupValue == _radioCourseValue ? colorOrange : colorBlueDark),
                              onChanged: (value) {
                                setState(() {
                                  _groupValue = value as int;
                                });
                              },
                            ),
                            Text(
                              "Course",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: _groupValue == _radioCourseValue
                                        ? colorOrange
                                        : colorTextBlue,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _groupValue = _radioTrainingValue;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  _groupValue == _radioTrainingValue ? colorOrange : colorBlueDark),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                              value: _radioTrainingValue,
                              groupValue: _groupValue,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              activeColor: colorOrange,
                              fillColor: MaterialStateProperty.all(
                                  _groupValue == _radioTrainingValue ? colorOrange : colorBlueDark),
                              onChanged: (value) {
                                setState(() {
                                  _groupValue = value as int;
                                });
                              },
                            ),
                            Text(
                              "Training",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: _groupValue == _radioTrainingValue
                                        ? colorOrange
                                        : colorTextBlue,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Request Title",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _titleController,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Judul request wajib diisi";
                    }

                    if (value.length < 3) {
                      return "Judul request tidak boleh kurang dari 3 karakter";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Request Detail",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorTextBlue,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _detailController,
                  autocorrect: false,
                  maxLines: 6,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (_) => _processRequest(),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: colorBlueDark),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Detail request wajib diisi";
                    }

                    if (value.length < 3) {
                      return "Detail request tidak boleh kurang dari 6 karakter";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _processRequest(),
                    style: ElevatedButton.styleFrom(
                      primary: colorOrange,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      "Send Request",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
