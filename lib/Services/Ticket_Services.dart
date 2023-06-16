import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';

import '../Models/Ticket.dart';

import '../Providers/TicketProvider.dart';
import '../utils/Constants.dart';
import '../utils/Utils.dart';

class TicketServices {
  // void getTicketById(
  //     {required BuildContext context, required String? ticketId}) async {
  //   try {
  //     print('hello');
  //     print(ticketId);
  //     print("hello end");
  //     var ticketprovider = Provider.of<TicketProvider>(context, listen: false);
  //     http.Response res = await http.get(
  //       Uri.parse('${Constants.uri}ticket/t/$ticketId'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     print(res.body);
  //     if (res.statusCode == 201) {
  //       Ticket ticket = Ticket.fromJson(jsonDecode(res.body));
  //       ticketprovider.setTicket(ticket);
  //     } else if (res.statusCode == 404) {
  //       showSnackBar(context, "TicketNotFound");
  //     } else if (res.statusCode == 403) {
  //       showSnackBar(context, "Forbidden User not Authenticated");
  //     } else {
  //       showSnackBar(context, "Error!!!");
  //     }
  //   } catch (e) {}
  // }
  Future<void> getTicketById(
      {required BuildContext context, required String? ticketId}) async {
    try {
      var ticketprovider = Provider.of<TicketProvider>(context, listen: false);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}ticket/t/$ticketId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 201) {
        Ticket ticket = Ticket.fromJson(jsonDecode(res.body));
        ticketprovider.setTicket(ticket);
      } else if (res.statusCode == 404) {
        showSnackBar(context, "TicketNotFound");
      } else if (res.statusCode == 403) {
        showSnackBar(context, "Forbidden User not Authenticated");
      } else {
        showSnackBar(context, "Error!!!");
      }
    } catch (e) {}
  }

  // Future<List<Ticket>>
  static Future<void> getclubTickets({required BuildContext context}) async {
    try {
      print(Constants.btsprofile.id);
      print(Constants.usertoken);

      http.Response myclub = await http.get(
        Uri.parse('${Constants.uri}club/my-club'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      // print(myclub.body);
    var  myclubid=jsonDecode(myclub.body)['data'][0]['_id'];
print(myclubid);

      var ticketprovider = Provider.of<TicketProvider>(context, listen: false);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}ticket/${myclubid}'),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      List<Ticket> tic=(jsonDecode(res.body))['data'];
      
      // Ticket ticket = Ticket.fromJson(tic);
      // print(ticket.club);
      // if (res.statusCode == 201) {
      //   print(res.body);
      //   // Ticket ticket = Ticket.fromJson(jsonDecode(res.body));
      //   // ticketprovider.setTicket(ticket);
      // } else if (res.statusCode == 404) {
      //   showSnackBar(context, "TicketNotFound");
      // } else if (res.statusCode == 403) {
      //   showSnackBar(context, "Forbidden User not Authenticated");
      // } else {
      //   showSnackBar(context, "Error!!!");
      // }
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }
}
