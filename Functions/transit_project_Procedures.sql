USE transit_project_db;

DROP PROCEDURE IF EXISTS add_station_to_line;
DELIMITER $$
CREATE PROCEDURE add_station_to_line(
    IN station_input INT,
    IN line_input INT,
    IN sequence_input INT,
    IN distance_input DECIMAL(10,2)
)
BEGIN
    INSERT INTO Station_Line (station_id, line_id, sequence_order, distance_from_start)
    VALUES (station_input, line_input, sequence_input, distance_input);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS get_line_stations;
DELIMITER $$
CREATE PROCEDURE get_line_stations(IN line_input INT)
BEGIN
    SELECT 
        st.station_name,
        sl.sequence_order,
        sl.distance_from_start,
        st.station_type
    FROM Station_Line sl
	JOIN Station st ON sl.station_id = st.station_id
    WHERE sl.line_id = line_input
    ORDER BY sl.sequence_order;
END$$
DELIMITER ;