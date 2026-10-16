# Tata Power Smart Energy Control 360

A Power BI and MySQL data analysis project designed to explore power generation, plant performance, grid and substation conditions, billing, EV mobility, smart-meter activity, and energy risk indicators in one dashboard experience.

> **Project data note:** The supplied SQL script defines the database schema and data-loading commands. The dashboard screenshots are visual references supplied with this project. Unless verified from the loaded source data, dashboard values should be treated as illustrative and not as confirmed live Tata Power operational data.

## Project Information

- **Project Title:** Tata Power Smart Energy Control 360
- **Industry:** Energy and Power Utilities
- **Problem Statement:** Energy operations involve multiple areas—generation, plant availability, grid demand and supply, substation health, smart-meter readings, billing, EV charging, and alerts. Reviewing these areas separately can make it harder to compare performance and identify potential operational risks. This project brings these data areas into a structured SQL database and a set of Power BI dashboard pages for analysis.
- **Project Objectives:**
  - Organize energy-related operational data in MySQL.
  - Analyse plant output, generation mix, availability, efficiency, and revenue.
  - Explore grid demand, supply, frequency, technical losses, and unserved energy.
  - Review substation loading and health indicators.
  - Examine billing, payment status, smart-meter readings, and EV charging activity.
  - Present key metrics and comparisons through Power BI visuals and filters.
  - Support data-informed investigation of operational exceptions and potential risks.
- **Proposed Solution / Business Questions:** Use SQL tables and views to structure the data, then connect Power BI to explore questions such as: Which plants contribute most to output? How do demand and supply compare? Which zones show higher unserved energy or technical losses? What do substation health indicators show? How do billing payments and EV charging activity vary?
- **Dataset Name:** Tata Power Smart Energy Control 360 project dataset (CSV files referenced by the SQL loading script)
- **Dataset Source:** Project CSV files referenced in `smart energy control.sql`. The supplied script does not identify a public download URL or establish that the data is sourced from a live Tata Power feed.
- **Database Name:** `tata_power_360`
- **SQL Script:** `smart energy control.sql`

## Tools & Technologies

- MySQL 8.x
- SQL
- Power BI Desktop
- Power Query and DAX, where used in the Power BI report
- CSV files for data loading

## Project Overview

This project models several energy-management subject areas in MySQL and presents dashboard pages for operational and business analysis. The SQL script creates dimension tables and operational tables for plants, grid zones, substations, smart meters, EV stations, dates, generation, outages, billing, and alerts. It also defines views intended to help Power BI access the latest plant and fleet records, unacknowledged alerts, and hourly plant summaries.

Power BI is used to present metrics and visual comparisons across the dashboard pages. The expected business value is to make related indicators easier to review together and help users investigate patterns or exceptions. Actual business outcomes must be validated against reliable, production data.

## Project Objectives

1. Structure the project's energy data in a MySQL database.
2. Keep plant, zone, substation, smart-meter, EV-station, and date information in dimension tables.
3. Store operational measurements and transactions in separate fact/operational tables.
4. Provide SQL views for selected latest-state and summary analysis.
5. Visualize plant output, grid conditions, billing and EV mobility, and energy-risk indicators in Power BI.
6. Use dashboard filters and comparisons to support exploration of the available data.

## Dataset Information

The SQL script references CSV files for loading data, including:

- `Dim_Plant.csv`
- `Dim_Zone.csv`
- `Dim_Substation.csv`
- `Dim_SmartMeter.csv`
- `Dim_EV_Station.csv`
- `Dim_Date.csv`
- `Plant_Live.csv`
- `Fleet_Live.csv`
- `Plant_Daily.csv`
- `Outage_Log.csv`
- `Grid_Live.csv`
- `Substation_Health.csv`
- `SmartMeter_Live.csv`
- `EV_Sessions.csv`
- `Billing.csv`
- `Alerts.csv`

**Rows and columns:** Exact row counts and dataset dimensions are not documented in the supplied SQL script. Run row-count queries after loading the CSVs to record actual counts.

### Main tables and subject areas

| Table | Purpose / key fields |
|---|---|
| `dim_plant` | Plant name, fuel type, region, state, capacity, ownership, and reference performance factors |
| `dim_zone` | Zone, state, utility, location, and illustrative peak demand |
| `dim_substation` | Substation, zone, capacity, and voltage |
| `dim_smartmeter` | Meter, substation, zone, customer category, and rooftop solar flag |
| `dim_ev_station` | EV station, zone, location, and AC/DC charger counts |
| `dim_date` | Date, day, week, month, and weekend indicator |
| `plant_live` | Timestamped plant output, availability, load factor, temperature, emissions, revenue, and alert level |
| `fleet_live` | Generation by source, total output, clean-energy percentage, availability, outages, and system frequency |
| `plant_daily` | Daily generation, PLF, availability, coal stock days, revenue, and emissions |
| `outage_log` | Outage timing, duration, capacity lost, type, and reason |
| `grid_live` | Zone demand and supply, unserved MW, frequency, voltage, technical loss, and grid status |
| `substation_health` | Substation load, transformer/oil temperature, fault flag, load MVA, and status |
| `smartmeter_live` | Meter consumption, solar export, voltage, current, power factor, tamper flag, and reading status |
| `ev_sessions` | Charging sessions, energy delivered, duration, revenue, payment mode, and connector details |
| `billing` | Customer category, usage, tariff, billed amount, late fee, due date, and payment status |
| `alerts` | Alert category, entity, severity, type, message, metric value, and acknowledgement status |

