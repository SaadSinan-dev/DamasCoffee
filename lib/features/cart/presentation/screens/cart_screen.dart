import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/cart/data/cart_data.dart';
import 'package:tamkeen_mini_project/features/cart/presentation/widgets/cart_card.dart';
import 'package:tamkeen_mini_project/features/cart/presentation/widgets/cart_header_icon.dart';
import 'package:tamkeen_mini_project/features/cart/presentation/widgets/empty_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItemModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CartData.items;
  }

  void _removeItem(CartItemModel item) {
    setState(() {
      _items.remove(item);
      CartData.items.remove(item);
    });
  }

  double get _totalPrice => _items.fold(
        0.0,
        (sum, item) => sum + item.price * item.quantity,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20).r,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeaderIcon(
                      child: Icon(
                        Icons.window,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    HeaderIcon(child: Icon(Icons.person, color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: _items.isEmpty
                    ? EmptyCart()
                    : ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return CartCard(
                            key: ValueKey(item.name),
                            item: item,
                            onRemove: () => _removeItem(item),
                          );
                        },
                      ),
              ),
              if (_items.isNotEmpty)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 13.sp,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '\$',
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                _totalPrice.toStringAsFixed(2),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.textPrimary,
                          foregroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(
                              horizontal: 72.w, vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.checkout);
                        },
                        child: Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
