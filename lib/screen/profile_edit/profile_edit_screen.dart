import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../../constants/styles.dart';
import '../../widgets/custom_notification_snackbar.dart';

class ProfileEditScreen extends StatefulWidget {
  static const String routeName = '/profile_edit_screen';
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specialistController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      CustomNotificationSnackbar(context: context, message: "Profil berhasil diubah");
    }
  }

  @override
  void initState() {
    _specialistController.text = "Dave Christian";
    _specialistController.text = "123345@company.com";
    _specialistController.text = "Designer";

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _specialistController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    _provinceController.dispose();
    _cityController.dispose();
    _zipCodeController.dispose();

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
          "Edit Profile",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: colorTextBlue,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () => _updateProfile(),
          style: ElevatedButton.styleFrom(
            primary: colorOrange,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          child: Text(
            "Simpan",
            style: Theme.of(context).textTheme.button!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: colorGreyLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32.0,
                    ),
                    Center(
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size(85, 85),
                          child: Image.asset("assets/images/avatar_example_1.png"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: Text(
                        "Data diri",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: colorBlueDark,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
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
                          return "Nama lengkap wajib diisi";
                        }

                        if (value.length < 3) {
                          return "Nama lengkap tidak boleh kurang dari 6 karakter";
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
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "123456@company.com",
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
                      "Phone Number",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: colorTextBlue,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "0853234xxx",
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
                          return "Nomor telepon wajib diisi";
                        }

                        if (value.length < 8) {
                          return "Nomor telepon tidak boleh kurang dari 8 karakter";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Detail Address",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: colorTextBlue,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _addressController,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Jalan Kenangan Timur",
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
                          return "Alamat wajib diisi";
                        }

                        if (value.length < 10) {
                          return "Alamat tidak boleh kurang dari 10 karakter";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Country",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: colorTextBlue,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _countryController,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Indonesia",
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
                          return "Negara wajib diisi";
                        }

                        if (value.length < 3) {
                          return "Negara tidak boleh kurang dari 3 karakter";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "State/Province",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: colorTextBlue,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _provinceController,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "DKI Jakarta",
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
                          return "Provinsi wajib diisi";
                        }

                        if (value.length < 3) {
                          return "Provinsi tidak boleh kurang dari 3 karakter";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "City",
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: colorTextBlue,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _cityController,
                                autocorrect: false,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Jakarta Barat",
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
                                    return "Kota wajib diisi";
                                  }

                                  if (value.length < 3) {
                                    return "Kota tidak boleh kurang dari 3 karakter";
                                  }

                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Zip Code",
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: colorTextBlue,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _zipCodeController,
                                autocorrect: false,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.send,
                                onFieldSubmitted: (_) => _updateProfile(),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "12345",
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
                                    return "Kode pos wajib diisi";
                                  }

                                  if (value.length < 3) {
                                    return "Kode pos tidak boleh kurang dari 3 karakter";
                                  }

                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
