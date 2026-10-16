# ⚡ Tata Power Smart Energy Control 360

## Industry
**Energy & Utilities | Power Generation | Grid Infrastructure | Smart Metering | EV Mobility**

---

## Project Overview

**Tata Power Smart Energy Control 360** is an end-to-end Business Intelligence and Decision Intelligence platform designed to demonstrate how energy generation, grid infrastructure, electricity billing, electric vehicle (EV) mobility, smart meters, and operational alerts can be analyzed through interactive Power BI dashboards.

The project integrates structured CSV datasets with MySQL for centralized data storage and SQL-based analysis. Power Query is used for data transformation, while DAX and Microsoft Power BI are used to develop analytical measures, interactive visualizations, and decision-support dashboards.

The platform brings together multiple energy-related business areas to help users explore operational performance, identify trends, monitor potential risks, and support data-driven decision-making.

> **Important project note:** This is an educational analytics prototype. The datasets and dashboard outputs should not be interpreted as verified live operational data from Tata Power unless independently validated. The project demonstrates an analytics workflow and does not imply official affiliation with Tata Power.

## Project Workflow

**CSV Datasets → MySQL Database → SQL Analysis → Power Query / ETL → Data Cleaning → Data Modeling → DAX Measures → Power BI Dashboards → Business Insights → Decision Intelligence**

## Business Areas Covered

- Power generation and plant performance analysis
- Grid infrastructure and substation monitoring
- Zone-wise energy performance analysis
- Electricity billing and revenue analysis
- Smart meter data analysis
- Electric vehicle charging station analysis
- EV fleet activity analysis
- Operational alerts and event monitoring
- Infrastructure performance comparisons
- Energy-related risk identification
- Operational trend analysis
- Decision intelligence and business recommendations

## Project Objectives

- Build a structured database for energy-related operational datasets.
- Organize dimension and fact tables for analytical reporting.
- Analyze power generation across available plants and zones.
- Compare operational performance across grid infrastructure.
- Examine electricity billing and revenue trends.
- Explore smart meter and EV charging station data.
- Analyze available fleet-related operational records.
- Monitor operational alerts and identify potential risk areas.
- Perform SQL-based data extraction, aggregation, and analysis.
- Apply Power Query for ETL and data preparation.
- Develop DAX measures for analytical KPIs.
- Build an interactive four-page Power BI dashboard.
- Convert analytical results into meaningful business insights.
- Demonstrate an end-to-end Data Analyst and Business Intelligence workflow.

## Problem Statement

Energy and utility operations involve multiple datasets related to power generation, grid infrastructure, electricity billing, smart meters, EV charging stations, fleet activity, and operational alerts. When these datasets are maintained and analyzed separately, it can be difficult to understand overall performance, compare operational trends, identify exceptions, and determine which areas require further investigation.

Tata Power Smart Energy Control 360 demonstrates a centralized analytics solution that integrates structured energy-related datasets and presents key performance indicators through interactive Power BI dashboards.

### Business Questions

- Which power plants contribute the most to recorded energy generation?
- How does recorded energy performance vary across zones?
- Which plants or zones require further performance investigation?
- How does electricity billing vary across available categories?
- What revenue patterns can be identified from the billing data?
- How are EV charging stations distributed across available locations?
- What fleet activity patterns appear in the dataset?
- How can smart meter information support operational monitoring?
- Which areas have the highest recorded number of operational alerts?
- What alert categories or severity levels require attention, if available?
- Which grid infrastructure assets require further investigation?
- What operational trends can be identified over time?
- How can management use analytical findings to prioritize follow-up actions?

Answers depend on the available dataset fields, data quality, and validated analytical results.

## Tools & Technologies

| Tool / Technology | Purpose |
|---|---|
| MySQL | Database creation, data storage, and table management |
| SQL | Data validation, joins, aggregations, and operational analysis |
| Power Query | ETL, data transformation, and preparation |
| Microsoft Power BI | Interactive dashboards and business intelligence |
| DAX | KPI calculations and analytical measures |
| Microsoft Excel / CSV | Dataset inspection and preparation |
| GitHub | Version control, project documentation, and portfolio publishing |

## Dataset Description

