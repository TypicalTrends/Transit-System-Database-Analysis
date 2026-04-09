USE transit_project_db;

DROP VIEW IF EXISTS long_distance_lines;
CREATE VIEW long_distance_lines AS
SELECT 
    l.line_id,
    l.line_name,
    l.line_type,
    MAX(sl.distance_from_start) AS total_distance
FROM Line l
JOIN Station_Line sl ON l.line_id = sl.line_id
GROUP BY l.line_id, l.line_name, l.line_type
HAVING MAX(sl.distance_from_start) > (
    SELECT AVG(max_distance)
    FROM (
        SELECT MAX(distance_from_start) AS max_distance
        FROM Station_Line
        GROUP BY line_id
    ) AS line_distances
);