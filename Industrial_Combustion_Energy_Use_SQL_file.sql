create database energy;
use energy;
show tables;
desc industry;
drop table industry;
select * from industry;
#  Q1
select FUEL_TYPE,round(sum(MMBtu_TOTAL),2) as Total_MMBtu from industry where 
FUEL_TYPE in( "ethane","Ethanol (100%)") group by FUEL_TYPE;

# Q2
select FACILITY_NAME, round(avg(GWht_TOTAL),2) as Avg_of_GWht_Total from industry where 
FACILITY_NAME = "3M COMPANY";

# Q3 
select GWht_Total, UNIT_NAME from industry where UNIT_NAME between 1990 and 1950;

# Q4
 
 select MECS_Region, concat(round((sum(MMBtu_TOTAL) / (select sum(MMBtu_TOTAL) from industry)*100),2),"%") as MMBtu_percentage,
concat(round((sum(GWht_TOTAL) / (select sum(GWht_TOTAL) from industry)*100),2),"%") as GWht_percentage from industry
group by MECS_Region limit 4;
 

# Q.5
select distinct  PRIMARY_NAICS_TITLE,  count(distinct FACILITY_NAME) as Facility_Name , count(distinct FUEL_TYPE) as Fuel_type 
from industry group by PRIMARY_NAICS_TITLE;







