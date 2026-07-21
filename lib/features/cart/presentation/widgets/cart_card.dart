// features/cart/presentation/widgets/cart_item_card.dart

import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/cart/data/cart_data.dart';

class CartCard extends StatefulWidget {
  final CartItemModel item;

  const CartCard({super.key, required this.item});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  void _increment() => setState(() => widget.item.quantity++);

  void _decrement() {
    if (widget.item.quantity > 1) {
      setState(() => widget.item.quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(38, 43, 51, 1),
          Color.fromRGBO(38, 43, 51, 0)
        ]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.item.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                //Roust
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(15, 28, 27, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    ' ${widget.item.roastLevel} Roast',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.item.size.toInt()}g',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                        fontFamily: 'Inter',
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          (widget.item.price * widget.item.quantity)
                              .toStringAsFixed(2),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            _QuantityButton(
                              icon: Icons.remove,
                              onTap: _decrement,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.textPrimary)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${widget.item.quantity}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            _QuantityButton(
                              icon: Icons.add,
                              onTap: _increment,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            _QuantityButton(
                              icon: Icons.remove,
                              onTap: _decrement,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.textPrimary)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${widget.item.quantity}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            _QuantityButton(
                              icon: Icons.add,
                              onTap: _increment,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: AppColors.textPrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.primary, size: 16),
      ),
    );
  }
}
