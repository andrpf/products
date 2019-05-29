USE [products]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* В базе данных MS SQL Server есть продукты и категории. Одному продукту может соответствовать много категорий, 
в одной категории может быть много продуктов. Напишите SQL запрос для выбора всех пар «Имя продукта – Имя категории». 
Если у продукта нет категорий, то его имя все равно должно выводиться.
*/

CREATE TABLE dbo.Category(
	[Id] [int] identity NOT NULL PRIMARY KEY CLUSTERED,
	[Name] [nvarchar](255) NULL,
 )
GO

CREATE TABLE dbo.Products(
	[Id] [int] identity NOT NULL PRIMARY KEY CLUSTERED,
	[Id_Cat] [int] NULL,
	[Name] [nvarchar](255) NULL,
 )
GO

insert into [dbo].[Category]  ([Name])
select [Name] from (
   select Name = 'Radiotechnics'
   union
   select 'Electronics'
) q

-- select * from [dbo].[Category] 

insert into  [dbo].[Products] ([Id_Cat], [Name])
select [Id_Cat], [Name] from (
   select Id_Cat = 2, Name = 'Radio'
   union
   select Id_Cat = 3, Name = 'Computer'
   union
   select Id_Cat = NULL, Name = 'Tomato'
   union
   select Id_Cat = 2, Name = 'Recorder'
   union
   select Id_Cat = 3, Name = 'Recorder'
) q

-- select * from [dbo].[Products] 

select p.Name as Product, case when c.Name is NULL then '' else c.Name end as Category from [dbo].[Products] p left join [dbo].[Category] c on p.Id_Cat = c.Id order by p.Name


