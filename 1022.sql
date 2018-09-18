use ejia;

drop table if exists AFFECT;
drop table if exists MEET;
drop table if exists TESTRESULT;
drop table if exists TREATMENT;
drop table if exists PROFESSIONAL;
drop table if exists CLIENT;
drop table if exists PATERNITYTEST;
drop table if exists TESTINGLABORATOTRY;
drop table if exists CERTIFIER;
drop table if exists ACCREDITATION;
drop table if exists MENTALILLNESS;
drop table if exists ADDRESS;

/* Create the ADDRESS table*/
   create table ADDRESS(
    AddressID int(6) NOT NULL,
	StreetNumber int(8) NOT NULL,
	StreetName varchar(20),
	Suburb varchar(15) ,
	Postcode int(4) NOT NULL,
	primary key (AddressID)
   )
   ENGINE=InnoDB; 
   
/* Create the MENTALILLNESS table*/
   create table MENTALILLNESS(
    MentalIllnessCode int(6) NOT NULL,
	MentalIllnessDescription varchar(40),
	primary key (MentalIllnessCode)
   )
   ENGINE=InnoDB;
   
/* Create the ACCREDITATION table*/
   create table ACCREDITATION(
    AccreditationName varchar(20) NOT NULL,
	AccresitationDetails varchar(40),
	primary key (AccreditationName)
   )
   ENGINE=InnoDB;
   
/* Create the CERTIFIER table*/
   create table CERTIFIER(
    CertifierID int(6) NOT NULL,
	CertifierDetails varchar(40),
	primary key (CertifierID)
   )
   ENGINE=InnoDB; 
   
 /* Create the TESTINGLABORATOTRY table*/
   create table TESTINGLABORATOTRY(
    LabCode int(6) NOT NULL,
	LabDetails varchar(40),
	primary key (LabCode)
   )
   ENGINE=InnoDB;

   /* Create the PATERNITYTEST table*/
   create table PATERNITYTEST(
    TestID int(6) NOT NULL,
	TestDetails varchar(40) NOT NULL,
	LabCode int(6) NOT NULL,
	primary key (TestID),
	foreign key (LabCode) references TESTINGLABORATOTRY(LabCode)
	)
	ENGINE=InnoDB;   	

/* Create the CLIENT table*/
    create table CLIENT(
    ClientID int(6) NOT NULL,
	ClientName varchar(20),
	AddressID int(6) NOT NULL,
	TestID int(6) NOT NULL,
	primary key (ClientID),
	foreign key (AddressID) references ADDRESS(AddressID),
	foreign key (TestID) references PATERNITYTEST(TestID)
	) 
	ENGINE=InnoDB;  

/* Create the PROFESSIONALS table*/
   create table PROFESSIONAL(
    ProfessionalID int(6) NOT NULL,
	ProfessinalDetails varchar(40),
	AccreditationName varchar(20),
	primary key (ProfessionalID),
	foreign key (AccreditationName) references ACCREDITATION(AccreditationName)
	)
	ENGINE=InnoDB;   
 
 /* Create the TREATMENT table*/
   create table TREATMENT(
    TreatmentCode int(6) NOT NULL,
	TreatmentDetails varchar(40),
    MentalIllnessCode int(6) NOT NULL,
	CertifierID int(6) NOT NULL,
	primary key (TreatmentCode),
	foreign key (MentalIllnessCode) references MENTALILLNESS(MentalIllnessCode),
	foreign key (CertifierID) references CERTIFIER(CertifierID)
	)
	ENGINE=InnoDB;  
	
/* Create the TESTRESULT table*/
   create table TESTRESULT(
	ResultCode int(6) NOT NULL,
	LabCode int(6) NOT NULL,
	primary key (ResultCode),
	foreign key (LabCode) references TESTINGLABORATOTRY(LabCode)
	)
	ENGINE=InnoDB;  
	
/* Create the MEET table*/
   create table MEET(
    ClientID int(6) NOT NULL,
	ProfessionalID int(6) NOT NULL,
	primary key (ClientID,ProfessionalID),
	foreign key(ClientID) references CLIENT(ClientID),
	foreign key(ProfessionalID) references PROFESSIONAL(ProfessionalID)
   )
   ENGINE=InnoDB; 	
   
/* Create the AFFECT table*/
   create table AFFECT(
    ClientID int(6) NOT NULL,
	MentalIllnessCode int(6) NOT NULL,
	primary key (ClientID,MentalIllnessCode),
	foreign key(ClientID) references CLIENT(ClientID),
	foreign key(MentalIllnessCode) references MENTALILLNESS(MentalIllnessCode)
   )
   ENGINE=InnoDB; 	

insert into ADDRESS values (709, 79 , 'SandyBay Road','SandyBay','7003');
insert into MENTALILLNESS values (201, 'Fell panic');
insert into ACCREDITATION values ('anxiety', 'Unknown');
insert into CERTIFIER values (2301, 'Certifier 1');
insert into TESTINGLABORATOTRY values (654309, 'Australian Lab for menatl illness');
insert into PATERNITYTEST values (1001, 'Blood Test',654309);
insert into CLIENT values (5002, 'Jackson William',709,1001);
insert into PROFESSIONAL values (101, 'Commnity doctor', 'anxiety');
insert into TREATMENT values (600, 'Clinical Psychologists',201,2301);
insert into TESTRESULT values (1000,654309);
insert into MEET values (5002, 101);
insert into AFFECT values (5002, 201);

