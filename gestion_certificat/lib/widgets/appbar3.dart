import 'package:flutter/material.dart';
import 'package:gestion_certificat/constants/app_colors.dart';
import 'package:gestion_certificat/page/page_acceuil.dart';


class MyAppbar2 extends StatefulWidget implements PreferredSizeWidget {

  final String nomPage;
  const MyAppbar2({super.key,required this.nomPage});

  @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Size get preferredSize => const Size.fromHeight(200);

  @override
  State<MyAppbar2> createState() => _MyAppbar2State();
}

class _MyAppbar2State extends State<MyAppbar2> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(400, 170),
      
      child: Column(
        children: [
          AppBar(
            foregroundColor:  AppColors.buttonSecondary,
            toolbarHeight: 170,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
              child: Column(
                children: [
                  // 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageAcceuil()),
                          );
                        },
                        icon: Image.asset("assets/images/logo5.png",
                          height: 90,
                        ),
                      ),
                      IconButton(
                      
                        icon: const Icon(Icons.menu_rounded),
                        color: AppColors.buttonSecondary,
                        iconSize: 50,
                        tooltip: 'Menu',
                        onPressed: () {
                          // handle the press
                        },
                      ),
                    
                    ],
                  ),

                  // 

                Padding(
                  padding: const EdgeInsets.only(top: 10 , left: 10, right: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      TextButton(
                        onPressed: () { Navigator.pop(context); },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "Retour",
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
            
                      const SizedBox(height: 5),
                      Text(
                        widget.nomPage,
                        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),


                ],
              )
            ),
           
           
            backgroundColor:  AppColors.background2,
          ),
         
        ]
      ),
    );
  }
}