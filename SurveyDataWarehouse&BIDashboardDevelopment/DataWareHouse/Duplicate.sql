select sql_text,COUNT(*) from   [T2].[dbo].[SPS_Test1_Tsql] _file
    where  DATEADD(MINUTE,(SELECT DATEDIFF(MINUTE,GETUTCDATE(),GETDATE())),_file.timestamp) BETWEEN '2021-07-07 12:25:00.0000000 +00:00' AND '2021-07-07 13:37:00.0000000 +00:00'
 and _file.database_name='sps'
   and  _file.name  in( 'sql_batch_completed') 
   and username='sps'
   group by sql_text
   having count(*)>1
   order by count(*) desc

  
  select statement,COUNT(*) from   [T2].[dbo].[SPS_Test1_Tsql] _file
   where  DATEADD(MINUTE,(SELECT DATEDIFF(MINUTE,GETUTCDATE(),GETDATE())),_file.timestamp) BETWEEN '2021-07-07 12:25:00.0000000 +00:00' AND '2021-07-07 13:37:00.0000000 +00:00'
   and _file.database_name='sps'
   and  _file.name  in( 'rpc_completed') 
   and username='sps'
   and statement!='exec sp_reset_connection'
   group by statement
   having count(*)>1
   order by count(*) desc

   --select * from    [T2].[dbo].[SPS_Test1_Tsql] _file
   --where statement='exec [access].[IsDevUser] @UserId=10352'
   -- and  _file.name  in( 'rpc_completed') 

