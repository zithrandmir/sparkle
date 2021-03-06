/****** Script for SelectTopNRows command from SSMS  ******/
SELECT b.Project_ID AS 'PID'
      ,a.[Task_ID] AS 'TID'
	  ,a.[Work_Entry_Date] AS 'Date Entry'
      ,a.[Hours_Worked] AS 'Hrs'
      ,b.[Title] AS 'Task Name'
      ,c.Short_Description AS 'Project Name'
      ,a.[Description] AS 'Descr'
  FROM [Distance].[dbo].[Tme_Work_Log] a
  INNER JOIN [Distance].[dbo].[Tme_Task] b
	ON b.[Task_ID] = a.[Task_ID]
  INNER JOIN [Distance].dbo.Tme_Project c
    ON c.Project_ID = b.Project_ID
  WHERE User_ID = '1231'
  AND (Work_Entry_Date
        BETWEEN '2014-07-01 00:00:00'
	        AND '2015-06-30 23:59:59')
  AND a.Description NOT LIKE '%update tme%'
  AND a.Description NOT LIKE '%scrum meeting%'
  AND a.Description NOT LIKE '%tech team meeting%'
  AND a.Description NOT LIKE '%kitchen%'
  AND a.Description NOT LIKE '%generate 515%'
  AND a.Description NOT LIKE '%gen 515%'
  AND a.Description NOT LIKE '%ECFTP meeting%'
  AND a.Description NOT LIKE '%assignee(s) changed from%'
  AND b.Title NOT LIKE '%self appraisal for talbert tso%'
  ORDER BY a.[Task_ID], a.[Work_Entry_Date]