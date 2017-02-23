select v.text v.created_at, v.timestamp_ms, v.favorite_count , v.id , v1.location, v1.timezone
from tweets a
     LATERAL VIEW json_tuple(a.value ,'created_at','timestamp_ms','favorite_count','id','user', 'text') v
     as created_at, timestamp_ms, favorite_count , id , `user` , text    
	 LATERAL VIEW json_tuple(v.`user` ,'location','timezone') v1
     as location,timezone
     where v1.location is not Null 
--     and v1.timezone is not null 
--     and v.text LIKE '%dell%' 
		
;