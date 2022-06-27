import 'package:flutter/material.dart';
import 'package:lms/screen/faq/faq_view_model.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../constants/styles.dart';
import '../../utils/faq_state.dart';

class FaqScreen extends StatefulWidget {
  static const String routeName = '/faq_screen';
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    final FaqViewModel faqViewModel = Provider.of<FaqViewModel>(context, listen: false);

    _tabController = TabController(length: 2, vsync: this);
    faqViewModel.changeFaqState(FaqState.account);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 3.0,
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
          "FAQ",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: colorTextBlue,
                fontWeight: FontWeight.bold,
              ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 85),
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            decoration: const BoxDecoration(
                color: colorBlueDark, borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Consumer<FaqViewModel>(
              builder: (context, model, child) {
                return DefaultTabController(
                  length: 2,
                  initialIndex: model.faqState == FaqState.account ? 0 : 1,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: colorOrange,
                    unselectedLabelColor: Colors.white,
                    padding: const EdgeInsets.all(6.0),
                    indicator: RectangularIndicator(
                      color: Colors.white,
                      bottomLeftRadius: 15,
                      bottomRightRadius: 15,
                      topLeftRadius: 15,
                      topRightRadius: 15,
                    ),
                    indicatorColor: colorOrange,
                    onTap: (int index) {
                      if (index == 0) {
                        model.changeFaqState(FaqState.account);
                      } else {
                        model.changeFaqState(FaqState.guide);
                      }
                    },
                    tabs: const [
                      Tab(
                        child: Text(
                          "Account",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Panduan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: Consumer<FaqViewModel>(builder: (context, model, child) {
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount:
              model.faqState == FaqState.account ? model.lengthFaqAccount : model.lengthFaqGuide,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: colorBlueLight,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  collapsedIconColor: colorBlueDark,
                  iconColor: colorBlueDark,
                  title: Text(
                    "Bagaimana jika saya tidak bisa login",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorTextBlue,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  childrenPadding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
                  children: [
                    Text(
                      "Kamu dapat mencoba sekali lagi dan apabila terus gagal, silahkan mengajukan perubahan kata santi dengan memilih tombol “Reset”. Setelah itu, Kamu bisa log in kembali menggunakan kata sandi yang baru.",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: colorTextBlue,
                          ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
