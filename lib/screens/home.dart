import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tip_calculator/controller/homescreencontroller.dart';
import 'package:tip_calculator/customwidget/tipselect.dart';
import 'package:tip_calculator/screens/resultpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenController controller = HomeScreenController();

  @override
  void initState() {
    controller = Get.put(HomeScreenController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FBF9),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          '💸 Tip Calculator',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1B2733),
          ),
        ),
        // backgroundColor: const Color.fromARGB(255, 243, 241, 241),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bill Amount',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1B2733),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      keyboardType: TextInputType.number,
                      controller: controller.billAmountTextController,
                      decoration: InputDecoration(
                        hintText: 'Enter bill amount',
                        hintStyle: TextStyle(color: Color(0xFFB9BEC5)),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        prefixIcon: Container(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            '₹',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF25C8B5),
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),

                          borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Colors.grey.shade200, thickness: 1),
                    SizedBox(height: 20),

                    Text(
                      'Select Tip %',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1B2733),
                      ),
                    ),
                    SizedBox(height: 20),

                    Obx(
                      () => TipSelector(
                        selectedTip: controller.selectedTip.value,
                        tips: const [5, 10, 15, 20, 25],
                        onTipSelected: (tip) {
                          controller.selectedTip.value = tip;
                          controller.customTipPercentageTextController.text =
                              tip.toString();
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Colors.grey.shade200, thickness: 1),
                    SizedBox(height: 20),
                    Text(
                      'Custom Tip',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1B2733),
                      ),
                    ),
                    SizedBox(height: 20),

                    TextFormField(
                      controller: controller.customTipPercentageTextController,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Custom tip',
                        hintStyle: TextStyle(color: Color(0xFFB9BEC5)),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        suffixIcon: Icon(Icons.percent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),

                          borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                      ),
                      onChanged: (value) {
                        final tip = int.tryParse(value);
                        if (tip != null) {
                          controller.selectedTip.value = tip;
                        }
                      },
                    ),

                    SizedBox(height: 20),

                    Divider(color: Colors.grey.shade200, thickness: 1),
                    SizedBox(height: 20),
                    Text(
                      'Number of people',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1B2733),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: controller.personTextController,

                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.personCountIncrement();
                          },
                          icon: Icon(Icons.add),
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {
                            controller.personCountDecrement(context);
                          },
                          icon: Icon(Icons.remove),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),

                          borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  controller.calculatePerPerson(
                    billAmount:
                        double.tryParse(
                          controller.billAmountTextController.text,
                        ) ??
                        0,
                    tipPercentage:
                        double.tryParse(
                          controller.selectedTip.value.toString(),
                        ) ??
                        0,
                    peopleCount: controller.personCount.value,
                    context: context,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Color(0x3325C8B5),
                  backgroundColor: const Color(0xFF25C8B5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Calculate',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
