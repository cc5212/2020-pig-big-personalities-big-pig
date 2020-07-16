-- LOAD FILE

personalities = LOAD 'hdfs://cm:9000//uhadoop2020/tvallejos/personalities-sample-wo.tsv' USING PigStorage('\t') AS (EXT1,EXT2,EXT3,EXT4,EXT5,EXT6,EXT7,EXT8,EXT9,EXT10,EST1,EST2,EST3,EST4,EST5,EST6,EST7,EST8,EST9,EST10,AGR1,AGR2,AGR3,AGR4,AGR5,AGR6,AGR7,AGR8,AGR9,AGR10,CSN1,CSN2,CSN3,CSN4,CSN5,CSN6,CSN7,CSN8,CSN9,CSN10,OPN1,OPN2,OPN3,OPN4,OPN5,OPN6,OPN7,OPN8,OPN9,OPN10,EXT1_E,EXT2_E,EXT3_E,EXT4_E,EXT5_E,EXT6_E,EXT7_E,EXT8_E,EXT9_E,EXT10_E,EST1_E,EST2_E,EST3_E,EST4_E,EST5_E,EST6_E,EST7_E,EST8_E,EST9_E,EST10_E,AGR1_E,AGR2_E,AGR3_E,AGR4_E,AGR5_E,AGR6_E,AGR7_E,AGR8_E,AGR9_E,AGR10_E,CSN1_E,CSN2_E,CSN3_E,CSN4_E,CSN5_E,CSN6_E,CSN7_E,CSN8_E,CSN9_E,CSN10_E,OPN1_E,OPN2_E,OPN3_E,OPN4_E,OPN5_E,OPN6_E,OPN7_E,OPN8_E,OPN9_E,OPN10_E,dateload,screenw,screenh,introelapse,testelapse,endelapse,IPC,country,lat_appx_lots_of_err,long_appx_lots_of_err);

--Reduce Columns

personalities_reduce = FOREACH personalities generate EXT1,EXT2,EXT3,EXT4,EXT5,EXT6,EXT7,EXT8,EXT9,EXT10,EST1,EST2,EST3,EST4,EST5,EST6,EST7,EST8,EST9,EST10,AGR1,AGR2,AGR3,AGR4,AGR5,AGR6,AGR7,AGR8,AGR9,AGR10,CSN1,CSN2,CSN3,CSN4,CSN5,CSN6,CSN7,CSN8,CSN9,CSN10,OPN1,OPN2,OPN3,OPN4,OPN5,OPN6,OPN7,OPN8,OPN9,OPN10;

----------------------------------------EXT------------------------------------------------------------
--EXT1
g_personalities_EXT1 = foreach (GROUP personalities_reduce BY EXT1) generate $0 AS EXT1, COUNT($1) AS COUNT_EXT1;   
sp_EXT1 = foreach (Group (Filter g_personalities_EXT1 by EXT1 >3) all) generate CONCAT('EXT1', ''),SUM($1.$1);
total_EXT1 = foreach (Group g_personalities_EXT1 all) generate CONCAT('EXT1', ''),SUM($1.$1);
r_EXT1 = Foreach (JOIN sp_EXT1 by $0 , total_EXT1 by $0) generate $0,((double)$1)/$3;

--EXT2
g_personalities_EXT2 = foreach (GROUP personalities_reduce BY EXT2) generate $0 AS EXT2, COUNT($1) AS COUNT_EXT2;   
sp_EXT2 = foreach (Group (Filter g_personalities_EXT2 by EXT2 >3) all) generate CONCAT('EXT2', ''),SUM($1.$1);
total_EXT2 = foreach (Group g_personalities_EXT2 all) generate CONCAT('EXT2', ''),SUM($1.$1);
r_EXT2 = Foreach (JOIN sp_EXT2 by $0 , total_EXT2 by $0) generate $0,((double)$1)/$3;

--EXT3
g_personalities_EXT3 = foreach (GROUP personalities_reduce BY EXT3) generate $0 AS EXT3, COUNT($1) AS COUNT_EXT3;   
sp_EXT3 = foreach (Group (Filter g_personalities_EXT3 by EXT3 >3) all) generate CONCAT('EXT3', ''),SUM($1.$1);
total_EXT3 = foreach (Group g_personalities_EXT3 all) generate CONCAT('EXT3', ''),SUM($1.$1);
r_EXT3 = Foreach (JOIN sp_EXT3 by $0 , total_EXT3 by $0) generate $0,((double)$1)/$3;

