USE transit_project_db;

-- VIEW 1: Active Lines with Station Count
DROP VIEW IF EXISTS active_lines_with_stations;
CREATE VIEW active_lines_with_stations AS
SELECT 
    l.line_id,
    l.line_name,
    l.line_type,
    s.system_name,
    c.city_name,
    COUNT(sl.station_id) AS total_stations
FROM Line l
JOIN System s ON l.system_id = s.system_id
JOIN City c ON l.city_id = c.city_id
LEFT JOIN Station_Line sl ON l.line_id = sl.line_id
WHERE l.is_active = 1
GROUP BY l.line_id, l.line_name, l.line_type, s.system_name, c.city_name
HAVING COUNT(sl.station_id) > 0;