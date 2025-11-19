CREATE TABLE deliveries (
    order_id INT PRIMARY KEY,
    order_type VARCHAR(20),
    zone VARCHAR(20),
    hub_id VARCHAR(20),
    rider_id VARCHAR(20),
    order_date DATETIME,
    expected_delivery_time DATETIME,
    actual_delivery_time DATETIME,
    distance_km DECIMAL(6,2),
    base_cost DECIMAL(10,2),
    rider_payment DECIMAL(10,2),

    -- Derived columns from Python
    delay_mins DECIMAL(10,2),
    sla_met TINYINT,                -- 1 = on time/early, 0 = delayed
    delay_bucket VARCHAR(30),
    cost_leakage DECIMAL(10,2),
    cost_leakage_flag TINYINT       -- 1 = leakage, 0 = ok
);
