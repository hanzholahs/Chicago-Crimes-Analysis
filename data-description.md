# Crimes - 2001 to Present

The dataset is downloaded from: https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2

## Information

**Updated:** October 15, 2023

**Data Provided by:** Chicago Police Department

**Metadata:**
- Data Owner: Police
- Time Period: 2001 to present, minus the most recent seven days
- Frequency: Data are updated daily.

**Topics:**
- Category: Public Safety
- Tags: crime,police

**Licensing and Attribution:**
- License: See Terms of Use
- Source Link: https://portal.chicagopolice.org/portal/page/portal/ClearPath

## Description

This dataset reflects reported incidents of crime (with the exception of murders where data exists for each victim) that occurred in the City of Chicago from 2001 to present, minus the most recent seven days. Data is extracted from the Chicago Police Department's CLEAR (Citizen Law Enforcement Analysis and Reporting) system. In order to protect the privacy of crime victims, addresses are shown at the block level only and specific locations are not identified. Should you have questions about this dataset, you may contact the Data Fulfillment and Analysis Division of the Chicago Police Department at DFA@ChicagoPolice.org.

Disclaimer: These crimes may be based upon preliminary information supplied to the Police Department by the reporting parties that have not been verified. The preliminary crime classifications may be changed at a later date based upon additional investigation and there is always the possibility of mechanical or human error. Therefore, the Chicago Police Department does not guarantee (either expressed or implied) the accuracy, completeness, timeliness, or correct sequencing of the information and the information should not be used for comparison purposes over time. The Chicago Police Department will not be responsible for any error or omission, or for the use of, or the results obtained from the use of this information. All data visualizations on maps should be considered approximate and attempts to derive specific addresses are strictly prohibited. The Chicago Police Department is not responsible for the content of any off-site pages that are referenced by or that reference this web page other than an official City of Chicago or Chicago Police Department web page. The user specifically acknowledges that the Chicago Police Department is not responsible for any defamatory, offensive, misleading, or illegal conduct of other users, links, or third parties and that the risk of injury from the foregoing rests entirely with the user. The unauthorized use of the words "Chicago Police Department," "Chicago Police," or any colorable imitation of these words or the unauthorized use of the Chicago Police Department logo is unlawful. This web page does not, in any way, authorize such use. Data are updated daily. 

To access a list of Chicago Police Department - Illinois Uniform Crime Reporting (IUCR) codes, go to http://data.cityofchicago.org/Public-Safety/Chicago-Police-Department-Illinois-Uniform-Crime-R/c7ck-438e

## What's in this Dataset?

| Rows | Columns | Each row is a|
|  --- | --- | --- |
| 7.91M | 22 | Reported Crime |

## Columns in this Dataset

|Column Name|Description|Type|
|---|---|---|
|ID|Unique identifier for the record.|Number||
|Case Number|The Chicago Police Department RD Number (Records Division Number), which is unique to the incident.|Plain Text||
|Date|Date when the incident occurred. this is sometimes a best estimate.|Date & Time||
|Block|The partially redacted address where the incident occurred, placing it on the same block as the actual address.|Plain Text||
|IUCR|The Illinois Unifrom Crime Reporting code. This is directly linked to the Primary Type and Description. See the list of IUCR codes at [https://data.cityofchicago.org/d/c7ck-438e](https://data.cityofchicago.org/d/c7ck-438e).|Plain Text||
|Primary Type|The primary description of the IUCR code.|Plain Text||
|Description|The secondary description of the IUCR code, a subcategory of the primary description.|Plain Text||
|Location Description|Description of the location where the incident occurred.|Plain Text||
|Arrest|Indicates whether an arrest was made.|Checkbox||
|Domestic|Indicates whether the incident was domestic-related as defined by the Illinois Domestic Violence Act.|Checkbox||
|Beat|Indicates the beat where the incident occurred. A beat is the smallest police geographic area – each beat has a dedicated police beat car. Three to five beats make up a police sector, and three sectors make up a police district. The Chicago Police Department has 22 police districts. See the beats at [https://data.cityofchicago.org/d/aerh-rz74](https://data.cityofchicago.org/d/aerh-rz74).|Plain Text||
|District|Indicates the police district where the incident occurred. See the districts at [https://data.cityofchicago.org/d/fthy-xz3r](https://data.cityofchicago.org/d/fthy-xz3r).|Plain Text||
|Ward|The ward (City Council district) where the incident occurred. See the wards at [https://data.cityofchicago.org/d/sp34-6z76](https://data.cityofchicago.org/d/sp34-6z76).|Number||
|Community Area|Indicates the community area where the incident occurred. Chicago has 77 community areas. See the community areas at [https://data.cityofchicago.org/d/cauq-8yn6](https://data.cityofchicago.org/d/cauq-8yn6).|Plain Text||
|FBI Code|Indicates the crime classification as outlined in the FBI's National Incident-Based Reporting System (NIBRS). See the Chicago Police Department listing of these classifications at [http://gis.chicagopolice.org/clearmap_crime_sums/crime_types.html](http://gis.chicagopolice.org/clearmap_crime_sums/crime_types.html).|Plain Text||
|X Coordinate|The x coordinate of the location where the incident occurred in State Plane Illinois East NAD 1983 projection. This location is shifted from the actual location for partial redaction but falls on the same block.|Number||
|Y Coordinate|The y coordinate of the location where the incident occurred in State Plane Illinois East NAD 1983 projection. This location is shifted from the actual location for partial redaction but falls on the same block.|Number||
|Year|Year the incident occurred.|Number||
|Updated On|Date and time the record was last updated.|Date & Time||
|Latitude|The latitude of the location where the incident occurred. This location is shifted from the actual location for partial redaction but falls on the same block.|Number||
|Longitude|The longitude of the location where the incident occurred. This location is shifted from the actual location for partial redaction but falls on the same block.|Number||
|Location|The location where the incident occurred in a format that allows for creation of maps and other geographic operations on this data portal. This location is shifted from the actual location for partial redaction but falls on the same block.|Location||
