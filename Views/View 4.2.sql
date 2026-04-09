USE transit_project_db;

DROP VIEW IF EXISTS transfer_stations;
CREATE VIEW transfer_stations AS
SELECT 
    st.station_id,
    st.station_name,
    c.city_name,
    COUNT(DISTINCT sl.line_id) AS lines_served
FROM Station st
JOIN City c ON st.city_id = c.city_id
JOIN Station_Line sl ON st.station_id = sl.station_id
WHERE st.station_id IN (
    SELECT station_id 
    FROM Station_Line 
    GROUP BY station_id 
    HAVING COUNT(line_id) > 1
)
GROUP BY st.station_id, st.station_name, c.city_name;