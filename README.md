# テーブル設計
## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | string     | null: false, unique: true      |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| birthday           | datetime   | null: false                    |

-has_many :items
-has_many :comments
-has_many :orders

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| seller             | string     | null: false                    |
| name               | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| price              | integer    | null: false                    |
| category           | string     | null: false                    |
| brand              | string     | null: false                    |
| situation          | string     | null: false                    |

-belongs_to :user
-has_many :comments
-has_one :order

## commentsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

-belongs_to :user
-belongs_to :item

## ordersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| buyer              | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| delivery_days      | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

-has_one :delivery_address
-has_one :delivery_day
-has_one :delivery_charge
-belongs_to :user
-belongs_to :item

## delivery_addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| address            | string     | null: false                    |
| order_id           | references | null: false, foreign_key: true |

-belongs_to :order

## delivery_daysテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| day                | string     | null: false                    |
| order_id           | references | null: false, foreign_key: true |

-belongs_to :order

## delivery_chargesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| charge             | string     | null: false                    |
| order_id           | references | null: false, foreign_key: true |

-belongs_to :order