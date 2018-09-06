-- Created by chris otaalo
-- Last modification date: 2016-02-17 15:23:43.807




-- tables
-- Table Authors
CREATE TABLE authors (
    author_id int  NOT NULL AUTO_INCREMENT,
    author_firstname varchar(50)  NOT NULL,
    author_lastname varchar(50)  NOT NULL,
    author_othernames varchar(50)  NOT NULL,
    author_birthdate date  NOT NULL,
    author_history text  NOT NULL,
    author_image text  NOT NULL,
    author_isactive int  NOT NULL  DEFAULT 1,
    CONSTRAINT authors_pk PRIMARY KEY (author_id)
);

-- Table Book_Author
CREATE TABLE book_author (
    book_author_id int  NOT NULL AUTO_INCREMENT,
    bookId int  NOT NULL,
    authorId int  NOT NULL,
    CONSTRAINT book_author_pk PRIMARY KEY (book_author_id)
);

-- Table Book_Genre
CREATE TABLE book_genres (
    book_genreid int  NOT NULL AUTO_INCREMENT,
    book_genre varchar(20)  NOT NULL,
    book_genreactive int  NOT NULL  DEFAULT 1,
    CONSTRAINT book_genres_pk PRIMARY KEY (book_genreid)
);

-- Table Book_Images
CREATE TABLE book_images (
    imageID int  NOT NULL AUTO_INCREMENT,
    book_id int  NOT NULL,
    imagePath TEXT  NOT NULL,
    imageIsTitle int  NOT NULL  DEFAULT 0,
    imageActive int  NOT NULL  DEFAULT 1,
    CONSTRAINT book_images_pk PRIMARY KEY (imageID)
);

-- Table Books
CREATE TABLE books (
    book_id int  NOT NULL AUTO_INCREMENT,
    book_title varchar(50)  NOT NULL,
    book_isbn varchar(15)  NOT NULL,
    book_yop date  NOT NULL,
    book_dateadded timestamp  NOT NULL,
    book_active int  NOT NULL  DEFAULT 1,
    book_genreid int  NOT NULL,
    book_publisherid int  NOT NULL,
    CONSTRAINT books_pk PRIMARY KEY (book_id)
);

CREATE INDEX books_idx_1 ON books (book_genreid,book_publisherid);


-- Table `Order`
CREATE TABLE `order` (
    order_id int  NOT NULL AUTO_INCREMENT,
    user_id int  NOT NULL,
    total_amount varchar(10)  NOT NULL,
    date_added timestamp  NOT NULL,
    CONSTRAINT order_pk PRIMARY KEY (order_id)
);

-- Table Order_Details
CREATE TABLE order_details (
    order_detail_id int  NOT NULL AUTO_INCREMENT,
    order_id int  NOT NULL,
    book_id int  NOT NULL,
    order_quantity int  NOT NULL,
    order_price varchar(10)  NOT NULL,
    order_dateadded timestamp  NOT NULL,
    order_status int  NOT NULL  DEFAULT 0,
    CONSTRAINT order_details_pk PRIMARY KEY (order_detail_id)
);

-- Table Publishers
CREATE TABLE publishers (
    publisher_id int  NOT NULL AUTO_INCREMENT,
    publisher_name varchar(20)  NOT NULL,
    publisher_country int  NOT NULL,
    publisher_city varchar(20)  NOT NULL,
    publisher_active int  NOT NULL  DEFAULT 1,
    CONSTRAINT publishers_pk PRIMARY KEY (publisher_id)
);

-- Table User
CREATE TABLE user (
    user_id int  NOT NULL AUTO_INCREMENT,
    user_firstname varchar(20)  NOT NULL,
    user_lastname varchar(20)  NOT NULL,
    user_emailaddress varchar(50)  NOT NULL,
    user_password varchar(255)  NOT NULL,
    user_type varchar(50)  NOT NULL  DEFAULT "customer",
    user_active int  NOT NULL  DEFAULT 1,
    CONSTRAINT user_pk PRIMARY KEY (user_id)
);

-- Table User_Billing
CREATE TABLE user_billing (
    billing_id int  NOT NULL AUTO_INCREMENT,
    billing_user_id int  NOT NULL,
    billing_address TEXT  NOT NULL,
    billing_country varchar(50)  NOT NULL,
    billing_phonenumber varchar(20)  NOT NULL,
    active int  NOT NULL  DEFAULT 1,
    CONSTRAINT user_billing_pk PRIMARY KEY (billing_id)
);





-- foreign keys
-- Reference:  Book_Author_Authors (table: Book_Author)

ALTER TABLE book_author ADD CONSTRAINT book_author_authors FOREIGN KEY book_author_authors (authorId)
    REFERENCES authors (author_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
-- Reference:  Book_Author_Books (table: Book_Author)

ALTER TABLE book_author ADD CONSTRAINT book_author_books FOREIGN KEY book_author_books (bookId)
    REFERENCES books (book_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
-- Reference:  Book_Images_Books (table: Book_Images)

ALTER TABLE book_images ADD CONSTRAINT book_images_books FOREIGN KEY book_images_books (book_id)
    REFERENCES books (book_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
-- Reference:  Books_Book_Genre (table: Books)

ALTER TABLE books ADD CONSTRAINT books_book_genres FOREIGN KEY books_book_genres (book_genreid)
    REFERENCES book_genres (book_genreid)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
-- Reference:  Books_Publishers (table: Books)

ALTER TABLE books ADD CONSTRAINT books_publishers FOREIGN KEY books_publishers (book_publisherid)
    REFERENCES publishers (publisher_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
-- Reference:  Order_Details_Books (table: Order_Details)

ALTER TABLE order_details ADD CONSTRAINT order_details_books FOREIGN KEY order_details_books (book_id)
    REFERENCES books (book_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
-- Reference:  Order_Details_Order (table: Order_Details)

ALTER TABLE order_details ADD CONSTRAINT order_details_order FOREIGN KEY order_details_order (order_id)
    REFERENCES `order` (order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
-- Reference:  Order_User (table: `Order`)

ALTER TABLE `order` ADD CONSTRAINT order_user FOREIGN KEY order_user (user_id)
    REFERENCES user (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
-- Reference:  User_Billing_User (table: User_Billing)

ALTER TABLE user_billing ADD CONSTRAINT user_billing_user FOREIGN KEY user_billing_user (billing_user_id)
    REFERENCES user (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;



-- End of file.