The project dataset is organized into **15 CSV files: 6 dimension tables and 9 fact tables**, with approximately **23,589 data rows** in total, excluding headers and blank rows. The exact row counts, field names, and relationships should be validated against the CSV files included in the repository.

The datasets cover energy-related information across plants, dates, zones, substations, smart meters, EV charging stations, billing, fleet activity, and operational alerts.

### Dimension Tables

Dimension tables provide descriptive information for categorizing, filtering, and analyzing operational records.

| File | Description | Potential analytical applications |
|---|---|---|
| `Dim_Date.csv` | Date-related attributes | Daily, monthly, yearly, and period-over-period trends |
| `Dim_Ev_Station.csv` | EV charging station information | Station comparisons and location-based infrastructure analysis |
| `Dim_Plant.csv` | Power plant information | Plant-level performance and generation comparisons |
| `Dim_SmartMeter.csv` | Smart meter information | Meter categorization and meter-related analysis |
| `Dim_Substation.csv` | Substation information | Substation comparisons and infrastructure monitoring |
| `Dim_Zone.csv` | Zone-related information | Zone-wise and regional comparisons |

Smart meter records alone do not establish actual electricity consumption. Consumption analysis requires suitable consumption measurements in the data.

### Fact Tables

Fact tables contain operational measurements, events, transactions, and records used for analysis.

| File | Description | Potential analytical applications |
|---|---|---|
| `Fact_Alerts.csv` | Operational alerts and event records | Alert counts, trends, category comparisons, and investigation |
| `Fact_Billing.csv` | Electricity billing records | Billing amount aggregation and revenue trends |
| `Fact_Fleet_Live.csv` | EV fleet or live fleet-related records | Fleet activity and mobility trends |
| Remaining six fact tables | Other energy-related datasets in the project | Document their actual filenames, fields, and purpose from the source files |

> **Dataset documentation note:** Before publishing the final repository, list all nine fact-table filenames and their actual columns. Avoid adding unverified table names or field definitions.

## Database Design

**Database name:** `tata_power_360`

The project uses a relational database structure containing six dimension tables and nine fact tables. Dimension tables provide descriptive attributes, while fact tables contain operational records used for calculations, comparisons, and reporting.

### Example: Create the Database

```sql
CREATE DATABASE IF NOT EXISTS tata_power_360;

USE tata_power_360;

SHOW TABLES;
```

### Conceptual Data Model

```text
                    ENERGY ANALYTICS DATA MODEL
                              Dim_Date
                                 |
                 +---------------+---------------+
                 |               |               |
                 v               v               v
              Fact_1          Fact_2          Fact_3
                 |               |               |
                 +---------------+---------------+
                                 |
                   +-------------+-------------+
                   |             |             |
                   v             v             v
               Dim_Plant      Dim_Zone     Dim_Substation
                   |
                   v
            Power Generation
             & Performance

          Dim_Ev_Station                 Dim_SmartMeter
                |                              |
                v                              v
          EV-Related Facts              Meter-Related Facts
                |                              |
                +---------------+--------------+
                                |
                                v
                       Power BI Reporting
```

This is a conceptual illustration, not a verified physical relationship diagram. The actual model should reflect the foreign keys, table grains, and relationships present in the datasets.

The actual relationships between dates, plants, zones, substations, smart meters, EV stations, billing, fleet activity, and alerts must be established according to available keys and the structure of the imported data.

## SQL Analysis

SQL is used to retrieve, validate, aggregate, and analyze data stored in MySQL.

### Key SQL Activities

- Database creation and table management
- CSV data import validation
- Row-count and data-type verification
- Missing-value and duplicate checks
- Joins between related tables
- Aggregation and grouping
- KPI preparation and operational trend analysis
- Data consistency validation

### Example 1 — Create and Select the Database

```sql
CREATE DATABASE IF NOT EXISTS tata_power_360;
USE tata_power_360;
```

### Example 2 — Count Operational Alert Records

```sql
SELECT
    COUNT(*) AS total_alert_records
FROM Fact_Alerts;
```

This calculates the number of records in `Fact_Alerts`, assuming the table exists and has been populated.

### Example 3 — Inspect Billing Data

