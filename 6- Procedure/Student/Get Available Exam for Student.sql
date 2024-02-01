USE [Examination]
GO

/****** Object:  StoredProcedure [StudentSC].[GetAvailableExams]    Script Date: 1/17/2024 12:56:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [StudentSC].[GetAvailableExams]
AS
BEGIN
    SET NOCOUNT ON;

    select * from [dbo].[GetAvailableExamsFun]()


END;
GO


