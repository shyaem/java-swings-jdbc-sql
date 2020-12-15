

DROP TABLE IF EXISTS site_works CASCADE;
DROP TABLE IF EXISTS staff_details CASCADE;
DROP TABLE IF EXISTS work CASCADE;
DROP TABLE IF EXISTS materials_with_retailer CASCADE;
DROP TABLE IF EXISTS site_details CASCADE;
DROP TABLE IF EXISTS buildings CASCADE;
DROP TABLE IF EXISTS client_details CASCADE;
DROP TABLE IF EXISTS material CASCADE;
DROP TABLE IF EXISTS retailer CASCADE;
DROP TABLE IF EXISTS student CASCADE;

CREATE TABLE student(
    id BIGSERIAL,
    name VARCHAR(20),
    password VARCHAR(20)
);

insert into student(name,password) values('shyam','shyam123');

CREATE TABLE client_details(
    client_details_id BIGSERIAL,
    client_details_name  VARCHAR(20) UNIQUE NOT NULL,
    client_details_email VARCHAR(30),
    client_details_gender VARCHAR(6),
    client_details_address VARCHAR(30),
    client_details_phone VARCHAR(20),
    PRIMARY KEY(client_details_id,client_details_name)
);

CREATE TABLE buildings(
    buildings_id BIGSERIAL,
    buildings_type VARCHAR(20) NOT NULL PRIMARY KEY
);

CREATE TABLE site_details(
    site_details_id BIGSERIAL,
    client_details_name VARCHAR(20)  REFERENCES client_details(client_details_name),
    buildings_type VARCHAR(20)   REFERENCES buildings(buildings_type),
    site_details_name VARCHAR(20) PRIMARY KEY,
    site_details_age DATE ,
    site_details_address VARCHAR(30),
    site_details_dimensions VARCHAR(20),
    site_details_worth NUMERIC(13,2) NOT NULL
);



CREATE TABLE work(
    work_id BIGSERIAL ,
    work_type VARCHAR(20)  NOT NULL PRIMARY KEY,
    work_cost INT NOT NULL
);

CREATE TABLE site_works(
    site_works_id BIGSERIAL,
    site_details_name VARCHAR(20) REFERENCES site_details(site_details_name),
    work_type VARCHAR(20)  REFERENCES work(work_type),
    staff_details_name VARCHAR(20)  ,
    site_details_work_status VARCHAR(20) NOT NULL
);

CREATE TABLE staff_details(
    staff_details_id BIGSERIAL ,
    work_type VARCHAR(20)  REFERENCES work(work_type),
    staff_details_name VARCHAR(20) PRIMARY KEY,
    staff_details_email VARCHAR(30),
    staff_details_salary INT NOT NULL,
    staff_details_dob date ,
    staff_details_address VARCHAR(30),
    staff_details_phone VARCHAR(20) NOT NULL
);

ALTER TABLE site_works ADD FOREIGN KEY (staff_details_name) REFERENCES staff_details(staff_details_name);

CREATE TABLE material(
    material_id BIGSERIAL,
    material_company VARCHAR(20) NOT NULL,
    material_type VARCHAR(20) UNIQUE NOT NULL PRIMARY KEY,
    material_price INT NOT NULL,
    material_weight VARCHAR(20),
    material_rating VARCHAR(20)
);

CREATE TABLE retailer(
    retailer_id BIGSERIAL ,
    retailer_name VARCHAR(20) UNIQUE NOT NULL PRIMARY KEY,
    retailer_email VARCHAR(30),
    retailer_address VARCHAR(30),
    retailer_phone VARCHAR(20) NOT NULL
    
);


CREATE TABLE materials_with_retailer(
    materials_with_retailer_id BIGSERIAL PRIMARY KEY,
    material_type VARCHAR(20) REFERENCES material(material_type),
    retailer_name VARCHAR(20) REFERENCES retailer(retailer_name)

);




/* insersion*/

insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Loni', 'lprise0@bigcartel.com', 'Female', '53 High Crossing Pass', '290 336 6183');
insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Revkah', 'rfust1@huffingtonpost.com', 'Female', '765 Maywood Street', '101 158 0285');
insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Hubert', 'hthayre2@g.co', 'Male', '289 Westridge Plaza', '976 512 0137');
insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Stefa', 'smuro3@constantcontact.com', 'Female', '8166 Rieder Terrace', '998 694 2614');
insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Aleta', 'adinan4@wikispaces.com', 'Female', '329 Crownhardt Place', '569 613 8965');
insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Morton', 'mdellow5@shareasale.com', 'Male', '76279 Michigan Avenue', '315 462 1302');
insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Angil', 'aradki6@bluehost.com', 'Female', '8 Brickson Park Circle', '424 699 3554');
insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Sandy', 'sboxer7@time.com', 'Female', '95 Rigney Circle', '204 672 0196');
insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Florentia', 'flacer8@barnesandnoble.com', 'Female', '11268 Gale Alley', '969 542 6109');
insert into client_details (client_details_name, client_details_email, client_details_gender, client_details_address, client_details_phone) values ('Blanche', 'bcullum9@walmart.com', 'Female', '6539 Swallow Crossing', '654 856 1574');

INSERT INTO buildings(buildings_type) VALUES ('bangla');
INSERT INTO buildings(buildings_type) VALUES ('mansion');
INSERT INTO buildings(buildings_type) VALUES ('duplex');
INSERT INTO buildings(buildings_type) VALUES ('villa');
INSERT INTO buildings(buildings_type) VALUES ('standered');
INSERT INTO buildings(buildings_type) VALUES ('apartment');
INSERT INTO buildings(buildings_type) VALUES ('farm house');



insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Sandy','mansion','Logan', '2020-10-20', '5500 Esker Crossing', 87063899.54);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Florentia','villa','Independence', '2009-10-15', '7324 Blue Bill Park Hill', 77651282.67);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Aleta','bangla','Mitchell', '2008-12-01', '480 Grim Pass', 2984499.65);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Angil','farm house','Redwing', '2003-05-13', '70027 Lawn Place', 70092027.39);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Blanche','bangla','Forster', '2016-05-20', '37212 Little Fleur Crossing', 24400637.22);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Morton','farm house','Anhalt', '2018-12-23', '97609 Esker Junction',  56825593.25);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Loni','bangla','Coolidge', '2014-12-12', '4532 Brentwood Lane', 12507820.07);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Hubert','villa','Marquette', '2005-11-28', '25506 Eagle Crest Trail', 7969202.08);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Revkah','standered','6th', '2019-03-16', '8628 Springs Junction', 44833389.55);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Hubert','apartment','Stephen', '2002-10-16', '40653 Starling Junction',  57518019.45);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Stefa','duplex','Sycamore', '2016-01-22', '91 Maple Wood Place',  53613721.56);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Aleta','apartment','Anderson', '2017-09-21', '67 Crescent Oaks Street',  84841864.68);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Stefa','mansion','Havey', '2013-05-18', '3402 Waxwing Parkway',  6794224.32);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Morton','apartment','Jenna', '2014-03-02', '750 Sundown Plaza',  56879550.21);
insert into site_details (client_details_name,buildings_type,site_details_name, site_details_age, site_details_address, site_details_worth) values ('Loni','duplex','Ludington', '2002-01-21', '31 Stephen Way',  90587408.53);


insert into work (work_type, work_cost) values ('plumbering', 12826.22);
insert into work (work_type, work_cost) values ('painting', 20209.23);
insert into work (work_type, work_cost) values ('builder', 33254.61);
insert into work (work_type, work_cost) values ('decor', 38979.91);
insert into work (work_type, work_cost) values ('plastering', 22448.56);
insert into work (work_type, work_cost) values ('technition', 19615.29);
insert into work (work_type, work_cost) values ('carpenter', 19630.11);
insert into work (work_type, work_cost) values ('welder', 25472.39);


insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('plumbering','Dewdney', 'bdewdney0@netlog.com', 15184.13, '1989-09-09', '1550 Barby Lane', '672 684 1212');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('welder','Pengilly', 'gpengilly1@addtoany.com', 21661.18, '2000-08-11', '9 Londonderry Junction', '491 344 7996');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('painting','Pendall', 'vpendall2@surveymonkey.com', 25830.96, '1997-12-12', '37147 Rieder Way', '667 497 5278');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('welder','Pringley', 'lpringley3@dmoz.org', 37104.75, '1986-10-23', '0079 Sundown Terrace', '705 630 9980');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('carpenter','Karadzas', 'bkaradzas4@mlb.com', 39368.50, '1993-01-31', '66236 Nobel Alley', '196 641 6535');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('painting','Ramsbotham', 'kramsbotham5@cocolog-nifty.com', 39458.96, '1989-10-02', '36 Thompson Lane', '104 558 6852');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('technition','Fraine', 'sfraine6@oakley.com', 15495.03, '1999-06-19', '85421 Del Mar Trail', '165 832 7675');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('decor','Hellard', 'fhellard7@phoca.cz', 36025.77, '1996-08-29', '33564 Tennessee Road', '572 410 9216');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('plastering','Weine', 'pweine8@howstuffworks.com', 15748.49, '1986-10-04', '12 Shelley Park', '905 425 6399');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('builder','Mandrier', 'mmandrier9@cnbc.com', 20590.13, '1998-04-30', '6630 Melvin Street', '620 465 6350');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('plumbering','Woodwing', 'swoodwinga@adobe.com', 22911.19, '1992-04-27', '9 Twin Pines Pass', '743 944 4885');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('builder','Stoven', 'kstovenb@alexa.com', 14719.50, '1992-03-30', '4320 Reindahl Plaza', '377 382 9701');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('decor','Webburn', 'mwebburnc@amazon.co.jp', 25623.28, '1992-06-13', '44913 Manufacturers Parkway', '819 151 3090');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('plastering','Scurrer', 'rscurrerd@ucoz.com', 19334.57, '1991-05-19', '01154 Weeping Birch Lane', '888 501 9157');
insert into staff_details (work_type,staff_details_name, staff_details_email, staff_details_salary, staff_details_dob, staff_details_address, staff_details_phone) values ('technition','Pittem', 'mpitteme@soundcloud.com', 39651.18, '1992-02-27', '4 Anzinger Plaza', '392 867 7839');


insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Ludington','plastering','Weine','completed');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Anderson','builder','Mandrier','pending');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Independence','plumbering','Dewdney','completed');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Coolidge','decor','Hellard','completed');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Logan','painting','Ramsbotham','pending');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Logan','technition','Pittem','completed');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Marquette','carpenter','Karadzas','pending');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Anhalt','decor','Webburn','completed');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Redwing','welder','Pringley','completed');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Jenna','plastering','Scurrer','completed');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Anhalt','builder','Stoven','pending');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Coolidge','decor','Hellard','completed');
insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values ('Ludington','decor','Webburn','not started');

insert into material (material_company, material_type, material_price, material_weight, material_rating) values ('Thoughtworks','steel', 18249.71, '1ton', '5star');
insert into material (material_company, material_type, material_price, material_weight, material_rating) values ('Eare','iron', 24516.13, '5ton', '4star');
insert into material (material_company, material_type, material_price, material_weight, material_rating) values ('Jetwire','paints',29630.40, '4ton', '1star');
insert into material (material_company, material_type, material_price, material_weight, material_rating) values ('Gevee','cement', 32953.54, '3ton', '4star');
insert into material (material_company, material_type, material_price, material_weight, material_rating) values ('Fiveclub','bricks', 14273.93, '3ton', '3star');
insert into material (material_company, material_type, material_price, material_weight, material_rating) values ('Ooba','concrete', 36718.14, '2ton', '5star');
insert into material (material_company, material_type, material_price, material_weight, material_rating) values ('Tavu','sand', 26627.22, '7ton', '4star');


insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Basilio', 'bmcquin0@guardian.co.uk', '7 Straubel Parkway', '630 944 9342');
insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Parker', 'pbelding1@kickstarter.com', '0 Anhalt Plaza', '832 778 4868');
insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Rayshell', 'rlarner2@desdev.cn', '80 Barby Circle', '928 680 3672');
insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Gerhard', 'gesche3@google.it', '1635 Southridge Street', '235 390 4631');
insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Krista', 'kdutton4@pen.io', '29 Homewood Junction', '196 847 3482');
insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Zarah', 'zdawidowicz5@slashdot.org', '38534 Quincy Park', '606 161 1244');
insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Hanna', 'hstacey6@goo.gl', '2 Quincy Park', '574 757 2749');
insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Sharl', 'sashby7@wikispaces.com', '3 Glacier Hill Junction', '781 269 2699');
insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Cross', 'cchyuerton8@cpanel.net', '7130 Red Cloud Pass', '180 661 7060');
insert into retailer (retailer_name, retailer_email, retailer_address, retailer_phone) values ('Diahann', 'drobardley9@hexun.com', '415 Sullivan Center', '559 409 6697');


insert into materials_with_retailer(material_type,retailer_name) VALUES ('steel','Basilio');
insert into materials_with_retailer(material_type,retailer_name) VALUES ('sand','Basilio');
insert into materials_with_retailer(material_type,retailer_name) VALUES ('iron','Basilio');
insert into materials_with_retailer(material_type,retailer_name) VALUES ('concrete','Rayshell');
insert into materials_with_retailer(material_type,retailer_name) VALUES ('paints','Parker');
insert into materials_with_retailer(material_type,retailer_name) VALUES ('cement','Parker');
insert into materials_with_retailer(material_type,retailer_name) VALUES ('bricks','Zarah');
insert into materials_with_retailer(material_type,retailer_name) VALUES ('sand','Krista');


/*1.staff_details profession who are not unique
SELECT work_type, COUNT(*) FROM staff_details GROUP BY work_type HAVING COUNT(*) > 1  ;
*/
/*2.the total young staff_details in the contruction company
SELECT * FROM staff_details ORDER BY staff_details_dob DESC;
*/
/*3. detailes of client_details and site_details using inner join
SELECT client_details.client_details_name,buildings.buildings_type from client_details INNER JOIN site_details  ON client_details.client_details_name = site_details.client_details_name
INNER JOIN buildings ON site_details.buildings_type = buildings.buildings_type;
*/
/* geting the details of materials available with retailers using left outer join
SELECT e.material_type,p.retailer_name from material e LEFT OUTER JOIN materials_with_retailer mr ON e.material_type = mr.material_type
LEFT OUTER JOIN retailer p ON mr.retailer_name = p.retailer_name;

*/



/*4.company ha buildings buildingss of sum,min,max,avg
SELECT SUM(site_details_worth) site_detailss_worth,MAX(site_details_worth) max, MIN(site_details_worth) min,AVG(site_details_worth) avg FROM site_details;
*/
/*5. staff_details having salary greater than 20,000
SELECT * FROM staff_details WHERE staff_details_salary > 20000;
*/
/*6. an employees annual income
SELECT (staff_details_salary*12) annual_salary FROM staff_details;
*/
/*7. emails of client_detailss having .com at end
SELECT *  FROM client_details WHERE client_details_email LIKE '%.com';
*/
/*8. buildingss with there age and geting dob of staff_details in text
SELECT EXTRACT(YEAR FROM (SELECT AGE(NOW(),site_details_age))) as buildings_age FROM site_details;
SELECT TO_CHAR(staff_details_dob,'MONTH:DAY:YYYY') FROM staff_details;
*/
/*9.list of site_detailss between and not between 1lack to 3lack, contructions which are pending and constucted 
SELECT * FROM site_details WHERE site_details_worth BETWEEN 1000000 AND 3000000;
SELECT *  FROM site_works WHERE site_details_work_status IN('pending','completed');
SELECT * FROM site_details WHERE site_details_worth NOT BETWEEN 100000 AND 300000;
SELECT *  FROM site_works WHERE site_details_work_status NOT IN('pending','completed');
*/
/*10. union of site_details age and staff_details age
SELECT site_details_age FROM site_details UNION SELECT staff_details_dob FROM staff_details;
    
*/