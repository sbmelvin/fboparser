BEGIN;

DROP TABLE IF EXISTS AMDCSS_CSV; 
DROP TABLE IF EXISTS ARCHIVE_CSV; 
DROP TABLE IF EXISTS AWARD_CSV; 
DROP TABLE IF EXISTS COMBINE_CSV; 
DROP TABLE IF EXISTS EMAIL_CSV; 
DROP TABLE IF EXISTS FAIROPP_CSV; 
DROP TABLE IF EXISTS JA_CSV; 
DROP TABLE IF EXISTS MOD_CSV; 
DROP TABLE IF EXISTS PRESOL_CSV; 
DROP TABLE IF EXISTS SNOTE_CSV; 
DROP TABLE IF EXISTS SRCSGT_CSV; 
DROP TABLE IF EXISTS UNARCHIVE_CSV; 

CREATE TABLE PRESOL_CSV(
	fbo_agency text,
	fbo_archdate text,
	fbo_awardee text,
	fbo_awdamt text,
	fbo_awddate text,
	fbo_awdnbr text,
	fbo_classcod text,
	fbo_contact text,
	fbo_date text,
	fbo_desc text,
	fbo_donbr text,
	fbo_email text,
	fbo_foja text,
	fbo_linenbr text,
	fbo_link text,
	fbo_location text,
	fbo_modnbr text,
	fbo_naics text,
	fbo_ntype text,
	fbo_offadd text,
	fbo_office text,
	fbo_popaddress text,
	fbo_popcountry text,
	fbo_popzip text,
	fbo_respdate text,
	fbo_setaside text,
	fbo_snote text,
	fbo_solnbr text,
	fbo_srcsgt text,
	fbo_stauth text,
	fbo_subject text,
	fbo_url text,
	fbo_year text,
	fbo_zip text
);

SELECT * INTO AMDCSS_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO ARCHIVE_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO AWARD_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO COMBINE_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO EMAIL_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO FAIROPP_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO JA_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO MOD_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO SNOTE_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO SRCSGT_CSV FROM PRESOL_CSV WHERE 1=2;
SELECT * INTO UNARCHIVE_CSV FROM PRESOL_CSV WHERE 1=2;

COPY AMDCSS_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_AMDCSS.csv' WITH CSV; 
COPY ARCHIVE_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_ARCHIVE.csv' WITH CSV; 
COPY AWARD_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_AWARD.csv' WITH CSV; 
COPY COMBINE_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_COMBINE.csv' WITH CSV; 
COPY EMAIL_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_EMAIL.csv' WITH CSV; 
COPY FAIROPP_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_FAIROPP.csv' WITH CSV; 
COPY JA_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_JA.csv' WITH CSV; 
COPY MOD_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_MOD.csv' WITH CSV; 
COPY PRESOL_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_PRESOL.csv' WITH CSV; 
COPY SNOTE_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_SNOTE.csv' WITH CSV; 
COPY SRCSGT_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_SRCSGT.csv' WITH CSV; 
COPY UNARCHIVE_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_UNARCHIVE.csv' WITH CSV; 

COMMIT;

