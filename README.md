# テーブル設計
## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false,                   |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| birthday           | date       | null: false                    |

-has_many :items
-has_many :orders

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| content            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| charge_id          | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| days_id            | integer    | null: false                    |
| price              | integer    | null: false                    |

-belongs_to :user
-belongs_to :category
-belongs_to :situation
-belongs_to :charge
-belongs_to :area
-belongs_to :days
-has_one :order


## ordersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

-has_one :address
-belongs_to :user
-belongs_to :item

## addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| area_id            | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

-belongs_to :order
