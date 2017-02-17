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
	presol_agency text,
	presol_archdate text,
	presol_awardee text,
	presol_awdamt text,
	presol_awddate text,
	presol_awdnbr text,
	presol_classcod text,
	presol_contact text,
	presol_date text,
	presol_desc text,
	presol_donbr text,
	presol_email text,
	presol_foja text,
	presol_linenbr text,
	presol_link text,
	presol_location text,
	presol_modnbr text,
	presol_naics text,
	presol_ntype text,
	presol_offadd text,
	presol_office text,
	presol_popaddress text,
	presol_popcountry text,
	presol_popzip text,
	presol_respdate text,
	presol_setaside text,
	presol_snote text,
	presol_solnbr text,
	presol_srcsgt text,
	presol_stauth text,
	presol_subject text,
	presol_url text,
	presol_year text,
	presol_zip text
);

COPY AMDCSS_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_AMDCSS_CSV'; 
COPY ARCHIVE_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_ARCHIVE_CSV'; 
COPY AWARD_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_AWARD_CSV'; 
COPY COMBINE_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_COMBINE_CSV'; 
COPY EMAIL_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_EMAIL_CSV'; 
COPY FAIROPP_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_FAIROPP_CSV'; 
COPY JA_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_JA_CSV'; 
COPY MOD_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_MOD_CSV'; 
COPY PRESOL_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_PRESOL_CSV'; 
COPY SNOTE_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_SNOTE_CSV'; 
COPY SRCSGT_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_SRCSGT_CSV'; 
COPY UNARCHIVE_CSV FROM '/Users/stephen/Development/fboparser.git/fbofeed_UNARCHIVE_CSV'; 

COMMIT;

