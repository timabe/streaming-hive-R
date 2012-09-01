streaming-hive-R
================
Tutorial on using R functions for MapReduce in Hadoop Hive. 

### In R
load(url('https://www.dropbox.com/sh/czicmdgeciugh2g/8E_eqT0osY/hive_df.Rdata'))
### write file as demo.txt to directory where you access Hadoop.

### In Hadoop
hadoop dfs -mkdir /user/tabraham/demo
hadoop dfs -put demo.txt /user/tabraham/demo/

### Make data accessible in hive

hive

# Now in hive create table

DROP TABLE IF EXISTS my_hive_r_demo;
CREATE EXTERNAL TABLE my_hive_r_demo(users int, rating double)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE
LOCATION '/user/tabraham/demo/';

# Test to see that everything went to plan

set hive.cli.print.header=true; select * from my_hive_r_demo limit 10;

# Should see this output
users    rating
1        7.50102978077378
1        8.16001579613901
1        8.2207013654759
1        8.08969763594036
1        8.02185649420374
1        7.32446772249964
1        7.99874786335045
1        7.80794715362293
1        7.5859102184561
1        8.02276625313363