--EXT4
g_personalities_EXT4 = foreach (GROUP personalities_reduce BY EXT4) generate $0 AS EXT4, COUNT($1) AS COUNT_EXT4;   
sp_EXT4 = foreach (Group (Filter g_personalities_EXT4 by EXT4 >3) all) generate CONCAT('EXT4', ''),SUM($1.$1);
total_EXT4 = foreach (Group g_personalities_EXT4 all) generate CONCAT('EXT4', ''),SUM($1.$1);
r_EXT4 = Foreach (JOIN sp_EXT4 by $0 , total_EXT4 by $0) generate $0,((double)$1)/$3;

--EXT5
g_personalities_EXT5 = foreach (GROUP personalities_reduce BY EXT5) generate $0 AS EXT5, COUNT($1) AS COUNT_EXT5;   
sp_EXT5 = foreach (Group (Filter g_personalities_EXT5 by EXT5 >3) all) generate CONCAT('EXT5', ''),SUM($1.$1);
total_EXT5 = foreach (Group g_personalities_EXT5 all) generate CONCAT('EXT5', ''),SUM($1.$1);
r_EXT5 = Foreach (JOIN sp_EXT5 by $0 , total_EXT5 by $0) generate $0,((double)$1)/$3;

--EXT6
g_personalities_EXT6 = foreach (GROUP personalities_reduce BY EXT6) generate $0 AS EXT6, COUNT($1) AS COUNT_EXT6;   
sp_EXT6 = foreach (Group (Filter g_personalities_EXT6 by EXT6 >3) all) generate CONCAT('EXT6', ''),SUM($1.$1);
total_EXT6 = foreach (Group g_personalities_EXT6 all) generate CONCAT('EXT6', ''),SUM($1.$1);
r_EXT6 = Foreach (JOIN sp_EXT6 by $0 , total_EXT6 by $0) generate $0,((double)$1)/$3;

--EXT7
g_personalities_EXT7 = foreach (GROUP personalities_reduce BY EXT7) generate $0 AS EXT7, COUNT($1) AS COUNT_EXT7;   
sp_EXT7 = foreach (Group (Filter g_personalities_EXT7 by EXT7 >3) all) generate CONCAT('EXT7', ''),SUM($1.$1);
total_EXT7 = foreach (Group g_personalities_EXT7 all) generate CONCAT('EXT7', ''),SUM($1.$1);
r_EXT7 = Foreach (JOIN sp_EXT7 by $0 , total_EXT7 by $0) generate $0,((double)$1)/$3;

--EXT8
g_personalities_EXT8 = foreach (GROUP personalities_reduce BY EXT8) generate $0 AS EXT8, COUNT($1) AS COUNT_EXT8;   
sp_EXT8 = foreach (Group (Filter g_personalities_EXT8 by EXT8 >3) all) generate CONCAT('EXT8', ''),SUM($1.$1);
total_EXT8 = foreach (Group g_personalities_EXT8 all) generate CONCAT('EXT8', ''),SUM($1.$1);
r_EXT8 = Foreach (JOIN sp_EXT8 by $0 , total_EXT8 by $0) generate $0,((double)$1)/$3;

--EXT9
g_personalities_EXT9 = foreach (GROUP personalities_reduce BY EXT9) generate $0 AS EXT9, COUNT($1) AS COUNT_EXT9;   
sp_EXT9 = foreach (Group (Filter g_personalities_EXT9 by EXT9 >3) all) generate CONCAT('EXT9', ''),SUM($1.$1);
total_EXT9 = foreach (Group g_personalities_EXT9 all) generate CONCAT('EXT9', ''),SUM($1.$1);
r_EXT9 = Foreach (JOIN sp_EXT9 by $0 , total_EXT9 by $0) generate $0,((double)$1)/$3;

--EXT10
g_personalities_EXT10 = foreach (GROUP personalities_reduce BY EXT10) generate $0 AS EXT10, COUNT($1) AS COUNT_EXT10;   
sp_EXT10 = foreach (Group (Filter g_personalities_EXT10 by EXT10 >3) all) generate CONCAT('EXT10', ''),SUM($1.$1);
total_EXT10 = foreach (Group g_personalities_EXT10 all) generate CONCAT('EXT10', ''),SUM($1.$1);
r_EXT10 = Foreach (JOIN sp_EXT10 by $0 , total_EXT10 by $0) generate $0,((double)$1)/$3;


--UNION
R = UNION r_EXT1,r_EXT2,r_EXT3,r_EXT4,r_EXT5,r_EXT6,r_EXT7,r_EXT8,r_EXT9,r_EXT10;

maxx = foreach (Group R all) generate MAX($1.$1);

Resp = Foreach (JOIN R by $1, maxx by $0) generate $0,$1;
