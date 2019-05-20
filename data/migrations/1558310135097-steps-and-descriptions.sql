CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
<!-- Creates a table from the data in the first table 1558310510630-->

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
<!-- This will get all of the unique bookshelf names from books and put them into the bookshelf table in the name column 1558310687606-->

ALTER TABLE books ADD COLUMN bookshelf_id INT;

<!-- adds a column to the bookshelf table for later tying it to the book table. 1558310761269--> 

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

<!-- this gets the tables ready to be connected. its going to find all of the matching names between the books table and the bookshelf table then set the od of that bookshelf row to whatever the bookshelf_id is. 1558310918531 -->

ALTER TABLE books DROP COLUMN bookshelf;

<!-- now that we have bookshelf table we dont need the column bookshelf in books so we drop it. 1558311029723--> 

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);

<!--finally we link the two tables with a foreign key --> 