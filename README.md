# Energy Consumption Analytics Project

## 1. Business Problem
[cite_start]A national energy agency wants to analyze electricity consumption trends to improve energy efficiency and demand planning[cite: 34]. The goal of this project is to:
* Monitor household energy consumption trends over time.
* Identify regions with the highest energy demand.
* Analyze the cost of energy consumption based on different tariff plans.
* Highlight the top consuming households to target for energy-saving campaigns.

## 2. Data Source Description
[cite_start]The project utilizes two heterogeneous data sources[cite: 3]:

* **Source 1: CSV File (Fact Data)**
    * **Name:** `household_energy_consumption.csv`
    * [cite_start]**Description:** Contains daily energy consumption records (kWh) for various households, including dates and raw consumption data[cite: 6, 8].
    * **Link:** [Insert Link to your Dataset Here]

* **Source 2: SQL Server Database (Dimension Data)**
    * [cite_start]**Description:** A relational database created to store dimension tables that were not present in the CSV file[cite: 13, 16].
    * **Tables:**
        * `Regions`: Contains Region ID and standardized Region Names.
        * `Tariff_Plans`: Contains Tariff IDs and Rate per kWh.
        * `Households_SQL`: Serves as a bridge table linking households to specific regions and tariff plans.

## 3. ETL Steps (Power Query)
Data was extracted from CSV and SQL Server, then transformed using Power Query in Power BI. [cite_start]The following steps were applied[cite: 44, 45]:

1.  **Data Type Conversion:** Converted the `Date` column to Date type and `Household_ID` to Text to ensure accurate modeling.
2.  [cite_start]**Merging Queries (Step 1):** Merged the CSV data with the `Households_SQL` table to bring in `Tariff_ID` and `Region_ID`[cite: 49].
3.  **Merging Queries (Step 2):** Merged the result with the `Tariff_Plans` table to fetch the `Rate_per_kWh` for each transaction.
4.  [cite_start]**Calculated Column (Cost):** Created a custom column to calculate the estimated cost using the formula: `Cost = Energy_Consumption_kWh * Rate_per_kWh`[cite: 52].
5.  [cite_start]**Date Dimension:** Created a separate Date Dimension table derived from the source date column to enable time-intelligence analysis[cite: 53].

*(Place a screenshot of your Power Query steps here if available)*

## 4. Data Model
[cite_start]A **Star Schema** data model was designed to optimize performance and reporting[cite: 55].

* **Fact Table:** `Fact_Consumption` (Central table containing metrics like Usage and Cost).
* **Dimension Tables:** `Regions`, `Tariff_Plans`, `Households`, and `Date Dimension`.
* **Relationships:** One-to-Many relationships were established between Dimensions and the Fact table.

![Data Model](screenshots/model.png)
*(Note: Ensure the image file is in a folder named 'screenshots' in your repo)*

## 5. Dashboard & Visuals
[cite_start]The Power BI dashboard provides an interactive view of the energy data[cite: 62].

**Key Visuals:**
* [cite_start]**Line Chart:** Trends of energy consumption over time[cite: 69].
* [cite_start]**Bar Chart:** Total consumption breakdown by Region[cite: 70].
* [cite_start]**Bar Chart:** Consumption analysis by Household Type[cite: 71].
* [cite_start]**Table:** Top 10 households by energy consumption[cite: 72].

![Dashboard Screenshot](screenshots/dashboard.png)

## 6. KPIs and Insights
**Key Performance Indicators (KPIs):**
* [cite_start]**Total Energy Consumed:** The total kWh recorded across all households[cite: 64].
* [cite_start]**Estimated Energy Cost:** The total calculated cost based on tariff rates[cite: 67].
* [cite_start]**Average Household Consumption:** The average energy usage per household[cite: 65].

**Insights:**
* Identified specific regions that consume significantly more power than others.
* Observed consumption trends to pinpoint high-usage months or days.
* Highlighted the top 10 consumers who contribute most to the total load.

## 7. Recommendations
[cite_start]Based on the analysis[cite: 87]:
1.  **Targeted Campaigns:** Launch awareness campaigns in the highest-consuming regions identified in the dashboard.
2.  **Tariff Review:** Analyze if households on "Standard" plans are over-consuming compared to those on "Saver" plans.
3.  **Peak Load Management:** Encourage high-usage households to shift consumption to off-peak hours to reduce costs.

## 8. Challenges
* [cite_start]**Data Integration:** Connecting two different sources (CSV and SQL Server) required careful handling of data types to ensure successful merging[cite: 88].
* **Data Quality:** Ensuring that IDs matched perfectly between the CSV and SQL tables to avoid null values during joins.
* **Calculations:** Creating the correct logic for Cost calculation required expanding merged tables correctly.
