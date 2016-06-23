DROP TABLE pets;
DROP TABLE pet_stores;


CREATE TABLE pet_stores(
  id serial4 primary key,
  name varchar(255),
  address varchar(255),
  stock_type varchar(255)
);

CREATE TABLE pets(
  id serial4 primary key,
  name varchar(255),
  type varchar(255),
  pet_shop_id int4 references pet_stores(id)
);

