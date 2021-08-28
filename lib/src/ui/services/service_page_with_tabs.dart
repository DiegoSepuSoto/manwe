import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/service_repository.dart';
import 'package:manwe/src/domain/blocs/service/service_page_cubit.dart';
import 'package:manwe/src/ui/services/tabs/contact_tab.dart';
import 'package:manwe/src/ui/services/tabs/description_tab.dart';
import 'package:manwe/src/ui/services/tabs/profesionals_tab.dart';
import 'package:manwe/src/ui/shared/components/error_page.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class ServicePageWithTabs extends StatelessWidget {
  const ServicePageWithTabs();

  @override
  Widget build(BuildContext context) {
    final serviceID = ModalRoute.of(context)!.settings.arguments as String;

    final serviceRepository = new ServiceRepository();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return BlocProvider(
      create: (context) =>
          ServiceCubit(servicePageRepository: serviceRepository)
            ..servicePageStarted(serviceID),
      child: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: BlocBuilder<ServiceCubit, ServicePageState>(
              builder: (context, state) {
            if (state is ServicePageLoading) {
              return Scaffold(
                body: LoadingCube(),
              );
            } else if (state is ServicePageSuccessLoad) {
              final servicePage = state.servicePage;
              return DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: kPrimaryColor,
                    brightness: Brightness.dark,
                    bottom: TabBar(
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(
                          text: "Descripción",
                        ),
                        Tab(
                          text: "Profesionales",
                        ),
                        Tab(
                          text: "Contacto",
                        ),
                      ],
                    ),
                    title: Text(state.servicePage.name),
                  ),
                  body: TabBarView(
                    children: [
                      DescriptionTab(
                        logoURL: servicePage.logoUrl,
                        description: servicePage.description,
                      ),
                      ProfesionalsTab(
                        profesionals: servicePage.persons,
                      ),
                      ContactTab(
                        contacts: servicePage.contacts,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: ErrorPage(),
              );
            }
          }),
        ),
      ),
    );
  }
}
