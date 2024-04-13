# Data Engineering Zoomcamp Final Project:

**Data source choosen **
  from: https://capitalbikeshare.com/system-data
Data is published by month and comes in CSV format.  

### **Understanding the Data:**

Our dataset captures the dynamics of bike rentals, including details such as rental timestamps, start and finish station locations, bike types, and riders' membership types. This rich dataset allows us to analyze usage patterns, optimize bike distribution, and tailor membership offerings to enhance the overall user experience.

- **Duration** – Duration of trip
- **Start Date** – Includes start date and time
- **End Date** – Includes end date and time
- **Start Station** – Includes starting station name and number
- **End Station** – Includes ending station name and number
- **Bike Number** – Includes ID number of bike used for the trip
**Member Type** – Indicates whether user was a "registered" member (Annual Member, 30-Day Member or Day Key Member) or a "casual" rider (Single Trip, 24-Hour Pass, 3-Day Pass or 5-Day Pass)

            'ride_id': str,
            'rideable_type': str,
            'start_station_name': str,
            'start_station_id': pd.Int64Dtype(),
            'end_station_name': str,
            'end_station_id': pd.Int64Dtype(),
            'start_lat': float,
            'start_lng': float,
            'end_lat': float,
            'end_lng': float,
            'member_casual': str

This data has been processed to exclude trips taken by staff for servicing and inspecting the system, trips to and from our "test" stations at our warehouses, and any trips lasting less than 60 seconds, which may represent false starts or attempts by users to re-dock a bike to ensure it is secure.

## Tech Stack:
- **Google Cloud Storage**: Serves as our primary data lake, used for storing raw data.
- **Google BigQuery**: A data warehouse that holds our processed and structured data, facilitating complex queries and analysis.
- **Mage**: Acts as the orchestration layer in our data pipeline. It automates the flow of data from various sources, transforms it into a more analytics-friendly format (Parquet), and manages the storage of this data in Google Cloud Storage. It also efficiently handles the transfer of processed data into Google BigQuery for further analysis.
- **Docker**: Used to containerize the Mage environment, ensuring consistency and scalability.
- **Looker Studio**: Our tool for data visualization, enabling insights through interactive dashboards and reports.
- 
## Data Processing Workflow
The data processing is managed using **Mage** and consists of four main steps:

1. **Load Data**: Data is initially loaded from the source.
2. **Data Exporter (`bike_to_gcp_parquet`)**: This component converts source CSV files into Parquet format, optimizing them for storage efficiency and access speed, and then exports the data to Google Cloud Storage (GCS).
3. **Load GCS Block**: This stage involves loading the Parquet files from GCS.
4. **Export to BigQuery (`load_gcs_to_big_query`)**: Finally, the processed data is loaded into Google BigQuery, allowing for advanced data analytics and querying capabilities.

<img width="646" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/18f13536-7d6d-41c8-9606-5386c6afc23e">

## How Data is Evaluated

Data evaluation is performed using **Google Looker Studio**. We leverage Looker Studio's robust visualization capabilities to analyze trends, performance, and patterns within the data. This approach helps in making data-driven decisions and enhances understanding through interactive dashboards and reports.

For a detailed view, visit our Looker Studio dashboard: [Google Looker Studio Dashboard](https://lookerstudio.google.com/s/rSVxjildIjE).
<img width="792" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/009683b8-038f-4cf9-8a1f-05118235ad39">

## New Fields Added

Several new fields have been added to enhance the analytical capabilities and visualization potential of our dataset:

- **geo_start** and **geo_end** (latitude, longitude): These fields provide the geographical coordinates of the start and end points of each bike rental. They are primarily used in generating heat maps to visualize spatial distribution and hotspot areas.

- **start_at_month** and **start_at_year**: These fields capture the month and year when the bike rental started. They are instrumental in creating time-based visualizations and analyzing trends over different time periods.


<img width="1078" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/0c9b5cec-e175-4281-b5cf-571ad5034daf">

## Questions Answered and Findings

The data covers the years **2022** and **2023**. Below are some of the key insights and analytics derived from the dataset:

![Data Visualization](https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/f96d16bf-5316-4e7d-8875-e8bc0efd7c15)

- The top-left corner of the dashboard allows users to choose the date range.
- **Total rides**: 7,944,116
- **User Type**: 61.2% of the rides are by members.
- **Bike Types**: 71.6% are Classic bikes, making them the most used type.

**Rides by Month:**

![Rides by Month](https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/16c53b29-2e51-488f-bc7f-8055f3064073)

- The impact of weather on biking habits is evident:
  - Most popular months for rides are **July, August**, and **September**.
  - Least popular months are **December, February**, and **January**.

**Popular Stations:**

![Popular Stations](https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/97c3f3c8-43ec-4173-98cb-2fe285a0f5a5)

- While there are null values for start and end stations, these have been retained in the total counts for completeness. However, to determine which stations are popular, null values were filtered out for accuracy by adjusting the table setup.


# How to run project and prerequisites:

- Google Cloud account.
- Clone repo: [https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project.git]
- Install Docker: 
- Run `docker compose build`
- Run `docker compose up`

- Create a service account. If you need a refresher on creating a GCP service account, check Week1 new service account section. Download the JSON key and place it in project.
- Find 'io_config.yaml and set the location for json file.
  - <img width="293" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/7043fb1f-477d-4db7-b35d-5a212ab5fd30">
   

Once Docker compose up done. Navigate to: [http://localhost:6789]
- Open capital_bikeshare pipeline.
- Click edit pipeline
<img width="561" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/eac5620d-dfb4-43e6-8129-4944c2edd09b">

- To process the set variable 2023 and run.
- Set the global variable for 2022 and run.

- Once all steps done you can check
    - GCS to see parquet raw files.
    - Check BiqQuery for bike_share table.
 
- You can make the connection for https://lookerstudio.google.com/ by using BigQuery.
  






 




  


