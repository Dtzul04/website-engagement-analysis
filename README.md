# Website Engagement Analysis Pipeline

## 📊 Project Overview
This project demonstrates a full-stack data engineering workflow. I built a containerized PostgreSQL environment to ingest and analyze website traffic data, transforming raw Excel exports into actionable SQL insights.

## 🛠️ Technical Architecture
* **Database:** PostgreSQL (housed in Docker)
* **Environment:** Docker Compose for isolated, reproducible infrastructure.
* **Data Pipeline:** Manual ETL (Extract, Transform, Load) process from .csv to SQL.

## 🚀 Key Challenges & Solutions
* **Data Type Mismatch:** Encountered errors with "October" (String) being mapped to Month (Integer). Resolved by evolving the schema to `VARCHAR` to maintain data integrity.
* **Special Characters:** Handled `%` symbols in conversion rates by importing as strings, ensuring the `COPY` command executed successfully.
* **Docker Synchronization:** Managed the file-sharing bridge between the local macOS filesystem and the Linux-based Docker container.

## 📈 Analysis Queries Included
The `queries.sql` file includes automated scripts to find:
1.  **Traffic Leaders:** Pages with the highest total sessions.
2.  **Device Performance:** Average session duration split by Mobile vs. Desktop.
3.  **Source Efficiency:** Which marketing channels yield the highest conversion rates.

## 💻 How to Use
1.  **Start the Container:** `docker-compose up -d`
2.  **Sync the Data:** `docker cp website_analytics.csv analytics_db:/website_traffic.csv`
3.  **Run Analysis:** `docker exec -it analytics_db psql -U admin -d digital_analytics -f /queries.sql`