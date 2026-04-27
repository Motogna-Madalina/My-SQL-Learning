-- =========================
-- INDEXES
-- =========================

-- CREATE
CREATE INDEX idx_arbeitszeit_mitarbeiter
ON arbeitszeit (mitarbeiter_id);

CREATE INDEX idx_kreditinstitut_ort_plz
ON kreditinstitutneu (ort, plz);

-- =========================
-- DROP
-- =========================

ALTER TABLE arbeitszeit
DROP INDEX idx_arbeitszeit_mitarbeiter;

ALTER TABLE kreditinstitutneu
DROP INDEX idx_kreditinstitut_ort_plz;