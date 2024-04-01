# Data Engineering Zoomcamp Final Project:

**Data source choosen **
  from: https://capitalbikeshare.com/system-data
Data published by month and comes in csv format.  

### **Let's get the know about the data:**

Our dataset captures the dynamics of bike rentals, encompassing details such as rental timestamps, start and finish station locations, bike types, and membership types of riders. This rich dataset enables us to analyze usage patterns, optimize bike distribution, and tailor membership offerings to enhance the overall user experience.

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

This data has been processed to remove trips that are taken by staff as they service and inspect the system, trips that are taken to/from any of our “test” stations at our warehouses and any trips lasting less than 60 seconds (potentially false starts or users trying to re-dock a bike to ensure it's secure).

## Tech Stack:
- **Google Cloud Storage**: Utilized as our primary data lake solution to store raw data. 
- **Google BigQuery**: Data warehouse that stores our processed and structured data, ready for complex queries and analysis.
- **Mage**:  Mage acts as the orchestration layer in our data pipeline. It automates the flow of data from various sources, transforms the data into a more analytics-friendly format (parquet), and manages the storage of this data in GCS. It also efficiently handles the transfer of processed data into BigQuery for further analysis.
- **Docker**: Mage environment is containerized using Docker. 
- **Looker Studio**: Serves as our data visualization tool.


## How data processed?

Used Mage to process data. Consists of 4 steps. 
Load data from source.
bike_to_gcp_parquet (Data Exporter) converts source csv files to parquet format and exports the data in gcs.
load_gcs block load the parquet files to export big_query
load_gcs_to_big_query

<img width="646" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/18f13536-7d6d-41c8-9606-5386c6afc23e">

https://lookerstudio.google.com/s/rSVxjildIjE
## How data evaluated?
Used google looker studio. 
<img width="792" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/009683b8-038f-4cf9-8a1f-05118235ad39">

New fields added. 
geo_star and geo_end (latitude, longitude) for geo location used in heat map. 
start_at month and years to use in visuals.

<img width="1078" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/0c9b5cec-e175-4281-b5cf-571ad5034daf">

## **Questions answered and findings?**

Data covers 2022 and 2023
<img width="642" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/f96d16bf-5316-4e7d-8875-e8bc0efd7c15">


The top left can choose the date range.
- **Total rides**: 7,944,116
- **User Type**: 61.2% of the rides are by members
- **Bike Types** 71.6% Classic (Most used bike type)

**Rides by month:**

<img width="631" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/16c53b29-2e51-488f-bc7f-8055f3064073">

We can see the direct effect of weather 
- Most popular months for rides are July, August and September
- Least popular months are December, February and January

Which stations are popular? 
There are null start and end stations. I want to keep them in total numbers 
but to determine popular stations, I filtered the null values for accuracy by adding filter in table setup. 


<img width="718" alt="image" src="https://github.com/aytechz/capital_bikeshare_zoomcamp_data_project/assets/42274990/97c3f3c8-43ec-4173-98cb-2fe285a0f5a5">


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
  






 




  


