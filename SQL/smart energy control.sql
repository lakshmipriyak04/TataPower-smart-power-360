-- Tata Power Smart Energy Control 360 - MySQL schema (MySQL 8.x)
CREATE DATABASE IF NOT EXISTS tata_power_360 CHARACTER SET utf8mb4;
USE tata_power_360;

DROP TABLE IF EXISTS dim_plant;
CREATE TABLE dim_plant (
  `PlantID` VARCHAR(50) NOT NULL,
  `Plant_Name` VARCHAR(100) NOT NULL,
  `Fuel_Type` VARCHAR(50) NOT NULL,
  `Segment` VARCHAR(50) NOT NULL,
  `Region` VARCHAR(50) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  `Latitude` DOUBLE NOT NULL,
  `Longitude` DOUBLE NOT NULL,
  `Capacity_MW` INT NOT NULL,
  `Ownership` VARCHAR(50) NOT NULL,
  `Base_PLF` DOUBLE NOT NULL,
  `Emission_Factor_tCO2_per_MWh` DOUBLE NOT NULL,
  `Temp_Limit_C` INT NOT NULL,
  `Data_Note` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`PlantID`)
);

DROP TABLE IF EXISTS dim_zone;
CREATE TABLE dim_zone (
  `ZoneID` VARCHAR(50) NOT NULL,
  `Zone` VARCHAR(50) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  `Utility` VARCHAR(100) NOT NULL,
  `Latitude` DOUBLE NOT NULL,
  `Longitude` DOUBLE NOT NULL,
  `Peak_Demand_MW_Illustrative` INT NOT NULL,
  PRIMARY KEY (`ZoneID`)
);

DROP TABLE IF EXISTS dim_substation;
CREATE TABLE dim_substation (
  `SubstationID` VARCHAR(50) NOT NULL,
  `Substation` VARCHAR(100) NOT NULL,
  `ZoneID` VARCHAR(50) NOT NULL,
  `Capacity_MVA` INT NOT NULL,
  `Voltage_kV` INT NOT NULL,
  PRIMARY KEY (`SubstationID`)
);

DROP TABLE IF EXISTS dim_smartmeter;
CREATE TABLE dim_smartmeter (
  `MeterID` VARCHAR(50) NOT NULL,
  `SubstationID` VARCHAR(50) NOT NULL,
  `ZoneID` VARCHAR(50) NOT NULL,
  `Customer_Category` VARCHAR(50) NOT NULL,
  `Rooftop_Solar` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`MeterID`)
);

DROP TABLE IF EXISTS dim_ev_station;
CREATE TABLE dim_ev_station (
  `StationID` VARCHAR(50) NOT NULL,
  `Station_Name` VARCHAR(100) NOT NULL,
  `ZoneID` VARCHAR(50) NOT NULL,
  `Zone` VARCHAR(50) NOT NULL,
  `Latitude` DOUBLE NOT NULL,
  `Longitude` DOUBLE NOT NULL,
  `AC_Chargers` INT NOT NULL,
  `DC_Chargers` INT NOT NULL,
  PRIMARY KEY (`StationID`)
);

DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date (
  `Date` DATE NOT NULL,
  `Day_Name` VARCHAR(50) NOT NULL,
  `Week` INT NOT NULL,
  `Month` VARCHAR(50) NOT NULL,
  `Is_Weekend` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Date`)
);

DROP TABLE IF EXISTS plant_live;
CREATE TABLE plant_live (
  `Timestamp` DATETIME NOT NULL,
  `PlantID` VARCHAR(50) NOT NULL,
  `Plant_Name` VARCHAR(100) NOT NULL,
  `Output_MW` DOUBLE NOT NULL,
  `Availability_Pct` DOUBLE NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `Plant_Load_Factor_Pct` DOUBLE NOT NULL,
  `Efficiency_Pct` DOUBLE,
  `Equipment_Temp_C` DOUBLE NOT NULL,
  `Wind_Speed_ms` DOUBLE,
  `Solar_Irradiance_Wm2` DOUBLE,
  `Reservoir_Level_Pct` DOUBLE,
  `CO2_t` DOUBLE NOT NULL,
  `Ambient_Temp_C` DOUBLE NOT NULL,
  `Humidity_Pct` DOUBLE NOT NULL,
  `Vibration_mm_s` DOUBLE,
  `Heat_Rate_kcal_kWh` DOUBLE,
  `Coal_Consumption_t` DOUBLE,
  `Revenue_INR` DOUBLE NOT NULL,
  `Alert_Level` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Timestamp`, `PlantID`)
);