```sql
SELECT *
FROM Fact_Billing
LIMIT 10;
```

This displays a sample of billing records for initial inspection.

### Example 4 — Validate Row Counts

```sql
SELECT
    'Fact_Alerts' AS table_name,
    COUNT(*) AS total_records
FROM Fact_Alerts

UNION ALL

SELECT
    'Fact_Billing' AS table_name,
    COUNT(*) AS total_records
FROM Fact_Billing

UNION ALL

SELECT
    'Fact_Fleet_Live' AS table_name,
    COUNT(*) AS total_records
FROM Fact_Fleet_Live;
```

This compares row counts across the three identified fact tables.

### Additional SQL Analysis

Further analysis can include generation by plant and zone, billing amounts by available categories, alerts by severity or status when those columns exist, fleet activity over time, EV station activity where usage records are available, joins to corresponding dimensions, and checks for incomplete or inconsistent records.

All queries should use the actual table and column names from the imported datasets.

## ETL & Data Cleaning

Power Query Editor is used to prepare and transform data before it is loaded into the Power BI reporting model.

1. **Extract:** Organize CSV datasets, import them into MySQL, and connect Power BI to the database.
2. **Transform:** Review column names, correct data types, check missing and duplicate values, standardize categories, prepare date/time fields, validate numeric measurements and key columns, review relationships, and create derived columns where required.
3. **Load:** Load transformed datasets into the Power BI data model, configure relationships, create DAX measures, and build interactive visuals and filters.

## DAX Measures

A dedicated Measures table can be used in Power BI to organize analytical measures. Final implementations depend on actual column names and the grain of each source table.

### Energy Generation & Plant Performance
- Total Recorded Energy Generation
- Average Energy Generation
- Plant Performance Comparison
- Zone-wise Generation
- Generation Trend

### Grid & Substation Operations
- Total Substations
- Substation Distribution by Zone
- Asset Count
- Available Grid Performance Indicators

### Billing & Revenue Analysis
- Total Billing Amount
- Average Billing Amount
- Billing Trend
- Billing Category Comparison

### EV Mobility & Smart Metering
- Total EV Stations
- Total Recorded Fleet Activity
- Station-Level Activity
- Smart Meter Count
- Available Meter-Related Performance Indicators

### Operational Alerts
- Total Alert Records
- Alerts by Category
- Alerts by Severity, if available
- Alerts by Status, if available
- Alert Trend
- Potential Risk Classification

### Decision Intelligence
- Operational Risk Indicator
- High-Priority Alert Count
- Performance Exception Indicator
- Operational Status
- Recommended Action

Measures such as total energy generation, revenue, or alert severity must only be implemented when the required source columns are present. Definitions should match the actual data rather than assume a field exists.

## BI Dashboard Architecture

The Power BI presentation layer contains four dedicated dashboard pages:

1. **Dashboard Overview**
2. **Grid & Substations**
3. **Billing & EV Mobility**
4. **Energy Risk Intelligence 360**

The dashboard progresses from high-level performance monitoring to focused operational analysis and risk investigation.

**What is happening? → Where is the issue? → What does the data indicate? → What should be investigated next?**

## Page 1 — Dashboard Overview

Provides a high-level summary of the energy-related information available in the dataset.

**Potential KPIs**
- Total Recorded Energy Generation
- Total Plants
- Total Substations
- Total Billing Amount
- Total Operational Alert Records

**Potential visuals**
- Energy Generation by Plant
- Energy Generation by Zone
- Energy Performance Trend
- Plant-Level Performance Comparison
- Operational Alert Summary
- High-Level Infrastructure Overview

**Suggested slicers:** Date, Zone, Plant, and Substation.

**Business purpose:** Understand the dataset at a glance, compare recorded energy performance, explore plant and zone activity, monitor high-level indicators, and identify areas requiring deeper investigation.

## Page 2 — Grid & Substations

Focuses on infrastructure-related information and zone-level operational analysis.

**Potential KPIs**
- Total Substations
- Total Zones
- Total Plants
- Infrastructure Asset Count
- Available Grid Performance Indicators

