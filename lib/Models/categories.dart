class Categories {
  Categories({this.category, this.amount, this.link, this.children});

  String category;
  double amount;
  String link;
  List<Categories> children;
}

final List<Categories> CategoriesList = [
  Categories(category: 'Auto & Transport', children: <Categories>[
    Categories(category: 'Car payment'),
    Categories(category: 'Gas & Fuel'),
    Categories(category: 'Repairs'),
    Categories(category: 'Parking fees'),
  ]),
  Categories(category: 'Food', children: <Categories>[
    Categories(category: 'Meals'),
    Categories(category: 'Coffee Shops'),
    Categories(category: 'Restaurants'),
    Categories(category: 'Groceries'),
  ]),
  Categories(category: 'Bills & Utilities', children: <Categories>[
    Categories(category: 'Bills & Utilities'),
    Categories(category: 'Water'),
    Categories(category: 'Internet'),
    Categories(category: 'Phone'),
    Categories(category: 'Gas'),
  ]),
  Categories(category: 'Family', children: <Categories>[
    Categories(category: 'Rent'),
    Categories(category: 'Household repairs'),
    Categories(category: 'Household Items/Supplies'),
  ]),
  Categories(category: 'Shopping', children: <Categories>[
    Categories(category: 'Clothing'),
    Categories(category: 'Shoes'),
    Categories(category: 'Other supplies'),
  ]),
  Categories(category: 'Electronics & Software', children: <Categories>[
    Categories(category: 'Computer Section'),
    Categories(category: 'accessories'),
    Categories(category: 'Mobile Devices'),
    Categories(category: 'Smart Devices'),
    Categories(category: 'IOT'),
  ]),
  Categories(category: 'Gifts & Donations', children: <Categories>[
    Categories(category: 'Charity'),
    Categories(category: 'Vacations'),
    Categories(category: 'Zakat'),
    Categories(category: 'Gifts'),
  ]),
  Categories(category: 'Health & Fitness', children: <Categories>[
    Categories(category: 'Primary care'),
    Categories(category: 'Dental care'),
    Categories(category: 'Medications'),
    Categories(category: 'Personal care'),
    Categories(category: 'Sports activities'),
  ]),
  Categories(category: 'Entertainment', children: <Categories>[
    Categories(category: 'Concerts'),
    Categories(category: 'Vacations'),
    Categories(category: 'Games'),
    Categories(category: 'Movies & DVDs'),
    Categories(category: ' (Subscriptions (Netflix, Amazon, Hulu, etc'),
  ]),
  Categories(category: 'Insurances', children: <Categories>[
    Categories(category: 'Health Insurance'),
    Categories(category: 'Auto insurance'),
    Categories(category: 'Life insurance'),
  ]),
  Categories(category: 'Travel',children: [Categories(category: 'Travel')]),
  Categories(category: 'Cash',children: [Categories(category: 'Cash')]),
  Categories(category: 'Other',children: [Categories(category: 'Other')]),
];

final categories = [
  "Entertainment",
  "Travel",
  "Shopping",
  "Food",
];
