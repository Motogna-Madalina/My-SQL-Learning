

-- make indexes
CREATE INDEX index_arbeitszeit_mitarbeiter
ON arbeitszeit (mitarbeiter_id);

CREATE INDEX index_plzort
ON kreditinstitutneu (ort, plz);

-- drop indexes
DROP INDEX index_arbeitszeit_mitarbeiter ON arbeitszeit;
DROP INDEX index_plzort ON kreditinstitutneu;