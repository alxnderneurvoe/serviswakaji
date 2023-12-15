import 'package:app_servis/shooping/Category/ban.dart';
import 'package:flutter/material.dart';
import '../berandashop.dart';

import '../Page/Cart.dart';
import '../Page/ItemPage.dart';
import '../ToSide/Profil.dart';

void navigateToHomePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BerandaShopPage()),
  );
}

void navigateToCartPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CartPage()),
  );
}

void navigateToItemPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ItemPage()),
  );
}

void navigateToProfilPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProfilPage()),
  );
}

void navigateToBanPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BanPage()),
  );
}

