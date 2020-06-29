create table patient(
patId number primary key not null,
firstName varchar2(255) default null,
lastName varchar2(255) default null,
city varchar2(30)default 'cairo',
region varchar2(255)default null ,
street varchar2(255)default null,
telphone varchar2(15)default null
);



create table department(
depId number primary key not null,
depName varchar2(250),
depDesc varchar2(255) default null
);


create table doctor(
docId number primary key not null,
firstName varchar2(255) default null,
lastName varchar2(255) default null,
city varchar2(30)default 'cairo',
region varchar2(255)default null ,
street varchar2(255)default null,
telphone varchar2(15)default null,
specialization varchar2(250) default'General',
pos varchar2(250) default'undertraining',
salary number default'5000',
depId number,
foreign key (depId)references department(depId)
);



create table appointment(
appCode number primary key not null,
appDate date not null,
appDesc varchar2(400) default null,
vezeeta number default'100',
patId number,
docId number,
foreign key (patId) references patient(patId),
foreign key (docId) references doctor(docId)
);

create table medicalExamanation(
examCode number primary key not null,
examDate date not null,
examDesc varchar2(350),
vezeeta number default '300',
patId number,
docId number,
foreign key (patId) references patient(patId),
foreign key (docId) references doctor(docId)
);


create table medicine(
medCode number primary key not null,
medDesc varchar2(350)
);


create table treatment(
medCode number not null,
examCode number not null,
treatDesc varchar2(400),
primary key (medCode,examCode),
foreign key (medCode)references medicine(medCode),
foreign key (examCode)references medicalExamanation(examCode)
);


create table physican(
phyId number primary key not null,
firstName varchar2(255) default null,
lastName varchar2(255) default null,
city varchar2(30)default 'cairo',
region varchar2(255)default null ,
street varchar2(255)default null,
telphone varchar2(15)default null,
specialization varchar2(250) default'General',
pos varchar2(250) default'undertraining',
salary number default'5000',
depId number,
foreign key (depId)references department(depId)
);

create table xraysession(
sessionNum number primary key not null,
sessionDate date not null,
xrayCode varchar2(50),
vezeeta number default'200',
patId number,
phyId number,
foreign key (patId) references patient(patId),
foreign key (phyId) references physican(phyId)
);


create table room(
roomNum number primary key ,
roomlevel number default '0'
);


create table surgery (
sugeryNum number primary key not null,
surgeonId number not null,
patId number not null,
roomNum number not null,
surDesc varchar2(500),
vezeeta number ,
foreign key (patId) references patient(patId),
foreign key (surgeonId) references doctor(docId),
foreign key (roomNum) references room(roomNum)
);





create table nurse(
nurseId number primary key not null,
firstName varchar2(255) default null,
lastName varchar2(255) default null,
city varchar2(30)default 'cairo',
region varchar2(255)default null ,
street varchar2(255)default null,
telphone varchar2(15)default null,
specialization varchar2(250) default'General',
pos varchar2(250) default'undertraining',
salary number default'5000',
depId number,
foreign key (depId)references department(depId)
);


create table nurseSurgeryStaff(
surgeryNum number not null,
memberNum number not null,
nurseId number,
primary key (surgeryNum,memberNum),
foreign key (surgeryNum) references surgery(sugeryNum),
foreign key (nurseId) references nurse(nurseID)
);


drop table doctorsSurgeryStaff;
create table doctorsSurgeryStaff(
surgeryNum number not null,
memberNum number not null,
docId number,
primary key (surgeryNum,memberNum),
foreign key (surgeryNum) references surgery(sugeryNum),
foreign key (docId) references doctor(docID)
);



create table ReservationRoom(
resCode number primary key,
roomNum number not null,
patId number not null,
foreign key (roomNum) references room(roomNum),
foreign key (patId) references patient(patID)
);


create table pharmacist(
pharmId number primary key not null,
firstName varchar2(255) default null,
lastName varchar2(255) default null,
city varchar2(30)default 'cairo',
region varchar2(255)default null ,
street varchar2(255)default null,
telphone varchar2(15)default null,
pos varchar2(250) default'undertraining',
salary number default'5000',
depId number,
foreign key (depId)references department(depId)
);





create table employee(
employeeId number primary key not null,
firstName varchar2(255) default null,
lastName varchar2(255) default null,
city varchar2(30)default 'cairo',
region varchar2(255)default null ,
street varchar2(255)default null,
telphone varchar2(15)default null,
pos varchar2(250) default'undertraining',
salary number default'5000',
depId number,
foreign key (depId)references department(depId)
);










create table drugmakingprocess(
drugMakProcNum number primary key not null,
pharmId number not null,
medCode number not null,
description varchar(500),
foreign key (pharmId)references pharmacist(pharmId),
foreign key (medCode)references medicine(medCode)
);

create table patienthosts(
hostnationalId number primary key not null,
hostName varchar2(15)
);

create table visit(
visitNum number primary key not null,
visitDate date not null,
patId number,
hostnationalID number,
foreign key (patId)references patient(patId),
foreign key (hostnationalID)references patienthosts(hostnationalId)
);


create table equipment(
equCode number primary key not null,
equDesc varchar2(400),
equCost number
);



create table vendor(
vendorId number primary key not null,
firstName varchar2(255) default null,
lastName varchar2(255) default null,
city varchar2(30)default 'cairo',
region varchar2(255)default null ,
street varchar2(255)default null,
telphone varchar2(15)default null
);


create table supply(
supplyNum number primary key not null,
equCode number,
vendorId number,
suppdate date not null,
suppcost number not null,
foreign key (equCode)references equipment(equCode),
foreign key (vendorId)references vendor(vendorId)
);





INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (1,'Yetta','Clay','Dörtyol','Hatay','Ap #697-2669 Magna. St.','16390411 7151');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (2,'Tamekah','Whitaker','Popayán','Cauca','P.O. Box 559, 9832 Penatibus St.','16161024 8195');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (3,'Armand','Spears','Hafizabad','Sindh','Ap #428-9935 Enim, Rd.','16831216 1600');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (4,'Caleb','Weaver','Ipís','SJ','P.O. Box 180, 8930 Cursus Av.','16870629 8265');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (5,'Indigo','Love','Villar Pellice','Piemonte','155-4652 Adipiscing Ave','16680326 0345');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (6,'Keely','Dalton','Liberia','Guanacaste','1292 Donec Av.','16841119 5715');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (7,'Amity','Foley','Dublin','L','P.O. Box 839, 2960 Malesuada Rd.','16841009 5239');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (8,'Aurelia','Wallace','Owerri','IM','4566 Sodales. Rd.','16860512 0727');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (9,'Macon','Warner','Jerez de la Frontera','Andalucía','Ap #496-6417 Libero Rd.','16690426 7660');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (10,'Elton','Page','Sapele','Delta','7121 Ultricies Road','16311217 2907');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (11,'Eleanor','Blair','Sudhanoti','Azad Kashmir','P.O. Box 282, 5541 Egestas Road','16491028 4407');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (12,'Dexter','Dyer','Buguma','RI','8267 Ipsum Avenue','16550923 3119');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (13,'Wade','Alvarez','Tehuacán','Pue','P.O. Box 919, 976 Integer Rd.','16750803 6048');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (14,'Hall','Kramer','Awaran','Balochistan','Ap #962-5608 Tempus, Av.','16690205 6693');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (15,'Amos','Battle','Laurencekirk','Kincardineshire','Ap #338-6521 Pellentesque Ave','16860920 6910');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (16,'Cleo','Justice','Mojokerto','JI','673-4488 In Rd.','16791018 8650');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (17,'Unity','Jenkins','Oss','N.','Ap #988-4566 Aliquam Rd.','16571125 9027');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (18,'Savannah','Donovan','Jonesboro','AK','P.O. Box 703, 3442 Nascetur Road','16600514 9031');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (19,'Lara','Dickson','Siegendorf','Bgl','Ap #891-4797 Nonummy Rd.','16040107 8225');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (20,'Raphael','Schneider','Tauranga','North Island','634-5368 Mollis St.','16390817 8704');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (21,'Drew','Woods','Jelenia Góra','Dolno?l?skie','248-1464 Aliquam Ave','16580728 9011');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (22,'Jordan','Bates','Tomohon','SA','357-3309 Rhoncus St.','16840109 3169');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (23,'Ginger','Kane','Governador Valadares','MG','893-9262 Congue St.','16081001 8507');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (24,'Autumn','Berg','Lakeshore','Ontario','Ap #889-3466 Senectus Road','16610118 3314');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (25,'Whilemina','Hines','Vallentuna','Stockholms län','P.O. Box 262, 4556 Augue Street','16630825 1039');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (26,'Burton','Best','Purmerend','Noord Holland','910-9563 Ultrices Rd.','16881013 3762');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (27,'Audrey','Cohen','Victoria','BC','4920 Cras Avenue','16971015 2423');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (28,'Nigel','Garner','Merrickville-Wolford','Ontario','8807 Aliquet St.','16221109 8757');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (29,'Ima','Cain','Atlanta','GA','P.O. Box 366, 4200 Quisque Road','16480405 4205');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (30,'Colt','Sargent','Wanganui','NI','Ap #226-8352 Malesuada St.','16880718 8142');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (31,'Leigh','Watson','Åkersberga','AB','P.O. Box 231, 1081 Pede Street','16910622 7425');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (32,'Bevis','Morris','Przemy?l','Podkarpackie','9529 Integer Street','16940805 4014');
INSERT INTO vendor (vendorId,firstName,lastName,city,region,street,telphone) VALUES (33,'Marny','Wall','Mirny','Arkhangelsk Oblast','Ap #556-9279 Porttitor Ave','16710309 7940');


















INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (1,77,39,'27/03/21',2497131);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (2,4,98,'05/10/19',7335832);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (3,71,48,'04/02/21',6952505);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (4,53,42,'02/11/19',6055104);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (5,73,28,'30/05/19',285171);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (6,74,66,'09/09/19',5118458);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (7,4,79,'28/04/21',1348168);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (8,69,62,'31/12/20',2456440);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (9,26,64,'27/04/21',7224791);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (10,35,51,'19/03/21',8847095);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (11,82,12,'10/03/20',2233033);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (12,63,48,'16/01/21',4069848);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (13,66,69,'04/02/21',2068848);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (14,55,23,'06/02/20',1187263);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (15,69,85,'25/06/20',599929);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (16,56,94,'02/01/20',785950);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (17,13,57,'12/09/19',5663233);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (18,18,47,'27/05/20',5580143);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (19,10,45,'09/01/20',3067656);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (20,54,45,'09/11/20',8083713);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (21,3,13,'13/12/19',4710405);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (22,86,40,'20/03/20',4762678);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (23,1,98,'26/01/20',5618326);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (24,52,36,'27/11/19',662924);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (25,100,48,'27/01/20',553059);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (26,34,38,'19/02/21',7395727);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (27,72,72,'19/04/21',6237904);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (28,88,12,'29/11/19',4998037);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (29,48,91,'03/09/19',3328272);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (30,49,32,'27/03/20',8514052);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (31,33,8,'26/11/20',548913);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (32,84,58,'20/06/20',5371283);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (33,37,2,'24/06/19',3443329);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (34,74,35,'15/05/21',7713470);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (35,50,36,'24/10/19',5973289);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (36,72,87,'26/09/20',2915110);
INSERT INTO supply (supplyNum,equCode,vendorId,suppdate,suppcost) VALUES (37,34,18,'01/05/20',8205238);


select * from supply;








INSERT INTO equipment (equCode,equDesc,equCost) VALUES (1,'non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer',14886204);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (2,'iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh.',174350);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (3,'a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi',12249763);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (4,'tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit',1250797);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (5,'nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit.',2570890);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (6,'ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus',4964008);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (7,'id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor',3752412);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (8,'scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam',4525933);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (9,'felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus',10281718);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (10,'imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a,',13925219);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (11,'nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel,',4699042);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (12,'quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus',9187850);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (13,'est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu',4068494);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (14,'viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat.',12868489);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (15,'nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc',11861388);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (16,'metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla',8299766);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (17,'dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id,',4109882);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (18,'tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor',4137518);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (19,'interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis',5458791);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (20,'ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices',6846417);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (21,'Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris',498101);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (22,'tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla',2693129);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (23,'libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet',2653539);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (24,'luctus sit amet, faucibus ut, nulla. Cras eu tellus eu',604849);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (25,'Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit.',1203645);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (26,'eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec',4375970);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (27,'nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus',2006508);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (28,'congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus',3838856);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (29,'ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis',821403);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (30,'id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus',8960398);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (31,'tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in',10707646);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (32,'fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam',8418975);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (33,'ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam',1637818);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (34,'nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum',206499);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (35,'orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula',1839127);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (36,'tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames',2194604);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (37,'imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac',7126780);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (38,'Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue',3307554);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (39,'erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer',11675428);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (40,'iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et',6818840);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (41,'erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc',7322503);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (42,'orci. Ut semper pretium neque. Morbi quis urna. Nunc quis',12502670);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (43,'Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique',750029);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (44,'massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia',3200685);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (45,'diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus',8725859);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (46,'id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet',6948914);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (47,'turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus',5744610);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (48,'sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan',4399819);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (49,'nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque.',1036678);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (50,'eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id',1164290);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (51,'lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum',6478891);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (52,'a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique',12178942);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (53,'turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia',189413);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (54,'hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi',7365880);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (55,'ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis',561145);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (56,'elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum,',14859341);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (57,'dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed',3548397);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (58,'quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum',10151901);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (59,'imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',3452334);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (60,'mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare',1310960);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (61,'dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam',10099696);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (62,'Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem',12560157);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (63,'Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer',8197635);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (64,'imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In',13064738);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (65,'pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus',2030658);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (66,'Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a,',7605321);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (67,'rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis',11613274);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (68,'sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante',1067394);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (69,'congue a, aliquet vel, vulputate eu, odio. Phasellus at augue',2483610);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (70,'dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,',9015910);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (71,'felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis',6832998);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (72,'dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et',10984149);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (73,'interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec',10779382);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (74,'molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu',13500845);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (75,'lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus',231900);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (76,'congue a, aliquet vel, vulputate eu, odio. Phasellus at augue',5997607);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (77,'et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac',4102958);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (78,'dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget',9102228);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (79,'orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus',14103392);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (80,'lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique',13184364);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (81,'magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque',2102221);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (82,'sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus',105997);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (83,'iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy',8490140);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (84,'sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis',2887681);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (85,'dui, in sodales elit erat vitae risus. Duis a mi fringilla',10228783);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (86,'euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit',12208461);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (87,'massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio',3509018);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (88,'mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,',13692117);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (89,'metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla',11962616);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (90,'In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis',8320294);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (91,'Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit,',14948332);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (92,'eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus.',7343650);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (93,'Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare,',14632319);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (94,'pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem',3617256);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (95,'nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed',8991351);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (96,'eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae',6625141);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (97,'sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit',6800667);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (98,'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse',4394544);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (99,'at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis',13943382);
INSERT INTO equipment (equCode,equDesc,equCost) VALUES (100,'purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque',6691243);





























delete from visit;



select * from PATIENTHOSTS;

