BEGIN;

\set PWD '\'' `echo $PWD`
\set CSVDIR :PWD '/parsed/csv'

\set AMDCSS_CSV :CSVDIR '/fbofeed_AMDCSS.csv\''
\set ARCHIVE_CSV :CSVDIR '/fbofeed_ARCHIVE.csv\''
\set AWARD_CSV :CSVDIR '/fbofeed_AWARD.csv\''
\set COMBINE_CSV :CSVDIR '/fbofeed_COMBINE.csv\''
\set FAIROPP_CSV :CSVDIR '/fbofeed_FAIROPP.csv\''
\set JA_CSV :CSVDIR '/fbofeed_JA.csv\''
\set MOD_CSV :CSVDIR '/fbofeed_MOD.csv\''
\set PRESOL_CSV :CSVDIR '/fbofeed_PRESOL.csv\''
\set SNOTE_CSV :CSVDIR '/fbofeed_SNOTE.csv\''
\set SRCSGT_CSV :CSVDIR '/fbofeed_SRCSGT.csv\''
\set UNARCHIVE_CSV :CSVDIR '/fbofeed_UNARCHIVE.csv\''
\set FSTD_CSV :CSVDIR '/fbofeed_FSTD.csv\''
\set SSALE_CSV :CSVDIR '/fbofeed_SSALE.csv\''
\set ITB_CSV :CSVDIR '/fbofeed_ITB.csv\''

DROP TABLE IF EXISTS AMDCSS;
DROP TABLE IF EXISTS ARCHIVE;
DROP TABLE IF EXISTS AWARD;
DROP TABLE IF EXISTS COMBINE;
DROP TABLE IF EXISTS FAIROPP;
DROP TABLE IF EXISTS FBO_RECORD;
DROP TABLE IF EXISTS FSTD;
DROP TABLE IF EXISTS JA;
DROP TABLE IF EXISTS MOD;
DROP TABLE IF EXISTS PRESOL;
DROP TABLE IF EXISTS SNOTE;
DROP TABLE IF EXISTS SRCSGT;
DROP TABLE IF EXISTS UNARCHIVE;
DROP TABLE IF EXISTS ITB;
DROP TABLE IF EXISTS SSALE;
DROP TABLE IF EXISTS NOTICES;

CREATE TABLE FBO_RECORD(
	FBO_AGENCY TEXT,
	FBO_ARCHDATE TEXT,
	FBO_AWARDEE TEXT,
	FBO_AWDAMT TEXT,
	FBO_AWDDATE TEXT,
	FBO_AWDNBR TEXT,
	FBO_CLASSCOD TEXT,
	FBO_CONTACT TEXT,
	FBO_CORRECTION TEXT,
	FBO_DATE TEXT,
	FBO_DESC TEXT,
	FBO_DONBR TEXT,
	FBO_EMAIL TEXT,
	FBO_FOJA TEXT,
	FBO_LINENBR TEXT,
	FBO_LINK TEXT,
	FBO_LOCATION TEXT,
	FBO_MODNBR TEXT,
	FBO_NAICS TEXT,
	FBO_NTYPE TEXT,
	FBO_OFFADD TEXT,
	FBO_OFFICE TEXT,
	FBO_PASSWORD TEXT,
	FBO_POPADDRESS TEXT,
	FBO_POPCOUNTRY TEXT,
	FBO_POPZIP TEXT,
	FBO_RESPDATE TEXT,
	FBO_SETASIDE TEXT,
	FBO_SOLNBR TEXT,
	FBO_STAUTH TEXT,
	FBO_SUBJECT TEXT,
	FBO_URL TEXT,
	FBO_YEAR TEXT,
	FBO_ZIP TEXT,
	FBO_POC_EMAIL TEXT,
	FBO_POC_EMAIL_DESC TEXT,
	FBO_LINK_URL TEXT,
	FBO_LINK_DESC TEXT,
	FBO_FILENAME TEXT,
	FBO_RECORD_TEXT TEXT
 );

