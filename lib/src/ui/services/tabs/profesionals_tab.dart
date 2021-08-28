import 'package:flutter/material.dart';
import 'package:manwe/src/domain/models/service_page.dart';
import 'package:manwe/src/ui/services/components/profesional_list_item.dart';

class ProfesionalsTab extends StatelessWidget {
  final List<Person> profesionals;

  const ProfesionalsTab({required this.profesionals});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ProfesionaListItem(
          name: profesionals[index].name,
          charge: profesionals[index].charge,
          email: profesionals[index].email,
          profilePictureURL: profesionals[index].profilePictureUrl,
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: profesionals.length,
    );
  }
}
