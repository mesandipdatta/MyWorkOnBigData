/* 
Find the Top 10 pagenames having max hit count
*/
WIKI_INPUT = LOAD '/Sandip/input/inwiki' USING PigStorage(' ') 
    AS (domain_name:chararray, pagename:chararray, hitcount:int, bytesreturned:int);                 

A = FILTER WIKI_INPUT BY domain_name == 'en';

B = ORDER A BY hitcount DESC;

C = LIMIT B 10 ;

DUMP C;

/* 
B = LIMIT A 100; 
DUMP B;
*/