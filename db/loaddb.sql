PRAGMA foreign_keys = ON;
GO

CREATE TABLE IF NOT EXISTS account (
	userid varchar (80) PRIMARY KEY NOT NULL ,
	email varchar (80) NOT NULL ,
	firstname varchar (80) NOT NULL ,
	lastname varchar (80) NOT NULL ,
	status varchar (2) NULL ,
	addr1 varchar (80) NOT NULL ,
	addr2 varchar (40) NULL ,
	city varchar (80) NOT NULL ,
	state varchar (80) NOT NULL ,
	zip varchar (20) NOT NULL ,
	country varchar (20) NOT NULL ,
	phone varchar (80) NOT NULL
)
GO

CREATE TABLE IF NOT EXISTS bannerdata (
	favcategory varchar (80) PRIMARY KEY NOT NULL,
	bannername varchar (255) NULL 
)
GO

CREATE TABLE IF NOT EXISTS category (
	catid varchar (10) PRIMARY KEY NOT NULL,
	name varchar (80) NULL ,
	descn varchar (255) NULL 
)
GO

CREATE TABLE IF NOT EXISTS inventory (
	itemid varchar (10) PRIMARY KEY NOT NULL,
	qty int NOT NULL 
)
GO

CREATE TABLE IF NOT EXISTS item (
	itemid varchar (10) PRIMARY KEY NOT NULL,
	productid varchar (10) NOT NULL ,
	listprice decimal(10, 2) NULL ,
	unitcost decimal(10, 2) NULL ,
	supplier int NULL ,
	status varchar (2) NULL ,
	attr1 varchar (80) NULL ,
	attr2 varchar (80) NULL ,
	attr3 varchar (80) NULL ,
	attr4 varchar (80) NULL ,
	attr5 varchar (80) NULL ,
	FOREIGN KEY (productid) REFERENCES product(productid),
	FOREIGN KEY (supplier) REFERENCES supplier(suppid)
)
GO

CREATE TABLE IF NOT EXISTS lineitem (
	orderid int NOT NULL ,
	linenum int NOT NULL ,
	itemid varchar (10) NOT NULL ,
	quantity int NOT NULL ,
	unitprice numeric(10, 2) NOT NULL ,
	PRIMARY KEY (orderid, linenum) ,
	FOREIGN KEY (orderid) REFERENCES orders(orderid)
)
GO


CREATE TABLE IF NOT EXISTS orders (
	orderid int PRIMARY KEY NOT NULL ,
	userid varchar (80) NOT NULL ,
	orderdate datetime NOT NULL ,
	shipaddr1 varchar (80) NOT NULL ,
	shipaddr2 varchar (80) NULL ,
	shipcity varchar (80) NOT NULL ,
	shipstate varchar (80) NOT NULL ,
	shipzip varchar (20) NOT NULL ,
	shipcountry varchar (20) NOT NULL ,
	billaddr1 varchar (80) NOT NULL ,
	billaddr2 varchar (80) NULL ,
	billcity varchar (80) NOT NULL ,
	billstate varchar (80) NOT NULL ,
	billzip varchar (20) NOT NULL ,
	billcountry varchar (20) NOT NULL ,
	courier varchar (80) NOT NULL ,
	totalprice numeric(10, 2) NOT NULL ,
	billtofirstname varchar (80) NOT NULL ,
	billtolastname varchar (80) NOT NULL ,
	shiptofirstname varchar (80) NOT NULL ,
	shiptolastname varchar (80) NOT NULL ,
	creditcard varchar (80) NOT NULL ,
	exprdate varchar (7) NOT NULL ,
	cardtype varchar (80) NOT NULL ,
	locale varchar (80) NOT NULL ,
	FOREIGN KEY (userid) REFERENCES account(userid)
)
GO

CREATE TABLE IF NOT EXISTS orderstatus (
	orderid int NOT NULL ,
	linenum int NOT NULL ,
	timestamp datetime NOT NULL ,
	status varchar (2) NOT NULL,
	PRIMARY KEY (orderid, linenum) ,
	FOREIGN KEY (orderid) REFERENCES orders(orderid)
)
GO

CREATE TABLE IF NOT EXISTS product (
	productid varchar (10) PRIMARY KEY NOT NULL ,
	category varchar (10) NOT NULL ,
	name varchar (80) NULL ,
	descn varchar (255) NULL ,
	FOREIGN KEY (category) REFERENCES category(catid)	
)
GO

