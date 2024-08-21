-- Listar los usuarios que cumplan años el día de hoy cuya cantidad de ventas realizadas en enero 2020 sea superior a 1500.
SELECT 
    c.id,
    c.name,
    c.nickname,
    SUM(oi.quantity * i.price) AS total_sales
FROM 
    Customers c
JOIN 
    Orders o ON c.id = o.buyer_id
JOIN 
    OrderItems oi ON o.id = oi.order_id
JOIN 
    Items i ON oi.item_id = i.id
WHERE 
    EXTRACT(MONTH FROM o.date) = 1 
    AND EXTRACT(YEAR FROM o.date) = 2020
    AND EXTRACT(MONTH FROM CURRENT_DATE) = EXTRACT(MONTH FROM c.birthdate)
    AND EXTRACT(DAY FROM CURRENT_DATE) = EXTRACT(DAY FROM c.birthdate)
GROUP BY 
    c.id
HAVING 
    SUM(oi.quantity * i.price) > 1500;

-- Por cada mes del 2020, se solicita el top 5 de usuarios que más vendieron($) en la categoría Celulares. Se requiere el mes y año de análisis, nombre y apellido del vendedor, cantidad de ventas realizadas, cantidad de productos vendidos y el monto total transaccionado. 
WITH SalesData AS (
    SELECT
        EXTRACT(MONTH FROM o.date) AS month,
        EXTRACT(YEAR FROM o.date) AS year,
        c.id AS user_id,
        c.name,
        SUM(oi.quantity * i.price) AS total_sales,
        COUNT(oi.id) AS total_items,
        COUNT(DISTINCT o.id) AS total_orders
    FROM
        Orders o
    JOIN 
        Customers c ON o.seller_id = c.id
    JOIN 
        OrderItems oi ON o.id = oi.order_id
    JOIN 
        Items i ON oi.item_id = i.id
    JOIN
        Categories cat ON i.category_id = cat.id
    WHERE
        EXTRACT(YEAR FROM o.date) = 2020
        AND cat.name = 'Celulares'
    GROUP BY
        month, year, c.id, c.name
),
RankedSales AS (
    SELECT
        month,
        year,
        user_id,
        name,
        total_sales,
        total_items,
        total_orders,
        RANK() OVER (PARTITION BY month, year ORDER BY total_sales DESC) AS rank
    FROM
        SalesData
)
SELECT
    month,
    year,
    name AS seller_name,
    total_orders AS number_of_sales,
    total_items AS number_of_products,
    total_sales AS total_amount
FROM
    RankedSales
WHERE
    rank <= 5;

-- Se solicita poblar una nueva tabla con el precio y estado de los Ítems a fin del día. Tener en cuenta que debe ser reprocesable. Vale resaltar que en la tabla Item, vamos a tener únicamente el último estado informado por la PK definida. (Se puede resolver a través de StoredProcedure)
CREATE TABLE ItemStatusEndOfDay (
    item_id INT PRIMARY KEY,
    price NUMERIC(10, 2),
    status VARCHAR(255),
    record_date DATE
);

CREATE OR REPLACE FUNCTION update_item_status_end_of_day()
RETURNS VOID LANGUAGE plpgsql AS $$
BEGIN
    -- Insert or update item status
    INSERT INTO ItemStatusEndOfDay (item_id, price, status, record_date)
    SELECT
        i.id AS item_id,
        i.price,
        COALESCE(i.status, 'Unknown') AS status,
        CURRENT_DATE AS record_date
    FROM
        Items i
    ON CONFLICT (item_id) 
    DO UPDATE SET
        price = EXCLUDED.price,
        status = EXCLUDED.status,
        record_date = EXCLUDED.record_date;
END;
$$;
