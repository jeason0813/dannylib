/***
* @ 创建权限数据库/表
**/
IF NOT EXISTS(SELECT * FROM master.sys.sysdatabases where name='ruledb')
	BEGIN
		CREATE DATABASE ruledb
	END
GO
USE [ruledb]
GO
-- 菜单表 --
CREATE TABLE MenuData
(
ID CHAR(32) PRIMARY KEY NOT NULL,
PID CHAR(32) NULL,
ParentPath VARCHAR(2000) NULL,
Name NVARCHAR(50) NOT NULL,
Url NVARCHAR(1000) NULL,
[Level] INT DEFAULT(1) NOT NULL,
Sort INT DEFAULT(1) NOT NULL
)
GO
-- 页面元素表 --
CREATE TABLE PageData
(
ID CHAR(32) PRIMARY KEY NOT NULL,
Name NVARCHAR(500) NOT NULL,
Code NVARCHAR(50) NOT NULL
)
GO
-- 模块操作表 --
CREATE TABLE ModuleData
(
ID CHAR(32) PRIMARY KEY NOT NULL,
Name NVARCHAR(500) NOT NULL,
Md_NameSpace NVARCHAR(500) NULL,
Method NVARCHAR(500) NULL,
Code NVARCHAR(50) NULL
)
GO
-- 权限表 --
CREATE TABLE DataPermit
(
ID CHAR(32) PRIMARY KEY NOT NULL,
Title NVARCHAR(500) NOT NULL,
Content NVARCHAR(MAX) NULL,
[Description] NVARCHAR(500) NOT NULL
)
GO
-- 角色表 --
CREATE TABLE RoleData
(
ID CHAR(32) PRIMARY KEY NOT NULL,
Name NVARCHAR(500) NOT NULL,
[Description] NVARCHAR(500) NULL,
Sort INT DEFAULT(1) NOT NULL
)
GO
-- 角色与权限关系表 --
CREATE TABLE RoleDetail
(
Role_ID CHAR(32) NOT NULL,
Detail_ID CHAR(32) NOT NULL,
[Type] INT NOT NULL,
CONSTRAINT [PK_RoleID_Detail_ID] PRIMARY KEY CLUSTERED
(
Role_ID,
Detail_ID
) WITH (PAD_INDEX=OFF,STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)ON [PRIMARY]
GO