CREATE TABLE IF NOT EXISTS profile (
	userid varchar (80) PRIMARY KEY NOT NULL ,
	langpref varchar (80) NOT NULL ,
	favcategory varchar (30) NULL ,
	mylistopt int NULL ,
	banneropt int NULL 
)
GO

CREATE TABLE IF NOT EXISTS sequence (
	name varchar (30) PRIMARY KEY NOT NULL ,
	nextid int NOT NULL 
)
GO

CREATE TABLE IF NOT EXISTS signon (
	username varchar (25) PRIMARY KEY NOT NULL ,
	password varchar (25) NOT NULL 
)
GO

CREATE TABLE IF NOT EXISTS supplier (
	suppid int PRIMARY KEY NOT NULL ,
	name varchar (80) NULL ,
	status varchar (2) NOT NULL ,
	addr1 varchar (80) NULL ,
	addr2 varchar (80) NULL ,
	city varchar (80) NULL ,
	state varchar (80) NULL ,
	zip varchar (5) NULL ,
	phone varchar (80) NULL 
)
GO

delete from lineitem;
GO
delete from orderstatus;
GO
delete from orders;
GO
delete from bannerdata;
GO
delete from profile;
GO
delete from signon;
GO
delete from inventory;
GO
delete from item;
GO
delete from product;
GO
delete from account;
GO
delete from category;
GO
delete from supplier;
GO
delete from sequence;
GO

 CREATE INDEX IF NOT EXISTS itemProd ON item(productid)
GO

 CREATE INDEX IF NOT EXISTS productCat ON product(category)
GO

 CREATE INDEX IF NOT EXISTS productName ON product(name)
GO

INSERT INTO sequence VALUES('ordernum', 1000)
GO

INSERT INTO sequence VALUES('linenum', 1000)
GO

INSERT INTO signon VALUES('j2ee','j2ee')
GO

INSERT INTO signon VALUES('ACID','ACID')
GO


INSERT INTO account VALUES('j2ee','yourname@yourdomain.com','ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA',  '555-555-5555')
GO

INSERT INTO account VALUES('ACID','acid@yourdomain.com','ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA',  '555-555-5555')
GO


INSERT INTO profile VALUES('j2ee','english','DOGS','1','1')
GO

INSERT INTO profile VALUES('ACID','english','CATS','1','1')
GO


INSERT INTO bannerdata VALUES ('FISH','<image src="../images/banner_fish.gif">')
GO

INSERT INTO bannerdata VALUES ('CATS','<image src="../images/banner_cats.gif">')
GO

INSERT INTO bannerdata VALUES ('DOGS','<image src="../images/banner_dogs.gif">')
GO

INSERT INTO bannerdata VALUES ('REPTILES','<image src="../images/banner_reptiles.gif">')
GO

INSERT INTO bannerdata VALUES ('BIRDS','<image src="../images/banner_birds.gif">')
GO


INSERT INTO category VALUES ('FISH','Fish','<image src="../images/fish_icon.gif"><font size="5" color="blue"> Fish</font>')
GO

INSERT INTO category VALUES ('DOGS','Dogs','<image src="../images/dogs_icon.gif"><font size="5" color="blue"> Dogs</font>')
GO

INSERT INTO category VALUES ('REPTILES','Reptiles','<image src="../images/reptiles_icon.gif"><font size="5" color="blue"> Reptiles</font>')
GO

INSERT INTO category VALUES ('CATS','Cats','<image src="../images/cats_icon.gif"><font size="5" color="blue"> Cats</font>')
GO

INSERT INTO category VALUES ('BIRDS','Birds','<image src="../images/birds_icon.gif"><font size="5" color="blue"> Birds</font>')
GO


INSERT INTO product VALUES ('FI-SW-01','FISH','Angelfish','<image src="../images/fish1.jpg">Salt Water fish from Australia')
GO

INSERT INTO product VALUES ('FI-SW-02','FISH','Tiger Shark','<image src="../images/fish4.gif">Salt Water fish from Australia')
GO

INSERT INTO product VALUES ('FI-FW-01','FISH', 'Koi','<image src="../images/fish3.gif">Fresh Water fish from Japan')
GO

INSERT INTO product VALUES ('FI-FW-02','FISH', 'Goldfish','<image src="../images/fish2.gif">Fresh Water fish from China')
GO

INSERT INTO product VALUES ('K9-BD-01','DOGS','Bulldog','<image src="../images/dog2.gif">Friendly dog from England')
GO

INSERT INTO product VALUES ('K9-PO-02','DOGS','Poodle','<image src="../images/dog6.gif">Cute dog from France')
GO

INSERT INTO product VALUES ('K9-DL-01','DOGS', 'Dalmation','<image src="../images/dog5.gif">Great dog for a Fire Station')
GO

