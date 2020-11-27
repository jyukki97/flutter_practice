import 'package:flutter/material.dart';
import 'package:flutter_book/appointments/AppointmentsList.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ContactsDBWorker.dart';
import 'ContactsEntry.dart';
import 'ContactsList.dart';
import 'ContactsModel.dart' show ContactsModel, contactsModel;

class Contacts extends StatelessWidget {
  Tasks(){
    contactsModel.loadData("appointments", ContactsDBWorker.db);
  }
  Widget build(BuildContext inContext){

    return ScopedModel<ContactsModel>(
        model: contactsModel,
        child: ScopedModelDescendant<ContactsModel>(
            builder: (BuildContext inContext, Widget inChild, ContactsModel inModel){
              return IndexedStack(
                  index: inModel.stackIndex,
                  children: [ContactsList(), ContactsEntry()]
              );
            }
        )
    );
  }
}