DROP TABLE IF EXISTS tim_hive_r_demo_new;
CREATE TABLE tim_hive_r_demo_new (
       users double,
       rating double)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

add FILE map.R;
add FILE reduce.R;
FROM  
(
        map users, rating, grp
        using 'map.R'
        as users, rating, grp
        FROM my_hive_r_demo 
        cluster by users
) a
  INSERT OVERWRITE TABLE tim_hive_r_demo_new
  reduce a.users, a.rating
  USING 'reduce.R'
  AS users, rating;

