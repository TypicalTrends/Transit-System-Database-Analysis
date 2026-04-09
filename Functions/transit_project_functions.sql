USE transit_project_db;
DROP FUNCTION IF EXISTS city_station_count;
DELIMITER $$
CREATE FUNCTION city_station_count(city_input INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE station_total INT;

    SELECT COUNT(*)
    INTO station_total
    FROM Station
    WHERE City_id = city_input;
    RETURN station_total;
END$$
DELIMITER ;

#Get the number of stations using a city ID.
