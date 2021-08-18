import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:manwe/src/data/repositories/service_page_repository.dart';
import 'package:manwe/src/domain/blocs/service/service_cubit.dart';
import 'package:manwe/src/ui/shared/components/error_page.dart';
import 'package:manwe/src/ui/shared/components/full_size_image.dart';
import 'package:manwe/src/ui/shared/components/header_back_button.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:manwe/src/ui/utils/functions.dart';

class ServicePage extends StatelessWidget {
  const ServicePage();

  @override
  Widget build(BuildContext context) {
    final serviceID = ModalRoute.of(context)!.settings.arguments as String;

    final servicePageRepository = new ServicePageRepository();

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kPrimaryColor));

    return BlocProvider(
      create: (context) =>
          ServiceCubit(servicePageRepository: servicePageRepository)
            ..servicePageStarted(serviceID),
      child: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: Scaffold(
            body: BlocBuilder<ServiceCubit, ServiceState>(
                builder: (context, state) {
              if (state is ServiceLoading) {
                return LoadingCube();
              } else if (state is ServiceSuccessLoad) {
                final servicePage = state.servicePage;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ServiceHeader(
                          serviceLogoURL: servicePage.logoUrl,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: kDefaultPadding),
                          child: Text(
                            servicePage.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: 27.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(kDefaultPadding),
                          child: MarkdownBody(
                            data: servicePage.description,
                            styleSheet: buildPageMarkdownBody(),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding * 2,
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return ErrorPage();
              }
            }),
          ),
        ),
      ),
    );
  }
}

class ServiceHeader extends StatelessWidget {
  final String serviceLogoURL;

  const ServiceHeader({required this.serviceLogoURL});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderBackButton(),
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FullSizeImage(
                      image: serviceLogoURL,
                    );
                  },
                ),
              );
            },
            child: CircleAvatar(
              radius: 75.0,
              backgroundColor: kPrimaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(serviceLogoURL),
                radius: 70.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