INSERT INTO visit (visitNum,visitDate,patId,hostnationalID) VALUES (1,'06/03/2020',49,'166511246636');
INSERT INTO visit (visitNum,visitDate,patId,hostnationalID) VALUES (2,'21/01/2021',99,'163903073611');
INSERT INTO visit (visitNum,visitDate,patId,hostnationalID) VALUES (3,'12/11/2020',25,'167505098181');
makingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (1,29,5902,'tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (2,56,5905,'fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (3,7,5908,'ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (4,83,5911,'Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (5,37,5914,'arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (6,91,5917,'non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (7,28,5920,'sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (8,21,5923,'consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (9,79,5926,'enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (10,60,5929,'Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (11,53,5932,'leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus,');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (12,24,5935,'Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (13,31,5938,'cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (14,72,5941,'vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (15,51,5944,'Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (16,1,5947,'fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (17,31,5950,'dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (18,67,5953,'elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (19,11,5956,'sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (20,51,5959,'erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (21,65,5962,'Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (22,3,5965,'Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non,');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (23,43,5968,'malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (24,67,5971,'nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (25,64,5974,'aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (26,33,5977,'mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec,');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (27,6,5980,'a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (28,75,5983,'at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (29,64,5986,'luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (30,72,5989,'nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (31,58,5992,'orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (32,78,5995,'dui, in sodales elit erat vitae risus. Duis a mi fringilla');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (33,37,5998,'netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (34,35,6001,'a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (35,98,6004,'facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (36,80,6007,'eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (37,60,6010,'aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (38,29,6013,'fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (39,25,6016,'ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc,');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (40,40,6019,'erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (41,97,6022,'porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (42,63,6025,'risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (43,18,6028,'vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (44,54,6031,'fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (45,20,6034,'tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (46,84,6037,'Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (47,12,6040,'at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (48,39,6043,'scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel,');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (49,58,6046,'ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (50,35,6049,'malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (51,74,6052,'eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est,');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (52,8,6055,'auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (53,14,6058,'Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (54,18,6061,'sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (55,25,6064,'nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (56,70,6067,'tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (57,88,6070,'Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (58,78,6073,'Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a,');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (59,58,6076,'Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (60,76,6079,'semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (61,98,6082,'eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (62,9,6085,'posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (63,39,6088,'Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (64,58,6091,'ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (65,95,6094,'torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (66,87,6097,'metus sit amet ante. Vivamus non lorem vitae odio sagittis');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (67,39,6100,'tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (68,15,6103,'sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (69,92,6106,'convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (70,98,6109,'enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (71,81,6112,'sit amet luctus vulputate, nisi sem semper erat, in consectetuer');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (72,98,6115,'congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (73,19,6118,'tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (74,100,6121,'mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (75,36,6124,'vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (76,11,6127,'eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (77,23,6130,'vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (78,43,6133,'aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (79,32,6136,'Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (80,35,6139,'Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (81,5,6142,'fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (82,53,6145,'Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (83,46,6148,'egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (84,66,6151,'Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (85,81,6154,'arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (86,79,6157,'dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (87,86,6160,'Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (88,32,6163,'aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (89,97,6166,'elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (90,54,6169,'tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (91,78,6172,'nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (92,71,6175,'lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (93,4,6178,'mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (94,18,6181,'Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (95,61,6184,'Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (96,99,6187,'et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim.');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (97,71,6190,'primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (98,51,6193,'Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (99,67,6196,'nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem,');
INSERT INTO drugmakingprocess (drugMakProcNum,pharmId,medCode,description) VALUES (100,13,6199,'Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at');

select * from DRUGMAKINGPROCESS;












INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (1,'Veda','Charles','Bendigo','Victoria','1316 Fusce Ave','16171028 4520','',9848,26);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (2,'Noble','Barker','Albury','New South Wales','Ap #393-6361 Enim, Avenue','16321029 5790','',9988,39);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (3,'Keiko','Velasquez','Avesta','Dalarnas län','982-4760 Mattis Rd.','16810327 2699','part time',10098,30);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (4,'Brady','Fischer','Ivangorod','LEN','P.O. Box 609, 5266 Vestibulum, St.','16881008 4650','',3358,39);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (5,'Veronica','Francis','Hamburg','HH','5618 In Rd.','16990413 1274','undertraning',6076,45);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (6,'Herman','Jensen','Lanco','XIV','9533 A Rd.','16801109 0829','full time',3716,30);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (7,'Cadman','Guzman','Bangor','ME','339-5647 Tincidunt St.','16390505 4320','part time',3281,37);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (8,'Martin','Gallagher','Fraser Lake','BC','8657 Laoreet Rd.','16131228 0926','',9958,42);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (9,'Travis','Bentley','Galway','Connacht','2333 Scelerisque Avenue','16690529 6338','undertraning',8608,37);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (10,'Lynn','Clay','St. Petersburg','Florida','8214 Ut, Ave','16540113 6097','',4803,33);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (11,'Olivia','Hunt','Khairpur','Sindh','P.O. Box 882, 1165 Nascetur Street','16230327 5966','undertraning',4218,36);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (12,'Sebastian','Collier','Thunder Bay','Ontario','4936 Proin Rd.','16240510 8420','part time',8801,24);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (13,'Guinevere','Johns','Rio Grande','RS','Ap #293-1496 Consectetuer St.','16230204 9453','part time',5540,33);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (14,'Nayda','Luna','Waret-l''Ev?que','LU','P.O. Box 359, 1994 Nibh. St.','16031013 0216','undertraning',8153,20);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (15,'Darrel','Moody','Macul','RM','641-2902 Suspendisse St.','16801204 4726','part time',10106,47);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (16,'Lucian','Medina','Belfast','U','9208 Ullamcorper, Road','16060318 6362','',10697,28);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (17,'Drake','Lang','Jette','Brussels Hoofdstedelijk Gewest','P.O. Box 523, 5975 Amet Street','16090429 9724','specalist',8765,15);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (18,'Melvin','Conrad','Ulhasnagar','Maharastra','693-5520 Massa. Avenue','16580630 9646','undertraning',6863,13);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (19,'Emma','Flynn','Hervey Bay','QLD','Ap #528-8183 Vestibulum, Av.','16310406 0706','',8096,26);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (20,'Kyra','Carr','Bremerhaven','HB','3316 Neque Rd.','16420819 2171','',5594,43);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (21,'Bell','Melton','Criciúma','Santa Catarina','9410 Lorem Rd.','16650608 5981','specalist',4849,20);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (22,'Ulla','Henry','Uyo','Akwa Ibom','P.O. Box 194, 2737 Hendrerit Avenue','16210827 3737','',5586,18);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (23,'Baker','Baldwin','Saint John','NB','6556 Orci, St.','16351107 7707','undertraning',8683,23);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (24,'Wayne','Copeland','Saint-Denis','Île-de-France','7971 Elit Av.','16320815 5519','undertraning',10719,24);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (25,'Ima','Terry','Trollhättan','O','776-602 Elit, Av.','16280324 7036','part time',3988,17);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (26,'Brielle','Winters','Montpellier','Languedoc-Roussillon','P.O. Box 461, 2152 Tincidunt, Street','16401224 9357','',6521,23);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (27,'Gabriel','Estes','Owensboro','KY','P.O. Box 594, 2182 Cras Avenue','16481103 3804','specalist',7721,49);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (28,'Azalia','Kane','Vienna','Wie','514-8781 Lectus Avenue','16880210 0126','',7591,20);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (29,'Ulla','Mccullough','Tuxtla Gutiérrez','Chi','P.O. Box 348, 9635 Phasellus Rd.','16941123 9867','specalist',7216,50);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (30,'Vivian','Fowler','San Pietro al Tanagro','Campania','Ap #524-5250 Vulputate Ave','16751003 4395','',10720,42);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (31,'Emerson','Austin','Burnie','TAS','P.O. Box 989, 7587 Eleifend St.','16690302 7404','',6477,43);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (32,'Hilel','Bolton','Vienna','Wie','P.O. Box 211, 5670 Cursus Avenue','16980317 8459','specalist',8864,21);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (33,'Michael','Hensley','Udaipur','Rajasthan','Ap #785-8720 Fusce Av.','16070810 9533','specalist',9647,49);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (34,'Brennan','Craig','Berlin','BE','690-218 Semper Street','16430417 7670','part time',10231,25);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (35,'Anika','Mullins','Taupo','North Island','142 Ac Street','16790202 8757','',8515,21);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (36,'Maisie','Medina','Beypazar?','Ank','Ap #443-8648 Neque Av.','16920414 4175','',5646,48);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (37,'Carlos','Moran','Novosibirsk','NVS','Ap #166-6749 Vitae Ave','16250407 3129','part time',10845,47);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (38,'David','Downs','Diadema','SP','3103 Felis, Street','16360730 5145','undertraning',4709,17);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (39,'Colleen','Craig','Thurso','Quebec','P.O. Box 474, 6228 Vitae Ave','16340309 1600','part time',10356,30);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (40,'Carl','Lucas','Itagüí','ANT','Ap #114-1265 Luctus Ave','16570601 1904','undertraning',4412,13);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (41,'Jonah','Branch','Tejar','C','313-9341 Pellentesque Avenue','16490102 0885','',10451,35);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (42,'Dean','Fisher','Banchory','KC','P.O. Box 338, 1706 Mauris Road','16481024 3438','undertraning',7624,20);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (43,'Jeremy','Arnold','Le Mans','Pays de la Loire','983-332 Pellentesque Avenue','16660723 9503','full time',3586,30);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (44,'Yolanda','Guzman','Belfast','U','P.O. Box 560, 5822 Dolor Rd.','16940508 7942','part time',8621,33);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (45,'Logan','Flynn','Alajuelita','SJ','P.O. Box 324, 8607 Mauris, Rd.','16330913 8679','part time',5946,12);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (46,'Chastity','Franco','Rodì Milici','Sicilia','P.O. Box 868, 8152 Interdum St.','16790712 1177','specalist',8275,44);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (47,'Teegan','Benton','Putre','XV','Ap #947-2431 Et, Street','16450311 8038','',9899,38);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (48,'Illana','Deleon','Criciúma','SC','474-6617 Magna. Road','16190429 6785','specalist',3649,48);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (49,'Imogene','Woodard','Zamora de Hidalgo','Michoacán','Ap #570-4563 Risus. Rd.','16620729 3710','part time',9537,27);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (50,'Stacy','Mclaughlin','Envigado','Antioquia','3862 Velit. Ave','16110608 2561','',3554,12);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (51,'Nash','Justice','Tulsa','Oklahoma','286-2985 Pretium St.','16110908 6668','undertraning',5891,17);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (52,'Kellie','Brown','Zierikzee','Zeeland','Ap #476-7974 Nullam St.','16670713 6187','specalist',4166,49);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (53,'Zeph','Mckay','Wachtebeke','Oost-Vlaanderen','924-7523 Nisi Av.','16970620 2182','undertraning',3712,40);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (54,'Clio','Hurley','Tours','Centre','P.O. Box 358, 2686 Felis Street','16360804 3489','specalist',5999,33);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (55,'Brett','Bradley','St. Clears','Carmarthenshire','464-3257 Dui Avenue','16310227 0356','',5039,15);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (56,'Aidan','Lawson','Puerto Vallarta','Jal','9372 Magna. Av.','16340523 3622','undertraning',9701,40);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (57,'Thomas','Norman','Nemi','Lazio','P.O. Box 638, 3871 Et St.','16351216 1542','',9165,14);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (58,'Micah','Thompson','Hudiksvall','Gävleborgs län','473-6270 Aliquam Av.','16680915 6711','specalist',7882,47);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (59,'Salvador','Mccormick','East Linton','East Lothian','P.O. Box 273, 8161 Ipsum Avenue','16601220 5164','specalist',9381,36);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (60,'India','Adams','Dandenong','Victoria','919-1065 Enim. Road','16181212 9466','full time',7297,42);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (61,'Kaden','Mills','Chimbote','Ancash','P.O. Box 742, 2231 Ligula. Av.','16350810 1981','part time',4941,48);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (62,'Ima','Rivera','Gwangmyeong','Gye','Ap #761-5421 Risus St.','16530511 6799','undertraning',6537,16);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (63,'Troy','Doyle','Balikpapan','KI','P.O. Box 989, 1456 Adipiscing, Street','16210129 4078','part time',5209,26);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (64,'Lana','Gentry','Luziânia','Goiás','8580 Sed St.','16590717 7942','',10148,22);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (65,'Leandra','Wilkins','Cambridge Bay','NU','P.O. Box 721, 2873 Risus. Road','16540512 4297','',6788,36);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (66,'Jarrod','Russell','Gwangju','Gye','P.O. Box 364, 8949 Ac Avenue','16051217 1331','',7294,31);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (67,'Alfonso','Cannon','Turbo','Antioquia','P.O. Box 865, 3397 Hendrerit St.','16911108 1080','',3960,34);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (68,'Shad','Witt','Price','Quebec','3105 Eros St.','16640527 6921','',7924,22);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (69,'Indira','Burch','Overland Park','KS','7565 Et Road','16480730 7584','',6500,27);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (70,'Dacey','Stanton','Wroc?aw','Dolno?l?skie','228-1230 Phasellus Rd.','16701112 9967','',3165,50);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (71,'Kimberley','Bush','Wellington','North Island','Ap #689-6404 Cras Rd.','16821204 8188','undertraning',3885,25);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (72,'Shana','Orr','Irkutsk','Irkutsk Oblast','P.O. Box 965, 6775 Mauris Rd.','16230201 0729','specalist',9442,12);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (73,'Roanna','Fletcher','Atlanta','Georgia','8177 Sagittis Av.','16360523 5096','part time',5936,30);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (74,'Paul','Hopkins','Lima','Lima','Ap #446-707 Semper. St.','16191005 7700','undertraning',10822,36);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (75,'Brock','Bond','Boston','MA','P.O. Box 343, 4307 Accumsan Avenue','16600115 5438','',7686,33);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (76,'Darius','Palmer','Durg','CT','P.O. Box 214, 6592 Diam Street','16080327 0917','',9760,49);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (77,'Geoffrey','Walton','Sicuani','CUS','P.O. Box 221, 6102 Integer St.','16390112 7435','',9316,15);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (78,'Fuller','May','Istanbul','Istanbul','9348 Porttitor Av.','16400103 0438','undertraning',8504,49);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (79,'Anastasia','Dickerson','Sant''Arsenio','CAM','Ap #503-5916 Amet Road','16621104 9256','specalist',4144,12);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (80,'Malik','Hester','Guaymas','Sonora','2588 Lorem Avenue','16700926 6094','full time',10052,27);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (81,'Zeph','Chase','Vienna','Vienna','Ap #599-520 Donec Avenue','16520211 5704','undertraning',8523,48);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (82,'Gannon','Ayala','Mobile','Alabama','Ap #306-5100 Purus, St.','16170823 6508','part time',7991,31);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (83,'Sebastian','Schroeder','Berlin','Berlin','P.O. Box 377, 9118 A Street','16010221 0218','',7561,34);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (84,'Danielle','Webster','Whangarei','North Island','P.O. Box 936, 9128 Donec St.','16301211 7424','full time',8177,21);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (85,'Kelsie','Hubbard','Hudson''s Hope','British Columbia','Ap #280-4778 Risus. Rd.','16580509 2482','undertraning',3695,43);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (86,'Jin','Sanford','New Plymouth','North Island','8813 Lorem Ave','16891024 0467','full time',8118,43);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (87,'Edan','Maldonado','Melbourne','VIC','P.O. Box 310, 8448 Erat Avenue','16040911 9765','',6429,29);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (88,'Briar','Leonard','Le Grand-Quevilly','HA','Ap #899-3617 Dui, Ave','16281104 0076','undertraning',6749,19);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (89,'Buffy','Britt','Gyeongju','North Gyeongsang','7277 Elit. Road','16080813 7780','full time',9380,47);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (90,'Ahmed','Wallace','Cuenca','CM','Ap #509-3244 Mollis Rd.','16240810 5431','full time',4332,30);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (91,'Natalie','Montoya','Ahmadnagar','Maharastra','5582 Blandit Rd.','16140222 3299','part time',5286,48);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (92,'Bree','Collier','Kano','Kano','P.O. Box 543, 9794 Posuere, Rd.','16331116 4994','specalist',5338,25);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (93,'Beau','Preston','Kostroma','KOS','438-5972 Volutpat. Ave','16530605 8412','full time',8573,50);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (94,'Anika','Barton','Samara','SAM','4515 Mattis Street','16071028 6246','',8079,17);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (95,'Gannon','Hewitt','Badin','Punjab','Ap #497-5247 Egestas St.','16520506 7282','full time',7772,21);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (96,'Aurelia','Hardy','Holywell','Flintshire','2150 Malesuada Ave','16930124 1452','full time',9915,24);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (97,'Kennedy','Tyler','Depok','West Java','P.O. Box 397, 6740 Leo. Rd.','16310723 4613','undertraning',5904,43);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (98,'Bianca','Joseph','Grasse','Provence-Alpes-Côte d''Azur','Ap #357-200 Malesuada Rd.','16480507 7569','specalist',8973,33);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (99,'Armand','Lloyd','Vienna','Wie','206 Fringilla Ave','16701104 2103','specalist',9884,22);
INSERT INTO employee (employeeId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (100,'Chaim','Durham','Te Puke','North Island','P.O. Box 493, 3226 Consectetuer Street','16371019 4410','specalist',8184,22);










INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (1,'Magee','Richard','Puno','Puno','989 Ut St.','16780104 7783','undertraning',9400,20);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (2,'Berk','Macdonald','Lambayeque','LAM','822-1397 A Rd.','16200404 4851','specalist',5048,42);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (3,'Brent','Owen','Cawdor','Nairnshire','291-2212 Nisl. Ave','16031007 2913','full time',9596,21);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (4,'Matthew','Myers','Marseille','Provence-Alpes-Côte d''Azur','669-6576 Augue St.','16700803 4287','',3476,26);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (5,'Blaze','Wilcox','Ulsan','Gye','6004 Aliquam Av.','16900427 3521','part time',6836,5);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (6,'Griffin','Morgan','Pointe-au-Pic','QC','150 Sit Rd.','16940509 5325','',5933,6);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (7,'Jorden','Robertson','Dawson Creek','British Columbia','Ap #515-392 At Ave','16800806 8721','part time',7691,31);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (8,'Clayton','Mcgowan','Lampa','Metropolitana de Santiago','361-5062 Vivamus St.','16061028 8730','',6890,33);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (9,'Zeph','Avery','Cairns','Queensland','Ap #212-2271 Quisque Av.','16420610 6660','',6495,5);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (10,'Debra','Rasmussen','Omaha','NE','8602 Dictum St.','16381018 4998','specalist',6352,36);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (11,'Aimee','Moore','Melbourne','Victoria','860-1403 A Road','16860609 3865','',6932,35);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (12,'Ruby','Swanson','Tokoroa','NI','260-4241 Arcu Street','16340116 4268','full time',6789,44);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (13,'Ryder','Jenkins','Hamburg','HH','832-6643 Nulla Rd.','16751213 8830','specalist',4197,2);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (14,'Sonia','Chen','K?dzierzyn-Ko?le','OP','200-3485 Eget Road','16200113 8789','',3759,37);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (15,'Burton','Hughes','Modinagar','Uttar Pradesh','3317 Arcu. Av.','16860417 9567','full time',6339,21);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (16,'Flavia','Carey','Naperville','IL','P.O. Box 153, 416 Fusce Street','16600502 6064','undertraning',9613,9);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (17,'Laurel','Pollard','Molino dei Torti','PIE','P.O. Box 910, 2946 Nunc St.','16010911 7630','',10284,19);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (18,'Raja','Woods','Sudbury','Suffolk','P.O. Box 832, 2079 Nulla. Ave','16530615 8923','',4751,43);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (19,'Nerea','Burton','Adelaide','South Australia','4755 Quis, Street','16720811 8633','',7493,25);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (20,'Laurel','Carson','Oaxaca','Oax','7332 Maecenas St.','16060512 3538','',6047,44);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (21,'Leroy','Hammond','Miami','Florida','961-6876 Semper Av.','16620116 1913','full time',6030,17);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (22,'Kaitlin','Faulkner','Kano','KN','P.O. Box 881, 4299 Cursus Road','16540723 4664','',8399,2);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (23,'Frances','Holmes','Thisnes','Luik','289-6974 Ridiculus Av.','16281127 0145','undertraning',8159,21);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (24,'Reed','Wise','Ribnitz-Damgarten','Mecklenburg-Vorpommern','799-9176 Facilisis. Rd.','16130924 6047','full time',9385,44);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (25,'Jonah','Cote','Dublin','L','P.O. Box 292, 680 Quisque Rd.','16830816 6902','undertraning',4079,47);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (26,'Kylie','Gallegos','Bauchi','BA','848-2228 Nec, Rd.','16700712 5201','full time',7563,45);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (27,'Rylee','Sweet','Palopo','SN','P.O. Box 999, 4990 Aenean Road','16510921 4469','part time',5200,38);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (28,'Zoe','Mcknight','Chandrapur','MH','Ap #348-3508 Fermentum Ave','16561125 8913','',9723,43);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (29,'Conan','Vargas','Berlin','Berlin','6016 Aliquam Av.','16470102 4483','part time',10623,21);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (30,'Omar','Hansen','Nässjö','F','2219 Ullamcorper, Street','16481101 2006','specalist',9548,5);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (31,'Fleur','Weeks','Palopo','South Sulawesi','8132 Adipiscing Rd.','16320604 3873','specalist',6722,34);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (32,'Farrah','Willis','Bellevue','Washington','812-1368 Nunc Av.','16830328 5616','part time',3955,11);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (33,'Candice','Sherman','Haveli','Azad Kashmir','245-7384 Dictum Rd.','16810718 8081','part time',3032,42);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (34,'Josiah','Bartlett','Ivanovo','IVA','906-2668 Vitae, Street','16770328 7255','',8565,16);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (35,'Isaac','Rodgers','La Granja','RM','8788 Penatibus Avenue','16380427 2965','',7461,42);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (36,'Carlos','Baird','Thatta','Punjab','967-1950 Ligula. St.','16470320 8779','undertraning',10273,22);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (37,'Remedios','Bonner','Volgograd','VGG','879-7878 In Avenue','16760902 5379','part time',8598,4);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (38,'Cedric','Holt','Turbo','Antioquia','P.O. Box 464, 5530 Dictum Ave','16090213 7355','',9115,42);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (39,'Beck','Moss','Helkijn','WV','P.O. Box 546, 7303 Nulla St.','16691216 0816','',3947,28);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (40,'Jamal','Boyle','Flushing','Zeeland','768-5743 In Avenue','16711004 8266','undertraning',6083,13);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (41,'Porter','Hodge','Kanpur','UP','6900 Dolor. Ave','16251121 4021','',7708,36);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (42,'Lesley','Adams','Lochristi','Oost-Vlaanderen','P.O. Box 584, 1967 Penatibus St.','16390701 3530','full time',10614,8);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (43,'Irma','Puckett','Kusa','Chelyabinsk Oblast','P.O. Box 672, 7815 Risus. Avenue','16320419 3985','specalist',5789,39);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (44,'Oprah','Lawrence','Compiègne','PI','3342 Et St.','16940206 2179','part time',8163,11);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (45,'Denton','Galloway','Hawera','North Island','Ap #508-6042 Nec Rd.','16480407 0748','full time',6689,10);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (46,'Jolene','Richard','Cajamarca','Cajamarca','Ap #836-3744 Curabitur Ave','16130118 9856','part time',6811,40);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (47,'Abraham','Hines','Hamburg','HH','909 Sodales Rd.','16371114 7581','specalist',7832,33);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (48,'Lana','Acevedo','Hearst','ON','655-1766 Magnis Rd.','16460826 9199','part time',8186,24);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (49,'Steven','Beard','Sujawal','PU','P.O. Box 826, 3960 Ligula. Av.','16060805 8137','',4171,37);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (50,'Hiram','Abbott','Vladimir','Vladimir Oblast','558-7370 Eget Rd.','16551213 4510','',6964,21);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (51,'John','Bender','Galway','Connacht','495-6851 Ornare. Road','16060125 3974','undertraning',8890,13);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (52,'Neil','Burnett','Essex','Ontario','573-5240 Ipsum. Rd.','16140706 6396','full time',3081,5);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (53,'Amelia','Head','Istanbul','Istanbul','Ap #609-5619 Quis Av.','16431126 8751','undertraning',9598,38);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (54,'Phelan','Willis','Sicuani','Cusco','Ap #720-4062 Amet, Rd.','16051014 1401','part time',9806,9);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (55,'Merritt','Knowles','Bahawalpur','SI','P.O. Box 989, 8970 Lorem. Street','16850127 6995','',9806,20);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (56,'Hasad','Myers','Welland','Ontario','984-3294 Nec Avenue','16540922 7948','undertraning',4195,35);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (57,'Hammett','Savage','Sheffield','Yorkshire','865-2820 Nec Avenue','16860116 5189','part time',10720,36);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (58,'Randall','Hays','Huancayo','Junín','780-287 Mauris Ave','16230220 5121','',8233,16);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (59,'Hyatt','Skinner','Taupo','North Island','Ap #931-5936 Ullamcorper, Road','16160505 9086','specalist',6820,20);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (60,'August','Hickman','Buccheri','SIC','438-5479 Purus, Avenue','16670906 1474','',6900,8);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (61,'Noah','Murray','Mercedes','H','2442 Vel Street','16090910 1800','undertraning',8382,33);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (62,'Remedios','Castillo','Irapuato','Guanajuato','2265 Rhoncus St.','16500707 3322','full time',6365,1);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (63,'Jemima','Kane','Temuka','SI','P.O. Box 975, 2383 Dolor Road','16340826 8542','',9430,26);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (64,'Heather','Kline','Scarborough','ON','P.O. Box 845, 2783 Sapien Street','16400623 2823','specalist',5144,24);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (65,'Ciara','Larson','Schwaz','Tir','P.O. Box 805, 2599 Elit, Rd.','16060813 4821','part time',6704,23);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (66,'Mariko','Lamb','San Rafael','SJ','9494 Sem, Rd.','16810706 8457','specalist',6114,48);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (67,'Gail','Bowen','Billings','MT','589-1574 Sit Rd.','16400330 9442','part time',4431,28);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (68,'Adele','Bates','Lo Prado','RM','Ap #284-7327 Tincidunt Ave','16260619 0441','undertraning',6224,28);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (69,'Pandora','Bryan','Samara','Samara Oblast','P.O. Box 249, 8568 At Street','16470229 2337','part time',10664,8);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (70,'Bradley','Swanson','Alphen aan den Rijn','Zuid Holland','7731 Proin St.','16691219 9483','full time',8387,29);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (71,'Alvin','Sears','Salzburg','Sbg','P.O. Box 395, 171 Aliquam St.','16100904 5590','undertraning',4377,31);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (72,'Sean','Garrett','San Ramón','RM','826-1156 Libero. Avenue','16510420 4028','',4937,33);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (73,'Abbot','Mooney','Montreal','QC','Ap #543-3347 Lorem Street','16640126 4533','',4765,18);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (74,'Patricia','Duffy','Chimbote','Ancash','850-2994 Gravida Street','16300211 9760','part time',10678,19);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (75,'Sebastian','Valenzuela','Pilibhit','UP','Ap #258-2155 Tellus. Av.','16820909 0136','full time',10414,1);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (76,'Elizabeth','Carr','Iksan','North Jeolla','Ap #224-293 Ridiculus Road','16141106 3710','',8453,38);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (77,'Kyla','Bradley','Prince George','British Columbia','330-1899 Aliquam Rd.','16590424 3317','part time',8293,8);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (78,'Ebony','Beard','Clarksville','TN','P.O. Box 128, 781 Proin Road','16951005 6170','',6507,11);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (79,'Aline','Haney','Waiuku','North Island','Ap #925-5599 Lorem, Rd.','16520310 7734','specalist',3304,41);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (80,'Yuri','Ramos','Palencia','Castilla y León','219-7157 Dolor Ave','16421126 4215','',10294,24);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (81,'Hamilton','Deleon','Eschwege','HE','5214 Non St.','16530903 8924','',8643,10);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (82,'Walter','Rivera','Port Harcourt','Rivers','109-9421 Vitae Road','16741030 0920','',6997,33);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (83,'Felix','Day','Malahide','Ontario','P.O. Box 698, 8036 Risus. Rd.','16730904 9158','',3144,22);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (84,'Imelda','Ware','Cimahi','West Java','P.O. Box 924, 3066 Nascetur Rd.','16290710 2806','',8244,5);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (85,'Fulton','Stevenson','Shaki','Oyo','Ap #255-7568 Dui Ave','16980918 7819','undertraning',9320,31);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (86,'Levi','Glass','Denpasar','Bali','4389 Nulla Avenue','16650814 2061','part time',6553,16);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (87,'Clayton','Fernandez','Aguacaliente (San Francisco)','C','P.O. Box 672, 5198 Gravida Avenue','16130824 1296','',10769,3);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (88,'Lareina','Davenport','Berwick-upon-Tweed','NB','1703 Magnis Av.','16060910 7362','',4171,42);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (89,'Andrew','Harrington','San Mauro Cilento','CAM','999-7895 Morbi St.','16860804 1722','',6840,42);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (90,'Steel','Hobbs','Rangiora','South Island','169-5825 Ornare Rd.','16581104 6969','part time',10738,26);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (91,'Justina','Simon','Curanilahue','VII','P.O. Box 590, 4622 Mauris. Av.','16271021 3618','',8396,33);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (92,'Jeremy','Oliver','Okene','Kogi','P.O. Box 205, 124 Egestas. Street','16210421 7423','undertraning',3520,32);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (93,'Joseph','Stokes','Alanya','Antalya','249-2707 Lectus. Street','16830707 9486','part time',10473,44);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (94,'Arthur','Lowe','Mersin','Mersin','4170 Ridiculus Av.','16470802 7497','',7962,22);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (95,'Xavier','Todd','San Nicolás','Cartago','739-2843 Purus. Street','16170911 8960','undertraning',9701,16);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (96,'Camilla','Hodge','Lakewood','CO','Ap #566-1660 Facilisis. St.','16010929 5626','undertraning',5167,46);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (97,'Nell','Vaughan','Kraków','Ma?opolskie','7277 Elit. Street','16920113 3510','',10600,32);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (98,'Gemma','Benjamin','Harnai','Balochistan','6007 Est, St.','16580902 2550','undertraning',10490,45);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (99,'Christian','Nieves','Mersin','Mersin','2434 Tempor Street','16700510 8209','',6073,50);
INSERT INTO pharmacist (pharmId,firstName,lastName,city,region,street,telphone,pos,salary,depId) VALUES (100,'Cheyenne','Mullins','Chetwynd','British Columbia','Ap #636-1878 A Av.','16171227 3257','full time',4425,10);






select * from doctorsSurgeryStaff;





INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (1,24,40);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (2,6,47);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (3,39,42);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (4,9,31);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (5,37,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (6,46,38);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (7,39,50);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (8,47,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (9,50,32);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (10,3,47);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (11,11,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (12,30,30);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (13,23,50);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (14,21,40);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (15,37,38);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (16,2,31);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (17,33,49);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (18,13,41);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (19,23,33);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (20,10,39);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (21,13,45);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (22,20,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (23,49,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (24,15,33);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (25,11,47);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (26,19,38);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (27,46,44);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (28,9,42);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (29,6,46);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (30,48,41);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (31,49,36);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (32,32,34);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (33,37,39);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (34,36,32);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (35,29,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (36,42,32);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (37,38,49);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (38,8,37);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (39,22,48);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (40,37,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (41,8,37);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (42,23,46);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (43,36,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (44,29,46);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (45,1,37);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (46,12,45);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (47,10,43);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (48,46,42);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (49,3,31);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (50,15,45);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (51,43,44);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (52,15,50);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (53,33,36);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (54,19,41);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (55,45,43);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (56,28,32);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (57,23,32);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (58,10,49);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (59,39,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (60,11,44);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (61,45,38);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (62,19,45);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (63,49,32);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (64,23,30);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (65,3,33);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (66,13,37);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (67,12,42);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (68,38,33);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (69,9,46);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (70,43,41);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (71,3,37);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (72,38,34);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (73,18,49);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (74,19,40);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (75,22,43);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (76,29,41);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (77,20,44);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (78,47,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (79,29,39);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (80,42,41);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (81,9,49);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (82,13,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (83,49,40);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (84,18,30);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (85,28,44);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (86,10,36);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (87,49,41);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (88,24,37);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (89,46,35);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (90,46,45);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (91,29,38);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (92,39,49);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (93,35,43);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (94,32,50);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (95,25,50);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (96,35,30);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (97,21,42);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (98,40,41);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (99,3,33);
INSERT INTO ReservationRoom (resCode,roomNum,patId) VALUES (100,40,35);











insert into doctorsSurgeryStaff values (1,1,64);
insert into doctorsSurgeryStaff values (2,1,64);
insert into doctorsSurgeryStaff values (3,1,25);
insert into doctorsSurgeryStaff values (1,2,65);
insert into doctorsSurgeryStaff values (1,3,98);
insert into doctorsSurgeryStaff values (2,2,67);
insert into doctorsSurgeryStaff values (3,2,41);


INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (2,'Gail','Roach','Pinto','VII','P.O. Box 725, 6430 Faucibus Street','16590924 7248','nursing','night shifts',4973,57);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (3,'Suki','Jenkins','Noisy-le-Grand','Île-de-France','P.O. Box 761, 6758 Mauris Ave','16780605 3380',' Burn nursing','special',5400,9);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (4,'Tana','Pierce','Calle Blancos','San José','Ap #376-2985 Tincidunt, Road','16640222 2589',' Cardiac Intervention nursing','under training',6762,51);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (5,'Christine','Burch','Almería','AN','P.O. Box 597, 4346 In Ave','16280326 8677',' Medical-surgical nursing','ful time',1878,53);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (6,'Darryl','Short','P?ock','MA','P.O. Box 616, 4764 Mus. Rd.','16690505 6534',' Emergency nursing','special',6986,22);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (7,'Gisela','Fields','Whitby','Ontario','612-9338 Turpis Rd.','16760304 0598',' Forensic nursing','ful time',3141,98);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (8,'Galena','Briggs','Lodhran','SI','3245 Elit Street','16250430 8533',' Military and uniformed services ','special',4381,73);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (9,'Belle','Gonzalez','Owensboro','KY','744-6774 Neque. St.','16910112 2969',' Cardiac Intervention nursing','night shifts',5045,50);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (10,'Pascale','Cash','Vienna','Vienna','P.O. Box 249, 9988 Nulla St.','16390521 6820',' Environmental health nursing','under training',3059,95);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (11,'Abra','Leblanc','Hindeloopen','Fr','719 Libero. Rd.','16050105 0314',' Camp nursing','under training',5168,12);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (12,'Carly','Hendrix','Arsiè','Veneto','300 Vitae Rd.','16850528 1504',' Home health nursing','under training',6885,29);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (13,'Serena','Sharpe','Loverval','Henegouwen','8926 Metus. Rd.','16470606 2710',' Faith community nursing','special',3408,57);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (14,'Alisa','Mclean','Galway','Connacht','439-4602 Et Av.','16400820 4713',' Environmental health nursing','night shifts',6068,79);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (15,'Indira','Ochoa','Pagazzano','Lombardia','243-2498 Enim. Rd.','16360426 6308',' Geriatric nursing','ful time',2027,58);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (16,'Brooke','Thompson','Vienna','Vienna','P.O. Box 153, 9439 Risus St.','16980103 9513',' Hospice and palliative care nursing','night shifts',3195,77);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (17,'Aubrey','Stuart','Toowoomba','QLD','Ap #377-9581 Vulputate, Rd.','16330220 2332',' Genetics nursing','under training',5333,51);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (18,'Shaine','Meyer','Sukabumi','JB','3156 Dui. St.','16050217 8874',' Legal nurse consultant','special',5800,27);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (19,'Christen','Everett','Paris','Île-de-France','7888 Felis Street','16810624 0586',' Emergency nursing','special',4111,50);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (20,'Violet','Todd','Cartagena','Bolívar','891 Fusce Rd.','16180228 8181',' Faith community nursing','ful time',4805,12);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (21,'Shafira','Powell','Coatzacoalcos','Ver','P.O. Box 813, 8263 Eget Ave','16701214 1748',' Infection control nursing','night shifts',6183,1);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (22,'Carla','Hogan','East Gwillimbury','ON','P.O. Box 787, 3724 Hendrerit Av.','16080216 5795',' Emergency nursing','night shifts',3172,55);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (23,'Halee','Nolan','Orosei','SAR','246-1308 Fringilla, St.','16130712 7512',' Health visiting','ful time',2539,43);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (24,'Sheila','Dillard','Tiegem','West-Vlaanderen','P.O. Box 463, 2179 Scelerisque Road','16930428 8690',' Dental nursing','ful time',7960,26);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (25,'Maite','Richard','Elbl?g','Warmi?sko-mazurskie','P.O. Box 298, 6285 At St.','16010914 7249',' Cardiac nursing','under training',3665,29);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (26,'Chava','Garrison','Cartagena','Bolívar','890-2148 Dictum Road','16530324 0831',' Gastroenterology nursing','under training',1677,53);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (27,'Olivia','Weiss','Olympia','WA','2706 Tincidunt, Street','16210702 7977',' Infectious disease nursing','under training',2805,1);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (28,'Alice','Calhoun','Galway','C','P.O. Box 252, 2578 Augue Ave','16050319 1538',' Forensic nursing','special',3372,10);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (29,'Kalia','English','Berlin','BE','Ap #964-905 Lectus, St.','16070516 9522',' Immunology and allergy nursing','ful time',3821,38);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (30,'Zia','Todd','Wanaka','South Island','9651 Consectetuer Street','16000128 9719',' Neonatal nursing','special',7961,44);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (31,'Carol','Roberts','Itagüí','ANT','P.O. Box 242, 9939 Eros Road','16890109 8957',' Camp nursing','under training',5204,45);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (32,'Belle','Sellers','Toulon','Provence-Alpes-Côte d''Azur','P.O. Box 202, 6409 In Rd.','16711104 2839',' Immunology and allergy nursing','night shifts',7729,61);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (33,'Gemma','Chase','Quesada','Alajuela','3618 Lacus. Rd.','16810825 2787',' Advanced practice nursing','night shifts',1625,67);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (34,'Jacqueline','Cook','Vienna','Wie','P.O. Box 694, 377 Nullam Avenue','16060606 8344',' Forensic nursing','ful time',2313,40);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (35,'Guinevere','Lloyd','Apeldoorn','Gelderland','P.O. Box 694, 3815 Diam. Road','16120104 9705',' Environmental health nursing','special',6669,14);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (36,'Aretha','Mullins','Belfast','Ulster','501-4621 Arcu. Street','16160508 7707',' Military and uniformed services ','under training',4261,75);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (37,'Desiree','Cohen','Windsor','ON','521-3833 Scelerisque, Street','16790806 8567','nursing','special',3996,65);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (38,'Pamela','Hicks','Sutton','Surrey','P.O. Box 361, 4884 Odio Avenue','16910517 7506',' Geriatric nursing','special',7551,69);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (39,'Jaden','Bright','Oryol','ORL','7154 Facilisis St.','16140203 5933',' Advanced practice nursing','night shifts',7975,83);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (40,'MacKensie','Trevino','Middelburg','Zeeland','989-2281 Turpis Rd.','16520524 8817',' Holistic nursing','ful time',6691,74);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (41,'Violet','Preston','Frigento','Campania','3430 Ante Rd.','16951002 0093',' Diabetes Nursing','under training',1554,29);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (42,'Marcia','Vega','San José de Alajuela','A','Ap #161-5875 Sed Street','16500714 1756',' Hyperbaric nursing','special',6793,6);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (43,'Shelley','Vance','Tehuacán','Pue','Ap #552-9590 Pellentesque Av.','16010316 2582',' Dental nursing','night shifts',7985,88);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (44,'Zenaida','Murray','Lauro de Freitas','BA','8689 Pede, Avenue','16670222 7882',' Holistic nursing','ful time',5461,7);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (45,'Colette','Blake','Veenendaal','U.','Ap #352-5412 Dui, Rd.','16430525 7315',' Military and uniformed services ','special',3901,55);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (46,'Kameko','Briggs','Cork','M','Ap #610-1011 Diam. Street','16350708 1572',' Geriatric nursing','ful time',7778,72);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (47,'Amber','Trujillo','Szczecin','ZP','P.O. Box 779, 6268 Suspendisse Road','16801218 5099',' Holistic nursing','under training',2352,23);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (48,'Aline','Cabrera','Bhiwandi','Maharastra','Ap #898-6608 Libero Av.','16710622 0127',' Medical-surgical nursing','ful time',2622,43);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (49,'Ashely','Montoya','Berlin','BE','3112 Risus. St.','16610913 8187',' Faith community nursing','night shifts',6388,97);
select * from nurse;
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (51,'Shellie','Collier','Tharparkar','SI','P.O. Box 612, 9779 Mauris Road','16170714 2988',' Emergency nursing','night shifts',1536,38);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (52,'Alexis','Reese','Castello di Godego','VEN','Ap #461-6181 Lobortis St.','16190320 7015',' Correctional nursing','night shifts',4684,55);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (53,'MacKensie','Barr','Bedford','BD','P.O. Box 484, 8599 Ridiculus St.','16470827 3372',' Maternal-child nursing','ful time',3534,99);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (54,'Erica','Figueroa','Vladimir','Vladimir Oblast','Ap #660-3875 Eros Ave','16800103 5065',' Genetics nursing','special',7470,63);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (55,'Serena','Pickett','Motueka','SI','Ap #106-7632 Vel Av.','16101002 8791',' Dental nursing','ful time',5964,23);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (56,'Sasha','Maddox','Vienna','Vienna','929-9825 Neque Rd.','16311013 9411',' Critical care nursing','ful time',5044,37);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (57,'Megan','Zimmerman','Palopo','SN','Ap #307-6549 Dis Street','16861110 3808',' Health visiting','night shifts',5984,66);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (58,'Delilah','Cardenas','Ternate','MU','882-4675 Ut Ave','16751224 7250',' Infectious disease nursing','night shifts',5393,20);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (59,'Danielle','Hardin','Sagar','MP','P.O. Box 199, 1192 Ultrices. Rd.','16401028 6559',' Intravenous therapy nursing','under training',3249,70);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (60,'Stacey','Frye','Watson Lake','Yukon','245-5571 Sed Rd.','16970626 2996',' Maternal-child nursing','night shifts',7977,14);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (61,'Dominique','Austin','Khushab','Punjab','P.O. Box 515, 9500 Suscipit Rd.','16541105 3886',' Maternal-child nursing','under training',7885,66);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (62,'Rama','Short','Galway','Connacht','P.O. Box 715, 2766 Velit Av.','16830422 6734',' Home health nursing','night shifts',1566,21);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (63,'Wyoming','Bryan','Sevilla','AN','492-3911 Egestas Rd.','16591109 1287',' Gastroenterology nursing','under training',2860,94);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (64,'Wynne','Ballard','Tokoroa','NI','682-5544 Eu Street','16961116 9831',' Critical care nursing','special',5022,48);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (65,'Madaline','Hopkins','Bad Vöslau','NÖ.','Ap #999-1556 Morbi Av.','16170813 6831',' Hospice and palliative care nursing','ful time',4102,11);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (66,'September','Glover','Belfast','Ulster','P.O. Box 772, 2073 Luctus St.','16401111 1962',' Forensic nursing','special',2843,2);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (67,'Ingrid','Whitehead','Murcia','Murcia','5066 Rhoncus. Road','16060918 3074',' Correctional nursing','special',6951,10);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (68,'Kyla','Bruce','Dublin','L','668-8189 Non Av.','16740126 4051',' Correctional nursing','night shifts',2600,50);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (69,'Hayfa','Rutledge','Carmen de Bolivar','BOL','P.O. Box 537, 420 Mauris St.','16061127 0125',' Medical-surgical nursing','special',7838,100);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (70,'Clare','Eaton','Hengelo','Ov','Ap #875-4890 Enim. St.','16401214 9953',' Infectious disease nursing','special',6574,84);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (71,'Aiko','Pace','Vienna','Wie','731-7875 Nunc Street','16550510 0304',' Intravenous therapy nursing','special',3930,57);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (72,'Nadine','Davidson','Vannes','BR','P.O. Box 755, 5076 Tincidunt Av.','16590724 9303',' Infection control nursing','night shifts',2743,88);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (73,'Shannon','Melton','Anamur','Mer','4780 Penatibus St.','16701205 2218',' Dental nursing','special',6654,7);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (74,'Bertha','Richard','Apartadó','ANT','Ap #493-7261 Turpis. Av.','16150523 4912',' Hospice and palliative care nursing','under training',1776,41);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (75,'Cheyenne','Walter','Penco','Biobío','2679 Sapien St.','16190327 5798',' Critical care nursing','under training',3108,13);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (76,'Iola','Bryan','Los Angeles','CA','Ap #678-3489 Libero Ave','16050514 0947',' Diabetes Nursing','special',7633,89);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (77,'Celeste','Brock','Liverpool','New South Wales','923-1145 Ullamcorper, Road','16240614 7948',' Immunology and allergy nursing','special',5432,40);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (78,'Jolie','Aguilar','Borgo Valsugana','TAA','P.O. Box 586, 2905 Felis, Ave','16771101 7132',' Environmental health nursing','special',2148,73);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (79,'Kimberley','Thomas','Hofors','Gävleborgs län','521-5585 Eleifend Ave','16240619 2696','Ambulatory care nursing','under training',4669,33);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (80,'Melodie','Cain','Saumur','PA','256-6012 Egestas Rd.','16960915 8358',' Camp nursing','night shifts',6280,97);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (81,'Madeline','Hahn','Pekanbaru','Riau','P.O. Box 637, 6898 Semper Ave','16040327 5167',' Correctional nursing','night shifts',6269,88);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (82,'Cheryl','Ayala','Toru?','KP','P.O. Box 853, 9277 Lectus Av.','16000820 0925','nursing','special',7388,5);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (83,'Laura','Gould','Pickering','Ontario','Ap #966-1290 Arcu. Road','16740822 9347',' Dental nursing','ful time',2378,29);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (84,'Unity','Melton','Galway','Connacht','328 Iaculis Rd.','16241012 2648',' Burn nursing','under training',3459,71);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (85,'Eden','Wallace','Huancayo','JUN','587-6790 Justo. Road','16210817 3622',' Emergency nursing','night shifts',3190,26);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (86,'Remedios','Stafford','Roio del Sangro','Abruzzo','P.O. Box 471, 9923 Felis, Road','16630821 9796',' Critical care nursing','ful time',7739,23);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (87,'Amelia','Reilly','Anyang','Gyeonggi','P.O. Box 133, 4964 Sed Street','16230501 5378',' Forensic nursing','night shifts',7868,73);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (88,'Dahlia','Chaney','Dublin','Leinster','8101 Et Avenue','16011225 2200',' Intravenous therapy nursing','night shifts',2381,46);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (89,'Rhea','York','Tofield','AB','7006 Nec Rd.','16770815 5796',' Flight nursing','ful time',4315,30);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (90,'Naomi','Robbins','Malang','East Java','P.O. Box 250, 6874 Dapibus Ave','16480815 8325',' Dental nursing','special',5669,56);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (91,'Mechelle','Crawford','Feira de Santana','BA','437-9817 Imperdiet Avenue','16610328 3039',' Environmental health nursing','under training',7347,20);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (92,'Tara','Clark','Mianwali','PU','P.O. Box 558, 6145 Eu, Rd.','16340926 5455',' Forensic nursing','night shifts',1844,92);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (93,'Rama','Shaw','Yekaterinburg','Sverdlovsk Oblast','P.O. Box 284, 8566 Mollis. Road','16920321 1496',' Maternal-child nursing','under training',1501,47);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (94,'Latifah','Mitchell','Borås','O','9555 Et, Ave','16101108 8497',' Forensic nursing','special',7202,83);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (95,'Imelda','Dickerson','Jundiaí','SP','987-7939 Sapien Road','16540819 0626',' Diabetes Nursing','ful time',3335,85);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (96,'Madonna','Ryan','Colico','LOM','Ap #194-5898 Ullamcorper Street','16910606 6674',' Flight nursing','under training',2933,91);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (97,'Kerry','Burris','Clovenfords','Selkirkshire','1991 Tellus. Avenue','16310416 9168',' Holistic nursing','special',2796,12);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (98,'Karyn','Duffy','Mexico City','CDM','Ap #182-6164 Faucibus Road','16280720 2839',' Cardiac Intervention nursing','night shifts',7415,75);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (99,'Jaime','Cunningham','Ulhasnagar','MH','2335 Vel St.','16010928 2947',' Critical care nursing','night shifts',4318,82);
INSERT INTO nurse (nurseId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depID) VALUES (100,'Roanna','Kirby','Vallentuna','Stockholms län','Ap #882-5597 Nisi. Road','16280826 5793',' Gastroenterology nursing','special',5064,29);












INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (1,42,55,26,'diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit',1603678);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (2,52,45,24,'ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus.',385591);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (3,42,59,39,'varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla',1762149);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (4,53,47,24,'Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius',1132922);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (5,57,30,37,'Nulla dignissim. Maecenas',1268727);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (6,53,63,22,'fermentum arcu. Vestibulum ante ipsum primis in faucibus',1887475);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (7,54,69,30,'nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam',424832);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (8,43,30,31,'diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget,',2035548);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (9,28,60,23,'sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus,',259809);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (10,30,69,21,'enim, sit amet ornare lectus justo',1514390);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (11,40,37,37,'cursus, diam at pretium aliquet, metus urna convallis erat, eget',1757764);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (12,27,55,28,'elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,',1959657);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (13,33,55,32,'nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non,',1250942);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (14,48,62,40,'nec mauris blandit mattis. Cras eget',2579743);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (15,37,52,20,'feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis',2257136);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (16,47,30,31,'adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis',2683188);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (17,33,51,33,'quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc',666957);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (18,45,48,39,'lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non,',807263);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (19,27,45,35,'mattis velit justo nec ante. Maecenas mi felis,',2301552);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (20,42,42,35,'lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci',1425279);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (21,34,47,27,'consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus',2097069);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (22,47,40,37,'Morbi metus. Vivamus euismod urna. Nullam lobortis quam',228788);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (23,56,52,28,'interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem',1347344);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (24,32,58,26,'lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non',1543790);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (25,40,59,35,'magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis',1852730);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (26,33,60,20,'pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et',1882439);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (27,48,32,28,'nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.',1094121);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (28,47,59,32,'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus.',421195);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (29,55,35,24,'sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur',2556887);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (30,31,61,34,'purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus',301235);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (31,49,35,24,'nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec',229776);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (32,35,54,27,'mattis.',2631573);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (33,53,62,34,'vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante.',1083487);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (34,53,34,40,'Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.',828304);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (35,57,69,33,'lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna,',1712658);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (36,56,30,27,'dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec',1939554);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (37,37,37,34,'gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat.',830136);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (38,50,69,20,'sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet,',486045);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (39,26,46,31,'nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum',2108707);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (40,27,65,20,'Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at',1608239);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (41,32,65,35,'Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce',344641);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (42,32,63,32,'mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit',498266);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (43,26,59,33,'condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas',2279102);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (44,26,50,20,'risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu.',496925);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (45,48,67,35,'elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices,',1640117);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (46,59,55,36,'libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed,',2778875);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (47,28,70,21,'amet, consectetuer adipiscing elit. Aliquam auctor,',1733609);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (48,25,31,23,'Fusce dolor quam, elementum at,',157334);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (49,31,57,38,'Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper',655200);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (50,56,34,29,'non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,',1685793);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (51,58,50,32,'ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut,',1884427);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (52,51,44,25,'Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit.',2122309);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (53,30,51,28,'arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat',1435843);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (54,32,60,20,'eu dolor egestas rhoncus. Proin nisl sem,',722480);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (55,54,41,22,'Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,',480972);
select * from surgery;
ERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (56,54,30,39,'Donec',1579320);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (57,31,35,23,'fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac',223071);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (58,25,31,25,'in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum.',1229297);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (59,27,69,23,'lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna.',423159);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (60,45,32,28,'quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus',97675);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (61,27,35,35,'libero et tristique pellentesque, tellus sem',2539588);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (62,46,64,37,'turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices.',1794838);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (63,25,68,25,'Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut',94153);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (64,44,38,39,'ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt',456127);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (65,44,42,21,'enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus',1263777);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (66,31,55,34,'vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus.',553440);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (67,50,51,31,'ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis',2264929);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (68,47,47,32,'eu sem. Pellentesque ut',1742869);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (69,58,52,26,'diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut',1344987);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (70,30,31,36,'Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas',2780594);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (71,47,30,30,'mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales',657624);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (72,50,58,20,'conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie',1665700);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (73,41,40,29,'Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam',443056);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (74,31,39,22,'adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed',445722);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (75,33,44,23,'orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada',1759202);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (76,43,59,37,'parturient montes, nascetur ridiculus mus. Proin vel',2390239);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (77,28,50,23,'eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus',404606);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (78,55,67,35,'euismod enim. Etiam gravida molestie arcu. Sed eu',2872371);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (79,59,52,32,'molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.',2107413);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (80,46,40,36,'Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus',769744);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (81,52,42,36,'Nunc',2074129);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (82,40,70,31,'mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim.',438380);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (83,46,38,21,'nisl',1561622);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (84,57,59,23,'risus. Donec egestas. Aliquam nec enim.',2876388);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (85,31,67,37,'ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu',1545318);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (86,36,46,34,'pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget,',2961447);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (87,59,35,32,'pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac',2261280);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (88,38,63,40,'pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus',597079);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (89,29,61,36,'eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet',883835);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (90,55,47,25,'eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero',2530633);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (91,58,60,20,'pellentesque, tellus sem mollis dui, in',1115797);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (92,30,41,27,'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu',2245423);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (93,25,49,35,'porttitor tellus non magna.',1401802);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (94,58,45,23,'Cum sociis natoque penatibus et magnis',1042559);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (95,42,31,31,'lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada',633969);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (96,44,40,24,'ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin',2301817);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (97,30,58,38,'a nunc. In at pede. Cras vulputate',949168);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (98,38,35,21,'sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer',1313604);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (99,31,60,28,'sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec',719867);
INSERT INTO surgery (sugeryNum,surgeonId,patId,roomNum,surDesc,vezeeta) VALUES (100,53,60,35,'eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus',2193605);










INSERT INTO room (roomNum,roomlevel) VALUES (1,9);
INSERT INTO room (roomNum,roomlevel) VALUES (2,0);
INSERT INTO room (roomNum,roomlevel) VALUES (3,2);
INSERT INTO room (roomNum,roomlevel) VALUES (4,3);
INSERT INTO room (roomNum,roomlevel) VALUES (5,15);
INSERT INTO room (roomNum,roomlevel) VALUES (6,2);
INSERT INTO room (roomNum,roomlevel) VALUES (7,5);
INSERT INTO room (roomNum,roomlevel) VALUES (8,3);
INSERT INTO room (roomNum,roomlevel) VALUES (9,4);
INSERT INTO room (roomNum,roomlevel) VALUES (10,6);
INSERT INTO room (roomNum,roomlevel) VALUES (11,13);
INSERT INTO room (roomNum,roomlevel) VALUES (12,15);
INSERT INTO room (roomNum,roomlevel) VALUES (13,10);
INSERT INTO room (roomNum,roomlevel) VALUES (14,6);
INSERT INTO room (roomNum,roomlevel) VALUES (15,15);
INSERT INTO room (roomNum,roomlevel) VALUES (16,7);
INSERT INTO room (roomNum,roomlevel) VALUES (17,1);
INSERT INTO room (roomNum,roomlevel) VALUES (18,1);
INSERT INTO room (roomNum,roomlevel) VALUES (19,11);
INSERT INTO room (roomNum,roomlevel) VALUES (20,2);
INSERT INTO room (roomNum,roomlevel) VALUES (21,10);
INSERT INTO room (roomNum,roomlevel) VALUES (22,4);
INSERT INTO room (roomNum,roomlevel) VALUES (23,12);
INSERT INTO room (roomNum,roomlevel) VALUES (24,13);
INSERT INTO room (roomNum,roomlevel) VALUES (25,6);
INSERT INTO room (roomNum,roomlevel) VALUES (26,6);
INSERT INTO room (roomNum,roomlevel) VALUES (27,10);
INSERT INTO room (roomNum,roomlevel) VALUES (28,6);
INSERT INTO room (roomNum,roomlevel) VALUES (29,6);
INSERT INTO room (roomNum,roomlevel) VALUES (30,5);
INSERT INTO room (roomNum,roomlevel) VALUES (31,10);
INSERT INTO room (roomNum,roomlevel) VALUES (32,9);
INSERT INTO room (roomNum,roomlevel) VALUES (33,4);
INSERT INTO room (roomNum,roomlevel) VALUES (34,13);
INSERT INTO room (roomNum,roomlevel) VALUES (35,7);
INSERT INTO room (roomNum,roomlevel) VALUES (36,4);
INSERT INTO room (roomNum,roomlevel) VALUES (37,3);
INSERT INTO room (roomNum,roomlevel) VALUES (38,9);
INSERT INTO room (roomNum,roomlevel) VALUES (39,4);
INSERT INTO room (roomNum,roomlevel) VALUES (40,2);
INSERT INTO room (roomNum,roomlevel) VALUES (41,3);
INSERT INTO room (roomNum,roomlevel) VALUES (42,10);
INSERT INTO room (roomNum,roomlevel) VALUES (43,13);
INSERT INTO room (roomNum,roomlevel) VALUES (44,8);
INSERT INTO room (roomNum,roomlevel) VALUES (45,8);
INSERT INTO room (roomNum,roomlevel) VALUES (46,8);
INSERT INTO room (roomNum,roomlevel) VALUES (47,4);
INSERT INTO room (roomNum,roomlevel) VALUES (48,4);
INSERT INTO room (roomNum,roomlevel) VALUES (49,9);
INSERT INTO room (roomNum,roomlevel) VALUES (50,9);
INSERT INTO room (roomNum,roomlevel) VALUES (51,11);
INSERT INTO room (roomNum,roomlevel) VALUES (52,15);
INSERT INTO room (roomNum,roomlevel) VALUES (53,7);
INSERT INTO room (roomNum,roomlevel) VALUES (54,13);
INSERT INTO room (roomNum,roomlevel) VALUES (55,5);
INSERT INTO room (roomNum,roomlevel) VALUES (56,10);
INSERT INTO room (roomNum,roomlevel) VALUES (57,4);
INSERT INTO room (roomNum,roomlevel) VALUES (58,11);
INSERT INTO room (roomNum,roomlevel) VALUES (59,2);
INSERT INTO room (roomNum,roomlevel) VALUES (60,4);
INSERT INTO room (roomNum,roomlevel) VALUES (61,6);
INSERT INTO room (roomNum,roomlevel) VALUES (62,2);
INSERT INTO room (roomNum,roomlevel) VALUES (63,0);
INSERT INTO room (roomNum,roomlevel) VALUES (64,3);
INSERT INTO room (roomNum,roomlevel) VALUES (65,14);
INSERT INTO room (roomNum,roomlevel) VALUES (66,10);
INSERT INTO room (roomNum,roomlevel) VALUES (67,11);
INSERT INTO room (roomNum,roomlevel) VALUES (68,5);
INSERT INTO room (roomNum,roomlevel) VALUES (69,7);
INSERT INTO room (roomNum,roomlevel) VALUES (70,11);
INSERT INTO room (roomNum,roomlevel) VALUES (71,8);
INSERT INTO room (roomNum,roomlevel) VALUES (72,15);
INSERT INTO room (roomNum,roomlevel) VALUES (73,14);
INSERT INTO room (roomNum,roomlevel) VALUES (74,1);
INSERT INTO room (roomNum,roomlevel) VALUES (75,12);
INSERT INTO room (roomNum,roomlevel) VALUES (76,7);
INSERT INTO room (roomNum,roomlevel) VALUES (77,9);
INSERT INTO room (roomNum,roomlevel) VALUES (78,9);
INSERT INTO room (roomNum,roomlevel) VALUES (79,0);
INSERT INTO room (roomNum,roomlevel) VALUES (80,9);
INSERT INTO room (roomNum,roomlevel) VALUES (81,5);
INSERT INTO room (roomNum,roomlevel) VALUES (82,12);
INSERT INTO room (roomNum,roomlevel) VALUES (83,7);
INSERT INTO room (roomNum,roomlevel) VALUES (84,13);
INSERT INTO room (roomNum,roomlevel) VALUES (85,1);
INSERT INTO room (roomNum,roomlevel) VALUES (86,9);
INSERT INTO room (roomNum,roomlevel) VALUES (87,13);
INSERT INTO room (roomNum,roomlevel) VALUES (88,5);
INSERT INTO room (roomNum,roomlevel) VALUES (89,10);
INSERT INTO room (roomNum,roomlevel) VALUES (90,8);
INSERT INTO room (roomNum,roomlevel) VALUES (91,13);
INSERT INTO room (roomNum,roomlevel) VALUES (92,5);
INSERT INTO room (roomNum,roomlevel) VALUES (93,6);
INSERT INTO room (roomNum,roomlevel) VALUES (94,12);
INSERT INTO room (roomNum,roomlevel) VALUES (95,7);
INSERT INTO room (roomNum,roomlevel) VALUES (96,0);
INSERT INTO room (roomNum,roomlevel) VALUES (97,5);
INSERT INTO room (roomNum,roomlevel) VALUES (98,3);
INSERT INTO room (roomNum,roomlevel) VALUES (99,0);
INSERT INTO room (roomNum,roomlevel) VALUES (100,2);






INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (1,'07/09/2020','aliquet',2466,27,94);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (2,'01/05/2021','Nulla',4125,19,73);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (3,'19/05/2021','sapien.',5674,10,22);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (4,'20/06/2019','eu',1530,33,24);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (5,'18/10/2020','neque.',4706,42,22);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (6,'06/11/2020','ut',587,46,95);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (7,'20/01/2020','Etiam',6053,85,24);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (8,'11/08/2019','hendrerit',5961,56,75);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (9,'26/09/2020','ac',2368,79,1);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (10,'06/10/2020','ante.',6129,47,80);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (11,'03/06/2020','imperdiet',4285,54,42);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (12,'06/10/2020','faucibus',2581,16,37);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (13,'01/08/2020','senectus',4912,89,21);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (14,'15/04/2020','purus,',1053,40,64);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (15,'17/07/2019','mi',5880,86,40);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (16,'01/02/2020','ut',2959,72,88);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (17,'04/05/2021','senectus',6572,74,55);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (18,'12/12/2019','et',3588,83,60);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (19,'28/01/2020','sollicitudin',1129,37,41);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (20,'05/02/2021','Mauris',4528,83,43);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (21,'24/09/2019','Nulla',1155,25,60);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (22,'11/02/2021','Nam',1419,69,97);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (23,'09/04/2021','ac,',6005,9,74);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (24,'17/02/2021','ullamcorper.',4418,96,57);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (25,'22/02/2021','aliquam,',2314,15,73);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (26,'01/10/2020','vitae',4051,57,94);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (27,'19/07/2020','lorem,',6334,79,28);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (28,'01/06/2019','semper',1982,77,95);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (29,'10/11/2019','sem',3887,24,60);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (30,'01/07/2019','non,',3955,47,79);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (31,'13/02/2021','a,',5966,5,7);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (32,'11/02/2021','Nam',2271,93,5);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (33,'25/05/2020','Vestibulum',5459,96,72);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (34,'02/11/2020','Nunc',3165,17,71);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (35,'31/08/2020','habitant',1916,96,96);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (36,'16/12/2019','sed',5544,95,94);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (37,'09/09/2020','condimentum.',3669,61,33);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (38,'01/12/2020','justo',1715,30,56);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (39,'02/05/2021','tellus.',2662,72,72);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (40,'25/06/2020','orci',5093,59,81);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (41,'28/04/2020','elit.',4717,84,88);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (42,'17/06/2019','dolor.',2091,83,29);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (43,'18/01/2020','ut',6329,55,45);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (44,'31/07/2020','parturient',6127,88,17);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (45,'18/10/2019','bibendum',4496,49,51);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (46,'10/01/2021','In',1374,87,50);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (47,'03/07/2019','pede',1130,41,76);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (48,'23/10/2019','sem',6475,42,82);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (49,'21/02/2021','nisi.',6943,84,47);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (50,'17/09/2020','odio,',2092,36,35);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (51,'14/10/2019','ligula',5586,58,79);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (52,'28/02/2021','sit',6123,65,77);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (53,'11/04/2020','Sed',5552,75,63);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (54,'28/10/2020','risus.',6399,57,41);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (55,'05/09/2019','sodales',2785,10,42);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (56,'11/08/2019','nec',1684,13,29);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (57,'12/10/2020','ridiculus',5807,56,61);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (58,'10/06/2020','aliquet',5134,25,40);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (59,'09/03/2020','Donec',5000,86,27);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (60,'13/09/2020','semper',2507,85,5);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (61,'16/11/2019','turpis.',867,7,96);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (62,'03/07/2019','enim.',5646,92,62);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (63,'01/04/2021','lacus.',3243,42,5);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (64,'05/01/2020','interdum',5939,34,29);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (65,'26/07/2019','iaculis',3104,59,57);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (66,'19/05/2021','Phasellus',3328,34,17);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (67,'01/02/2020','molestie.',5873,83,34);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (68,'26/01/2020','nulla',939,44,66);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (69,'04/02/2020','quam',6079,41,25);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (70,'09/11/2019','est',3217,61,6);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (71,'12/04/2020','Praesent',3953,7,63);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (72,'10/05/2020','at,',703,45,24);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (73,'09/05/2021','Nunc',5902,4,21);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (74,'13/11/2019','eu,',2302,97,32);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (75,'14/07/2019','mi',2645,79,19);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (76,'26/09/2020','Nulla',2562,52,9);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (77,'01/11/2020','aliquet',719,69,37);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (78,'05/12/2019','ridiculus',2839,64,66);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (79,'06/05/2020','Duis',3272,48,34);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (80,'01/09/2020','sit',950,19,19);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (81,'17/01/2020','dignissim',3414,10,68);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (82,'07/11/2019','adipiscing',4585,28,28);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (83,'07/03/2021','ullamcorper,',6305,19,4);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (84,'22/02/2020','vitae',3486,92,97);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (85,'04/10/2019','Nullam',6311,43,79);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (86,'27/09/2020','neque.',3805,56,62);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (87,'28/05/2020','auctor',995,38,89);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (88,'15/10/2019','auctor',4869,40,90);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (89,'16/06/2019','Sed',2033,60,61);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (90,'01/10/2019','ipsum',1150,36,44);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (91,'02/09/2019','dignissim',6877,92,7);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (92,'29/05/2020','ut',4812,13,45);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (93,'25/07/2019','in',4046,83,80);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (94,'20/04/2020','In',4472,50,66);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (95,'18/05/2020','lobortis',5882,14,29);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (96,'25/12/2019','vulputate',2777,33,30);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (97,'10/03/2020','nec',2915,85,77);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (98,'16/05/2020','eget',5793,72,41);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (99,'15/05/2020','massa.',2166,2,24);
INSERT INTO xraysession (sessionNum,sessionDate,xrayCode,vezeeta,patId,phyId) VALUES (100,'22/09/2019','urna.',4166,30,97);


INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (1,'Garrett','Strong','Burlington','Ontario','966-6880 Turpis. Street','16190302 1440',' Anesthesiology','under training',8774,74);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (2,'Burke','Snider','Nanded','Maharastra','102 Non, Street','16520620 4033',' Dermatology','under training',5349,88);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (3,'Valentine','Simon','Renca','Metropolitana de Santiago','Ap #275-9220 Fermentum Rd.','16331202 9808',' Anesthesiology','speialist',7063,80);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (4,'Quail','Kemp','Veere','Zeeland','205-5532 Magna Rd.','16570208 5209',' Dermatology','under training',6678,86);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (5,'Aubrey','Landry','Dornoch','Sutherland','1167 Nunc Rd.','16670417 2151',' Medical genetics','full time',7988,80);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (6,'Stacey','Dejesus','Soledad de Graciano Sánchez','San Luis Potosí','Ap #820-750 Odio St.','16320821 0306',' Family medicine','full time',9602,49);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (7,'Sylvester','Melendez','Tarakan','North Kalimantan','P.O. Box 687, 2685 Semper Street','16810527 4636',' Emergency medicine','part time',8127,32);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (8,'Jared','Peterson','Berlin','Berlin','5259 Eu Avenue','16700225 0830',' Emergency medicine','full time',7264,9);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (9,'Martina','Middleton','Ust-Katav','Chelyabinsk Oblast','P.O. Box 829, 5388 Vulputate, Rd.','16620628 5493','immune system','part time',6153,6);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (10,'Garth','Bean','Miryang','Gye','P.O. Box 157, 2241 Sed Rd.','16730422 5878',' Dermatology','under training',7652,86);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (11,'Maggy','Olson','Columbus','Ohio','P.O. Box 756, 9221 Quisque St.','16581006 0615',' Internal medicine','part time',8425,7);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (12,'Audra','Willis','Stargard Szczeci?ski','ZP','7748 Tempor Street','16810319 3663',' Dermatology','part time',7748,69);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (13,'Selma','Ballard','Moulins','Auvergne','Ap #164-1220 Nec Road','16241020 1806',' Family medicine','under training',9590,81);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (14,'Zachary','Mejia','Irapuato','Gto','5085 Volutpat. Rd.','16090628 7560',' Emergency medicine','under training',8609,91);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (15,'Hayfa','Barrera','Galway','C','P.O. Box 613, 332 Amet Rd.','16480811 5770',' Dermatology','part time',9523,93);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (16,'Tobias','Gay','Bathurst','NSW','P.O. Box 653, 6337 Tellus Street','16761108 5601',' Diagnostic radiology','full time',6945,13);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (17,'Damian','Pena','Vienna','Wie','P.O. Box 733, 7552 Purus, Rd.','16240225 1355',' Anesthesiology','part time',7382,16);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (18,'Shad','Cummings','Gunsan','Jeo','P.O. Box 180, 9292 Sit Road','16130813 5993','immune system','part time',9695,15);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (19,'Geraldine','Hardy','Hamburg','Hamburg','999-6490 Morbi Av.','16350622 5857',' Family medicine','part time',8084,67);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (20,'Yvonne','Deleon','Vänersborg','O','P.O. Box 945, 7330 Metus. Avenue','16641222 1944',' Diagnostic radiology','speialist',9918,70);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (21,'Carson','England','Dordrecht','Zuid Holland','P.O. Box 616, 6017 Curabitur Avenue','16371002 8766','immune system','under training',6100,8);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (22,'Paloma','Noel','San Nicolás','Biobío','Ap #390-6415 Sit Street','16660625 4602',' Family medicine','part time',9944,66);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (23,'Noel','Wade','Paris','IL','P.O. Box 443, 673 Augue, Rd.','16250319 4942',' Dermatology','speialist',5513,45);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (24,'Kristen','Mathews','Makurdi','BE','Ap #496-1865 Sodales Road','16940717 6214',' Emergency medicine','speialist',7974,9);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (25,'Nash','Adkins','Broken Hill','New South Wales','Ap #387-3247 Ullamcorper St.','16720724 4042',' Anesthesiology','speialist',8598,31);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (26,'Karly','Obrien','Porbandar','GJ','137 Cursus, St.','16611121 8050',' Anesthesiology','full time',7879,57);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (27,'Wilma','Ayers','Trujillo','LAL','730-2354 Molestie Rd.','16020427 8154',' Diagnostic radiology','speialist',7691,95);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (28,'Jordan','Goodman','Redwater','AB','7300 Lobortis Ave','16841028 9881',' Medical genetics','speialist',9491,40);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (29,'Macon','Flowers','Quimper','Bretagne','3653 A, Rd.','16240701 4121',' Emergency medicine','full time',7519,1);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (30,'Noelani','Hoffman','NeuprŽ','Luik','Ap #782-7828 Suscipit, Av.','16410812 0462',' Family medicine','under training',9167,50);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (31,'Quin','Wilcox','Beawar','Rajasthan','P.O. Box 607, 7488 Natoque Rd.','16210815 1578',' Family medicine','full time',6421,5);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (32,'Lyle','Ortiz','Camponogara','Veneto','369-4116 Tempor Ave','16310724 0891',' Anesthesiology','full time',5397,20);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (33,'Kane','Nixon','Taupo','North Island','Ap #634-1941 Consequat Av.','16300913 5371',' Emergency medicine','speialist',6053,88);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (34,'Melinda','Stafford','Carmen','C','544-6349 Augue St.','16120223 5121',' Diagnostic radiology','under training',7504,15);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (35,'Jennifer','Hall','Russell','Ontario','150-8858 Velit. Rd.','16890402 5098','immune system','under training',6729,92);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (36,'Hashim','Murray','Kirkland','Quebec','364-6624 Aliquam Road','16750229 1193',' Dermatology','speialist',7459,60);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (37,'Fallon','Chavez','Chestermere','AB','Ap #560-8462 Semper, St.','16990408 8805',' Internal medicine','part time',9572,46);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (38,'Odessa','Fields','Essex','Ontario','555 Neque Avenue','16580830 8703','immune system','part time',6181,31);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (39,'Beck','Robbins','Cáceres','EX','P.O. Box 952, 2432 Arcu. Rd.','16810509 7342',' Family medicine','full time',8840,17);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (40,'Maryam','Crosby','Hastings','NI','103-3399 Ipsum. Rd.','16700418 4995',' Internal medicine','full time',9908,38);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (41,'Eliana','Ingram','Feira de Santana','Bahia','936-5935 Vitae, St.','16321108 2452',' Diagnostic radiology','part time',7341,55);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (42,'Jennifer','Slater','Vienna','Vienna','771-7824 Consectetuer Avenue','16240506 7899',' Family medicine','under training',5326,53);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (43,'Shoshana','Munoz','Bhakkar','Punjab','990-2230 Faucibus Avenue','16590606 8035',' Medical genetics','under training',7087,59);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (44,'Erica','Wynn','María Pinto','Metropolitana de Santiago','P.O. Box 920, 633 Sollicitudin Rd.','16620922 6833',' Internal medicine','speialist',7956,37);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (45,'Randall','Beard','Notre-Dame-du-Nord','Quebec','975 Urna Road','16200419 0977',' Medical genetics','part time',8037,76);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (46,'Christopher','Whitaker','Chicoutimi','Quebec','5604 Eleifend St.','16251107 8228',' Emergency medicine','full time',7484,71);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (47,'Darryl','Curry','Kediri','East Java','P.O. Box 535, 9819 Ullamcorper. Rd.','16451017 1624',' Diagnostic radiology','under training',5527,21);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (48,'Gemma','Bowers','Pacasmayo','LAL','Ap #153-5687 Erat St.','16060413 6598',' Diagnostic radiology','under training',8091,44);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (49,'Meredith','Watson','Tarma','Junín','2680 Orci. Av.','16801030 9238',' Dermatology','full time',7511,78);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (50,'Iola','Lloyd','Bologna','ERM','P.O. Box 942, 4353 Interdum St.','16101227 7263',' Emergency medicine','speialist',8505,96);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (51,'Lester','Boone','Belford Roxo','RJ','7597 Vitae Av.','16491108 5431',' Anesthesiology','under training',9351,65);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (52,'Amy','Wilkerson','Rennes','Bretagne','315-9078 Arcu. Road','16540730 4467',' Emergency medicine','part time',9184,100);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (53,'Yardley','Rose','Chiclayo','Lambayeque','P.O. Box 727, 6123 Et Av.','16820416 0934','immune system','part time',8098,99);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (54,'Axel','Frye','Tarnów','Ma?opolskie','Ap #244-7743 Fames St.','16970829 4674',' Family medicine','speialist',7978,64);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (55,'Palmer','Roberson','Pudahuel','Metropolitana de Santiago','P.O. Box 520, 7209 Tincidunt Road','16270815 8122',' Emergency medicine','speialist',7471,41);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (56,'Nasim','Garrison','Madiun','JI','2674 Libero. Road','16300526 6360','immune system','speialist',7072,46);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (57,'Steven','Mcguire','Awka','Anambra','P.O. Box 260, 7034 Hendrerit Street','16830505 5694',' Dermatology','full time',8715,80);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (58,'Regan','Melton','Maranguape','Ceará','967-2186 Placerat, Road','16360521 0586','immune system','under training',6534,54);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (59,'Asher','Velasquez','Kursk','Kursk Oblast','5889 Id Rd.','16040627 3946',' Medical genetics','full time',7238,28);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (60,'Chester','Garcia','Napoli','Campania','7762 Ultrices. Rd.','16691119 1697','immune system','speialist',6009,1);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (61,'Hunter','Sexton','Boo','Stockholms län','P.O. Box 798, 3869 Dictum Rd.','16160309 0430',' Diagnostic radiology','speialist',6095,13);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (62,'Matthew','David','Quinte West','ON','P.O. Box 706, 4293 Quisque Avenue','16921113 3211',' Dermatology','under training',7884,9);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (63,'Galvin','Bright','Cañas','G','161-6070 Consequat Av.','16081015 1928',' Family medicine','under training',7978,90);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (64,'Alden','Stevenson','Radom','Mazowieckie','P.O. Box 992, 4974 Arcu. Ave','16200526 2437',' Diagnostic radiology','full time',9036,1);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (65,'Wynter','Porter','Eindhoven','Noord Brabant','9844 Morbi Avenue','16710124 6515',' Internal medicine','full time',8389,8);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (66,'Fuller','Colon','Quetta','Balochistan','7730 Metus Street','16160703 2610',' Anesthesiology','full time',8007,77);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (67,'Susan','Alston','Tambov','Tambov Oblast','P.O. Box 822, 5078 Mauris St.','16650914 9289',' Diagnostic radiology','speialist',7756,35);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (68,'Stephen','Hyde','Cork','Munster','494-4052 Quam Av.','16690402 4012',' Dermatology','part time',6561,55);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (69,'Dante','Hood','Lambayeque','Lambayeque','6554 Pede, Avenue','16351113 9010',' Emergency medicine','full time',5722,77);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (70,'Lenore','Orr','Jönköping','Jönköpings län','P.O. Box 921, 2056 Lectus. Road','16030708 7544',' Dermatology','full time',7010,85);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (71,'Alma','Woodward','Fayetteville','Arkansas','239-1504 Molestie Street','16741124 7740','immune system','full time',6175,98);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (72,'Julian','Kirkland','Vienna','Wie','Ap #958-5856 Arcu. Road','16491130 2802',' Emergency medicine','speialist',7584,61);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (73,'Brady','Noel','Herenthout','AN','755-6495 Tristique Av.','16520230 0181',' Internal medicine','full time',8402,46);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (74,'Carol','Booth','Sierra Gorda','II','192-2378 Aliquam Street','16030603 2236',' Anesthesiology','full time',5636,6);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (75,'Ian','Pierce','?om?a','Podlaskie','586-1043 Donec Ave','16110207 8779',' Internal medicine','full time',7861,33);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (76,'Cruz','Mccoy','Essex','VT','P.O. Box 588, 2246 Quis Ave','16851206 6880',' Emergency medicine','part time',5283,79);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (77,'Nelle','Bird','Hillsboro','OR','716-4667 Tellus. Avenue','16410727 6232',' Diagnostic radiology','full time',9854,93);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (78,'Naomi','Rose','Beverlo','Limburg','Ap #309-7902 Curabitur Avenue','16890503 4388',' Anesthesiology','full time',5896,84);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (79,'Buckminster','Chaney','Berlin','BE','P.O. Box 375, 7474 Pharetra Street','16030819 8068',' Medical genetics','under training',5643,52);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (80,'Yuri','Simon','Paradise','Nevada','P.O. Box 163, 1731 Auctor Rd.','16481214 1069',' Medical genetics','speialist',9895,58);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (81,'Hamish','Camacho','Horsham','VIC','191 Donec Street','16380512 4066',' Emergency medicine','full time',7333,41);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (82,'Scarlet','Odonnell','Buin','Metropolitana de Santiago','Ap #625-9937 Elit, Rd.','16940708 4590',' Emergency medicine','full time',7283,83);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (83,'Tanya','Reid','Kansas City','KS','8953 Odio. Rd.','16560205 4495',' Diagnostic radiology','part time',5752,6);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (84,'Colt','Estrada','Suwon','Gye','868-8914 Aliquet. St.','16090203 2978',' Diagnostic radiology','speialist',6586,76);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (85,'Aidan','Church','Tarnów','Ma?opolskie','264-1783 Magna Road','16301210 9454',' Dermatology','under training',5654,67);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (86,'Michelle','Mcbride','Ribeirão das Neves','Minas Gerais','9345 Quisque Road','16860602 6857','immune system','under training',5201,35);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (87,'Matthew','Bishop','Mackay','QLD','2583 Neque Road','16410513 0886',' Diagnostic radiology','part time',9888,50);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (88,'Steven','Daniel','Alajuelita','SJ','Ap #572-7725 Cum Av.','16430420 7139',' Dermatology','part time',8054,1);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (89,'Bernard','Rollins','Erie','Pennsylvania','532-7114 Elementum Rd.','16140604 0293',' Diagnostic radiology','speialist',7601,6);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (90,'Solomon','Bridges','Barkhan','BL','643-2070 Non Street','16570916 7224',' Dermatology','full time',6142,83);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (91,'Molly','Mcdaniel','Envigado','ANT','145-800 Neque. Road','16580303 9345',' Internal medicine','speialist',5766,13);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (92,'Holmes','Mccoy','Karacabey','Bursa','P.O. Box 177, 5402 Maecenas St.','16170818 5465',' Family medicine','full time',9586,38);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (93,'Aileen','Fowler','Greymouth','SI','212-5985 Et Street','16461116 5806',' Medical genetics','under training',8719,9);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (94,'Trevor','Leonard','Bendigo','VIC','P.O. Box 270, 8136 Erat St.','16770614 0337','immune system','under training',7134,18);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (95,'Troy','Norman','La Paz','Baja California','344-7238 Vestibulum, Rd.','16541101 7881',' Diagnostic radiology','under training',6133,32);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (96,'Grady','Justice','Limache','V','Ap #182-5220 Bibendum St.','16821114 0796',' Anesthesiology','part time',9150,10);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (97,'Rogan','Pace','Berlin','BE','P.O. Box 442, 8950 Dolor. Ave','16351017 0420',' Emergency medicine','speialist',7469,67);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (98,'Karen','Franks','Waver','Waals-Brabant','347-3581 Sodales Rd.','16020403 0233',' Emergency medicine','speialist',6151,17);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (99,'Judith','Obrien','Quesada','Alajuela','P.O. Box 145, 6171 Nec Av.','16020221 9523',' Dermatology','under training',7016,18);
INSERT INTO physican (phyId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (100,'Sydney','Burch','Lidköping','Västra Götalands län','P.O. Box 559, 4361 Neque St.','16350618 2777',' Internal medicine','full time',5914,44);








INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5896,14,'odio tristique pharetra. Quisque ac libero');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5899,91,'molestie. Sed id risus quis diam luctus');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5902,15,'sapien imperdiet ornare. In faucibus. Morbi');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5905,99,'urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5908,34,'erat, eget tincidunt dui augue eu');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5911,76,'Nulla semper tellus id nunc interdum');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5914,63,'urna. Nunc quis arcu vel quam dignissim pharetra.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5917,88,'risus. In mi pede, nonummy ut, molestie in, tempus eu,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5920,44,'ante ipsum primis in');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5923,31,'sem ut');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5926,67,'ligula eu enim.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5929,77,'arcu. Sed et libero. Proin mi. Aliquam');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5932,72,'magna sed dui. Fusce aliquam, enim');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5935,36,'Suspendisse aliquet, sem');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5938,38,'lacus. Ut nec urna et');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5941,5,'diam luctus');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5944,82,'felis purus');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5947,80,'enim non nisi.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5950,13,'ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5953,74,'ipsum. Curabitur consequat, lectus sit amet luctus');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5956,8,'vestibulum. Mauris magna. Duis');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5959,10,'venenatis a, magna. Lorem ipsum dolor');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5962,23,'vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5965,61,'ac metus vitae velit egestas lacinia. Sed congue, elit');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5968,94,'magna. Sed eu eros. Nam consequat dolor vitae dolor.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5971,22,'commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5974,59,'Vivamus sit amet risus. Donec egestas. Aliquam nec');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5977,17,'aptent taciti sociosqu');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5980,46,'eget ipsum. Suspendisse sagittis. Nullam vitae');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5983,64,'in sodales elit erat vitae');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5986,74,'pellentesque eget, dictum placerat, augue. Sed');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5989,84,'felis ullamcorper viverra. Maecenas iaculis aliquet diam.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5992,80,'iaculis odio. Nam interdum enim non nisi. Aenean eget');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5995,73,'faucibus orci luctus et ultrices posuere');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (5998,23,'gravida sit amet, dapibus id, blandit at,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6001,100,'ridiculus mus.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6004,45,'tellus sem mollis dui, in sodales elit erat vitae risus.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6007,42,'turpis. Nulla aliquet.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6010,37,'enim.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6013,66,'eget, venenatis a, magna. Lorem ipsum');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6016,70,'convallis, ante');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6019,39,'auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6022,92,'felis orci, adipiscing non, luctus sit amet,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6025,66,'Duis sit amet diam eu dolor');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6028,68,'tristique');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6031,100,'eu nulla at sem molestie');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6034,72,'tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6037,55,'sagittis semper. Nam tempor diam dictum sapien.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6040,10,'nunc est, mollis non, cursus non, egestas a, dui.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6043,57,'dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6046,55,'pede. Cum');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6049,35,'Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6052,63,'Donec tempor, est ac mattis semper, dui');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6055,64,'congue turpis. In');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6058,57,'sagittis augue, eu tempor erat neque non quam. Pellentesque');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6061,4,'arcu.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6064,65,'Morbi accumsan laoreet ipsum. Curabitur consequat,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6067,2,'pellentesque massa');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6070,13,'ligula tortor, dictum eu, placerat');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6073,70,'elit, pellentesque a, facilisis');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6076,59,'convallis est, vitae sodales nisi magna sed dui.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6079,10,'tellus. Nunc lectus pede, ultrices');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6082,40,'taciti sociosqu ad litora torquent per conubia');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6085,56,'Cum sociis natoque penatibus et magnis dis');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6088,60,'amet metus. Aliquam erat');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6091,22,'non');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6094,93,'varius. Nam porttitor scelerisque neque.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6097,52,'tincidunt nibh. Phasellus nulla. Integer vulputate, risus a');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6100,94,'Donec porttitor tellus non magna. Nam ligula elit, pretium');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6103,60,'tristique aliquet. Phasellus fermentum convallis ligula.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6106,28,'Pellentesque ut ipsum ac mi');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6109,98,'dui quis accumsan convallis, ante lectus convallis est,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6112,47,'et, rutrum non, hendrerit id, ante.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6115,81,'nisl elementum');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6118,6,'risus. Nulla eget metus eu erat');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6121,29,'Morbi neque');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6124,5,'dolor egestas rhoncus.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6127,63,'ac orci. Ut semper pretium neque. Morbi quis');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6130,50,'ut mi. Duis risus odio, auctor vitae,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6133,32,'pede et risus. Quisque');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6136,40,'a mi');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6139,40,'Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6142,98,'justo. Proin non massa non ante bibendum ullamcorper. Duis cursus,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6145,23,'egestas. Aliquam');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6148,54,'varius ultrices, mauris');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6151,16,'egestas. Fusce aliquet magna a neque.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6154,94,'dui nec urna suscipit nonummy.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6157,17,'enim mi');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6160,12,'nisi. Aenean eget metus. In nec');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6163,12,'facilisi. Sed neque. Sed eget lacus. Mauris non dui');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6166,63,'placerat, augue. Sed molestie. Sed id risus quis diam');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6169,6,'dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6172,53,'eget magna. Suspendisse tristique neque venenatis');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6175,27,'In condimentum. Donec at arcu.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6178,78,'vulputate, lacus.');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6181,55,'fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6184,14,'eu tempor erat neque non');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6187,72,'mi lorem, vehicula et, rutrum eu, ultrices');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6190,65,'Donec felis orci,');
INSERT INTO treatment (medCode,examCode,treatDesc) VALUES (6193,25,'lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum');






INSERT INTO medicine (medCode,medDesc) VALUES (5896,'lorem ut aliquam iaculis, lacus pede sagittis augue, eu');
INSERT INTO medicine (medCode,medDesc) VALUES (5899,'a feugiat tellus lorem eu metus. In');
INSERT INTO medicine (medCode,medDesc) VALUES (5902,'bibendum fermentum metus. Aenean sed pede nec ante blandit viverra.');
INSERT INTO medicine (medCode,medDesc) VALUES (5905,'et malesuada fames ac turpis');
INSERT INTO medicine (medCode,medDesc) VALUES (5908,'orci. Ut semper pretium neque. Morbi quis urna.');
INSERT INTO medicine (medCode,medDesc) VALUES (5911,'Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet');
INSERT INTO medicine (medCode,medDesc) VALUES (5914,'magnis dis parturient montes, nascetur ridiculus mus.');
INSERT INTO medicine (medCode,medDesc) VALUES (5917,'justo eu arcu. Morbi sit amet massa.');
INSERT INTO medicine (medCode,medDesc) VALUES (5920,'vestibulum, neque sed dictum eleifend, nunc risus varius');
INSERT INTO medicine (medCode,medDesc) VALUES (5923,'sapien. Nunc pulvinar arcu et pede. Nunc sed');
INSERT INTO medicine (medCode,medDesc) VALUES (5926,'pretium et, rutrum non, hendrerit');
INSERT INTO medicine (medCode,medDesc) VALUES (5929,'lorem, auctor quis, tristique ac, eleifend');
INSERT INTO medicine (medCode,medDesc) VALUES (5932,'et tristique pellentesque, tellus sem mollis');
INSERT INTO medicine (medCode,medDesc) VALUES (5935,'velit. Cras lorem lorem, luctus ut, pellentesque eget,');
INSERT INTO medicine (medCode,medDesc) VALUES (5938,'nec tempus scelerisque, lorem ipsum sodales purus, in molestie');
INSERT INTO medicine (medCode,medDesc) VALUES (5941,'sed, est. Nunc laoreet lectus quis');
INSERT INTO medicine (medCode,medDesc) VALUES (5944,'fringilla est. Mauris eu turpis. Nulla aliquet. Proin');
INSERT INTO medicine (medCode,medDesc) VALUES (5947,'Donec non justo.');
INSERT INTO medicine (medCode,medDesc) VALUES (5950,'ipsum primis in faucibus orci luctus et ultrices posuere');
INSERT INTO medicine (medCode,medDesc) VALUES (5953,'tellus lorem eu metus. In lorem. Donec elementum, lorem');
INSERT INTO medicine (medCode,medDesc) VALUES (5956,'massa. Integer vitae');
INSERT INTO medicine (medCode,medDesc) VALUES (5959,'lorem, luctus ut,');
INSERT INTO medicine (medCode,medDesc) VALUES (5962,'purus. Duis elementum, dui quis accumsan');
INSERT INTO medicine (medCode,medDesc) VALUES (5965,'risus a ultricies adipiscing, enim mi tempor lorem, eget');
INSERT INTO medicine (medCode,medDesc) VALUES (5968,'et magnis dis parturient montes, nascetur ridiculus mus.');
INSERT INTO medicine (medCode,medDesc) VALUES (5971,'elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum.');
INSERT INTO medicine (medCode,medDesc) VALUES (5974,'malesuada fames ac turpis egestas. Aliquam fringilla cursus');
INSERT INTO medicine (medCode,medDesc) VALUES (5977,'aliquet nec, imperdiet nec,');
INSERT INTO medicine (medCode,medDesc) VALUES (5980,'consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet');
INSERT INTO medicine (medCode,medDesc) VALUES (5983,'Donec elementum, lorem ut aliquam iaculis, lacus');
INSERT INTO medicine (medCode,medDesc) VALUES (5986,'tortor at risus. Nunc ac sem ut dolor dapibus');
INSERT INTO medicine (medCode,medDesc) VALUES (5989,'mattis. Cras eget nisi dictum augue malesuada');
INSERT INTO medicine (medCode,medDesc) VALUES (5992,'dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu');
INSERT INTO medicine (medCode,medDesc) VALUES (5995,'at pretium aliquet,');
INSERT INTO medicine (medCode,medDesc) VALUES (5998,'libero. Integer in magna. Phasellus dolor elit, pellentesque a,');
INSERT INTO medicine (medCode,medDesc) VALUES (6001,'est. Mauris eu');
INSERT INTO medicine (medCode,medDesc) VALUES (6004,'Aenean euismod mauris eu elit. Nulla facilisi.');
INSERT INTO medicine (medCode,medDesc) VALUES (6007,'orci sem eget massa. Suspendisse');
INSERT INTO medicine (medCode,medDesc) VALUES (6010,'mollis vitae, posuere at, velit. Cras lorem');
INSERT INTO medicine (medCode,medDesc) VALUES (6013,'Morbi sit amet massa. Quisque porttitor eros nec tellus.');
INSERT INTO medicine (medCode,medDesc) VALUES (6016,'vitae mauris sit amet lorem semper auctor. Mauris vel turpis.');
INSERT INTO medicine (medCode,medDesc) VALUES (6019,'tortor. Nunc commodo auctor velit. Aliquam');
INSERT INTO medicine (medCode,medDesc) VALUES (6022,'ac turpis egestas. Fusce');
INSERT INTO medicine (medCode,medDesc) VALUES (6025,'Duis cursus, diam at pretium aliquet, metus');
INSERT INTO medicine (medCode,medDesc) VALUES (6028,'convallis convallis dolor. Quisque');
INSERT INTO medicine (medCode,medDesc) VALUES (6031,'Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis');
INSERT INTO medicine (medCode,medDesc) VALUES (6034,'porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris');
INSERT INTO medicine (medCode,medDesc) VALUES (6037,'enim. Etiam gravida molestie arcu. Sed');
INSERT INTO medicine (medCode,medDesc) VALUES (6040,'Quisque porttitor eros');
INSERT INTO medicine (medCode,medDesc) VALUES (6043,'elit, a feugiat tellus');
INSERT INTO medicine (medCode,medDesc) VALUES (6046,'mi tempor lorem, eget mollis');
INSERT INTO medicine (medCode,medDesc) VALUES (6049,'id ante dictum cursus. Nunc mauris elit, dictum');
INSERT INTO medicine (medCode,medDesc) VALUES (6052,'erat eget ipsum. Suspendisse');
INSERT INTO medicine (medCode,medDesc) VALUES (6055,'Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus');
INSERT INTO medicine (medCode,medDesc) VALUES (6058,'egestas rhoncus. Proin nisl sem,');
INSERT INTO medicine (medCode,medDesc) VALUES (6061,'Aenean massa. Integer vitae nibh. Donec');
INSERT INTO medicine (medCode,medDesc) VALUES (6064,'tellus lorem eu metus. In lorem. Donec elementum,');
INSERT INTO medicine (medCode,medDesc) VALUES (6067,'neque venenatis lacus. Etiam bibendum');
INSERT INTO medicine (medCode,medDesc) VALUES (6070,'diam at pretium aliquet, metus urna convallis erat,');
INSERT INTO medicine (medCode,medDesc) VALUES (6073,'ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor.');
INSERT INTO medicine (medCode,medDesc) VALUES (6076,'ridiculus mus. Aenean');
INSERT INTO medicine (medCode,medDesc) VALUES (6079,'vel arcu eu odio');
INSERT INTO medicine (medCode,medDesc) VALUES (6082,'consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate');
INSERT INTO medicine (medCode,medDesc) VALUES (6085,'arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.');
INSERT INTO medicine (medCode,medDesc) VALUES (6088,'ut eros non enim commodo hendrerit. Donec porttitor');
INSERT INTO medicine (medCode,medDesc) VALUES (6091,'massa non ante bibendum ullamcorper. Duis');
INSERT INTO medicine (medCode,medDesc) VALUES (6094,'eget lacus. Mauris non dui nec urna');
INSERT INTO medicine (medCode,medDesc) VALUES (6097,'magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam');
INSERT INTO medicine (medCode,medDesc) VALUES (6100,'risus. Donec egestas. Duis ac arcu. Nunc mauris.');
INSERT INTO medicine (medCode,medDesc) VALUES (6103,'nulla. Donec non justo. Proin non massa non');
INSERT INTO medicine (medCode,medDesc) VALUES (6106,'aliquet. Phasellus fermentum convallis ligula. Donec luctus');
INSERT INTO medicine (medCode,medDesc) VALUES (6109,'Nulla tempor augue ac');
INSERT INTO medicine (medCode,medDesc) VALUES (6112,'Duis elementum, dui quis accumsan');
INSERT INTO medicine (medCode,medDesc) VALUES (6115,'non, bibendum sed, est. Nunc laoreet lectus quis massa.');
INSERT INTO medicine (medCode,medDesc) VALUES (6118,'consequat purus. Maecenas libero est, congue a, aliquet vel,');
INSERT INTO medicine (medCode,medDesc) VALUES (6121,'eu augue porttitor');
INSERT INTO medicine (medCode,medDesc) VALUES (6124,'elit, a feugiat tellus lorem');
INSERT INTO medicine (medCode,medDesc) VALUES (6127,'Vivamus non lorem vitae odio sagittis');
INSERT INTO medicine (medCode,medDesc) VALUES (6130,'sed consequat auctor,');
INSERT INTO medicine (medCode,medDesc) VALUES (6133,'arcu. Morbi sit');
INSERT INTO medicine (medCode,medDesc) VALUES (6136,'Suspendisse dui. Fusce diam nunc, ullamcorper eu,');
INSERT INTO medicine (medCode,medDesc) VALUES (6139,'luctus felis purus ac tellus. Suspendisse sed dolor.');
INSERT INTO medicine (medCode,medDesc) VALUES (6142,'Cum sociis natoque penatibus et');
INSERT INTO medicine (medCode,medDesc) VALUES (6145,'accumsan laoreet ipsum. Curabitur consequat, lectus sit');
INSERT INTO medicine (medCode,medDesc) VALUES (6148,'volutpat. Nulla facilisis. Suspendisse commodo');
INSERT INTO medicine (medCode,medDesc) VALUES (6151,'leo, in lobortis tellus justo sit amet nulla. Donec non');
INSERT INTO medicine (medCode,medDesc) VALUES (6154,'lorem tristique aliquet. Phasellus fermentum convallis ligula.');
INSERT INTO medicine (medCode,medDesc) VALUES (6157,'vel turpis. Aliquam adipiscing lobortis risus. In mi pede,');
INSERT INTO medicine (medCode,medDesc) VALUES (6160,'Ut tincidunt vehicula risus.');
INSERT INTO medicine (medCode,medDesc) VALUES (6163,'nunc sed pede. Cum');
INSERT INTO medicine (medCode,medDesc) VALUES (6166,'ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque.');
INSERT INTO medicine (medCode,medDesc) VALUES (6169,'nonummy ultricies ornare, elit elit fermentum risus,');
INSERT INTO medicine (medCode,medDesc) VALUES (6172,'Sed nunc est, mollis');
INSERT INTO medicine (medCode,medDesc) VALUES (6175,'magna. Phasellus dolor');
INSERT INTO medicine (medCode,medDesc) VALUES (6178,'quis diam. Pellentesque habitant morbi tristique senectus et netus');
INSERT INTO medicine (medCode,medDesc) VALUES (6181,'in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet,');
INSERT INTO medicine (medCode,medDesc) VALUES (6184,'Sed nulla ante, iaculis');
INSERT INTO medicine (medCode,medDesc) VALUES (6187,'et ultrices posuere cubilia');
INSERT INTO medicine (medCode,medDesc) VALUES (6190,'lectus, a sollicitudin orci sem eget massa. Suspendisse');
INSERT INTO medicine (medCode,medDesc) VALUES (6193,'mauris id sapien. Cras');









INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (1,'07/11/2019','id enim.',231,98,77);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (2,'25/04/2021','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce',165,66,69);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (3,'07/05/2021','et malesuada fames ac turpis egestas.',166,45,76);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (4,'21/06/2019','Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius',485,46,13);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (5,'24/10/2019','massa.',174,55,64);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (6,'28/03/2021','nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis',222,57,44);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (7,'05/03/2021','eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,',433,37,27);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (8,'12/11/2019','egestas a, dui. Cras pellentesque. Sed dictum. Proin',253,90,6);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (9,'05/09/2020','adipiscing elit. Curabitur sed tortor.',385,64,47);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (10,'20/07/2020','aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non,',397,20,2);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (11,'13/01/2020','rutrum magna. Cras',291,50,26);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (12,'15/12/2019','pellentesque massa lobortis ultrices.',207,68,73);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (13,'21/01/2020','enim, gravida sit amet, dapibus id, blandit at, nisi. Cum',374,12,85);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (14,'10/08/2020','nec ante.',486,98,17);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (15,'19/12/2019','a odio semper cursus. Integer mollis. Integer tincidunt aliquam',354,44,97);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (16,'09/09/2020','Donec at arcu. Vestibulum',468,17,29);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (17,'11/05/2021','iaculis quis, pede.',337,80,22);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (18,'06/06/2020','eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a',311,73,43);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (19,'19/02/2020','pellentesque, tellus sem mollis dui,',493,83,17);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (20,'13/02/2021','vulputate mauris sagittis',267,83,14);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (21,'23/06/2020','nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus',158,60,74);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (22,'12/11/2019','augue eu tellus. Phasellus elit pede, malesuada vel,',254,50,64);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (23,'13/01/2020','pede ac',469,32,65);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (24,'22/06/2019','neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,',208,66,71);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (25,'15/05/2021','Suspendisse ac',274,27,71);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (26,'21/09/2020','Quisque ornare tortor at',152,81,10);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (27,'06/11/2019','turpis egestas. Fusce aliquet magna a neque. Nullam',478,82,95);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (28,'21/09/2019','leo. Cras vehicula aliquet libero.',145,97,45);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (29,'26/03/2021','dis parturient montes, nascetur',282,91,34);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (30,'30/01/2021','commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium',265,16,55);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (31,'08/10/2020','In tincidunt congue turpis. In condimentum. Donec',115,79,53);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (32,'24/05/2019','Duis at lacus. Quisque purus sapien, gravida',492,68,13);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (33,'08/02/2021','malesuada vel, convallis in, cursus et,',160,24,6);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (34,'29/01/2021','nunc. In at pede. Cras vulputate',432,66,69);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (35,'29/12/2020','dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae',331,79,69);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (36,'03/05/2020','primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare.',347,72,35);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (37,'01/08/2020','erat. Vivamus nisi. Mauris nulla. Integer urna.',300,41,61);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (38,'11/08/2020','vulputate dui, nec tempus mauris erat eget',197,3,95);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (39,'27/04/2021','facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor,',361,59,54);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (40,'16/07/2020','nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at',178,32,84);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (41,'06/09/2019','blandit',485,55,69);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (42,'24/07/2020','eleifend',181,4,39);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (43,'21/03/2020','Curabitur sed tortor. Integer aliquam adipiscing lacus.',288,87,91);
select * from MEDICALEXAMANATION;
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (45,'13/01/2020','Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris,',245,29,24);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (46,'28/07/2020','libero. Donec consectetuer mauris id',419,40,30);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (47,'20/02/2020','fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla',439,72,27);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (48,'13/09/2019','dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet,',428,73,62);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (49,'13/01/2020','commodo auctor velit. Aliquam nisl. Nulla eu',112,37,18);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (50,'07/12/2019','tincidunt tempus',190,68,86);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (51,'26/05/2019','natoque penatibus et',427,73,11);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (52,'15/12/2019','pharetra nibh. Aliquam ornare, libero',238,53,86);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (53,'22/04/2021','ligula. Aenean gravida nunc sed pede. Cum sociis',490,67,10);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (54,'21/08/2019','iaculis odio. Nam',416,8,59);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (55,'03/07/2019','magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus',381,13,9);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (56,'24/05/2019','magna nec quam. Curabitur vel lectus.',439,12,2);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (57,'21/05/2021','Suspendisse eleifend. Cras',445,23,61);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (58,'07/03/2020','In faucibus. Morbi vehicula. Pellentesque',411,56,8);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (59,'30/07/2020','gravida. Praesent eu nulla at',315,78,39);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (60,'05/01/2020','Nam interdum enim non nisi. Aenean eget metus. In nec',342,54,32);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (61,'05/04/2020','nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis',405,20,48);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (62,'11/08/2019','pharetra. Quisque ac libero nec ligula',194,66,80);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (63,'23/06/2020','nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices.',486,82,60);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (64,'22/09/2020','Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero dui',495,88,36);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (65,'03/04/2021','est, mollis',432,11,83);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (66,'16/04/2021','ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus',450,38,18);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (67,'10/08/2019','Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo',396,13,55);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (68,'13/10/2020','ante ipsum primis',212,35,60);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (69,'24/03/2021','arcu. Morbi',119,26,42);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (70,'28/12/2020','Aliquam vulputate ullamcorper magna. Sed',244,34,78);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (71,'01/09/2019','aliquet diam. Sed diam lorem, auctor quis, tristique ac,',321,67,2);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (72,'06/02/2020','nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',145,28,85);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (73,'10/01/2021','ipsum. Phasellus vitae mauris sit amet lorem',426,40,75);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (74,'12/11/2020','varius ultrices, mauris ipsum porta elit, a feugiat tellus',248,59,82);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (75,'28/11/2020','Quisque purus sapien,',295,48,48);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (76,'05/02/2020','pharetra. Nam ac nulla.',270,63,56);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (77,'07/12/2019','aliquet libero. Integer in',301,62,12);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (78,'10/05/2020','facilisis vitae, orci.',296,45,35);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (79,'02/12/2020','magna. Praesent interdum ligula',215,29,53);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (80,'02/08/2019','sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus',321,54,47);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (81,'04/12/2020','at arcu. Vestibulum ante ipsum primis',107,82,6);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (82,'14/06/2019','turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla',364,9,68);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (83,'27/11/2020','at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc',336,59,39);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (84,'10/08/2020','dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam.',413,63,100);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (85,'06/10/2020','ante, iaculis nec, eleifend non, dapibus rutrum,',272,21,75);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (86,'21/09/2019','dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus',272,42,58);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (87,'03/11/2019','lorem fringilla ornare placerat, orci',276,17,49);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (88,'05/05/2021','et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum.',312,79,34);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (89,'08/01/2021','purus,',187,98,10);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (90,'01/07/2020','elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu',185,47,43);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (91,'14/04/2021','Quisque libero lacus, varius et, euismod et,',113,26,85);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (92,'27/03/2020','ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim.',206,17,66);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (93,'24/07/2020','consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor',238,97,6);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (94,'02/06/2020','egestas. Aliquam fringilla',233,11,63);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (95,'01/10/2019','metus eu erat',389,36,34);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (96,'30/03/2020','enim, gravida sit amet,',140,98,73);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (97,'26/11/2020','nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat',274,41,17);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (98,'09/12/2020','blandit enim',424,8,8);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (99,'09/07/2020','et,',303,83,94);
INSERT INTO medicalExamanation (examCode,examDate,examDesc,vezeeta,patId,docId) VALUES (100,'02/12/2019','Nullam vitae diam. Proin dolor. Nulla semper tellus id',443,75,39);



























INSERT INTO appointment  VALUES (1,'21/04/2021','pulvinar arcu',284,44,14);

INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (2,'05/03/2021','arcu. Vivamus sit',261,1,11);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (3,'12/12/2020','ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis',230,66,68);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (4,'03/11/2020','sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean',414,47,66);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (5,'30/06/2020','In faucibus. Morbi',235,62,14);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (6,'06/04/2020','venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non,',161,27,86);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (7,'30/11/2019','sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat',393,85,25);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (8,'13/10/2019','et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut',345,50,97);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (9,'23/08/2020','mollis nec, cursus a, enim. Suspendisse aliquet,',360,12,44);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (10,'21/02/2021','ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis',431,56,65);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (11,'09/11/2020','eget varius',402,25,69);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (12,'16/06/2019','non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,',318,66,3);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (13,'30/01/2021','vel arcu. Curabitur ut',187,68,76);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (14,'11/11/2020','Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.',371,35,51);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (15,'21/07/2020','Sed eu',395,22,65);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (16,'15/02/2020','aliquet. Phasellus',251,72,96);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (17,'23/12/2020','nec, leo. Morbi neque tellus, imperdiet non, vestibulum',317,11,77);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (18,'21/05/2021','Cras',194,42,29);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (19,'15/02/2020','consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing',301,17,48);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (20,'27/05/2019','massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor',471,85,59);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (21,'31/10/2019','et ultrices posuere',462,13,8);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (22,'09/03/2020','molestie sodales. Mauris blandit enim consequat purus.',231,36,41);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (23,'29/08/2019','tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae',451,99,91);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (24,'30/07/2019','massa. Integer vitae nibh. Donec',242,25,91);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (25,'28/08/2019','Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo.',331,20,48);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (26,'05/01/2020','per',307,12,90);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (27,'11/06/2020','luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu,',180,88,32);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (28,'06/01/2021','accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem',429,3,26);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (29,'07/09/2020','dolor',292,43,88);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (30,'02/08/2019','et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus',414,46,95);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (31,'05/06/2020','pellentesque eget, dictum placerat, augue. Sed molestie. Sed',182,42,60);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (32,'05/03/2020','Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui',143,97,43);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (33,'18/02/2020','porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit',471,94,69);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (34,'15/02/2020','dignissim lacus. Aliquam rutrum lorem ac risus. Morbi',318,11,81);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (35,'21/12/2019','enim nec tempus scelerisque, lorem',499,56,82);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (36,'27/12/2019','congue',497,4,48);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (37,'30/04/2020','tellus eu augue porttitor interdum. Sed auctor',447,17,87);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (38,'02/08/2020','lectus ante dictum mi, ac mattis',263,65,3);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (39,'26/12/2019','neque. Sed eget lacus. Mauris non dui',104,98,52);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (40,'05/12/2019','nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem',107,23,3);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (41,'29/08/2020','vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus',388,24,20);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (42,'20/05/2021','eget massa. Suspendisse eleifend. Cras',254,84,68);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (43,'29/11/2019','a,',235,59,62);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (44,'05/03/2021','orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel',458,30,81);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (45,'30/10/2019','turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris',477,47,73);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (46,'22/02/2021','ornare sagittis felis. Donec tempor,',479,13,88);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (47,'24/11/2019','elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in,',135,26,86);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (48,'20/08/2020','nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas.',360,90,53);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (49,'21/07/2019','porta elit, a feugiat',185,67,65);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (50,'08/05/2020','molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.',353,4,13);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (51,'04/12/2019','Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi',300,63,84);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (52,'07/11/2019','egestas ligula. Nullam feugiat placerat',243,30,78);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (53,'03/01/2020','Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,',344,43,32);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (54,'07/08/2020','blandit viverra. Donec',279,14,29);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (55,'17/04/2021','neque tellus, imperdiet',299,75,85);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (56,'12/03/2020','amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros',436,42,65);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (57,'09/01/2020','sapien, gravida non, sollicitudin a, malesuada id, erat.',389,60,52);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (58,'29/11/2020','interdum enim non nisi. Aenean eget metus. In nec orci. Donec',302,5,4);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (59,'12/03/2021','Cum sociis natoque penatibus et magnis dis parturient',471,90,5);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (60,'31/01/2020','enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas',135,23,93);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (61,'02/09/2020','vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula',164,61,100);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (62,'12/02/2021','turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus.',119,66,36);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (63,'14/10/2020','a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque',391,23,7);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (64,'08/04/2021','arcu vel quam dignissim pharetra.',368,17,7);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (65,'24/01/2020','libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae',261,91,60);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (66,'12/12/2020','Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean',364,45,59);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (67,'25/11/2019','vel quam dignissim pharetra. Nam ac',226,82,15);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (68,'21/08/2020','sollicitudin orci sem eget massa.',367,42,29);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (69,'05/11/2019','interdum. Curabitur dictum. Phasellus in felis. Nulla',140,60,96);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (70,'25/09/2020','Curabitur dictum. Phasellus in',143,68,61);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (71,'17/07/2020','Nulla semper tellus id nunc interdum feugiat.',149,31,65);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (72,'09/06/2020','parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie',175,94,45);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (73,'17/04/2021','accumsan neque et nunc. Quisque ornare tortor at',432,34,73);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (74,'11/12/2019','ligula.',275,50,72);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (75,'04/07/2019','non, lacinia at, iaculis quis, pede.',212,4,25);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (76,'19/12/2020','neque sed sem',346,43,37);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (77,'28/11/2020','diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat.',114,66,5);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (78,'06/07/2019','neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy.',200,93,13);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (79,'15/02/2020','Morbi neque tellus, imperdiet non, vestibulum',460,46,2);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (80,'26/01/2021','lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus',362,12,19);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (81,'25/03/2021','Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et,',141,46,23);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (82,'11/11/2019','felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu',379,80,66);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (83,'03/08/2019','id',429,49,52);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (84,'01/02/2021','Nulla aliquet. Proin velit.',372,36,90);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (85,'23/04/2021','Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a',493,1,52);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (86,'06/04/2021','posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat,',229,9,84);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (87,'09/02/2020','commodo hendrerit. Donec porttitor tellus non magna. Nam',295,56,8);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (88,'02/01/2021','pharetra sed, hendrerit',295,74,50);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (89,'09/06/2020','gravida',208,88,50);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (90,'08/09/2020','congue,',370,53,18);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (91,'17/06/2020','et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet,',316,39,91);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (92,'17/11/2020','primis in',456,13,46);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (93,'24/12/2020','In faucibus. Morbi vehicula. Pellentesque',352,68,35);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (94,'04/02/2020','ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat.',145,42,4);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (95,'14/11/2019','egestas, urna justo faucibus lectus, a sollicitudin orci',214,34,90);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (96,'03/03/2020','mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing',315,77,30);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (97,'03/07/2020','ante lectus convallis est,',373,27,1);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (98,'30/08/2019','sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus',301,34,10);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (99,'28/01/2021','justo sit amet nulla. Donec non justo. Proin',285,22,25);
INSERT INTO appointment (appCode,appDate,appDesc,vezeeta,patId,docId) VALUES (100,'10/12/2019','molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor',371,80,63);


INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (1,'Carol','Gordon','Villers-lez-Heest','Namen','733-4830 Ornare Rd.','16481225 -7790');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (2,'Thor','Hall','Ansan','Gyeonggi','Ap #647-4944 Sit Street','16310414 -0391');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (3,'Amber','Hensley','Gwangju','Gye','Ap #239-4818 Amet Avenue','16990302 -6046');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (4,'Raja','Valdez','Vienna','Vienna','7915 Vulputate St.','16180104 -2316');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (5,'Hector','Mosley','Alloa','Clackmannanshire','P.O. Box 605, 6309 Cras Rd.','16010710 -3939');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (6,'Cassady','Washington','Bauchi','BA','P.O. Box 775, 296 Ut Av.','16440921 -2794');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (7,'Colt','Kelly','Montauban','MI','Ap #787-2772 Eros. Rd.','16070326 -1545');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (8,'Graham','Stewart','Hulste','WV','P.O. Box 760, 6920 Pharetra Av.','16460514 -7158');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (9,'Briar','Guerrero','San Rafael','A','4613 Eu Av.','16770521 -4869');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (10,'Reece','Olson','Semarang','Central Java','661-6715 Fermentum Road','16660314 -9805');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (11,'Rooney','Baird','Frankston','VIC','736-9286 Nunc Road','16880208 -1524');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (12,'Dante','Gardner','Khyber Agency','FA','P.O. Box 911, 7329 Turpis Road','16470724 -1024');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (13,'Shana','Willis','Huntsville','Alabama','Ap #959-4628 Curabitur Avenue','16481208 -5571');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (14,'Hiroko','Lucas','Ñiquén','Biobío','731-2110 Elit, Rd.','16841207 -9942');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (15,'Dolan','Mcbride','Toulon','Provence-Alpes-Côte d''Azur','808-2314 Mauris Rd.','16120814 -9003');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (16,'Herrod','Day','San Pablo','Heredia','4270 Tellus. St.','16471129 -2294');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (17,'Heidi','Buckner','Pyeongtaek','Gye','8573 Euismod St.','16180617 -5970');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (18,'Chelsea','Warren','Oaxaca','Oaxaca','P.O. Box 742, 9675 Ipsum. St.','16110803 -2911');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (19,'Macaulay','Mcgowan','Zerba','Emilia-Romagna','3067 Nunc Rd.','16770615 -9931');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (20,'Teagan','Dickson','Metro','Lampung','994 Velit St.','16850526 -3049');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (21,'Nicholas','Gibbs','Miami','Florida','727-6371 Rutrum Rd.','16390829 -0863');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (22,'Anthony','English','Vallentuna','Stockholms län','1984 Morbi Ave','16621225 -1935');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (23,'Calvin','Levine','Toledo','CM','109-9001 Neque. Rd.','16130313 -8521');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (24,'Sonia','Gomez','Nemi','LAZ','919-1048 Risus Road','16350311 -9681');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (25,'Fletcher','Sanchez','Kozhikode','Kerala','P.O. Box 645, 1415 Luctus Av.','16871216 -9633');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (26,'Quyn','Barrett','Dublin','Leinster','254-4579 Egestas Avenue','16920723 -2746');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (27,'Germaine','Combs','Vienna','Wie','268-4529 At, Street','16810225 -4003');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (28,'Benjamin','Sargent','Zamo??','Lubelskie','P.O. Box 387, 8273 Pellentesque. Rd.','16220423 -0839');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (29,'Aaron','Harding','Berlin','Berlin','9532 Venenatis Avenue','16330215 -1216');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (30,'Lara','Salinas','Londrina','PR','P.O. Box 782, 3758 Odio. Ave','16361102 -1175');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (31,'Brandon','Kelley','Guarapuava','Paraná','P.O. Box 137, 8742 Nunc Street','16710606 -3055');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (32,'Channing','Boyd','Civo','LOM','Ap #868-9991 Mi St.','16750504 -6693');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (33,'Bruno','Shaw','Nijmegen','Gl','334-5173 Et St.','16701027 -7320');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (34,'Charles','Perry','Istanbul','Ist','755-7790 Dapibus Avenue','16390507 -8766');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (35,'Burke','Scott','Bandar Lampung','Lampung','456-3315 Maecenas Rd.','16460107 -0495');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (36,'Edan','Hess','Macul','Metropolitana de Santiago','Ap #108-4209 Purus, St.','16441113 -2006');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (37,'Sonya','Jennings','Kirov','KIR','Ap #407-8768 Luctus Av.','16881022 -2920');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (38,'Graiden','Reid','Norfolk','Virginia','367-7196 Cum Rd.','16520229 -3550');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (39,'Nathan','Jefferson','Zutphen','Gelderland','P.O. Box 776, 6653 Arcu Avenue','16721228 -8299');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (40,'Chadwick','Cherry','Cariboo Regional District','BC','Ap #983-6331 Iaculis Ave','16490528 -4321');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (41,'Adam','Cervantes','Glendale','AZ','802-6531 Ut St.','16520813 -4014');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (42,'Stone','Burgess','Vehari','SI','P.O. Box 951, 1905 Aenean Ave','16271025 -0214');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (43,'Carter','Burt','Salamanca','Guanajuato','P.O. Box 833, 707 Placerat, Ave','16201020 -3376');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (44,'Tad','Townsend','Kaduna','KD','Ap #578-7866 Tristique Rd.','16121006 -7391');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (45,'Bruno','Cooley','Bello','Antioquia','Ap #837-2175 Et Av.','16070326 -5405');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (46,'Roth','Freeman','Dunedin','SI','350-3499 Dis Road','16620602 -2888');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (47,'Gabriel','Holloway','Dijon','BO','198-7074 Et, Road','16270512 -5512');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (48,'Brielle','Chase','Providencia','Metropolitana de Santiago','Ap #721-9637 Magnis Street','16700630 -2751');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (49,'Micah','Hudson','Viran?ehir','?an','P.O. Box 421, 5792 Diam Road','16811019 -7673');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (50,'Larissa','David','Siddi','Sardegna','P.O. Box 248, 1487 Suspendisse Rd.','16750808 -6464');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (51,'Kiona','Knowles','Poppel','AN','2960 Nulla Av.','16140619 -9529');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (52,'Reuben','Massey','Cherain','LX','Ap #885-5974 Elit. Avenue','16121101 -8310');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (53,'Carissa','Blevins','Assen','Drenthe','P.O. Box 330, 3641 Pharetra, Road','16781011 -9409');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (54,'Buckminster','Stanton','Sagamu','OG','421-8226 Mauris Rd.','16020122 -4375');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (55,'Constance','Savage','Bathurst','New South Wales','Ap #358-6818 Volutpat St.','16971229 -8323');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (56,'Martin','Hendrix','San Ignacio','VII','P.O. Box 417, 2397 Mi. Road','16020224 -8258');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (57,'Rashad','Ewing','Torreón','Coahuila','748-8430 Dolor. Avenue','16911114 -0340');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (58,'Shelly','Mercado','Saint-Sébastien-sur-Loire','PA','Ap #961-9266 Dolor. St.','16020408 -2739');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (59,'Lacota','Hester','Vienna','Vienna','Ap #150-7495 Magna. Ave','16231021 -0030');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (60,'Alexis','Hayes','Ghanche','GB','P.O. Box 584, 7764 Eu Avenue','16221203 -5824');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (61,'Octavius','Flowers','Mildura','Victoria','P.O. Box 595, 2172 Pharetra. St.','16160916 -2761');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (62,'Claudia','Burch','Gijzelbrechtegem','West-Vlaanderen','Ap #923-489 Amet, Avenue','16411004 -6812');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (63,'Abigail','Rivas','Belfast','U','Ap #874-559 Lectus Rd.','16260104 -5418');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (64,'Elliott','Holland','Novgorod','Novgorod Oblast','Ap #421-7642 Sit Rd.','16781207 -4677');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (65,'Howard','Cameron','Vienna','Vienna','4379 Aliquet. Road','16020709 -3089');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (66,'Brynne','Jordan','Provo','UT','806-3782 Pellentesque Street','16331105 -5234');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (67,'Amethyst','Gonzalez','Santarém','Pará','Ap #874-9065 Magna. St.','16191102 -2992');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (68,'Charity','Hughes','Hillsboro','Oregon','P.O. Box 264, 9650 Aliquam Rd.','16221223 -8626');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (69,'Jacob','Emerson','Juazeiro do Norte','CE','P.O. Box 581, 5643 Arcu Av.','16530511 -0479');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (70,'Holly','Clark','Delta','BC','Ap #229-5047 Non St.','16440208 -2863');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (71,'Kenneth','Bryan','Fresno','California','P.O. Box 806, 6779 Tortor. Street','16810325 -8466');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (72,'Forrest','Cotton','Khairpur','SI','P.O. Box 480, 6434 Lorem, St.','16170205 -2117');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (73,'Keane','Quinn','Belgorod','BEL','P.O. Box 150, 4907 Eu Ave','16320517 -4794');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (74,'Trevor','Gentry','Palembang','South Sumatra','Ap #991-2869 Ornare Road','16001121 -1315');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (75,'Thomas','Powell','Crato','CE','P.O. Box 798, 7588 Non, Rd.','16320714 -5420');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (76,'Laith','Joseph','Varanasi','Uttar Pradesh','9409 Dolor Avenue','16700227 -5928');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (77,'Levi','Baird','Tasikmalaya','West Java','Ap #801-8891 Et St.','16370707 -0185');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (78,'Bevis','Holloway','Sterling Heights','MI','Ap #751-6373 Neque Avenue','16061224 -2602');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (79,'Asher','Morris','Bello','Antioquia','Ap #976-9322 Facilisis Road','16430904 -0410');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (80,'Pamela','Tanner','Jaén','CAJ','8977 Molestie Street','16600701 -5685');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (81,'Suki','Mckenzie','Acapulco','Gro','P.O. Box 271, 2262 Euismod Avenue','16300910 -4997');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (82,'Yetta','Flores','Thirimont','Henegouwen','Ap #417-966 Pharetra St.','16130218 -0433');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (83,'Shannon','Gregory','Vienna','Vienna','2653 Tortor Road','16690828 -3002');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (84,'Kasimir','Hopper','Mogi das Cruzes','São Paulo','7303 Sed Rd.','16271017 -1501');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (85,'Tarik','Booker','Aguacaliente (San Francisco)','Cartago','P.O. Box 633, 3584 Dictum Rd.','16240404 -3859');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (86,'Blaine','Bennett','Orlando','FL','Ap #326-3920 Sit Rd.','16100824 -4525');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (87,'Hanae','Ruiz','Sobral','CE','7904 Bibendum St.','16880122 -3929');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (88,'Yuli','Daniel','Lawton','Oklahoma','Ap #124-7122 Vestibulum St.','16530910 -0914');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (89,'Chadwick','Donaldson','Cimahi','West Java','Ap #673-5135 Dictum. Street','16391216 -7479');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (90,'Caesar','Dickerson','Bad Kreuznach','RP','P.O. Box 422, 6450 Erat. Street','16130726 -7961');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (91,'Keith','Davis','Gebze','Kocaeli','2066 Auctor Street','16231114 -7132');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (92,'Whoopi','Morton','Bida','Niger','P.O. Box 925, 3358 Etiam Street','16770818 -9878');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (93,'Zahir','Hines','Pangnirtung','Nunavut','358-5597 Accumsan Street','16510329 -1810');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (94,'Amos','Weeks','Lidköping','O','7477 Nullam St.','16350915 -6869');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (95,'Alana','Greer','Karak','Khyber Pakhtoonkhwa','799-5054 Faucibus Ave','16710520 -2563');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (96,'Alea','Fulton','Skardu','Gilgit Baltistan','132-5426 Suspendisse St.','16920806 -3348');

select * from patient;
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (98,'Nevada','Mccormick','Chepén','La Libertad','622 Nisi Rd.','16700804 -9038');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (99,'Kim','Ferrell','Rigolet','NL','748-7548 Consectetuer Street','16500721 -4355');
INSERT INTO patient (patId,firstName,lastName,city,region,street,telphone) VALUES (100,'Petra','Morrison','Vienna','Vienna','Ap #688-6013 Ad Ave','16391124 -8676');



INSERT INTO department (depId,depName,depDesc) VALUES (1,' Neurology','Pellentesque tincidunt tempus risus. Donec egestas. Duis');
INSERT INTO department (depId,depName,depDesc) VALUES (2,' Thoracic Surgery','elementum, dui quis accumsan convallis, ante lectus convallis');
INSERT INTO department (depId,depName,depDesc) VALUES (3,' Neonatal Intensive Care Unit','vehicula et, rutrum eu, ultrices');
INSERT INTO department (depId,depName,depDesc) VALUES (4,' Pediatric Hematology','tortor at risus.');
INSERT INTO department (depId,depName,depDesc) VALUES (5,' Pain Polyclinic ','mi');
INSERT INTO department (depId,depName,depDesc) VALUES (6,' Children Bone Marrow Transplantation Unit','ipsum');
INSERT INTO department (depId,depName,depDesc) VALUES (7,' Pain Polyclinic ','tempus risus.');
INSERT INTO department (depId,depName,depDesc) VALUES (8,'Hepatology General Surgery','cursus luctus, ipsum leo elementum sem, vitae aliquam');
INSERT INTO department (depId,depName,depDesc) VALUES (9,' Interventional Neuroradiology','ipsum ac mi eleifend egestas. Sed');
INSERT INTO department (depId,depName,depDesc) VALUES (10,' Nuclear Medicine','et, eros. Proin');
INSERT INTO department (depId,depName,depDesc) VALUES (11,' Gynecologic Oncology','orci luctus et ultrices posuere cubilia Curae; Phasellus');
INSERT INTO department (depId,depName,depDesc) VALUES (12,' HR','eget ipsum. Suspendisse sagittis. Nullam vitae diam.');
INSERT INTO department (depId,depName,depDesc) VALUES (13,' Pediatric Endocrinology','Vivamus euismod urna. Nullam lobortis quam a');
INSERT INTO department (depId,depName,depDesc) VALUES (14,' Bacteriology and Microbiology','sit amet, risus. Donec nibh enim,');
INSERT INTO department (depId,depName,depDesc) VALUES (15,' Neurology','amet,');
INSERT INTO department (depId,depName,depDesc) VALUES (16,' HIFU','a, arcu. Sed et');
INSERT INTO department (depId,depName,depDesc) VALUES (17,' Infections Diseases','Nulla dignissim.');
INSERT INTO department (depId,depName,depDesc) VALUES (18,' Chemotherapy Center','nisi. Aenean eget metus. In nec orci.');
INSERT INTO department (depId,depName,depDesc) VALUES (19,' Laboratory','sed consequat auctor, nunc');
INSERT INTO department (depId,depName,depDesc) VALUES (20,' Check Up Center','elementum purus,');
INSERT INTO department (depId,depName,depDesc) VALUES (21,' Cardiovascular Surgery','at');
INSERT INTO department (depId,depName,depDesc) VALUES (22,' Pedagogy (Child and Adolescent Psychology)','faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.');
INSERT INTO department (depId,depName,depDesc) VALUES (23,' Triage floor and Medicine','porttitor interdum.');
INSERT INTO department (depId,depName,depDesc) VALUES (24,' In Vitro Fertilization (IVF) ','egestas.');
INSERT INTO department (depId,depName,depDesc) VALUES (25,' mangment','ut,');
INSERT INTO department (depId,depName,depDesc) VALUES (26,' Bacteriology and Microbiology','Nunc pulvinar arcu et pede. Nunc sed orci');
INSERT INTO department (depId,depName,depDesc) VALUES (27,' Low Appetite Child Policlinic','nisl arcu');
INSERT INTO department (depId,depName,depDesc) VALUES (28,' Mezoterapi','elit fermentum risus, at fringilla purus');
INSERT INTO department (depId,depName,depDesc) VALUES (29,' Intensive Care','Mauris');
INSERT INTO department (depId,depName,depDesc) VALUES (30,' Mezoterapi','senectus et netus et malesuada fames');
INSERT INTO department (depId,depName,depDesc) VALUES (31,' Allergic Diseases','natoque penatibus et magnis dis parturient montes,');
INSERT INTO department (depId,depName,depDesc) VALUES (32,' secretary','odio.');
INSERT INTO department (depId,depName,depDesc) VALUES (33,' Pediatric Surgery','felis. Donec tempor, est ac mattis');
INSERT INTO department (depId,depName,depDesc) VALUES (34,' Coronary Intensive Care Unit','purus ac tellus. Suspendisse sed dolor. Fusce');
INSERT INTO department (depId,depName,depDesc) VALUES (35,' Hair Transplantation','amet risus. Donec egestas. Aliquam');
INSERT INTO department (depId,depName,depDesc) VALUES (36,' services','sit amet risus. Donec egestas. Aliquam');
INSERT INTO department (depId,depName,depDesc) VALUES (37,' Kidney Transplantation Center','mi lorem, vehicula');
INSERT INTO department (depId,depName,depDesc) VALUES (38,' Neonatal Intensive Care Unit','sollicitudin a, malesuada id, erat. Etiam vestibulum');
INSERT INTO department (depId,depName,depDesc) VALUES (39,' Home Care Services','at auctor ullamcorper, nisl arcu');
INSERT INTO department (depId,depName,depDesc) VALUES (40,' Liaison Psychiatry','rhoncus. Nullam velit');
INSERT INTO department (depId,depName,depDesc) VALUES (41,' Respiratory Therapy Center','Curabitur consequat, lectus sit amet luctus vulputate, nisi');
INSERT INTO department (depId,depName,depDesc) VALUES (42,' Obesity Surgery Center','sociosqu ad litora torquent per');
INSERT INTO department (depId,depName,depDesc) VALUES (43,' Urogynechology','pulvinar arcu');
INSERT INTO department (depId,depName,depDesc) VALUES (44,' Aviation Medicine','velit dui,');
INSERT INTO department (depId,depName,depDesc) VALUES (45,' Robotik Böbrek Nakli Merkezi','ipsum dolor sit amet,');
INSERT INTO department (depId,depName,depDesc) VALUES (46,' Oncology Center','quis diam.');
INSERT INTO department (depId,depName,depDesc) VALUES (47,' Neurology','convallis, ante lectus convallis');
INSERT INTO department (depId,depName,depDesc) VALUES (48,' Nuclear Medicine','Fusce aliquam, enim nec tempus scelerisque, lorem ipsum');
INSERT INTO department (depId,depName,depDesc) VALUES (49,' Low Appetite Child Policlinic','sit amet, faucibus ut,');
INSERT INTO department (depId,depName,depDesc) VALUES (50,' Oral and Dental Diseases','aliquam eros turpis non enim.');
INSERT INTO department (depId,depName,depDesc) VALUES (51,' Robotic Surgery Center','feugiat placerat velit. Quisque varius. Nam porttitor');
INSERT INTO department (depId,depName,depDesc) VALUES (52,' Pediatric Pulmonology','massa. Integer vitae nibh.');
INSERT INTO department (depId,depName,depDesc) VALUES (53,' PET/CT','nisl. Maecenas malesuada fringilla est.');
INSERT INTO department (depId,depName,depDesc) VALUES (54,' Transfusion center','a, dui.');
INSERT INTO department (depId,depName,depDesc) VALUES (55,' Pediatric Nephrology','Curae; Phasellus ornare.');
INSERT INTO department (depId,depName,depDesc) VALUES (56,' Plastic and Reconstructive Surgery','Integer mollis. Integer tincidunt aliquam arcu.');
INSERT INTO department (depId,depName,depDesc) VALUES (57,' HIFU','ut dolor dapibus gravida. Aliquam tincidunt, nunc ac');
INSERT INTO department (depId,depName,depDesc) VALUES (58,' Plastic and Reconstructive Surgery','elit pede, malesuada');
INSERT INTO department (depId,depName,depDesc) VALUES (59,' Chest Diseases ','tortor, dictum eu, placerat eget, venenatis');
INSERT INTO department (depId,depName,depDesc) VALUES (60,' Psychology','egestas a, dui. Cras pellentesque. Sed dictum. Proin');
INSERT INTO department (depId,depName,depDesc) VALUES (61,' HIFU','libero. Donec');
INSERT INTO department (depId,depName,depDesc) VALUES (62,' Pediatric Infection Diseases','vestibulum nec, euismod in, dolor.');
INSERT INTO department (depId,depName,depDesc) VALUES (63,' Pediatric Allergic Rhinitis','nisi.');
INSERT INTO department (depId,depName,depDesc) VALUES (64,' Onkolojik Cerrahi Merkezi','non, bibendum');
INSERT INTO department (depId,depName,depDesc) VALUES (65,' Gynecology ','Curae; Phasellus ornare. Fusce mollis. Duis sit amet');
INSERT INTO department (depId,depName,depDesc) VALUES (66,' Liaison Psychiatry','Vestibulum accumsan neque et nunc.');
INSERT INTO department (depId,depName,depDesc) VALUES (67,' Child and Young Sports Health Center','at risus. Nunc ac sem ut');
INSERT INTO department (depId,depName,depDesc) VALUES (68,' mangment','nunc sit amet metus. Aliquam erat');
INSERT INTO department (depId,depName,depDesc) VALUES (69,' Gynecologic Oncology','at fringilla purus mauris a nunc. In at');
INSERT INTO department (depId,depName,depDesc) VALUES (70,' Truebeam','amet, risus. Donec nibh enim,');
INSERT INTO department (depId,depName,depDesc) VALUES (71,' Cosmetic Medicine','erat');
INSERT INTO department (depId,depName,depDesc) VALUES (72,' Orthopedics and Traumatology','ante ipsum primis in faucibus orci luctus');
INSERT INTO department (depId,depName,depDesc) VALUES (73,' Mezoterapi','risus. Nulla eget');
INSERT INTO department (depId,depName,depDesc) VALUES (74,' Medical Management','ac turpis egestas. Aliquam fringilla cursus purus.');
INSERT INTO department (depId,depName,depDesc) VALUES (75,' Hematology and Blood Diseases','felis. Donec');
INSERT INTO department (depId,depName,depDesc) VALUES (76,' Radiology','libero. Proin sed turpis nec');
INSERT INTO department (depId,depName,depDesc) VALUES (77,' Aviation Medicine','natoque penatibus et magnis dis');
INSERT INTO department (depId,depName,depDesc) VALUES (78,' Liaison Psychiatry','amet ultricies sem magna');
INSERT INTO department (depId,depName,depDesc) VALUES (79,' Stroke Rehabilitation and Research Unit','quam dignissim pharetra. Nam ac nulla. In tincidunt');
INSERT INTO department (depId,depName,depDesc) VALUES (80,' Dermatology (Skin and Venereal Diseases)','ultricies ligula. Nullam enim. Sed nulla ante, iaculis');
INSERT INTO department (depId,depName,depDesc) VALUES (81,' Obesity Surgery Center','ut nisi a odio semper cursus.');
INSERT INTO department (depId,depName,depDesc) VALUES (82,' Oncology Center','at');
INSERT INTO department (depId,depName,depDesc) VALUES (83,' Allergic Diseases','aliquet. Phasellus fermentum convallis');
INSERT INTO department (depId,depName,depDesc) VALUES (84,' Triage floor and Medicine','turpis');
INSERT INTO department (depId,depName,depDesc) VALUES (85,' Tomosynthesis','vel,');
INSERT INTO department (depId,depName,depDesc) VALUES (86,' Aviation Medicine','arcu ac orci. Ut semper');
INSERT INTO department (depId,depName,depDesc) VALUES (87,' Liaison Psychiatry','nulla. In tincidunt congue turpis. In');
INSERT INTO department (depId,depName,depDesc) VALUES (88,' Urology','augue. Sed');
INSERT INTO department (depId,depName,depDesc) VALUES (89,' Pediatric Psychology','mattis ornare, lectus');
INSERT INTO department (depId,depName,depDesc) VALUES (90,' Kidney Transplantation Center','erat semper');
INSERT INTO department (depId,depName,depDesc) VALUES (91,' Organ Transplantation','tempus non, lacinia at, iaculis quis, pede.');
INSERT INTO department (depId,depName,depDesc) VALUES (92,' Liver Transplantation Center','Phasellus at augue id');
INSERT INTO department (depId,depName,depDesc) VALUES (93,' Neonatal Intensive Care Unit','diam');
INSERT INTO department (depId,depName,depDesc) VALUES (94,' Eye Center','leo elementum sem, vitae');
INSERT INTO department (depId,depName,depDesc) VALUES (95,' Hair Transplantation','nec urna et arcu imperdiet ullamcorper.');
INSERT INTO department (depId,depName,depDesc) VALUES (96,' Radionuclide Therapy Unit','cursus et, eros. Proin ultrices. Duis volutpat nunc');
INSERT INTO department (depId,depName,depDesc) VALUES (97,' Muscle Disorders','ullamcorper, nisl');
INSERT INTO department (depId,depName,depDesc) VALUES (98,' Cardiovascular Surgery Intensive Care Unit','molestie tellus. Aenean egestas');
INSERT INTO department (depId,depName,depDesc) VALUES (99,' Pediatric Infection Diseases','tellus, imperdiet non, vestibulum nec, euismod in,');
INSERT INTO department (depId,depName,depDesc) VALUES (100,' Pediatric Gastroenterology','orci lacus vestibulum lorem, sit amet ultricies');


INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (1,'Kibo','Gross','Charsadda','KPK','Ap #438-2633 Suspendisse Rd.','16840105 3833',' Immunology','under traning',16888,92);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (2,'Brian','Molina','Minderhout','AN','P.O. Box 518, 5801 Et St.','16381212 5775',' Clinical microbiology','under traning',38951,99);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (3,'Addison','Moody','Stargard Szczeci?ski','Zachodniopomorskie','2712 Eleifend Rd.','16541012 1676',' Stomatology','under traning',29151,18);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (4,'Ila','Mays','Bihar Sharif','Bihar','379-5153 Purus, Road','16850130 0084',' Radiology','part time',6646,54);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (5,'Cailin','Sullivan','Lagos','LA','3282 Suspendisse Road','16940613 0238',' Craniofacial surgery','under traning',26165,20);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (6,'Teagan','Wolfe','Cartagena','BOL','310-3577 Mauris Rd.','16051116 2372',' Gastroenterologic surgery','under traning',10926,11);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (7,'Wilma','Miles','Lagos','LA','261-6740 Erat Avenue','16981212 1128',' Cardiology','under traning',38346,56);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (8,'Naomi','Richmond','Ledeberg','Oost-Vlaanderen','Ap #252-9667 Facilisis Avenue','16220718 9438',' Pathology','full time',27759,41);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (9,'Lillith','Graham','Pelluhue','VII','823-9342 Consectetuer Rd.','16470208 1201',' Plastic surgery','specialist',19049,50);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (10,'Kasper','Hooper','Vienna','Wie','300-5153 Dapibus St.','16210918 5690',' Clinical chemistry','supervisior',39249,25);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (11,'Eagan','Hull','Apeldoorn','Gelderland','759-8670 Vitae, St.','16670606 2079',' Obstetrics and gynaecology','full time',24274,81);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (12,'Silas','Gates','Santiago','RM','P.O. Box 108, 2978 Id, Street','16620911 5291',' Geriatrics','specialist',32459,90);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (13,'Rama','Haney','Bannu','Khyber Pakhtoonkhwa','838-8602 Integer St.','16810909 5425',' Psychiatry','specialist',27075,51);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (14,'Joseph','Zimmerman','Versailles','IL','Ap #679-3463 Donec Road','16940119 2944',' Preventive medicine','full time',31234,40);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (15,'Christian','Alexander','San Francisco','Heredia','540-4873 Leo. St.','16910526 5962',' Otorhinolaryngology','supervisior',6009,85);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (16,'Jolie','Kemp','Tonalá','Jalisco','993-1086 At Rd.','16250708 4743',' Obstetrics and gynaecology','under traning',5463,97);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (17,'Moana','Cantrell','Karimnagar','AP','5777 Eget, Street','16130116 8363',' Child psychiatry','part time',46505,48);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (18,'Amery','Gray','Kaluga','Kaluga Oblast','Ap #349-1213 Tellus, Rd.','16720117 4856',' Nephrology','under traning',45207,65);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (19,'Rosalyn','Eaton','Vienna','Wie','711-3592 Tincidunt Rd.','16290209 8371',' Stomatology','supervisior',9263,43);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (20,'Briar','Bowers','General Escobedo','N.L','P.O. Box 311, 5627 Aliquam Ave','16050806 2361',' Allergology','under traning',12367,42);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (21,'Kiayada','Cox','Tarragona','CA','932-6764 Aenean Avenue','16720427 6302',' Gastroenterologic surgery','part time',6959,19);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (22,'Amery','Shaffer','Jundiaí','São Paulo','Ap #717-8151 Quis, Street','16880925 1872',' Clinical chemistry','part time',23103,36);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (23,'Nerea','George','Tonalá','Jal','Ap #101-2476 Bibendum Avenue','16800723 2427',' Endocrinology','full time',43156,87);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (24,'Myles','Parrish','La Granja','Metropolitana de Santiago','Ap #580-2226 Ut St.','16220805 1207',' Allergology','supervisior',5217,85);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (25,'Hamish','Gray','Nancy','LO','831-4935 Eget Rd.','16640519 9875',' Neuropsychiatry','specialist',44009,22);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (26,'Graham','Dean','Goyang','Gyeonggi','693-4061 Pharetra. Road','16410719 5036',' Anaesthetics','full time',40559,90);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (27,'Dean','Payne','San Isidro','San José','276-2008 Tincidunt Av.','16750315 5942',' Gastroenterologic surgery','part time',18511,6);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (28,'Heidi','Pratt','Solok','West Sumatra','709-4817 Tincidunt St.','16371220 9471',' Preventive medicine','supervisior',43710,51);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (29,'Ursa','Houston','Hermosillo','Son','Ap #331-7997 Mauris, Rd.','16280504 8770','Accident and emergency medicine','specialist',19029,91);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (30,'Cedric','Alexander','Tire','?zm','1521 A St.','16780826 7673',' Child psychiatry','supervisior',45334,61);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (31,'Iris','Mccarty','Arviat','NU','1022 Vestibulum. Ave','16551217 2700',' Infectious diseases','supervisior',35380,82);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (32,'Kelly','Case','Jaboatão dos Guararapes','PE','8908 Mauris Rd.','16400416 3418',' General Practice','full time',17038,63);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (33,'Rowan','Hudson','Heppenheim','Hessen','P.O. Box 446, 4597 Aliquam, Ave','16770730 2787',' Craniofacial surgery','specialist',7562,94);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (34,'Jescie','Thomas','Jalgaon','MH','Ap #255-2357 Vestibulum Road','16690406 2202',' Oral and maxillofacial surgery','full time',33424,80);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (35,'Emmanuel','Cross','Alnwick','Northumberland','Ap #691-8972 Interdum St.','16700228 3526',' Nephrology','full time',28572,90);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (36,'Kyle','Huffman','Makassar','South Sulawesi','582-3907 Auctor, Avenue','16320221 2381',' Respiratory medicine','under traning',24767,72);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (37,'Aladdin','Riddle','Miraj','Maharastra','P.O. Box 870, 2723 Sapien, Road','16460125 2887',' Infectious diseases','part time',28966,36);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (38,'April','Hardin','Denpasar','Bali','Ap #652-874 Consequat Ave','16520710 2715',' Gastroenterologic surgery','full time',9913,61);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (39,'Leah','Benson','Ilesa','OS','P.O. Box 941, 909 Tristique Rd.','16160424 8995',' Respiratory medicine','specialist',40041,90);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (40,'Hyatt','Matthews','Wonju','Gan','4036 Est Rd.','16040627 3698',' Laboratory medicine','full time',29829,16);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (41,'Wesley','Pena','Kraków','MP','7341 Eleifend. Avenue','16040304 4415',' Anaesthetics','full time',9609,76);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (42,'Jamal','Bishop','Forbach','LO','9522 In Avenue','16270711 5644',' General surgery','part time',14394,65);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (43,'Trevor','Atkinson','Herstappe','Limburg','294-7695 Facilisis. St.','16360704 3845',' Paediatric surgery','specialist',17944,97);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (44,'Xantha','Green','Troyes','CH','585 Erat Rd.','16570504 6901',' Anaesthetics','under traning',11094,89);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (45,'Indira','Garrett','Taltal','II','3405 Velit Street','16590808 3651',' Endocrinology','supervisior',39436,55);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (46,'Tanya','Matthews','Bama','BO','228-8400 Mollis. Road','16020222 7799',' Geriatrics','part time',14514,22);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (47,'Hadley','Glenn','Sint-Joost-ten-Node','Brussels Hoofdstedelijk Gewest','229-5412 Donec St.','16441003 0136',' Immunology','supervisior',21326,19);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (48,'Stephen','Shaffer','Lagos','Lagos','967 Aenean Street','16240102 5032',' Clinical microbiology','specialist',37904,29);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (49,'Kim','Holder','Cap-de-la-Madeleine','QC','975-4671 Mollis. Rd.','16410728 6868',' Clinical neurophysiology','full time',21905,75);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (50,'Katelyn','Meyer','Ivangorod','Leningrad Oblast','Ap #175-8337 Tellus St.','16420715 8504',' Ophthalmology','under traning',33277,99);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (51,'Meghan','Cunningham','East Jakarta','JK','622-3603 Turpis Rd.','16150925 1235',' Radiology','supervisior',23271,25);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (52,'Phyllis','Copeland','Vienna','Wie','Ap #214-3903 Proin Rd.','16980503 9170',' Vascular surgery','specialist',46885,91);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (53,'Xenos','Marshall','Caplan','QC','Ap #598-3128 Ipsum Ave','16400203 2680',' Gastroenterologic surgery','full time',16271,58);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (54,'Jael','Knight','Rocca d''Arazzo','Piemonte','2498 Nibh Rd.','16860603 4547',' Radiology','specialist',41365,27);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (55,'Amity','Madden','Pakpatan','SI','Ap #824-8844 Lectus. Ave','16750722 2763',' Radiation Oncology','part time',9484,88);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (56,'Howard','Coleman','Sant''Angelo a Cupolo','Campania','P.O. Box 248, 5458 Eu Rd.','16850611 2625',' Neuropsychiatry','under traning',48568,34);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (57,'Britanney','Stanley','Quesada','A','185-678 Risus. Ave','16930317 3257',' Nuclear medicine','full time',24867,9);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (58,'Adrian','Langley','Tiruppur','TN','Ap #837-9688 Sodales St.','16400320 5566',' Thoracic surgery','part time',39857,22);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (59,'Steel','Vance','San Felipe','SJ','747-2476 Enim. St.','16770529 3921',' Venereology','supervisior',30896,37);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (60,'Nigel','Burnett','Bundaberg','Queensland','974-143 Et Rd.','16980706 6189',' Radiology','specialist',5005,68);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (61,'Macaulay','Wilson','Palmerston North','NI','P.O. Box 106, 1898 Enim, Rd.','16710230 1160',' Paediatric surgery','under traning',18619,25);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (62,'Macaulay','Russo','Cz?stochowa','Sl?skie','Ap #703-4867 Nonummy Avenue','16411221 7205',' Clinical neurophysiology','under traning',14304,66);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (63,'Casey','Dodson','Padang Sidempuan','North Sumatra','7272 Convallis Avenue','16560807 0107',' Ophthalmology','part time',13867,23);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (64,'Charlotte','Hanson','Palmerston North','NI','P.O. Box 847, 4113 Phasellus Rd.','16260226 8050',' Tropical medicine','part time',30109,55);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (65,'Ciaran','Dorsey','Panjgur','Balochistan','572-4990 Cras St.','16350103 2423',' Clinical microbiology','under traning',32854,31);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (66,'Noble','Watson','Upper Hutt','North Island','5351 Volutpat Rd.','16570205 2670',' Hematology','supervisior',20258,36);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (67,'Allen','Rush','Elx','Comunitat Valenciana','678-8380 Mauris Avenue','16700518 3012',' Physical medicine and rehabilitation','specialist',24320,90);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (68,'Ivy','Terry','Amravati','Maharastra','P.O. Box 337, 3345 Posuere Rd.','16840220 4781',' Family and General Medicine','specialist',41926,15);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (69,'Candace','Singleton','Sint-Lambrechts-Herk','L.','466-9647 Curabitur Rd.','16000112 6101',' Nephrology','full time',40427,11);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (70,'Georgia','Gay','Gwangyang','South Jeolla','2966 Tincidunt Avenue','16580407 1602',' Nuclear medicine','specialist',21706,36);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (71,'Kylan','Adams','Monclova','Coahuila','878-5440 Sollicitudin Av.','16170818 9061',' Neuropsychiatry','full time',35280,51);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (72,'Lavinia','Mason','San Antonio','SJ','4678 Faucibus Av.','16400509 9413',' Urology','supervisior',30866,72);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (73,'Xander','Giles','Guarulhos','SP','P.O. Box 159, 5399 Tincidunt St.','16950413 6137',' Thoracic surgery','under traning',33581,100);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (74,'Jeremy','Berry','Wilmington','DE','649 Vehicula. Rd.','16821007 3394',' Rheumatology','full time',18675,4);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (75,'Lamar','Jensen','Belcarra','BC','541 Et Road','16720513 2447',' Gastroenterologic surgery','under traning',43759,39);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (76,'Carter','Blankenship','Apartadó','Antioquia','1048 Tempor Rd.','16850607 1326',' Infectious diseases','full time',41281,31);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (77,'Elijah','Soto','Brussel','BU','Ap #911-6639 Tempor Rd.','16780327 0904',' Geriatrics','specialist',28703,71);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (78,'Britanni','Byrd','Kamyzyak','AST','Ap #349-1769 Duis St.','16491015 8668','Accident and emergency medicine','full time',31636,81);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (79,'Yvonne','Neal','Yogyakarta','Special Region of Yogyakarta','5929 Cursus Avenue','16400904 2468',' Radiology','supervisior',10292,47);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (80,'Maxwell','Kennedy','Coimbatore','TN','Ap #397-6860 Aliquam St.','16930120 3973',' Cardiology','part time',21052,26);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (81,'Echo','Manning','Pi?a','WP','982-6905 Adipiscing Avenue','16220717 4166',' Neurology','part time',5312,90);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (82,'Otto','Hensley','Kawartha Lakes','Ontario','Ap #682-2960 Metus. Av.','16410325 2674',' Internal medicine','part time',36221,25);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (83,'Olympia','Duncan','Lucknow','UP','P.O. Box 201, 3715 Cum St.','16720823 2277',' Pathology','supervisior',48655,30);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (84,'Nehru','Shaw','Galway','Connacht','5024 Neque Av.','16740718 4303',' General surgery','specialist',31256,63);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (85,'Eleanor','Holloway','Minna','NI','Ap #738-3550 Mauris Ave','16580915 2324',' Venereology','full time',48307,100);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (86,'Jamalia','Castillo','Jaén','CAJ','266-3365 Sociis Road','16151220 8305',' Orthopaedics','under traning',45856,78);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (87,'Eagan','Grant','Sitapur','Uttar Pradesh','Ap #731-2402 Eu Road','16930916 6578',' Laboratory medicine','under traning',40258,75);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (88,'Adrian','Walker','Nässjö','Jönköpings län','P.O. Box 217, 2657 Conubia Street','16940528 4994',' Radiology','full time',35232,66);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (89,'Britanni','Skinner','Ryazan','Ryazan Oblast','P.O. Box 622, 7520 Primis Street','16581203 8981',' Radiation Oncology','under traning',19804,37);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (90,'Darryl','Franklin','Collines-de-l''Outaouais','QC','236-9942 Risus. St.','16330826 8519',' Radiology','full time',43120,82);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (91,'Dorian','Joyce','Irkutsk','IRK','962 Vitae Rd.','16171014 0797',' Thoracic surgery','part time',12761,55);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (92,'Simon','Buckley','L''Hospitalet de Llobregat','CA','Ap #481-6017 Ut Rd.','16420928 7566',' Anaesthetics','supervisior',47024,3);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (93,'Mona','Fernandez','Sluis','Zl','Ap #610-4121 Vulputate St.','16711201 4720',' Rheumatology','specialist',38646,99);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (94,'Tallulah','Cantrell','Serrata','Calabria','P.O. Box 360, 310 Vulputate Avenue','16190603 0869',' Paediatric surgery','specialist',11461,60);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (95,'Hamilton','Cash','Henley-on-Thames','Oxfordshire','6289 Posuere, Rd.','16680515 9149',' Hematology','specialist',11555,8);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (96,'Devin','Farrell','Kano','Kano','Ap #977-9973 Sed Rd.','16000304 1837',' Anaesthetics','part time',12323,75);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (97,'Inga','Allison','Arequipa','ARE','Ap #894-3931 Nulla. St.','16800904 6205',' Pathology','supervisior',26955,70);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (98,'Jerry','Leonard','Lagos','LA','9173 Leo. Avenue','16550803 7818',' Urology','under traning',25031,19);
INSERT INTO doctor (docId,firstName,lastName,city,region,street,telphone,specialization,pos,salary,depId) VALUES (100,'Teagan','Cross','Vienna','Wie','Ap #757-9250 Hendrerit. Road','16700805 5829',' General Practice','full time',45622,53);
select * from doctor;
select * from NURSESURGERYSTAFF;