CREATE TABLE PRESOL		AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE AMDCSS		AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE ARCHIVE	AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE AWARD		AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE COMBINE	AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE FAIROPP	AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE FSTD		AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE ITB		AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE JA			AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE MOD		AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE NOTICES	AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE SNOTE		AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE SRCSGT		AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE SSALE		AS SELECT * FROM FBO_RECORD WHERE 1=2;
CREATE TABLE UNARCHIVE	AS SELECT * FROM FBO_RECORD WHERE 1=2;

COPY AMDCSS		FROM :AMDCSS_CSV WITH CSV;
COPY ARCHIVE	FROM :ARCHIVE_CSV WITH CSV;
COPY AWARD		FROM :AWARD_CSV WITH CSV;
COPY COMBINE	FROM :COMBINE_CSV WITH CSV;
COPY FAIROPP	FROM :FAIROPP_CSV WITH CSV;
COPY FSTD		FROM :FSTD_CSV WITH CSV;
COPY ITB		FROM :ITB_CSV WITH CSV;
COPY JA			FROM :JA_CSV WITH CSV;
COPY MOD		FROM :MOD_CSV WITH CSV;
COPY PRESOL		FROM :PRESOL_CSV WITH CSV;
COPY SNOTE		FROM :SNOTE_CSV WITH CSV;
COPY SRCSGT		FROM :SRCSGT_CSV WITH CSV;
COPY SSALE		FROM :SSALE_CSV WITH CSV;
COPY UNARCHIVE	FROM :UNARCHIVE_CSV WITH CSV;

ALTER TABLE NOTICES ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE AMDCSS ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE ARCHIVE ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE AWARD ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE COMBINE ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE FAIROPP ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE FSTD ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE ITB ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE JA ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE MOD ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE PRESOL ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE SNOTE ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE SRCSGT ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE SSALE ADD COLUMN NOTICE_TYPE TEXT;
ALTER TABLE UNARCHIVE ADD COLUMN NOTICE_TYPE TEXT;

UPDATE AMDCSS SET NOTICE_TYPE='AMDCSS';
UPDATE ARCHIVE SET NOTICE_TYPE='ARCHIVE';
UPDATE AWARD SET NOTICE_TYPE='AWARD';
UPDATE COMBINE SET NOTICE_TYPE='COMBINE';
UPDATE FAIROPP SET NOTICE_TYPE='FAIROPP';
UPDATE FSTD SET NOTICE_TYPE='FSTD';
UPDATE ITB SET NOTICE_TYPE='ITB';
UPDATE JA SET NOTICE_TYPE='JA';
UPDATE MOD SET NOTICE_TYPE='MOD';
UPDATE PRESOL SET NOTICE_TYPE='PRESOL';
UPDATE SNOTE SET NOTICE_TYPE='SNOTE';
UPDATE SRCSGT SET NOTICE_TYPE='SRCSGT';
UPDATE SSALE SET NOTICE_TYPE='SSALE';
UPDATE UNARCHIVE SET NOTICE_TYPE='UNARCHIVE';

INSERT INTO NOTICES SELECT * FROM AMDCSS;
INSERT INTO NOTICES SELECT * FROM ARCHIVE;
INSERT INTO NOTICES SELECT * FROM AWARD;
INSERT INTO NOTICES SELECT * FROM COMBINE;
INSERT INTO NOTICES SELECT * FROM FAIROPP;
INSERT INTO NOTICES SELECT * FROM FSTD;
INSERT INTO NOTICES SELECT * FROM ITB;
INSERT INTO NOTICES SELECT * FROM JA;
INSERT INTO NOTICES SELECT * FROM MOD;
INSERT INTO NOTICES SELECT * FROM PRESOL;
INSERT INTO NOTICES SELECT * FROM SNOTE;
INSERT INTO NOTICES SELECT * FROM SRCSGT;
INSERT INTO NOTICES SELECT * FROM SSALE;
INSERT INTO NOTICES SELECT * FROM UNARCHIVE;

COMMIT;
