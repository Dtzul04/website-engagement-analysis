DROP TABLE IF EXISTS website_traffic;
CREATE TABLE website_traffic (
    id SERIAL PRIMARY KEY,
    date DATE, 
    page VARCHAR(255),
    device VARCHAR(50),
    source VARCHAR(100),
    sessions INT,
    conversions INT,
    bounce_rate VARCHAR(10), 
    session_duration INT,
    conversion_rate VARCHAR(10), 
    month VARCHAR(20),
    engagement_level VARCHAR(50)
);

COPY website_traffic(date, page, device, source, sessions, conversions, bounce_rate, session_duration, conversion_rate, month, engagement_level) 
FROM '/website_traffic.csv' 
DELIMITER ',' CSV HEADER;

-- 1. Which pages get the most traffic?
SELECT page, SUM(sessions) as total_sessions
FROM website_traffic
GROUP BY page
ORDER BY total_sessions DESC;

-- 2. What is the average session duration by device?
SELECT device, ROUND(AVG(session_duration), 2) as avg_duration
FROM website_traffic
GROUP BY device;

-- 3. Top performing sources (Converting text % to numbers to find the max)
SELECT source, MAX(conversion_rate) as best_rate
FROM website_traffic
GROUP BY source
ORDER BY best_rate DESC;