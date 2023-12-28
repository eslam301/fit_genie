import 'package:flutter/material.dart';

class CustomBottomSheetList extends StatelessWidget {
  final String? title ;
  final List<String> list ;

  const CustomBottomSheetList({super.key , required this.list , this.title});
  @override
  Widget build(BuildContext context) {
    String selectedValue = list[0];
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background.withOpacity(0.85),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )
        ),
        child: Column(
            children: [
              Container(
                  width: 40,height: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      )
                  )
              ),
              Text('$title', style: const TextStyle(color: Colors.white,fontSize: 36,fontWeight: FontWeight.w500),),
              const SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                              onTap: (){
                                selectedValue = list[index];
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all( 10),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0,),
                                  )
                                ),
                                child: Text(list[index],
                                  style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 30,),
                                  textAlign: TextAlign.center,
                                  ),
                              )
                          ),
                        ],
                      );
                    }
                ),
              )
            ]
        )
    );
  }
}
