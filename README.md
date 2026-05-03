# Website Engagement Analysis

Website Engagement Analysis turns raw website traffic data into SQL-based insights about page performance, device behavior, and conversion efficiency.

## Live Demo Link

Not deployed; runs locally with PostgreSQL and Docker.

## Tech Stack

- **PostgreSQL**: I chose PostgreSQL because it is a production-grade relational database and a strong fit for structured analytics queries over website traffic data.
- **SQL**: I chose SQL because the core value of this project is transforming raw rows into business-readable metrics such as total sessions, average duration, and conversion performance.
- **Docker / Docker Compose**: I chose Docker so the database can run in an isolated local environment without requiring a manual PostgreSQL installation.
- **CSV**: I used CSV because it is a simple, portable format for exporting website analytics data and loading it into a relational database.

## Architecture Overview

The project loads `website_analytics.csv` into a PostgreSQL table defined in `queries.sql`. The same SQL script creates the schema, imports the CSV data, and runs analysis queries for traffic leaders, average session duration by device, and source-level conversion performance. Docker is used to host PostgreSQL locally so the analysis can be reproduced without changing the developer machine's system database.

## Local Setup Instructions

1. Clone the repository:

```bash
git clone https://github.com/Dtzul04/website-engagement-analysis.git
cd website-engagement-analysis
```

2. Install prerequisites:

```bash
# Required
docker --version

# Optional, useful for connecting directly from your terminal
psql --version
```

There are no application package dependencies to install because this project currently runs through Docker, PostgreSQL, SQL, and a CSV file.

3. Configure environment variables:

```bash
POSTGRES_USER=admin
POSTGRES_PASSWORD=<YOUR_PASSWORD>
POSTGRES_DB=digital_analytics
```

4. Start PostgreSQL:

```bash
docker-compose up -d
```

5. Copy the CSV file into the database container:

```bash
docker cp website_analytics.csv analytics_db:/website_traffic.csv
```

6. Run the analysis script:

```bash
docker cp queries.sql analytics_db:/queries.sql
docker exec -it analytics_db psql -U admin -d digital_analytics -f /queries.sql
```



## Known Limitations / What I Would Improve With More Time

- The project is currently a local SQL analysis workflow, not a deployed full-stack application.
- `bounce_rate` and `conversion_rate` are currently imported as text values; I would normalize them into numeric columns for more accurate sorting, filtering, and aggregation.
- The data load is manual; I would add a repeatable ETL script and validation checks for required columns, data types, and malformed rows.
- The analysis output is query-based; I would add a lightweight dashboard or report layer to make the findings easier for non-technical users to review.