DROP TABLE IF EXISTS fleet_live;
CREATE TABLE fleet_live (
  `Timestamp` DATETIME NOT NULL,
  `Thermal_MW` DOUBLE NOT NULL,
  `Gas_MW` DOUBLE NOT NULL,
  `Hydro_MW` DOUBLE NOT NULL,
  `Wind_MW` DOUBLE NOT NULL,
  `Solar_MW` DOUBLE NOT NULL,
  `Total_MW` DOUBLE NOT NULL,
  `Clean_Energy_Pct` DOUBLE NOT NULL,
  `CO2_t` DOUBLE NOT NULL,
  `Capacity_Available_MW` DOUBLE NOT NULL,
  `Fleet_Availability_Pct` DOUBLE NOT NULL,
  `Plants_On_Outage` INT NOT NULL,
  `System_Frequency_Hz` DOUBLE NOT NULL,
  PRIMARY KEY (`Timestamp`)
);

DROP TABLE IF EXISTS plant_daily;
CREATE TABLE plant_daily (
  `Date` DATE NOT NULL,
  `PlantID` VARCHAR(50) NOT NULL,
  `Plant_Name` VARCHAR(100) NOT NULL,
  `Generation_MU` DOUBLE NOT NULL,
  `PLF_Pct` DOUBLE NOT NULL,
  `Availability_Pct` DOUBLE NOT NULL,
  `Coal_Stock_Days` DOUBLE,
  `Revenue_Cr` DOUBLE NOT NULL,
  `CO2_t` DOUBLE NOT NULL,
  PRIMARY KEY (`Date`, `PlantID`)
);

DROP TABLE IF EXISTS outage_log;
CREATE TABLE outage_log (
  `OutageID` VARCHAR(50) NOT NULL,
  `PlantID` VARCHAR(50) NOT NULL,
  `Plant_Name` VARCHAR(50) NOT NULL,
  `Start_Time` DATETIME NOT NULL,
  `End_Time` DATETIME NOT NULL,
  `Duration_hr` DOUBLE NOT NULL,
  `MW_Lost` DOUBLE NOT NULL,
  `Outage_Type` VARCHAR(50) NOT NULL,
  `Reason` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`OutageID`)
);

DROP TABLE IF EXISTS grid_live;
CREATE TABLE grid_live (
  `Timestamp` DATETIME NOT NULL,
  `ZoneID` VARCHAR(50) NOT NULL,
  `Zone` VARCHAR(50) NOT NULL,
  `Demand_MW` DOUBLE NOT NULL,
  `Supply_MW` DOUBLE NOT NULL,
  `Unserved_MW` DOUBLE NOT NULL,
  `Frequency_Hz` DOUBLE NOT NULL,
  `Voltage_pu` DOUBLE NOT NULL,
  `Ambient_Temp_C` DOUBLE NOT NULL,
  `Power_Factor` DOUBLE NOT NULL,
  `Technical_Loss_Pct` DOUBLE NOT NULL,
  `Reactive_MVAr` DOUBLE NOT NULL,
  `Peak_Flag` VARCHAR(50) NOT NULL,
  `Grid_Status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Timestamp`, `ZoneID`)
);

