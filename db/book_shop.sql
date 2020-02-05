DROP TABLE books;
DROP TABLE authors;
DROP TABLE publishers;
DROP TABLE geners;




CREATE TABLE authors
(
  id SERIAL primary key,
  name VARCHAR(255) not null

);

CREATE TABLE publishers
(
  id SERIAL primary key,
  name VARCHAR(255) not null

);

CREATE TABLE geners
(
  id SERIAL PRIMARY key,
  gener VARCHAR(10)
);

CREATE TABLE books
(
  id SERIAL primary key,
  title VARCHAR(255) not null,
  buying_price FLOAT,
  selling_price FLOAT,
  description VARCHAR(255),
  stock_quantity INT,
  author_id INT REFERENCES authors(id) ON DELETE CASCADE,
  publisher_id INT REFERENCES publishers(id) ON DELETE CASCADE,
  gener_id INT REFERENCES geners(id) ON DELETE CASCADE

);
