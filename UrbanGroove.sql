create database ECommerce_DB;
use ECommerce_DB;
create table admin_personal_details(
	admin_id int auto_increment primary key,
    admin_fname varchar (100) not null,
    admin_lname varchar (100) not null,
    admin_email varchar(255) unique key not null,
    admin_phone varchar(10) unique key not null,
    admin_username varchar(255) unique key not null,
    admin_password varchar(255) not null,
    admin_profile_picture text not null,
    admin_govId_picture text not null,
    admin_registered_time timestamp default now(),
    admin_status_updated varchar(255) not null default "N/A",
    admin_status tinyint default 0
);

create table admin_address(
	admin_address_id int auto_increment primary key,
	admin_username varchar(255) unique key not null,
    admin_address varchar(500) not null,
    admin_city varchar(50) not null,
    admin_state varchar(50) not null,
    admin_zip_code int not null,
    primary key(admin_address_id,admin_username),
    foreign key(admin_username) references admin_personal_details(admin_username) on delete cascade
);

create table vendor_personal_details(
	vendor_id int auto_increment primary key,
    vendor_fname varchar (100) not null,
    vendor_lname varchar (100) not null,
    vendor_email varchar(255) unique key not null,
    vendor_phone varchar(10) unique key not null,
    vendor_username varchar(255) unique key not null,
    vendor_password varchar(255) not null,
    vendor_gst_number varchar(15) not null,
    vendor_trade_license text not null,
    vendor_govId_picture text not null,
    vendor_registered_time timestamp default now(),
    vendor_status_updated varchar(255) not null default "N/A",
    vendor_status tinyint default 0
);
create table vendor_personal_address(
	vendor_address_id int auto_increment,
	vendor_username varchar(255) unique key not null,
    vendor_address varchar(500) not null,
    vendor_city varchar(50) not null,
    vendor_state varchar(50) not null,
    vendor_zip_code int not null,
    primary key(vendor_address_id),
    foreign key (vendor_username) references vendor_personal_details(vendor_username) on delete cascade
);

create table vendor_shop_address(
	vendor_shop_address_id int auto_increment primary key,
	vendor_username varchar(255) unique key not null,
    vendor_shop_name_number varchar(200) not null,
    vendor_shop_address varchar(500) not null,
    vendor_shop_city varchar(50) not null,
    vendor_shop_state varchar(50) not null,
    vendor_shop_zip_code int not null,
    foreign key (vendor_username) references vendor_personal_details(vendor_username) on delete cascade
);

create table clothing_products(
	product_id int auto_increment primary key,
    vendor_username varchar(255) not null,
    product_type varchar(8) default "clothing",
    product_name varchar(200) not null,
    product_brand_name varchar(200),
    product_original_price double not null,
    product_selling_price double not null,
    product_quantity int not null,
    product_stock_status tinyint default 1,
    product_keywords varchar(500) not null,
    product_description varchar(1000) not null,
    product_img1 text not null,
    product_img2 text not null,
    product_img3 text not null,
    product_img4 text not null,
    product_img5 text not null,
    product_size1 text,
    product_size2 text,
    product_size3 text,
    product_size4 text,
    product_size5 text,
    product_refund_replace_option text not null,
    product_rating float default 0.0,
    product_rating_count int default 0,
    product_updated datetime default now(),
    product_status tinyint default 0,
    product_status_updated_by varchar(255) default "N/A",
    foreign key (vendor_username) references vendor_personal_details(vendor_username) on delete cascade
);
create table electronics_products(
	product_id int auto_increment primary key,
    vendor_username varchar(255) not null,
    product_type varchar(11) default "electronics",
    product_name varchar(200) not null,
    product_brand_name varchar(200),
    product_original_price double not null,
    product_selling_price double not null,
    product_quantity int not null,
    product_stock_status tinyint default 1,
    product_keywords varchar(500) not null,
	product_description varchar(1000) not null,
    product_technical_description varchar(800) not null,
    product_img1 text not null,
    product_img2 text not null,
    product_img3 text not null,
    product_img4 text not null,
    product_img5 text not null,
    product_refund_replace_option text not null,
    product_rating float default 0.0,
    product_rating_count int default 0,
    product_updated datetime default now(),
    product_status tinyint default 0,
    product_status_updated_by varchar(255) default "N/A",
    foreign key (vendor_username) references vendor_personal_details(vendor_username) on delete cascade
);
create table food_products(
	product_id int auto_increment primary key,
    vendor_username varchar(255) not null,
    product_type varchar(4) default "food",
    product_name varchar(200) not null,
    product_brand_name varchar(200),
    product_original_price double not null,
    product_selling_price double not null,
    product_quantity int not null,
    product_stock_status tinyint default 1,
    product_keywords varchar(500) not null,
	product_description varchar(1000) not null,
    product_shelf_life varchar(100) not null,
    product_perishable boolean not null,
    product_vegetarian boolean not null,
    product_meat_type text,
    product_img1 text not null,
    product_img2 text not null,
    product_img3 text not null,
    product_img4 text not null,
    product_img5 text not null,
	product_refund_replace_option text not null,
    product_rating float default 0.0,
    product_rating_count int default 0,
    product_updated datetime default now(),
    product_status tinyint default 0,
    product_status_updated_by varchar(255) default "N/A",
    foreign key (vendor_username) references vendor_personal_details(vendor_username) on delete cascade
);
create table client_personal_details(
	client_id int auto_increment primary key,
    client_fname varchar(100) not null,
    client_lname varchar(100) not null,
    client_email varchar(255) unique key not null,
    client_phone varchar(10) unique key not null,
    client_username varchar(255) unique key not null,
    client_password varchar(255) not null,
    client_profile_picture text,
    client_status tinyint default 1,
    client_registered_time timestamp default now()
);
create table client_address(
	client_address_id int auto_increment primary key,
	client_username varchar(255) not null,
    client_address_type text not null,
    client_address varchar(500) not null,
    client_city varchar(50) not null,
    client_state varchar(50) not null,
    client_landmark varchar(200),
    client_zip_code int not null,
    foreign key(client_username) references client_personal_details(client_username) on delete cascade
);
create table client_favourite_address(
	client_fav_address_id int auto_increment primary key,
	client_username varchar(255) not null,
    client_fav_address_type text not null,
    client_fav_address varchar(500) not null,
    client_fav_city varchar(50) not null,
    client_fav_state varchar(50) not null,
    client_fav_landmark varchar(200),
    client_fav_zip_code int not null,
    receiver_name varchar(100) not null,
    receiver_phone varchar(10) not null,
    foreign key(client_username) references client_personal_details(client_username) on delete cascade
);
CREATE TABLE wishlist (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    client_username varchar(255) not null,
    product_id INT NOT NULL,
    product_type varchar(20) NOT NULL,
    product_name varchar(200) not null,
    product_price double not null,
    product_img1 text not null,
    FOREIGN KEY (client_id) REFERENCES client_personal_details(client_id) ON DELETE CASCADE
);

CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    client_username varchar(255) not null,
    product_id INT NOT NULL,
    product_type varchar(20) NOT NULL,
    product_name varchar(200) not null,
    product_price double not null,
    product_img1 text not null,
    product_size varchar(20),
    product_quantity int not null default 1,
    FOREIGN KEY (client_id) REFERENCES client_personal_details(client_id) ON DELETE CASCADE
);
CREATE TABLE blog_posts (
    blog_id bigint AUTO_INCREMENT PRIMARY KEY,
    blog_title VARCHAR(255) NOT NULL,
    blog_content VARCHAR(10000) NOT NULL,
    blog_img TEXT NOT NULL,
    client_id INT NOT NULL,
    client_name VARCHAR(200) NOT NULL,
    link TEXT,
    like_count bigint default 0,
    dislike_count bigint default 0,
    upload_date timestamp default current_timestamp,
    FOREIGN KEY (client_id) REFERENCES client_personal_details(client_id) ON DELETE CASCADE
);
create table blog_like_dislike_log(
	log_id bigint auto_increment primary key,
    blog_id bigint not null,
    client_id int not null,
    log tinyint not null, -- 1 for liked, 0 for disliked
    log_time timestamp default current_timestamp,
    FOREIGN KEY (client_id) REFERENCES client_personal_details(client_id) ON DELETE CASCADE,
    FOREIGN KEY (blog_id) REFERENCES blog_posts(blog_id) ON DELETE CASCADE
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_id varchar(20) not null, -- "CASH ON DELIVERY"
    payment_order_id varchar(20) not null,
    client_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount DOUBLE NOT NULL,
    client_personal_address text not null,
    client_fav_address1 text,
    client_fav_address2 text,
    client_fav_address3 text,
    order_reference_code varchar(80) not null unique,
    order_status tinyint default 0, -- 0 means pending 1 means delivered 
    FOREIGN KEY (client_id) REFERENCES client_personal_details(client_id)
);
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    client_id INT NOT NULL,
    product_name varchar(200) not null,
    product_type varchar(20) not null,
    product_size text,
    product_id INT NOT NULL,
    product_img1 text not null,
    product_quantity INT NOT NULL,
    product_selling_price double NOT NULL,
    product_status tinyint default 0,
    total_item_price double not null,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) on delete cascade
);
create table product_rating_review(
	product_rating_review_id int auto_increment primary key,
    order_id INT NOT NULL,
    client_id int not null,
    product_id int not null,
    product_type varchar(20) not null,
    product_client_rating float not null default 0.0,
    product_review varchar(200) not null default "",
    foreign key product_rating_review(client_id) references client_personal_details(client_id)
);

delete from orders;
delete from order_items;
delete from product_rating_review;

select * from client_personal_details;
select * from orders;
select * from order_items;
select * from product_rating_review;
select * from electronics_products;
-- update food_products set product_rating=0, product_rating_count=0;
-- use ECommerce_DB;
select * from client_personal_details;
-- SELECT oi.order_item_id, oi.order_id, oi.product_name, oi.product_type, oi.product_size, oi.product_id, oi.product_img1, oi.product_quantity, oi.product_selling_price, oi.total_item_price, prr.product_client_rating, prr.product_review FROM order_items oi INNER JOIN product_rating_review prr ON oi.order_id=prr.order_id WHERE oi.product_id=1 AND oi.product_type="food";