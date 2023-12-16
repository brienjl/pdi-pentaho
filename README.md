# Introduction
This repository contains example data and common activities used for ETL and Data Engineering using Pentaho Data Integration (PDI) Community Edition.

More on Pentaho and it's use cases and features can be found [here](https://help.hitachivantara.com/Documentation/Pentaho/Data_Integration_and_Analytics/9.1/Products/Pentaho_Data_Integration).

## Required Software
Here's a full guide on [installing Pentaho](https://www.hitachivantara.com/en-us/pdf/implementation-guide/three-steps-to-install-pentaho-data-integration-ce.pdf).

### TL;DR
1. Download and install the latest Java JDK at [Java Downloads | Oracle](https://www.oracle.com/java/technologies/downloads/#jdk21-windows). 
2. Use the 'Base Install' of [Pentaho Community Edition | Hitachi Vantara](https://www.hitachivantara.com/en-us/products/pentaho-plus-platform/data-integration-analytics/pentaho-community-edition.html).
3. Extract the files into a new folder in your machine's Program Files (pc) or Applicaitons Folder (mac).
4. Run the *spoon.bat* file and Pentaho should fire up.

---

### Extracting Tabular Data - Customer Data
*Tabular data* in this context refers to data in *text/tab, csv, excel* files. 

For example tabular data extractions, we'll first look at the example **Customer Data** I've uploaded to this repo and the types of use cases we would use Pentaho for.

**Examples:** can be found in the **tabular-extractions.ktr** file in the [extractions](extractions/tabular-extractions.ktr) folder. 

The following use cases are:
* manually generated data grids within pentaho
* tab deliminated text files
* csv files
* multiple csv files
* excel files
* zip files containing multiple csv files

All of the sample data can be found in the **customers** folder under [sample data](sample-data) folder. 

#### Basic Tabular Data Workflow
Select the Input Transformation
* [Data grid](https://pentaho-public.atlassian.net/wiki/spaces/EAI/pages/386800034/Data+Grid) for small sample data and testing
* [Text file input](https://help.hitachivantara.com/Documentation/Pentaho/Data_Integration_and_Analytics/9.4/Products/Text_File_Input) for single and multi-file inputs where you can use Regex on the file string to select multiple files. Can also be used for multiple files compressed in ZIP folder.
* [Microsoft Excel Input](https://help.hitachivantara.com/Documentation/Pentaho/Data_Integration_and_Analytics/9.4/Products/Microsoft_Excel_Input) for excel and multi sheet inputs 

In all of the above Inputs, you'll want to configure the meta-data fields so they are named exactly the same, in the same order, of the same type, and have the same length. 

Next, you'll do some sorting on each of the inputs based on a given key by using
* [Sort rows](https://help.hitachivantara.com/Documentation/Pentaho/Data_Integration_and_Analytics/9.4/Products/Sort_rows) to sort each of the inputs by either ASC or DESC order. This is a pre-processing step before you merge all of these seperate data streams into a single data stream

Next, you'll merge the data streams into single "Customers" stream.
* [Sorted Merge](https://pentaho-public.atlassian.net/wiki/spaces/EAI/pages/371558198/Sorted+Merge) using the key used from the Sort Rows step before.

Finally, remove duplicate data.
* [Unique Rows](https://help.hitachivantara.com/Documentation/Pentaho/Data_Integration_and_Analytics/9.4/Products/Unique_Rows) to remove duplicate rows from the merged data stream.

![Tabular Data Extraction Simplified](ref-images/tabular-extractions-simple.JPG "Tabular Data Extraction Simplified.")

---