## Project Workflow

**Industry Selection → Problem Identification → Dataset Collection → MySQL Database Setup → Data Cleaning & Transformation Using SQL → SQL Data Analysis → Power BI Data Modeling → Dashboard Development → Insights & Recommendations**

## SQL Analysis

The supplied `smart energy control.sql` script includes:

- Database creation and selection for `tata_power_360`.
- Table definitions with primary keys for dimension and operational data.
- `LOAD DATA LOCAL INFILE` commands to import CSV files.
- `NULLIF()` handling for selected optional numeric values during CSV import.
- Indexes for selected plant, grid-zone, and alert timestamp queries.
- Views:
  - `v_plant_latest` — latest available row for each plant.
  - `v_fleet_latest` — latest fleet record.
  - `v_open_alerts` — alerts where `Acknowledged = 'No'`.
  - `v_plant_hourly` — hourly average output and summed emissions by plant.

The script contains schema and data-loading statements; it does not include a separate set of business-analysis `SELECT` queries or verified findings. Add those queries and document their results after loading and validating the data.

### Example validation queries

```sql
USE tata_power_360;

SELECT COUNT(*) AS plant_live_rows FROM plant_live;
SELECT COUNT(*) AS grid_live_rows FROM grid_live;
SELECT COUNT(*) AS billing_rows FROM billing;
SELECT COUNT(*) AS ev_sessions_rows FROM ev_sessions;

SELECT Plant_Name, SUM(Output_MW) AS total_output_mw
FROM plant_live
GROUP BY Plant_Name
ORDER BY total_output_mw DESC;

SELECT Zone, AVG(Demand_MW) AS avg_demand_mw,
       AVG(Supply_MW) AS avg_supply_mw,
       AVG(Unserved_MW) AS avg_unserved_mw
FROM grid_live
GROUP BY Zone
ORDER BY avg_unserved_mw DESC;

SELECT Payment_Status, COUNT(*) AS bill_count,
       SUM(Amount_INR) AS billed_amount_inr
FROM billing
GROUP BY Payment_Status;
```

These are suggested analysis queries, not claims that they have already been executed.

## Power BI Dashboard

The supplied screenshots show four dashboard pages:

1. **Dashboard_overview** — overview page with headline generation and performance KPIs, plant/state comparisons, generation mix, output trend, and top-plant visuals.
2. **Grid_substations** — grid and substation page with grid frequency, peak demand, unserved energy, technical loss, substation load, zone-level comparisons, and grid-health visuals.
3. **Billing_Ev Mobility** — billing and EV-mobility page with billing totals, units, smart-meter and EV-session indicators, payment status, meter-reading status, map, and monthly billing trend.
4. **Energy Risk_Intelligence 360** — risk-analysis page with demand/supply, outage and unserved-power indicators, zone efficiency/risk visuals, plant anomaly indicators, outage impact, regional map, and substation thermal/load visuals.

The screenshots document the displayed page designs. Confirm the actual Power BI model, transformations, measures, relationships, slicers, and data connection in the `.pbix` file before describing them as implemented. A `.pbix` file was not included in the supplied files for this README request.

## Data Analysis & Visualization

The dashboard pages are organized around these analysis themes:

- **Performance analysis:** plant output, load factor, efficiency, and availability.
- **Generation mix:** comparison of generation sources.
- **Grid analysis:** demand versus supply, frequency, technical losses, and unserved energy.
- **Substation health:** loading, temperature, and fault indicators.
- **Billing analysis:** billed amounts, units, payment status, and monthly trends.
- **EV mobility:** charging sessions, energy delivered, and revenue.
- **Risk and outage analysis:** alert severity, plant anomalies, outage duration, and capacity lost.

These are the analysis areas represented in the supplied SQL schema and screenshots. Confirm calculated results using the loaded data before publishing conclusions.

## Key Insights

Record insights here after executing SQL queries and validating the Power BI figures. Do not treat screenshot labels or illustrative sample values as verified operational findings.

Suggested format:

- **Finding:** [Describe a verified pattern from the dataset.]
- **Evidence:** [Include the query, measure, time period, and actual value.]
- **Business relevance:** [Explain why the finding matters.]
- **Recommendation:** [State a practical action supported by the evidence.]

## Power BI Dashboard Screenshots

### Dashboard_overview

![Dashboard_overview](Visualizations/Dashboard_overview.png)

### Grid_substations

![Grid_substations](Visualizations/Grid_substations.png)

### Billing_Ev Mobility

![Billing_Ev_Mobility](Visualizations/Billing_Ev_Mobility.png)

### Energy Risk_Intelligence 360

![Energy_Risk_Intelligence_360](Visualizations/Energy_Risk_Intelligence_360.png)

## Project Folder Structure

```text
Tata_Power_Smart_Energy_Control_360/
├── README.md
├── smart energy control.sql
└── Visualizations/
    ├── Dashboard_overview.png
    ├── Grid_substations.png
    ├── Billing_Ev_Mobility.png
    └── Energy_Risk_Intelligence_360.png
```

This structure reflects the SQL script and dashboard screenshots supplied for this README. Add the CSV files and Power BI `.pbix` report to the repository if you intend to share them and have permission to distribute them.

## Author

- **Name:** K LAKSHMI PRIYA
- **Student ID:** AFO5323408
- **Organization:** Anudip Foundation
- **Course:** DBA_AI
- **Batch Code:** ANP-D7635

---

*Note: This is an educational/portfolio project. Do not describe the data as real-time, live, or official production data unless its source and refresh process have been verified.*
