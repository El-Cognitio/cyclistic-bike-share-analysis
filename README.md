# Cyclistic Bike Share Analysis 2025-2026

## Overview
This project is the capstone of my Google Data Analytics Certificate. 
I analyzed over 5.5 million bike trips from Cyclistic, a fictional 
bike-share company based in Chicago, to answer one key business question: 
How do annual members and casual riders use Cyclistic bikes differently?

The insights from this analysis were used to design data-driven marketing 
strategies aimed at converting casual riders into annual members.

---

## Business Task
To analyze how annual members and casual riders use Cyclistic bikes 
differently, in order to provide data-driven insights that will help 
the marketing team design targeted strategies to convert casual riders 
into annual members.

---

## Tools Used
* **PostgreSQL** for data storage, cleaning, and analysis
* **pgAdmin 4** as the database interface
* **Microsoft Excel** for initial data exploration
* **Tableau Public** for data visualization and dashboard creation

---

## Data Source
The data was sourced externally from Motivate International Inc., made 
publicly available under their open data license. It consists of 12 months 
of historical bike trip records covering May 2025 to April 2026, totaling 
over 5.7 million rows before cleaning.

Each row represents a single bike trip and contains fields including ride 
ID, bike type, start and end timestamps, station names and IDs, geographic 
coordinates, and rider membership status. No personally identifiable 
information is included in the dataset.

---

## Data Cleaning Summary
The raw dataset contained 5,697,455 rows. After cleaning, 5,535,652 rows 
remained. The following issues were identified and addressed:

* Rides with zero duration were removed. These belonged almost exclusively 
to electric bikes and were consistent with accidental unlocks.
* Rides under 60 seconds were removed. Analysis showed 22,790 of these 
belonged to electric bikes, and casual riders had more of such trips, 
likely due to unfamiliarity with the docking system.
* Rows with missing end coordinates (693 rows) were removed as they 
could not be recovered.
* Blank station names were retained. These belonged to electric bike 
trips that do not require fixed docking stations and were not relevant 
to the core analysis.

Two calculated columns were added after cleaning:

* **ride_length**: the duration of each trip, calculated as ended_at 
minus started_at.
* **day_of_week**: the day each trip started, where 1 represents Sunday 
and 7 represents Saturday.

---

## Key Findings

**1. Purpose of Riding**
Members ride primarily for commuting while casual riders ride mainly 
for leisure and recreation.

**2. Peak Hours**
Members show a classic double peak at 7 to 8am and 4 to 5pm, aligning 
with typical work commute hours. Casual riders show a single gradual 
peak in the late afternoon, suggesting relaxed leisure riding.

**3. Day of Week**
Members ride most on weekdays, peaking on Thursday. Casual riders peak 
on weekends, particularly Saturday.

**4. Seasonality**
Both groups peak in August and decline in winter. Casual riders drop 
by 91.6% in December compared to August, while members drop by only 
75.3%, confirming that casual riders are weather-dependent leisure 
riders while members ride out of necessity.

**5. Ride Length**
Casual riders average 19 minutes 46 seconds per ride compared to 
members at 12 minutes 16 seconds. This suggests casual riders take 
scenic leisure routes while members take short direct commute routes.

**6. Total Rides**
Members account for 64.7% of all rides (3,582,607) while casual riders 
account for 35.3% (1,953,045).

**7. Bike Type**
Both groups prefer electric bikes at approximately 65% of rides. Members 
use classic bikes proportionally more, possibly due to comfort on familiar 
commute routes.

**8. Station Analysis**
The top 10 casual rider stations are concentrated around Chicago's major 
tourist and leisure attractions, particularly along the lakefront. Navy 
Pier leads with 32,173 casual rides, followed by DuSable Lake Shore Drive 
and Millennium Park. This confirms that casual riders are leisure and 
tourist riders.

---

## Recommendations

**1. Seasonal and Time Targeted Marketing Campaign**
Target casual riders during peak summer months (June to August) and 
specifically during evening hours (4pm to 6pm) when casual ridership 
is highest. This ensures marketing messages reach the maximum number 
of casual riders when they are most engaged and enjoying their experience.

**2. Strategic Location Based Marketing**
Place physical marketing materials such as billboards, posters, and 
flyers at the top 10 casual rider stations, all concentrated around 
Chicago's lakefront and tourist attractions including Navy Pier, 
Millennium Park, and DuSable Lake Shore Drive. Additionally, place 
billboards along popular sightseeing routes since casual riders take 
longer scenic rides.

**3. In-App Conversion Marketing**
Trigger a personalized membership conversion message immediately after 
every casual rider completes a payment, highlighting cost savings. After 
three or more rides, trigger a more aggressive offer reminding them how 
much they could be saving with a membership.

**4. Weekend Warrior Campaign**
Since casual riders peak on Saturdays and Sundays, launch a targeted 
weekend campaign branded as "Weekend Warrior to Everyday Rider." Offer 
a discounted first month membership exclusively on weekends, targeting 
riders immediately after completing their weekend ride.

---

## Dashboard
View the interactive Tableau dashboard here:
[Cyclistic Bike Share Dashboard](https://public.tableau.com/views/CyclisticBikeShareAnalysis2025-2026/CyclisticBikeShareCasualvsMemberAnalysis2025-2026)

---

## Project Journey
This project was not just a technical exercise. It was a journey.

I started with no idea where to begin. The dataset was large, the tools 
were unfamiliar, and the path forward was unclear. I tried Excel first 
and watched it freeze under the weight of 789,000 rows. I attempted 
BigQuery and ran into billing restrictions. I set up PostgreSQL from 
scratch, learned to write cleaning queries, and eventually imported 
all 12 months of data into a single database.

Along the way I discovered things the case study never told me to look 
for. I found that blank station names belonged exclusively to electric 
bikes. I identified that sub-minute rides were likely accidental unlocks 
by casual riders unfamiliar with the system. And I independently 
connected the top casual rider stations to Chicago's tourist attractions, 
an insight that directly shaped the marketing recommendations.

Building the dashboard came with its own set of challenges. After 
completing all 8 visualizations in Tableau Desktop, I discovered that 
the option to publish directly to Tableau Public was greyed out on the 
trial version. I explored exporting the workbook as a packaged .twbx 
file and opening it in Tableau Public Desktop, only to be met with 
another error. Tableau Public does not support PostgreSQL connections, 
so the workbook could not load the data.

I switched to extracting the data locally, but that introduced a new 
problem. My dataset contained over 5.5 million rows and Tableau Public 
only allows a maximum of 1 million rows. Rather than give up, I went 
back to PostgreSQL and wrote aggregation queries to summarize the data 
into 7 compact CSV files, each containing only the grouped statistics 
needed for each chart. The largest file had 48 rows. I then rebuilt 
the entire dashboard in Tableau Public Desktop using these summary 
tables and successfully published it.

Every obstacle taught me something. Every finding built my confidence. 
This capstone represents not just the completion of a certificate but 
the beginning of my journey as a data analyst.

---

## Certificate
Google Data Analytics Professional Certificate
Completed: 2026
Platform: Coursera

---

## Contact
**Name:** Oluwatimilehin Owoeye  
**LinkedIn:** [Oluwatimilehin Owoeye](https://www.linkedin.com/in/oluwatimilehin-owoeye-08a709192)  
**Tableau Public:** https://public.tableau.com/app/profile/oluwatimilehin.owoeye
**Kaggle:** https://www.kaggle.com/oluwatimilehinowoeye
