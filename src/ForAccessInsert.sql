USE [RDS]
GO
/****** Object:  StoredProcedure [dbo].[spANN_ModifyZones]    Script Date: 08/18/2010 15:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Романов А.Н.>
-- Create date: <17.08.2010>
-- Description:	<Редактирование справочника зон>
-- =============================================
ALTER PROCEDURE [dbo].[spANN_ModifyZones] 
@id_zone int,
@zone varchar(50),
@act int --0 - удаление 1 - добавление 2 - редактирование
AS
BEGIN

	if @act = 0
	begin
	    delete from dbo.ANN_ZONE_VOICE where id_zone = @id_zone 
	    delete from dbo.ANN_ZONE_TEMPL where id_zone = @id_zone 
	    delete from dbo.ANN_ON_OFF where id_zone = @id_zone   
	    
		delete from dbo.ANN_ZONES where id=@id_zone 
	end	
	else
	begin
		if @act = 1 
		begin
			insert into dbo.ANN_ZONES (zone,dk)
			values (@zone,GETDATE())
			set @id_zone = (select MAX(id) from dbo.ANN_ZONES) 
			insert into dbo.ANN_ON_OFF (id_zone,on_off,caption,dk)
			values (@id_zone,-1,'Приложение не запущено для зоны '+@zone,GETDATE()) 
		end	
		else
		  update dbo.ANN_ZONES 	
		  set zone = @zone,  dk = GETDATE()   
		  where id=@id_zone   	
	end
END