DROP TABLE IF EXISTS substation_health;
CREATE TABLE substation_health (
  `Timestamp` DATETIME NOT NULL,
  `SubstationID` VARCHAR(50) NOT NULL,
  `Load_Pct` DOUBLE NOT NULL,
  `Transformer_Temp_C` DOUBLE NOT NULL,
  `Fault_Flag` INT NOT NULL,
  `Load_MVA` DOUBLE NOT NULL,
  `Oil_Temp_C` DOUBLE NOT NULL,
  `Tap_Position` INT NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Timestamp`, `SubstationID`)
);

DROP TABLE IF EXISTS smartmeter_live;
CREATE TABLE smartmeter_live (
  `Timestamp` DATETIME NOT NULL,
  `MeterID` VARCHAR(50) NOT NULL,
  `Consumption_kWh` DOUBLE NOT NULL,
  `Solar_Export_kWh` DOUBLE NOT NULL,
  `Voltage_V` DOUBLE NOT NULL,
  `Current_A` DOUBLE NOT NULL,
  `Power_Factor` DOUBLE NOT NULL,
  `Tamper_Flag` INT NOT NULL,
  `Reading_Status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Timestamp`, `MeterID`)
);

DROP TABLE IF EXISTS ev_sessions;
CREATE TABLE ev_sessions (
  `SessionID` VARCHAR(50) NOT NULL,
  `Start_Time` DATETIME NOT NULL,
  `StationID` VARCHAR(50) NOT NULL,
  `Zone` VARCHAR(50) NOT NULL,
  `Charger_Type` VARCHAR(50) NOT NULL,
  `Vehicle_Type` VARCHAR(50) NOT NULL,
  `kWh_Delivered` DOUBLE NOT NULL,
  `Duration_min` DOUBLE NOT NULL,
  `Revenue_INR` DOUBLE NOT NULL,
  `Payment_Mode` VARCHAR(50) NOT NULL,
  `Connector_Type` VARCHAR(50) NOT NULL,
  `Start_SoC_Pct` INT NOT NULL,
  `End_SoC_Pct` INT NOT NULL,
  PRIMARY KEY (`SessionID`)
);

DROP TABLE IF EXISTS billing;
CREATE TABLE billing (
  `CustomerID` VARCHAR(50) NOT NULL,
  `ZoneID` VARCHAR(50) NOT NULL,
  `Customer_Category` VARCHAR(50) NOT NULL,
  `Smart_Meter` VARCHAR(50) NOT NULL,
  `Rooftop_Solar` VARCHAR(50) NOT NULL,
  `Billing_Month` VARCHAR(50) NOT NULL,
  `Units_kWh` DOUBLE NOT NULL,
  `Peak_Units_kWh` DOUBLE NOT NULL,
  `Tariff_INR_per_kWh` DOUBLE NOT NULL,
  `Amount_INR` DOUBLE NOT NULL,
  `Late_Fee_INR` DOUBLE NOT NULL,
  `Due_Date` DATE NOT NULL,
  `Payment_Status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CustomerID`, `Billing_Month`)
);

DROP TABLE IF EXISTS alerts;
CREATE TABLE alerts (
  `AlertID` VARCHAR(50) NOT NULL,
  `Timestamp` DATETIME NOT NULL,
  `Category` VARCHAR(50) NOT NULL,
  `EntityID` VARCHAR(50) NOT NULL,
  `Entity_Name` VARCHAR(100) NOT NULL,
  `Severity` VARCHAR(50) NOT NULL,
  `Alert_Type` VARCHAR(50) NOT NULL,
  `Message` VARCHAR(100) NOT NULL,
  `Metric_Value` DOUBLE NOT NULL,
  `Acknowledged` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`AlertID`)
);

-- Helpful indexes for DirectQuery / time filters
CREATE INDEX ix_plant_live_plant ON plant_live (PlantID, Timestamp);
CREATE INDEX ix_grid_live_zone ON grid_live (ZoneID, Timestamp);
CREATE INDEX ix_alerts_ts ON alerts (Timestamp);

-- Views for Power BI (use these or the raw tables)
CREATE OR REPLACE VIEW v_plant_latest AS
SELECT p.* FROM plant_live p
JOIN (SELECT PlantID, MAX(Timestamp) AS ts FROM plant_live GROUP BY PlantID) m
  ON m.PlantID = p.PlantID AND m.ts = p.Timestamp;

CREATE OR REPLACE VIEW v_fleet_latest AS
SELECT * FROM fleet_live ORDER BY Timestamp DESC LIMIT 1;

CREATE OR REPLACE VIEW v_open_alerts AS
SELECT * FROM alerts WHERE Acknowledged = 'No' ORDER BY Timestamp DESC;

CREATE OR REPLACE VIEW v_plant_hourly AS
SELECT DATE_FORMAT(Timestamp,'%Y-%m-%d %H:00:00') AS Hour_Start, PlantID,
       AVG(Output_MW) AS Avg_Output_MW, SUM(CO2_t) AS CO2_t
FROM plant_live GROUP BY 1, 2;

-- Load the CSVs. Run once: SET GLOBAL local_infile = 1;  and connect with --local-infile=1
-- (MySQL Workbench: Edit Connection > Advanced > Others: OPT_LOCAL_INFILE=1)
-- Edit the path C:/Tata_Power_360_MySQL/data/ below to where you extracted the folder (use forward slashes)
USE tata_power_360;

-- dim_plant
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Dim_Plant.csv' INTO TABLE dim_plant
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`PlantID`, `Plant_Name`, `Fuel_Type`, `Segment`, `Region`, `State`, `Latitude`, `Longitude`, `Capacity_MW`, `Ownership`, `Base_PLF`, `Emission_Factor_tCO2_per_MWh`, `Temp_Limit_C`, `Data_Note`);

-- dim_zone
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Dim_Zone.csv' INTO TABLE dim_zone
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`ZoneID`, `Zone`, `State`, `Utility`, `Latitude`, `Longitude`, `Peak_Demand_MW_Illustrative`);

-- dim_substation
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Dim_Substation.csv' INTO TABLE dim_substation
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`SubstationID`, `Substation`, `ZoneID`, `Capacity_MVA`, `Voltage_kV`);

-- dim_smartmeter
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Dim_SmartMeter.csv' INTO TABLE dim_smartmeter
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`MeterID`, `SubstationID`, `ZoneID`, `Customer_Category`, `Rooftop_Solar`);

-- dim_ev_station
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Dim_EV_Station.csv' INTO TABLE dim_ev_station
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`StationID`, `Station_Name`, `ZoneID`, `Zone`, `Latitude`, `Longitude`, `AC_Chargers`, `DC_Chargers`);

-- dim_date
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Dim_Date.csv' INTO TABLE dim_date
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`Date`, `Day_Name`, `Week`, `Month`, `Is_Weekend`);

-- plant_live
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Plant_Live.csv' INTO TABLE plant_live
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`Timestamp`, `PlantID`, `Plant_Name`, `Output_MW`, `Availability_Pct`, `Status`, `Plant_Load_Factor_Pct`, @v_Efficiency_Pct, `Equipment_Temp_C`, @v_Wind_Speed_ms, @v_Solar_Irradiance_Wm2, @v_Reservoir_Level_Pct, `CO2_t`, `Ambient_Temp_C`, `Humidity_Pct`, @v_Vibration_mm_s, @v_Heat_Rate_kcal_kWh, @v_Coal_Consumption_t, `Revenue_INR`, `Alert_Level`)
SET `Efficiency_Pct` = NULLIF(@v_Efficiency_Pct, ''), `Wind_Speed_ms` = NULLIF(@v_Wind_Speed_ms, ''), `Solar_Irradiance_Wm2` = NULLIF(@v_Solar_Irradiance_Wm2, ''), `Reservoir_Level_Pct` = NULLIF(@v_Reservoir_Level_Pct, ''), `Vibration_mm_s` = NULLIF(@v_Vibration_mm_s, ''), `Heat_Rate_kcal_kWh` = NULLIF(@v_Heat_Rate_kcal_kWh, ''), `Coal_Consumption_t` = NULLIF(@v_Coal_Consumption_t, '');

-- fleet_live
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Fleet_Live.csv' INTO TABLE fleet_live
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`Timestamp`, `Thermal_MW`, `Gas_MW`, `Hydro_MW`, `Wind_MW`, `Solar_MW`, `Total_MW`, `Clean_Energy_Pct`, `CO2_t`, `Capacity_Available_MW`, `Fleet_Availability_Pct`, `Plants_On_Outage`, `System_Frequency_Hz`);

-- plant_daily
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Plant_Daily.csv' INTO TABLE plant_daily
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`Date`, `PlantID`, `Plant_Name`, `Generation_MU`, `PLF_Pct`, `Availability_Pct`, @v_Coal_Stock_Days, `Revenue_Cr`, `CO2_t`)
SET `Coal_Stock_Days` = NULLIF(@v_Coal_Stock_Days, '');

-- outage_log
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Outage_Log.csv' INTO TABLE outage_log
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`OutageID`, `PlantID`, `Plant_Name`, `Start_Time`, `End_Time`, `Duration_hr`, `MW_Lost`, `Outage_Type`, `Reason`);

-- grid_live
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Grid_Live.csv' INTO TABLE grid_live
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`Timestamp`, `ZoneID`, `Zone`, `Demand_MW`, `Supply_MW`, `Unserved_MW`, `Frequency_Hz`, `Voltage_pu`, `Ambient_Temp_C`, `Power_Factor`, `Technical_Loss_Pct`, `Reactive_MVAr`, `Peak_Flag`, `Grid_Status`);

-- substation_health
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Substation_Health.csv' INTO TABLE substation_health
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`Timestamp`, `SubstationID`, `Load_Pct`, `Transformer_Temp_C`, `Fault_Flag`, `Load_MVA`, `Oil_Temp_C`, `Tap_Position`, `Status`);

-- smartmeter_live
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/SmartMeter_Live.csv' INTO TABLE smartmeter_live
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`Timestamp`, `MeterID`, `Consumption_kWh`, `Solar_Export_kWh`, `Voltage_V`, `Current_A`, `Power_Factor`, `Tamper_Flag`, `Reading_Status`);

-- ev_sessions
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/EV_Sessions.csv' INTO TABLE ev_sessions
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`SessionID`, `Start_Time`, `StationID`, `Zone`, `Charger_Type`, `Vehicle_Type`, `kWh_Delivered`, `Duration_min`, `Revenue_INR`, `Payment_Mode`, `Connector_Type`, `Start_SoC_Pct`, `End_SoC_Pct`);

-- billing
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Billing.csv' INTO TABLE billing
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`CustomerID`, `ZoneID`, `Customer_Category`, `Smart_Meter`, `Rooftop_Solar`, `Billing_Month`, `Units_kWh`, `Peak_Units_kWh`, `Tariff_INR_per_kWh`, `Amount_INR`, `Late_Fee_INR`, `Due_Date`, `Payment_Status`);

-- alerts
LOAD DATA LOCAL INFILE 'C:/Tata_Power_360_MySQL/data/Alerts.csv' INTO TABLE alerts
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
(`AlertID`, `Timestamp`, `Category`, `EntityID`, `Entity_Name`, `Severity`, `Alert_Type`, `Message`, `Metric_Value`, `Acknowledged`);