**Potential visuals**
- Substations by Zone
- Plant Distribution by Zone
- Infrastructure Distribution
- Substation-Level Performance Comparison
- Zone-Wise Operational Summary
- Infrastructure Trend Analysis, if time-based records are available

**Suggested slicers:** Date, Zone, Plant, and Substation.

**Business purpose:** Explore infrastructure distribution, plant and substation relationships, differences in recorded performance, assets requiring investigation, and potential infrastructure-related exceptions. Actual performance conclusions require suitable operational measurements.

## Page 3 — Billing & EV Mobility

Combines electricity billing analysis with available EV station, fleet, and smart meter information.

**Billing KPIs**
- Total Billing Amount
- Average Billing Amount
- Billing Record Count
- Billing Trend

**EV mobility KPIs**
- Total EV Stations
- Total Recorded Fleet Activity
- Station-Level Activity
- Available EV-Related Performance Indicators

**Potential visuals**
- Billing Amount by Available Category
- Billing Trend Over Time
- Billing Distribution
- EV Station Distribution
- Fleet Activity Analysis
- EV-Related Trend Analysis
- Smart Meter Distribution
- Billing and Mobility Performance Comparison

**Suggested slicers:** Date, EV Station, Zone, and available billing categories.

**Business purpose:** Explore billing and revenue patterns, differences between categories, EV station distribution and activity, fleet trends, smart meter information, and opportunities for further investigation.

## Page 4 — Energy Risk Intelligence 360

Serves as the analytical risk-monitoring and decision-support layer of the project. It is designed to help identify potential operational exceptions, review alert patterns, and prioritize further investigation.

### Dynamic KPI Cards & Metrics

1. **Total Operational Alerts:** Number of alert records in the selected reporting context.
2. **High-Priority Alerts:** Count of high-priority alerts, if a suitable severity or priority field exists.
3. **Operational Risk Indicator:** A risk classification based on documented business rules and available fields.
4. **Performance Exception Indicator:** Highlights records meeting predefined exception criteria.
5. **Energy Performance Summary:** Selected energy performance metrics when the required measurements exist.

Cards can respond to report filters when the data model and DAX measures are configured accordingly.

### Operational Intelligence & Action Framework

**Operational status and alerts:** Help users identify events requiring review. Example message:

> **OPERATIONAL ALERT:** Review the selected area's alert records and investigate any high-priority events identified by the available data.

The final alert should be generated from actual dataset values and documented business rules rather than hardcoded assumptions.

**Potential recommended actions**
- Investigate high-priority operational alerts.
- Review recurring alerts to identify possible underlying causes.
- Compare energy performance across plants and zones.
- Examine infrastructure assets associated with repeated exceptions where valid relationships exist.
- Validate unusual billing patterns before drawing conclusions.
- Investigate EV station or fleet activity exceptions when supported by the data.
- Establish monitoring thresholds based on verified operational requirements.
- Review historical trends to determine whether an issue is isolated or recurring.

**Risk classification:** Categories such as LOW, MEDIUM, and HIGH can be introduced using documented business rules. If thresholds or a risk score are used, explain how they are calculated in the README and dashboard documentation.

### Business Questions for Page 4

- How many operational alerts are present in the selected dataset?
- Which alert categories require further investigation?
- Which areas have a high concentration of recorded alerts?
- Are there recurring alert patterns over time?
- Which plants or zones show performance exceptions?
- What additional investigation is required before recommending operational changes?
- How can analytical indicators support operational prioritization?

**Business purpose:** Demonstrate how a traditional dashboard can be extended into a decision-support experience, moving from viewing historical records to identifying exceptions and considering appropriate next steps.

> **Important:** This page is a prototype for analytical risk monitoring. It does not provide verified real-time energy-system monitoring or automatically execute operational control actions.

## Key Business Insights

The dashboard is designed to support these categories of analysis:

1. **Energy Generation Performance:** Compare recorded generation across plants and zones.
2. **Grid Infrastructure:** Explore the distribution of substations and related infrastructure across zones.
3. **Billing and Revenue Patterns:** Analyze billing amounts and identify categories or periods requiring further investigation.
4. **EV Mobility:** Examine EV charging station information and fleet activity using available records.
5. **Smart Metering:** Explore smart meter information; analyze consumption only when actual consumption data is available.
6. **Operational Alert Monitoring:** Identify patterns in alert records and areas with high event concentrations.
7. **Performance Exceptions:** Use validated thresholds and operational indicators to identify records that differ from expected patterns.
8. **Decision Support:** Translate verified findings into prioritized recommendations for further investigation or operational review.

