USE [RDS]
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_GetEventAbbreviation]    Script Date: 08/10/2010 12:34:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_GetEventAbbreviation]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnANN_GetEventAbbreviation]
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_GetVoice]    Script Date: 08/10/2010 12:34:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_GetVoice]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnANN_GetVoice]
GO
/****** Object:  View [dbo].[vANN_AbsentVoices]    Script Date: 08/10/2010 12:34:32 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vANN_AbsentVoices]'))
DROP VIEW [dbo].[vANN_AbsentVoices]
GO
/****** Object:  View [dbo].[vANN_GetTemplates]    Script Date: 08/10/2010 12:34:32 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vANN_GetTemplates]'))
DROP VIEW [dbo].[vANN_GetTemplates]
GO
/****** Object:  View [dbo].[vANN_LangZones]    Script Date: 08/10/2010 12:34:32 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vANN_LangZones]'))
DROP VIEW [dbo].[vANN_LangZones]
GO
/****** Object:  View [dbo].[vANN_MESS_LOG]    Script Date: 08/10/2010 12:34:32 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vANN_MESS_LOG]'))
DROP VIEW [dbo].[vANN_MESS_LOG]
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_ConstCaption]    Script Date: 08/10/2010 12:34:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_ConstCaption]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnANN_ConstCaption]
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_GetArrayFromString]    Script Date: 08/10/2010 12:34:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_GetArrayFromString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnANN_GetArrayFromString]
GO
/****** Object:  Table [dbo].[ANN_ADV_MESSAGES]    Script Date: 08/10/2010 12:34:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ANN_ADV_MESSAGES]') AND type in (N'U'))
DROP TABLE [dbo].[ANN_ADV_MESSAGES]
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_ReplaceText]    Script Date: 08/10/2010 12:34:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_ReplaceText]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnANN_ReplaceText]
GO
/****** Object:  UserDefinedFunction [dbo].[fnAnn_GetReisNumber]    Script Date: 08/10/2010 12:34:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnAnn_GetReisNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnAnn_GetReisNumber]
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_GetVisinformVal]    Script Date: 08/10/2010 12:34:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_GetVisinformVal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnANN_GetVisinformVal]
GO
/****** Object:  User [kobra_ann]    Script Date: 08/10/2010 12:34:32 ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kobra_ann')
DROP USER [kobra_ann]
GO
USE [master]
GO
/****** Object:  Login [RIVC_DOMAIN\A.Romanov]    Script Date: 08/10/2010 12:34:32 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'RIVC_DOMAIN\A.Romanov')
DROP LOGIN [RIVC_DOMAIN\A.Romanov]
GO
/****** Object:  Login [RIVC_DOMAIN\A.Romanov]    Script Date: 08/10/2010 12:34:32 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'RIVC_DOMAIN\A.Romanov')
CREATE LOGIN [RIVC_DOMAIN\A.Romanov] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
USE [RDS]
GO
/****** Object:  User [kobra_ann]    Script Date: 08/10/2010 12:34:32 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kobra_ann')
CREATE USER [kobra_ann] FOR LOGIN [kobra_ann] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_GetVisinformVal]    Script Date: 08/10/2010 12:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_GetVisinformVal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- ===================================================
-- Author:		Набатов Т.Е.
-- Create date: 11.05.2010
-- Description:	Функция определяет, должен ли обрабатываться рейс как из Визинформа 
-- ===================================================
CREATE FUNCTION [dbo].[fnANN_GetVisinformVal] (@id_spp int)
RETURNS int
AS
BEGIN
  RETURN 0
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnAnn_GetReisNumber]    Script Date: 08/10/2010 12:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnAnn_GetReisNumber]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnAnn_GetReisNumber] 
(
	@NR varchar(max)
)
RETURNS varchar(max)
AS
BEGIN
	
	DECLARE @ReisNr varchar(max)

	IF @NR is NULL SET @ReisNr=''''
	ELSE 
	BEGIN
		SET @ReisNR=(select SUBSTRING(@NR,3,LEN(@NR)-2))
		IF (UNICODE(LEFT(@ReisNR,1)) BETWEEN 65 and 90) or (UNICODE(LEFT(@ReisNR,1)) BETWEEN 1040 and 1071) 
		  SET @ReisNR = (select SUBSTRING(@ReisNR,2,LEN(@ReisNR)-1))
	END		
	
	
	RETURN @ReisNr

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_ReplaceText]    Script Date: 08/10/2010 12:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_ReplaceText]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- ===================================================
-- Author:		GGV
-- Create date: 2010_02_19
-- Description:	Функция вставки нр, ак, ап в шаблон ЗС
-- ===================================================
CREATE FUNCTION [dbo].[fnANN_ReplaceText]
(
@mtext varchar(max),
@nr varchar(10),
@ap varchar(50),
@ak varchar(50)
)
RETURNS varchar(max)
AS
BEGIN
	if @NR is null
		set @NR = ''''
	if @AP is null
		set @AP = ''''
	if @AK is null
		set @AK = ''''

  select @mtext=replace(@mtext,''%NR'',@NR)
  select @mtext=replace(@mtext,''%AP'',@AP)
  select @mtext=replace(@mtext,''%AK'',@AK)  

  RETURN @mtext
END
' 
END
GO
/****** Object:  Table [dbo].[ANN_ADV_MESSAGES]    Script Date: 08/10/2010 12:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ANN_ADV_MESSAGES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ANN_ADV_MESSAGES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_TEMPL] [int] NULL,
	[EVENT] [int] NULL,
	[MSG_TXT] [text] NULL,
	[BASE_DELTA] [int] NULL,
	[BEFORE_AFTER] [int] NULL,
	[INTERVAL] [int] NULL,
	[DK] [datetime] NULL,
	[COMMENTS] [varchar](50) NULL,
	[USED] [int] NULL,
 CONSTRAINT [PK_ANN_ADV_MESSAGES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ANN_ADV_MESSAGES] ON
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (1, 1, 11, N'Registration at terminal 1', 180, 1, 240, CAST(0x00009D650097975F AS DateTime), N'К регистрации', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (3, 1, 24, N'Продолжается регистрация', 120, 1, 240, CAST(0x00009D650107D90B AS DateTime), N'К регистрации', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (4, 1, 14, N'Заканчивается регистрация.', 60, 1, 360, CAST(0x00009D650111B468 AS DateTime), N'К окончанию регистрации', 0)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (5, 5, 21, N'', 1020, 1, 180, CAST(0x00009D6501135174 AS DateTime), N'Начинается позже, чем нужно.', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (6, 8, 24, N'Просьба встречающим подходить к терминалу', 120, 1, 120, CAST(0x00009D66010A8505 AS DateTime), N'', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (9, 3, 31, N'Совершил посадку рейс № 2', 60, 1, 180, CAST(0x00009D6F0110C5E6 AS DateTime), N'', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (10, 9, 42, N'Выдача багажа прекращается', 180, 1, 240, CAST(0x00009D73009D4B39 AS DateTime), N'Последнее непоминание', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (11, 9, 41, N'Начало выдачи багажа', 120, 1, 300, CAST(0x00009D7300B862E6 AS DateTime), N'Багаж', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (12, 10, 11, N'рпрапрапрапра', 0, 1, 0, CAST(0x00009D76009EFB49 AS DateTime), N'', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (13, 4, 21, N'', 0, 1, 0, CAST(0x00009D7600B5453E AS DateTime), N'', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (14, 11, 21, N'Здравствуйте, тов. пассажиры!
Тест', 600, 1, 0, CAST(0x00009D7600BDBE37 AS DateTime), N'тестовое пояснение', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (15, 1, 11, N'', 180, 1, 240, CAST(0x00009DB300C53234 AS DateTime), N'К регистрации', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (17, 13, 11, N'Уважаемые пассажиры, начинается регистрация на рейс.', 0, 1, 0, CAST(0x00009DB500AC658E AS DateTime), N'Начало регистрации', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (19, 14, 14, N'Уважаемые пассажиры, начинается регистрация на рейс ', 0, 1, 0, CAST(0x00009DB500EBDC20 AS DateTime), N'Конец регистрации', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (20, 14, 21, N'Уважаемые пассажиры, начинается регистрация на рейс ', 0, 1, 0, CAST(0x00009DB500EBFB5D AS DateTime), N'Начало посадки', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (21, 14, 24, N'Уважаемые пассажиры, начинается регистрация на рейс ', 0, 1, 0, CAST(0x00009DB500EC10B4 AS DateTime), N'Конец посадки', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (22, 14, 11, N'Уважаемые пассажиры, начинается регистрация на рейс ', 0, 1, 0, CAST(0x00009DB500EC2151 AS DateTime), N'Начало регистрации', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (29, 15, 11, N'Продолжение регистрации на рейс_%NR ', 120, 1, 0, CAST(0x00009DC200A9588D AS DateTime), N'К регистрации', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (31, 17, 31, N'11', 120, 1, 0, CAST(0x00009DC900C6F806 AS DateTime), N'Пояснение', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (32, 21, 31, N'Совершил посадку самолет.
Рейс выполняла авиакомпания "Уральские авиалинии"', 120, 1, 0, CAST(0x00009DCD009E3AF5 AS DateTime), N'После посадки', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (33, 23, 31, N'тест для груп рейсов авиакомпании Сибирь', 120, 1, 0, CAST(0x00009DCD00B653A1 AS DateTime), N'После посадки', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (34, 24, 31, N'при посадке', 120, 1, 0, CAST(0x00009DCD00BAC6C3 AS DateTime), N'При посадке', 1)
INSERT [dbo].[ANN_ADV_MESSAGES] ([ID], [ID_TEMPL], [EVENT], [MSG_TXT], [BASE_DELTA], [BEFORE_AFTER], [INTERVAL], [DK], [COMMENTS], [USED]) VALUES (35, 25, 31, N'посадка', 120, 1, 0, CAST(0x00009DCD00BDDD34 AS DateTime), N'к посадке', 1)
SET IDENTITY_INSERT [dbo].[ANN_ADV_MESSAGES] OFF
/****** Object:  UserDefinedFunction [dbo].[fnANN_GetArrayFromString]    Script Date: 08/10/2010 12:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_GetArrayFromString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnANN_GetArrayFromString](@StringArray varchar(8000), @Separator varchar(1))
-- функция возвращает таблицу дат, полученных из входной строки
-- Создал : Набатов Т.Е.
RETURNS @StringTable table (NumStr varchar(500)) WITH EXECUTE AS CALLER
AS
begin
	if isnull(@StringArray, '''') != ''''
	begin
		-- set dateformat dmy  
		while LEN(@StringArray) > 0 
		begin
			IF CHARINDEX(@Separator, @StringArray) > 0 
			begin
				insert into @StringTable values (SUBSTRING(@StringArray, 1, CHARINDEX(@Separator, @StringArray)-1))
				SET @StringArray = SUBSTRING(@StringArray, CHARINDEX(@Separator, @StringArray)+1, LEN(@StringArray))
			end 
			else 
			begin
				insert into @StringTable values (SUBSTRING(@StringArray, 1, LEN(@StringArray)))
				SET @StringArray = ''''
			end
		end
	end
	
	return
end' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_ConstCaption]    Script Date: 08/10/2010 12:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_ConstCaption]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Романов А.Н.>
-- Create date: <29.08.2010>
-- Description:	<Функция меняет подставные переменные <Номер рейса>, и т.п. на %NR и наоборт >
-- =============================================
CREATE FUNCTION [dbo].[fnANN_ConstCaption] 
(
	@mtext varchar(max), @type int
)
RETURNS varchar(max)
AS
BEGIN
	
	DECLARE @Res varchar(max),@ConstValue varchar(max), @CaptionValue varchar(max)
	
	SET @Res = @mtext

	DECLARE tANN_Const CURSOR for
	select const, caption from dbo.ANN_CONST 
	
	open tANN_Const
	FETCH NEXT FROM tANN_Const into @ConstValue,@CaptionValue
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	  
	  if @type=0 
		Set @Res = Replace(@Res,@CaptionValue,@ConstValue)
	  else
	    Set @Res = Replace(@Res,@ConstValue,@CaptionValue)			
	  
	  FETCH NEXT FROM tANN_Const into @ConstValue,@CaptionValue
	END
	
	close tANN_const
	deallocate tANN_const
	
	RETURN @Res

END
' 
END
GO
/****** Object:  View [dbo].[vANN_MESS_LOG]    Script Date: 08/10/2010 12:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vANN_MESS_LOG]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vANN_MESS_LOG]
AS
SELECT     TOP (100) PERCENT AML.dt_beg, AML.dt_end, AML.mtext, ISNULL(AZ.zone, ''Все'') AS zone, AL.caption AS Lcaption, AE.caption AS Ecaption, 
                      ISNULL(ASM.TemplName, AAM.TemplName) AS Templ
FROM         dbo.ANN_MESS_LIST AS AML LEFT OUTER JOIN
                      dbo.ANN_ZONES AS AZ ON AML.id_zo = AZ.id LEFT OUTER JOIN
                      dbo.ANN_LANGUAGES AS AL ON AML.lang = AL.lang LEFT OUTER JOIN
                      dbo.ANN_EVENTS AS AE ON AML.event = AE.event LEFT OUTER JOIN
                      dbo.ANN_SCHED_MESS_LIST AS ASM ON AML.id_sched_templ = ASM.ID LEFT OUTER JOIN
                          (SELECT     AM.ID, AM.COMMENTS + '' ('' + ASM.Comments + '')'' AS TemplName
                            FROM          dbo.ANN_ADV_MESSAGES AS AM INNER JOIN
                                                   dbo.ANN_GROUP_TEMPLATES AS ASM ON ASM.ID = AM.ID_TEMPL) AS AAM ON AML.id_templ = AAM.ID
WHERE     (AML.sounded = 1)
ORDER BY AML.dt_beg
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vANN_MESS_LOG', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AML"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AZ"
            Begin Extent = 
               Top = 6
               Left = 231
               Bottom = 106
               Right = 383
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AL"
            Begin Extent = 
               Top = 6
               Left = 421
               Bottom = 121
               Right = 573
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AE"
            Begin Extent = 
               Top = 108
               Left = 231
               Bottom = 223
               Right = 383
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ASM"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AAM"
            Begin Extent = 
               Top = 126
               Left = 421
               Bottom = 211
               Right = 573
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Wi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vANN_MESS_LOG'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'vANN_MESS_LOG', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'dth = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vANN_MESS_LOG'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vANN_MESS_LOG', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vANN_MESS_LOG'
GO
/****** Object:  View [dbo].[vANN_LangZones]    Script Date: 08/10/2010 12:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vANN_LangZones]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vANN_LangZones]
AS
SELECT     TOP (100) PERCENT AL.id AS id_lang, AZ.id AS id_zone, AZ.zone, 1 AS used
FROM         dbo.ANN_LANGUAGES AL, dbo.ANN_ZONES AZ
WHERE     EXISTS
                          (SELECT     1
                            FROM          dbo.ANN_LANG_RULES
                            WHERE      id_lang = AL.id AND id_zone = AZ.id)
UNION
SELECT     TOP (100) PERCENT AL.id AS id_lang, AZ.id AS id_zone, AZ.zone, 0 AS used
FROM         dbo.ANN_LANGUAGES AL, dbo.ANN_ZONES AZ
WHERE     NOT EXISTS
                          (SELECT     1
                            FROM          dbo.ANN_LANG_RULES
                            WHERE      id_lang = AL.id AND id_zone = AZ.id)
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vANN_LangZones', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -288
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vANN_LangZones'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vANN_LangZones', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vANN_LangZones'
GO
/****** Object:  View [dbo].[vANN_GetTemplates]    Script Date: 08/10/2010 12:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vANN_GetTemplates]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vANN_GetTemplates]
AS
SELECT     TOP (100) PERCENT T.id_event, T.id_lang, T.Ecaption, T.Lcaption, dbo.fnANN_ConstCaption(AT.mtext, 1) AS mtext
FROM         dbo.ANN_TEMPLATES AS AT RIGHT OUTER JOIN
                          (SELECT     E.id AS id_event, L.id AS id_lang, E.caption AS Ecaption, L.caption AS Lcaption
                            FROM          dbo.ANN_EVENTS AS E CROSS JOIN
                                                   dbo.ANN_LANGUAGES AS L
                            WHERE      (E.used = 1)) AS T ON AT.id_event = T.id_event AND AT.id_lang = T.id_lang
ORDER BY T.id_lang, T.id_event
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vANN_GetTemplates', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AT"
            Begin Extent = 
               Top = 6
               Left = 418
               Bottom = 121
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3090
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vANN_GetTemplates'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vANN_GetTemplates', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vANN_GetTemplates'
GO
/****** Object:  View [dbo].[vANN_AbsentVoices]    Script Date: 08/10/2010 12:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vANN_AbsentVoices]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vANN_AbsentVoices]
AS
SELECT     AZV.id_zone, AZ.zone AS zone, AV.name AS voice, AL.caption AS language
FROM         dbo.ANN_ZONE_VOICE AS AZV INNER JOIN
                      dbo.ANN_VOICES AS AV ON AZV.id_voice = AV.id INNER JOIN
                      dbo.ANN_LANGUAGES AS AL ON AV.id_lang = AL.id INNER JOIN
                      dbo.ANN_ZONES AS AZ ON AZV.id_zone = AZ.id
WHERE     (NOT EXISTS
                          (SELECT     name
                            FROM          dbo.ANN_VOICES_INSTALLED
                            WHERE      (name = AV.name)))
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vANN_AbsentVoices', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AZV"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AV"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AL"
            Begin Extent = 
               Top = 6
               Left = 418
               Bottom = 121
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AZ"
            Begin Extent = 
               Top = 6
               Left = 608
               Bottom = 106
               Right = 760
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vANN_AbsentVoices'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vANN_AbsentVoices', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vANN_AbsentVoices'
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_GetVoice]    Script Date: 08/10/2010 12:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_GetVoice]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Романов А.Н.>
-- Create date: <03.08. 2010>
-- Description:	<Возвращает название голоса по указанному языку и зоне>
-- =============================================
CREATE FUNCTION [dbo].[fnANN_GetVoice]
(
	
	@Lang varchar(10),
	@zone int 
)
RETURNS varchar(max)
AS
BEGIN
	
	DECLARE @Res varchar(max)

	Set @Res = (select TOP 1 AV.name    
				from 
				dbo.ANN_VOICES AV
				inner join dbo.ANN_ZONE_VOICE AZV on AV.id=AZV.id_voice   
				inner join dbo.ANN_LANGUAGES AL on AV.id_lang=AL.id
				where AL.lang = @Lang and (AZV.id_zone=@zone or @zone=0) )

	RETURN @Res

END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnANN_GetEventAbbreviation]    Script Date: 08/10/2010 12:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnANN_GetEventAbbreviation]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Романов А.Н.>
-- Create date: <27.07.2010>
-- Description:	<Возвращает заголовок события = аббревиатура названия события + (язык)>
-- =============================================
CREATE FUNCTION [dbo].[fnANN_GetEventAbbreviation] 
(
	@id_event int, @id_lang int
)
RETURNS varchar(20)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Res varchar(20),
			@Ename varchar(max),
			@I int
	
	Set @Res=''''
	Set @Ename = (select TOP 1 caption from dbo.ANN_Events where id=@id_event)
	Set @Ename = IsNull(@Ename,'''')
	
	Set @I = CharIndex('' '',@Ename,1)
	while @I!=0
	begin
	  Set @Res = @Res+Upper(Left(@Ename,1))
	  Set @Ename = Right(@Ename,Len(@Ename)-@I)
	  Set @I = CharIndex('' '',@Ename,1)
	end
	Set @Res = @Res+Upper(Left(@Ename,1))+ '' (''+(select TOP 1 lang from dbo.ANN_Languages where id=@id_lang)+'')''

	RETURN @Res

END
' 
END
GO
