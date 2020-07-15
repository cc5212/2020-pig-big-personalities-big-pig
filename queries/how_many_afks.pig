personalities = LOAD 'hdfs://cm:9000//uhadoop2020/tvallejos/personalities-sample-wo.tsv' USING PigStorage('\t') AS (EXT1,EXT2,EXT3,EXT4,EXT5,EXT6,EXT7,EXT8,EXT9,EXT10,EST1,EST2,EST3,EST4,EST5,EST6,EST7,EST8,EST9,EST10,AGR1,AGR2,AGR3,AGR4,AGR5,AGR6,AGR7,AGR8,AGR9,AGR10,CSN1,CSN2,CSN3,CSN4,CSN5,CSN6,CSN7,CSN8,CSN9,CSN10,OPN1,OPN2,OPN3,OPN4,OPN5,OPN6,OPN7,OPN8,OPN9,OPN10,EXT1_E,EXT2_E,EXT3_E,EXT4_E,EXT5_E,EXT6_E,EXT7_E,EXT8_E,EXT9_E,EXT10_E,EST1_E,EST2_E,EST3_E,EST4_E,EST5_E,EST6_E,EST7_E,EST8_E,EST9_E,EST10_E,AGR1_E,AGR2_E,AGR3_E,AGR4_E,AGR5_E,AGR6_E,AGR7_E,AGR8_E,AGR9_E,AGR10_E,CSN1_E,CSN2_E,CSN3_E,CSN4_E,CSN5_E,CSN6_E,CSN7_E,CSN8_E,CSN9_E,CSN10_E,OPN1_E,OPN2_E,OPN3_E,OPN4_E,OPN5_E,OPN6_E,OPN7_E,OPN8_E,OPN9_E,OPN10_E,dateload,screenw,screenh,introelapse,testelapse,endelapse,IPC,country,lat_appx_lots_of_err,long_appx_lots_of_err);

g_count = foreach (group personalities all) generate COUNT(personalities) as count;

sum = FOREACH personalities GENERATE introelapse + testelapse + endelapse as time_in_test, g_count.count as count;

mean = FOREACH (GROUP sum ALL) generate sum.time_in_test as time_in_test, sum.count as count, AVG(sum.time_in_test) as avg;

dif = FOREACH sum GENERATE (time_in_test - mean.avg) * (time_in_test - mean.avg) as dif2,count;

sumsqr = FOREACH (group dif all) GENERATE SUM(dif.dif2) as sumsqr, g_count.count as count;

tmp = foreach sumsqr GENERATE sumsqr/count as tmp;

std = foreach tmp GENERATE SQRT(tmp) as std;

afk = filter sum by time_in_test > (mean.avg + 2 * std.std);

afk_count = foreach afk GENERATE COUNT(afk);
