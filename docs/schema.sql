-- SQL dump generated using DBML (dbml-lang.org)
-- Database: PostgreSQL
-- Generated at: 2022-04-28T11:26:46.986Z

CREATE TABLE "user" (
  "id" bigint PRIMARY KEY,
  "phone_number" varchar(50),
  "create_time" datetime(6),
  "update_time" datetime(6)
);

CREATE TABLE "orders" (
  "id" bigint(20) PRIMARY KEY,
  "user_id" int(20),
  "status" varchar(10),
  "create_time" datetime(6),
  "update_time" datetime(6)
);

CREATE TABLE "order_items" (
  "id" bigint(20) PRIMARY KEY,
  "product_id" int(20),
  "quantity" int(10)
);

CREATE TABLE "products" (
  "id" bigint(20) PRIMARY KEY,
  "merchant_id" int(20),
  "name" varchar(100),
  "price" int(20),
  "status" varchar(10),
  "create_time" datetime(6),
  "update_time" datetime(6)
);

CREATE TABLE "merchants" (
  "id" bigint(20) PRIMARY KEY,
  "merchant_name" varchar(20),
  "admin_id" int(20),
  "create_time" datetime(6),
  "update_time" datetime(6)
);

ALTER TABLE "orders" ADD FOREIGN KEY ("id") REFERENCES "user" ("id");

ALTER TABLE "merchants" ADD FOREIGN KEY ("admin_id") REFERENCES "user" ("id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("id") REFERENCES "orders" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("id") REFERENCES "order_items" ("product_id");

ALTER TABLE "products" ADD FOREIGN KEY ("merchant_id") REFERENCES "merchants" ("id");