INSERT INTO product VALUES ('K9-RT-01','DOGS', 'Golden Retriever','<image src="../images/dog1.gif">Great family dog')
GO

INSERT INTO product VALUES ('K9-RT-02','DOGS', 'Labrador Retriever','<image src="../images/dog5.gif">Great hunting dog')
GO

INSERT INTO product VALUES ('K9-CW-01','DOGS', 'Chihuahua','<image src="../images/dog4.gif">Great companion dog')
GO

INSERT INTO product VALUES ('RP-SN-01','REPTILES','Rattlesnake','<image src="../images/lizard3.gif">Doubles as a watch dog')
GO

INSERT INTO product VALUES ('RP-LI-02','REPTILES','Iguana','<image src="../images/lizard2.gif">Friendly green friend')
GO

INSERT INTO product VALUES ('FL-DSH-01','CATS','Manx','<image src="../images/cat3.gif">Great for reducing mouse populations')
GO

INSERT INTO product VALUES ('FL-DLH-02','CATS','Persian','<image src="../images/cat1.gif">Friendly house cat, doubles as a princess')
GO

INSERT INTO product VALUES ('AV-CB-01','BIRDS','Amazon Parrot','<image src="../images/bird4.gif">Great companion for up to 75 years')
GO

INSERT INTO product VALUES ('AV-SB-02','BIRDS','Finch','<image src="../images/bird1.gif">Great stress reliever')
GO


INSERT INTO supplier VALUES (1,'XYZ Pets','AC','600 Avon Way','','Los Angeles','CA','94024','212-947-0797')
GO

INSERT INTO supplier VALUES (2,'ABC Pets','AC','700 Abalone Way','','San Francisco ','CA','94024','415-947-0797')
GO


INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-1','FI-SW-01',16.50,10.00,1,'P','Large')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-2','FI-SW-01',16.50,10.00,1,'P','Small')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-3','FI-SW-02',18.50,12.00,1,'P','Toothless')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-4','FI-FW-01',18.50,12.00,1,'P','Spotted')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-5','FI-FW-01',18.50,12.00,1,'P','Spotless')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-6','K9-BD-01',18.50,12.00,1,'P','Male Adult')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-7','K9-BD-01',18.50,12.00,1,'P','Female Puppy')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-8','K9-PO-02',18.50,12.00,1,'P','Male Puppy')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-9','K9-DL-01',18.50,12.00,1,'P','Spotless Male Puppy')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-10','K9-DL-01',18.50,12.00,1,'P','Spotted Adult Female')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-11','RP-SN-01',18.50,12.00,1,'P','Venomless')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-12','RP-SN-01',18.50,12.00,1,'P','Rattleless')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-13','RP-LI-02',18.50,12.00,1,'P','Green Adult')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-14','FL-DSH-01',58.50,12.00,1,'P','Tailless')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-15','FL-DSH-01',23.50,12.00,1,'P','With tail')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-16','FL-DLH-02',93.50,12.00,1,'P','Adult Female')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-17','FL-DLH-02',93.50,12.00,1,'P','Adult Male')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-18','AV-CB-01',193.50,92.00,1,'P','Adult Male')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-19','AV-SB-02',15.50, 2.00,1,'P','Adult Male')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-20','FI-FW-02',5.50, 2.00,1,'P','Adult Male')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-21','FI-FW-02',5.29, 1.00,1,'P','Adult Female')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-22','K9-RT-02',135.50, 100.00,1,'P','Adult Male')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-23','K9-RT-02',145.49, 100.00,1,'P','Adult Female')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-24','K9-RT-02',255.50, 92.00,1,'P','Adult Male')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-25','K9-RT-02',325.29, 90.00,1,'P','Adult Female')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-26','K9-CW-01',125.50, 92.00,1,'P','Adult Male')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-27','K9-CW-01',155.29, 90.00,1,'P','Adult Female')
GO

INSERT INTO  item (itemid, productid, listprice, unitcost, supplier, status, attr1) VALUES('EST-28','K9-RT-01',155.29, 90.00,1,'P','Adult Female')
GO


INSERT INTO inventory (itemid, qty ) VALUES ('EST-1',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-2',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-3',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-4',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-5',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-6',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-7',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-8',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-9',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-10',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-11',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-12',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-13',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-14',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-15',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-16',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-17',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-18',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-19',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-20',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-21',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-22',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-23',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-24',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-25',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-26',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-27',10000)
GO

INSERT INTO inventory (itemid, qty ) VALUES ('EST-28',10000)
GO


