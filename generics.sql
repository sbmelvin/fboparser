BEGIN;

DROP TABLE IF EXISTS SETASIDE_TYPES;
DROP TABLE IF EXISTS PRODUCT_CODES;
DROP TABLE IF EXISTS SERVICE_CODES;
DROP TABLE IF EXISTS NAICS_CODES;

CREATE TABLE SETASIDE_TYPES (
	TYPE TEXT,
	FAR_REFERENCE TEXT
);

CREATE TABLE PRODUCT_CODES (
	CODE TEXT,
	DESCRIPTION TEXT
);

CREATE TABLE SERVICE_CODES (
	CODE TEXT,
	DESCRIPTION TEXT
);

CREATE TABLE NAICS_CODES (
	CODE TEXT,
	DESCRIPTION TEXT
);

COPY SETASIDE_TYPES FROM './db_data/csv/setaside_types.csv' WITH CSV;
COPY PRODUCT_CODES FROM './db_data/csv/product_codes.csv' WITH CSV;
COPY SERVICE_CODES FROM './db_data/csv/product_codes.csv' WITH CSV;

COMMIT;