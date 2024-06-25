# Enterprise-in-Wartime
Analyzing the Impact of Full-Scale War on Businesses in Ukraine
This report examines the impact of the full-scale invasion on February 24, 2022, on Ukrainian businesses and assesses their current recovery efforts.  While acknowledging the limitations of available data, the report provides valuable insights into the overall situation.

## Technology
**Data**: https://data.gov.ua/dataset/7436ae83-dfc1-4836-9962-8af3e831c522

**Data Cleaning & Export:** Python 

**Data Analysis:** MySQL

**Data Visualisation:** PowerBI

## Process 
On the DIIA Open Data Portal, I downloaded balance sheet and income statement data provided by the State Statistics Service of Ukraine for the years 2023, 2022, and 2021. The data, in XML format, consisted of 82,912 files, raising my expectations for a big number of statements from various companies. However, I later discovered that the data covered only about 18,328 enterprises, with many having multiple versions of their statements.

To upload the data on database, I first had to clean it, after which I created an XSD to establish a precise schema for the data. Since each statement included information for both the current and previous years, I chose to load the previous year's data as separate rows to ensure having enough of information for further analysis. After various steps, I successfully loaded the data into a MySQL database, allowing me to finally start analyzing the statements.







