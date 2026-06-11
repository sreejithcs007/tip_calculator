import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class TipSelector extends StatefulWidget {
//   const TipSelector({super.key});

//   @override
//   State<TipSelector> createState() => _TipSelectorState();
// }

// class _TipSelectorState extends State<TipSelector> {
//   int selectedTip = 15;

//   final List<int> tips = [5, 10, 15, 20, 25];

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 12,
//       runSpacing: 12,
//       children:
//           tips.map((tip) {
//             final isSelected = selectedTip == tip;

//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedTip = tip;
//                 });
//               },
//               child: Container(
//                 width: 60,
//                 height: 50,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: isSelected ? const Color(0xFF25C8B5) : Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.grey.shade300),
//                   boxShadow:
//                       isSelected
//                           ? [
//                             BoxShadow(
//                               color: const Color(0xFF25C8B5).withOpacity(0.3),
//                               blurRadius: 10,
//                               offset: const Offset(0, 4),
//                             ),
//                           ]
//                           : [],
//                 ),
//                 child: Text(
//                   '$tip%',
//                   style: GoogleFonts.inter(
//                     fontSize: 16,
//                     fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
//                     color: isSelected ? Colors.white : Colors.black87,
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//     );
//   }
// }

class TipSelector extends StatelessWidget {
  final int selectedTip;
  final List<int> tips;
  final Function(int) onTipSelected;

  const TipSelector({
    super.key,
    required this.selectedTip,
    required this.tips,
    required this.onTipSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children:
          tips.map((tip) {
            final isSelected = selectedTip == tip;
            return GestureDetector(
              onTap: () => onTipSelected(tip),
              child: Container(
                width: 60,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF25C8B5) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow:
                      isSelected
                          ? [
                            BoxShadow(
                              color: const Color(0xFF25C8B5).withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ]
                          : [],
                ),
                child: Text(
                  '$tip%',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
