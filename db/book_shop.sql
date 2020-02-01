DROP TABLE books;
DROP TABLE authors;
DROP TABLE publishers;




CREATE TABLE authors
(
  id SERIAL primary key,
  name VARCHAR(255) not null

);

CREATE TABLE books
(
  id SERIAL primary key,
  title VARCHAR(255) not null,
  buying_price INT,
  selling_price INT,
  description VARCHAR(255),
  stock_quantity INT,
  author_id INT REFERENCES authors(id)

);

CREATE TABLE publishers
(
  id SERIAL primary key,
  name VARCHAR(255) not null

);
