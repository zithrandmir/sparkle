/****** Script for SelectTopNRows command from SSMS  ******/
SELECT a.[Task_ID]
	  ,a.[Work_Entry_Date]
      ,a.[Hours_Worked]
      ,b.[Title]
      ,a.[Description]
  FROM [Distance].[dbo].[Tme_Work_Log] a
  INNER JOIN [Distance].[dbo].[Tme_Task] b
	ON b.[Task_ID] = a.[Task_ID]
  WHERE User_ID = '1231'
  AND (Work_Entry_Date
        BETWEEN '2013-07-01 00:00:00'
	        AND '2014-06-30 23:59:59')
  AND a.Description NOT LIKE '%update tme%'
  AND a.Description NOT LIKE '%scrum meeting%'
  AND a.Description NOT LIKE '%tech team meeting%'
  AND a.Description NOT LIKE '%kitchen%'
  ORDER BY a.[Task_ID], a.[Work_Entry_Date]