These are intended analytical capabilities. Document actual business findings only after SQL queries and Power BI results have been validated.

## Decision Intelligence

The major differentiating feature of Tata Power Smart Energy Control 360 is its Decision Intelligence approach.

Traditional dashboards primarily answer **“What happened?”** This project extends the analysis to:

- Where should we investigate?
- Which operational indicators require attention?
- What action should be considered next?

### Example Decision Flow

```text
Operational Data
      |
      v
Performance & Alert Analysis
      |
      v
Identify Exceptions
      |
      v
Validate Potential Risk
      |
      v
Prioritize Investigation
      |
      v
Recommend Next Steps
```

For example, if the available data identifies repeated high-priority alerts in a particular zone, the dashboard can highlight that zone for further investigation. Recommendations should be based on verified alert records, valid relationships, and documented business rules.

This approach demonstrates how a Data Analyst can convert structured data into insights that support business decisions.

## End-to-End Project Workflow

```text
Energy-Related CSV Datasets
            |
            v
      Data Inspection
            |
            v
       MySQL Database
            |
            v
       Table Creation
            |
            v
         Data Import
            |
            v
      Data Validation
            |
            v
        SQL Analysis
            |
            v
      Power BI Connection
            |
            v
      Power Query / ETL
            |
            v
        Data Cleaning
            |
            v
        Data Modeling
            |
            v
       Create DAX Measures
            |
            v
   Power BI Dashboard Development
            |
            v
    Interactive Filters & Slicers
            |
            v
      Operational Analysis
            |
            v
     Exception & Risk Analysis
            |
            v
       Decision Intelligence
            |
            v
      Business Recommendations
```

## Repository Structure

The following is a suggested structure. Update filenames and folders to match the actual files in the GitHub repository.

```text
Tata-Power-Smart-Energy-Control-360/
│
├── README.md
├── dataset/
│   ├── Dim_Date.csv
│   ├── Dim_Ev_Station.csv
│   ├── Dim_Plant.csv
│   ├── Dim_SmartMeter.csv
│   ├── Dim_Substation.csv
│   ├── Dim_Zone.csv
│   ├── Fact_Alerts.csv
│   ├── Fact_Billing.csv
│   ├── Fact_Fleet_Live.csv
│   └── ... remaining CSV files
│
├── sql/
│   ├── database_creation.sql
│   ├── table_creation.sql
│   └── analysis_queries.sql
│
├── powerbi/
│   └── Tata_Power_Smart_Energy_Control_360.pbix
│
├── screenshots/
│   ├── dashboard-overview.png
│   ├── grid-substations.png
│   ├── billing-ev-mobility.png
│   └── energy-risk-intelligence.png
│
└── documentation/
    ├── Project_Overview.docx
    └── Data_Dictionary.xlsx
```

## Dashboard Screenshots & Deliverables

Add screenshots of the completed dashboard pages to the `screenshots/` folder. Use these paths once the corresponding images have been added:

### 1. Dashboard Overview

![Dashboard Overview](screenshots/dashboard-overview.png)

### 2. Grid & Substations

![Grid and Substations](screenshots/grid-substations.png)

### 3. Billing & EV Mobility

![Billing and EV Mobility](screenshots/billing-ev-mobility.png)

### 4. Energy Risk Intelligence 360

![Energy Risk Intelligence 360](screenshots/energy-risk-intelligence.png)

### Deliverables

- MySQL database scripts
- SQL analysis queries
- Energy-related CSV datasets
- Power BI dashboard
- Dashboard screenshots
- Data dictionary
- Project documentation

## How to Run the Project

### Step 1 — Prepare the Datasets
Locate the CSV datasets in the repository. Verify filenames, column names, data types, and record counts.

### Step 2 — Create the MySQL Database
Open MySQL Workbench and execute:

```sql
CREATE DATABASE IF NOT EXISTS tata_power_360;
USE tata_power_360;
```

