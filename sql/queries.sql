-- Overall SLA and delay summary
SELECT
    COUNT(*) AS total_orders,
    ROUND(AVG(delay_mins), 2) AS avg_delay_mins,
    ROUND(AVG(sla_met) * 100, 2) AS sla_met_percent
FROM deliveries;

-- SLA and delay by order type
SELECT
    order_type,
    COUNT(*) AS total_orders,
    ROUND(AVG(delay_mins), 2) AS avg_delay_mins,
    ROUND(AVG(sla_met) * 100, 2) AS sla_met_percent
FROM deliveries
GROUP BY order_type
ORDER BY avg_delay_mins;

-- Zone-wise delay and SLA
SELECT
    zone,
    COUNT(*) AS total_orders,
    ROUND(AVG(delay_mins), 2) AS avg_delay_mins,
    ROUND(AVG(sla_met) * 100, 2) AS sla_met_percent
FROM deliveries
GROUP BY zone
ORDER BY avg_delay_mins DESC;


-- Top 10 riders by SLA performance
SELECT
    rider_id,
    COUNT(*) AS total_deliveries,
    ROUND(AVG(delay_mins), 2) AS avg_delay_mins,
    ROUND(AVG(sla_met) * 100, 2) AS sla_met_percent
FROM deliveries
GROUP BY rider_id
HAVING total_deliveries >= 50
ORDER BY sla_met_percent DESC, avg_delay_mins ASC
LIMIT 10;


-- 10 riders with worst delay
SELECT
    rider_id,
    COUNT(*) AS total_deliveries,
    ROUND(AVG(delay_mins), 2) AS avg_delay_mins,
    ROUND(AVG(sla_met) * 100, 2) AS sla_met_percent
FROM deliveries
GROUP BY rider_id
HAVING total_deliveries >= 50
ORDER BY avg_delay_mins DESC
LIMIT 10;



-- Hub-wise SLA and delay
SELECT
    hub_id,
    COUNT(*) AS total_orders,
    ROUND(AVG(delay_mins), 2) AS avg_delay_mins,
    ROUND(AVG(sla_met) * 100, 2) AS sla_met_percent
FROM deliveries
GROUP BY hub_id
ORDER BY sla_met_percent ASC;



-- Overall cost leakage
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN cost_leakage_flag = 1 THEN 1 ELSE 0 END) AS leakage_orders,
    ROUND(SUM(CASE WHEN cost_leakage_flag = 1 THEN cost_leakage ELSE 0 END), 2) AS total_leakage_amount
FROM deliveries;

-- Zone-wise cost leakage
SELECT
    zone,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN cost_leakage_flag = 1 THEN 1 ELSE 0 END) AS leakage_orders,
    ROUND(SUM(CASE WHEN cost_leakage_flag = 1 THEN cost_leakage ELSE 0 END), 2) AS total_leakage_amount
FROM deliveries
GROUP BY zone
ORDER BY total_leakage_amount DESC;




-- Rider ranking by hub based on SLA
SELECT
    hub_id,
    rider_id,
    COUNT(*) AS total_deliveries,
    ROUND(AVG(delay_mins), 2) AS avg_delay_mins,
    ROUND(AVG(sla_met) * 100, 2) AS sla_met_percent,
    RANK() OVER (PARTITION BY hub_id ORDER BY AVG(sla_met) DESC, AVG(delay_mins)) AS performance_rank
FROM deliveries
GROUP BY hub_id, rider_id;
