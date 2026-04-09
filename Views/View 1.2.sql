USE transit_project_db;
#Shows transit lines longer than average distance (uses JOIN, HAVING, subquery, aggregate function)

DROP VIEW IF EXISTS city_transit_summary;
CREATE VIEW city_transit_summary AS
SELECT 
    c.city_id,
    c.city_name,
    c.country,
    COUNT(DISTINCT l.line_id) AS total_lines,
    COUNT(DISTINCT st.station_id) AS total_stations
FROM City c
JOIN Line l ON c.city_id = l.city_id
JOIN Station st ON c.city_id = st.city_id
WHERE c.city_id IN (
    SELECT DISTINCT city_id 
    FROM Line 
    WHERE is_active = 1
)
