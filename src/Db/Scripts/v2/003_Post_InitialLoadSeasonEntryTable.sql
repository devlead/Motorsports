﻿IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'SeasonEntry') BEGIN
  MERGE [dbo].[SeasonEntry] AS Target 
  USING (
    SELECT DISTINCT
      S.[Id] AS [SeasonId],
      T.[Id] AS [TeamId],
      T.[Name] AS [Name]
    FROM
      [dbo].[Season] S
      INNER JOIN [dbo].[Round] R ON R.[Season] = S.[Id]
      INNER JOIN [dbo].[Team] T ON T.Sport = S.Sport AND R.[WinningTeam] = T.[Id]
  
    UNION

    SELECT DISTINCT
      S.[Id] AS [SeasonId],
      S.[WinningTeam] AS [TeamId],
      T.[Name] AS [Name]
    FROM
      [dbo].[Season] S
      INNER JOIN [dbo].[Team] T ON T.Sport = S.Sport AND S.[WinningTeam] = T.[Id]
    ) AS Source
  ON Target.[SeasonId] = Source.[SeasonId] AND Target.[TeamId] = Source.[TeamId] 
  WHEN NOT MATCHED BY TARGET THEN
    INSERT (
      [SeasonId],
      [TeamId],
      [Name]
    ) VALUES (
      Source.[SeasonId],
      Source.[TeamId],
      Source.[Name]
    );
END
GO
