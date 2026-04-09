USE transit_project_db;

DROP VIEW city_station_counts;

CREATE VIEW city_station_counts AS
SELECT
    c.City_id,
    c.city_name,
    COUNT(s.Station_id) AS station_count
FROM City c
JOIN Station s
    ON c.City_id = s.City_id
GROUP BY
    c.City_id,
    c.city_name
HAVING COUNT(s.Station_id) > 3;