### Step 3 — Create the Tables
Execute `sql/table_creation.sql`. Ensure the table definitions match the actual CSV column names and data types.

### Step 4 — Import the Data
Import the 15 CSV files into their corresponding MySQL tables and verify that the data has been imported correctly.

### Step 5 — Validate the Database
Check table row counts, column data types, missing values, duplicate records, primary and foreign key consistency, and relationships between fact and dimension tables.

### Step 6 — Run SQL Analysis
Execute `sql/analysis_queries.sql` and validate the query results.

### Step 7 — Open Power BI Desktop
Open the Power BI report:

`powerbi/Tata_Power_Smart_Energy_Control_360.pbix`

### Step 8 — Connect to MySQL
Configure the MySQL connection using database name `tata_power_360`. Ensure the required MySQL connector or driver is installed and configured.

### Step 9 — Refresh the Data
Refresh the Power BI report after verifying the database connection and data model.

### Step 10 — Explore the Dashboard
Navigate through the four pages: **Dashboard Overview → Grid & Substations → Billing & EV Mobility → Energy Risk Intelligence 360**. Use the available slicers, charts, KPI cards, and filters to explore the data.

## Recommendations & Strategic Interventions

Depending on validated analytical results, the platform can support recommendations such as:

- Investigate significant differences in recorded generation across plants.
- Compare zone-level energy performance to identify unusual patterns.
- Review infrastructure records associated with repeated operational exceptions.
- Analyze unusual billing trends before making business conclusions.
- Investigate EV station activity patterns using appropriate usage records.
- Review fleet-related exceptions when supported by the dataset.
- Monitor recurring operational alerts.
- Establish documented thresholds for identifying potential risks.
- Validate exceptional records before recommending corrective action.
- Prioritize investigations based on the severity and frequency of verified alerts.
- Develop forecasting or anomaly-detection models when suitable historical data is available.

These are examples of possible analytical actions. Final recommendations should be based on actual dashboard findings and appropriate business context.

## Project Outcome

Tata Power Smart Energy Control 360 demonstrates an end-to-end Business Intelligence workflow for organizing and analyzing energy-related datasets.

**Technology stack:** MySQL + SQL + Power Query + DAX + Power BI

**Analytics coverage:** Energy Generation → Grid Infrastructure → Billing → Smart Metering → EV Mobility → Operational Alerts → Risk Analysis → Decision Support

The solution demonstrates how structured datasets can be transformed into interactive dashboards that help users monitor recorded operational performance, compare plants and zones, explore grid and substation information, analyze billing and revenue patterns, investigate EV mobility and smart meter data, identify patterns in operational alerts, support data-driven investigation and prioritization, and communicate findings through interactive visualizations.

The project demonstrates practical skills in database management, SQL querying, data preparation, data modeling, DAX calculations, dashboard development, and business intelligence.

> This is an educational analytics prototype. It does not represent a verified live operational system or an official Tata Power product.

## Author

**K. LAKSHMI PRIYA**

- **Student ID:** AF05323408
- **Batch Code:** ANP-D7635
- **Project:** Tata Power Smart Energy Control 360
- **Domain:** Energy Analytics & Business Intelligence
- **Technologies:** MySQL | SQL | Microsoft Power BI | Power Query | DAX | Excel | GitHub
- **Project Focus:** Energy Generation | Grid Infrastructure | Substation Analysis | Electricity Billing | Smart Metering | EV Mobility | Fleet Analytics | Operational Alerts | Risk Analysis | Decision Intelligence | Interactive Business Intelligence

## License

This project is created for educational, portfolio, and data analytics demonstration purposes. It is an independent analytics prototype and should not be interpreted as an official Tata Power product or as a source of verified live operational data.

## Project Repository

The repository is intended to contain SQL database scripts, SQL analysis queries, energy-related CSV datasets, the Power BI dashboard, dashboard screenshots, a data dictionary, and project documentation.

Tata Power Smart Energy Control 360 demonstrates how structured energy-related data can be transformed into business insights and decision-support dashboards using modern data analytics and business intelligence tools.

⭐ If you find this project useful, feel free to explore the repository and its documentation.
