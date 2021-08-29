import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/service_repository.dart';
import 'package:manwe/src/domain/blocs/service/service_screen_cubit.dart';
import 'package:manwe/src/ui/services/tabs/contact_tab.dart';
import 'package:manwe/src/ui/services/tabs/description_tab.dart';
import 'package:manwe/src/ui/services/tabs/profesionals_tab.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class ServiceWithTabsScreen extends StatelessWidget {
  const ServiceWithTabsScreen();

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
          ServiceCubit(serviceRepository: serviceRepository)
            ..serviceScreenStarted(serviceID),
      child: Container(
        color: kBackgroundColor,
        child: SafeArea(
          top: false,
          child: BlocBuilder<ServiceCubit, ServiceScreenState>(
              builder: (context, state) {
            if (state is ServiceScreenLoading) {
              return Scaffold(
                body: LoadingCube(),
              );
            } else if (state is ServiceScreenSuccessLoad) {
              final serviceScreen = state.serviceScreen;
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
                    title: Text(state.serviceScreen.name),
                  ),
                  body: TabBarView(
                    children: [
                      DescriptionTab(
                        logoURL: serviceScreen.logoUrl,
                        description: serviceScreen.description,
                      ),
                      ProfesionalsTab(
                        profesionals: serviceScreen.persons,
                      ),
                      ContactTab(
                        contacts: serviceScreen.contacts,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: ErrorScreen(),
              );
            }
          }),
        ),
      ),
    );
  }
}
