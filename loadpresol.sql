BEGIN;
delete from presol;
copy presol from '/Users/stephen/Development/fboparser.git/presol.csv' WITH CSV HEADER;
COMMIT;

