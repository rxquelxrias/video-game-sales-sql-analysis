# Video Game Sales SQL Analysis

This project analyzes a video game sales dataset using PostgreSQL. The goal is to build a normalized relational database, clean and transform the data, and generate analytical queries to explore sales trends by platform, genre, publisher, and year.

## Dataset
The dataset contains global sales information for video games with the following columns:

- `Rank`
- `Name`
- `Platform`
- `Year`
- `Genre`
- `Publisher`
- `NA_Sales`
- `EU_Sales`
- `JP_Sales`
- `Other_Sales`
- `Global_Sales`

**Note:** Some values, such as `Year = N/A`, were cleaned during the ETL process and stored as `NULL` in the final tables.

## Data Pipeline
CSV (original dataset)
↓
Staging Table (staging_vgsales)
↓
Dimension Tables (genre, publisher, platform)
↓
Fact Tables (games, game_platform)
↓
Analytical Queries

- The **staging table** allows importing the raw CSV without worrying about type mismatches or dirty data.  
- The **normalized tables** ensure unique entries and proper relationships for analysis.  
- Non-numeric or missing values, such as `N/A` in the year column, are converted to `NULL`.

## Key Questions

- Which platforms generate the highest sales?
- What are the best-selling video games?
- Which genres dominate the market?

## Key Insights

- Top-selling video games globally.
- Sales breakdown by platform and region.
- Sales trends over the years.
- Top publishers by genre.

## Project workflow

1. Run database/schema.sql
2. Run database/staging_tables.sql
3. Import vgsales.csv into staging_vgsales
4. Run etl/load_from_staging.sql
5. Execute queries in queries/
