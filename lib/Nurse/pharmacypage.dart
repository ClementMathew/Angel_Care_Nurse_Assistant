import 'package:flutter/material.dart';
import 'descpage.dart';

class Pharmpage extends StatelessWidget {
  const Pharmpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: const Color.fromRGBO(82, 164, 80, 1),
        title: const Text("Pharmacy",style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2,color: Color.fromRGBO(82, 164, 80, 1),),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    hintText: "Search",
                      suffixIcon: const Icon(Icons.search_rounded),
                    suffixIconColor: const Color.fromRGBO(73, 69, 79, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    elevation: 15,
                    child: ListTile(
                      subtitle: const Text("Quantity : 120 units",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                      title: const Text("Ibuprofen",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                      ),
                      trailing: IconButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>const description(
                          medicineName: 'Ibuprofen',
                          medicineDescription:
                          'Ibuprofen is a nonsteroidal anti-inflammatory drug (NSAID) used to relieve pain, reduce inflammation, and lower fever. It works by blocking the production of certain chemicals in the body that cause pain and inflammation.',
                        )));
                      },
                        icon: const Icon(Icons.arrow_circle_right_rounded,
                          size: 35,
                          color: Color.fromRGBO(82, 164, 80, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
