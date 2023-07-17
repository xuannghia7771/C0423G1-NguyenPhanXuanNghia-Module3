
-- THAM SỐ LOẠI IN
DELIMITER //

CREATE PROCEDURE getCusById

(IN cusNum INT(11))

BEGIN

  SELECT * FROM customers WHERE customerNumber = cusNum;

END //

DELIMITER ;
-- GỌI SP THAM SỐ LOẠI IN
call getCusById(175);

-- THAM SỐ LOẠI OUT
DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;

END//

DELIMITER ;
-- GỌI SP THAM SỐ LOẠI OUT
CALL GetCustomersCountByCity('Lyon',@total);
SELECT @total;

-- THAM SỐ INOUT
DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;
-- GỌI SP THAM SỐ LOẠI INOUT
SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
CALL SetCounter(@counter,1); -- 3
CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8

