import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/notification_repository.dart';
import 'package:manwe/src/domain/blocs/notification/notification_screen_cubit.dart';
import 'package:manwe/src/ui/notifications/components/notification_card.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen();

  @override
  Widget build(BuildContext context) {
    final notificationRepository = new NotificationRepository();
    final Size size = MediaQuery
        .of(context)
        .size;

    return BlocProvider(
      create: (context) =>
      NotificationScreenCubit(notificationRepository: notificationRepository)
        ..notificationScreenStarted(),
      child: BlocBuilder<NotificationScreenCubit, NotificationScreenState>(
        builder: (context, state) {
          if (state is NotificationScreenLoading) {
            return LoadingCube();
          } else if (state is NotificationScreenSuccessLoad) {
            final notifications = state.notificationsScreen.notifications;
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Column(
                  children: [
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Container(
                        height: 15.0,
                      ),
                      padding: EdgeInsets.only(top: 0.0),
                      scrollDirection: Axis.vertical,
                      itemCount: notifications.length,
                      itemBuilder: (context, i) {
                        return NotificationCard(
                          imageURL: notifications[i].serviceImageUrl,
                          title: notifications[i].title,
                          body: notifications[i].body,
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return ErrorScreen();
          }
        },
      ),
    );
  }
}
