STOCK_A = LOAD '/Sandip/input/NYSE_daily_prices_A.csv' USING PigStorage(',') 
    AS (exchange:chararray, symbol:chararray, date:chararray,                 
    open:float, high:float, low:float, close:float, volume:int, adj_close:float); 

B = LIMIT STOCK_A 100; 
C = FOREACH B GENERATE symbol, date, close; 
DESCRIBE C; 
STORE C INTO '/Sandip/output/C3' USING PigStorage(','); 