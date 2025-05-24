import 'package:flutter/material.dart';
import 'package:gestion_certificat/page/user/appbar.dart';
import 'package:gestion_certificat/page/user/custom_card.dart';
import 'package:gestion_certificat/widgets/appbar3.dart';

import 'package:intl/intl.dart';


class DemandeCertificat extends StatefulWidget {
  const DemandeCertificat({super.key});

  @override
  State<DemandeCertificat> createState() => _DemandeCertificatState();
}

class _DemandeCertificatState extends State<DemandeCertificat> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar2(nomPage: 'Demande de Certificat',),
      body: MyCustomCard(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(child: MyDemandeForm()),
          ),
        ),
      ),
    );
  }
}


class MyDemandeForm extends StatefulWidget {
  const MyDemandeForm({super.key});

  @override
  State<MyDemandeForm> createState() => _MyDemandeFormState();
}

class _MyDemandeFormState extends State<MyDemandeForm> {
  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey _formKey = GlobalKey();

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: FocusScope(
        node: _node,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 12,),
            Text('Date de naissance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 33, 129, 101)),),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+10),
            DateInputExample(node: _node,),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+20),
            Text('Lieu de naissance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 33, 129, 101)),),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+10),
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onEditingComplete: _node.nextFocus,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 33, 129, 101), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
                hintText: "Lieu de Naissance",
                hintStyle: TextStyle(
                  color: Color.fromARGB(180, 33, 129, 101),
                  fontFamily: "Roboto",
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                // prefixIcon: const Icon(Icons.home_outlined)
              ),
            ),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+20),
            Text('Numero de telephone', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 33, 129, 101)),),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+10),
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              maxLength: 9,
              onEditingComplete: _node.nextFocus,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 33, 129, 101), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
                hintText: "7x 123 45 67",
                hintStyle: TextStyle(
                  color: Color.fromARGB(180, 33, 129, 101),
                  fontFamily: "Roboto",
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                // prefixIcon: const Icon(Icons.phone_outlined)
              ),
            ),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+10),
            Text('Numero d\'identification nationale', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 33, 129, 101)),),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+10),
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              maxLength: 13,
              onEditingComplete: _node.nextFocus,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 33, 129, 101), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
                // labelText: "CNI",
                hintText: "x xxxx xxxx xxxxx",
                hintStyle: TextStyle(
                  color: Color.fromARGB(180, 33, 129, 101),
                  fontFamily: "Roboto",
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                // prefixIcon: const Icon(Icons.perm_identity)
              ),
            ),
            Text('Numero de la maison', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 33, 129, 101)),),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+10),
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              maxLength: 9,
              onEditingComplete: _node.nextFocus,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 33, 129, 101), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
                hintText: "Maison",
                hintStyle: TextStyle(
                  color: Color.fromARGB(180, 33, 129, 101),
                  fontFamily: "Roboto",
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                ),
                fillColor: Colors.green.withValues(alpha: 0.1),
                filled: true,
                // prefixIcon: const Icon(Icons.home_outlined)
              ),
            ),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+12),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Color.fromARGB(255, 33, 129, 101),
                foregroundColor: Colors.grey,
              ),
              child: const Text(
                "Envoyer la demande",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height:MediaQuery.of(context).viewInsets.bottom+12),
          ],
        ),
      ),
    );
  }
}

class DateInputExample extends StatefulWidget {
  final FocusScopeNode? node;
  const DateInputExample({super.key, this.node});

  @override
  State <DateInputExample> createState() => _DateInputExampleState();
}

class _DateInputExampleState extends State<DateInputExample> {
  DateTime? selectedDate;// = DateTime(1990);
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = ''; // Initialize with an empty string
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    } 
    if (picked == null) {
      setState(() {
        dateController.text = "31/01/1990";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autofocus: true,
      onEditingComplete: widget.node!.nextFocus,
      controller: dateController,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 33, 129, 101), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
        ),
        fillColor: Colors.green.withValues(alpha: 0.1),
        filled: true,
        hintText: "Date de naissance",
        hintStyle: TextStyle(
          color: Color.fromARGB(180, 33, 129, 101),
          fontFamily: "Roboto",
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_month, color: Color.fromARGB(255, 33, 129, 101),),
          onPressed: () => _selectDate(context),
        ),
      ),
      // readOnly: true, // Make the text field read-only
    );
  }
}
