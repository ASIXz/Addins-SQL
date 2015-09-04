CREATE TABLE [dbo].[Debt]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [City] NCHAR(50) NULL, 
);
CREATE TABLE [dbo].[Empl]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [FirstName] NVARCHAR(50) NULL, 
    [LastName] NVARCHAR(50) NULL,
	[Salary] DECIMAL NOT NULL,
    [DeptId] INT NULL, 
    CONSTRAINT [FK_Table_ToTable] FOREIGN KEY ([DeptId]) REFERENCES [Debt]([Id])
);