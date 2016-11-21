
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/21/2016 12:59:14
-- Generated from EDMX file: C:\Users\dev303\Documents\Visual Studio 2015\Projects\SimpleSystem\SimpleSystem\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SimpleSystemDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ClientsOrders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_ClientsOrders];
GO
IF OBJECT_ID(N'[dbo].[FK_OrdersSupplyCatalogue_Orders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrdersSupplyCatalogue] DROP CONSTRAINT [FK_OrdersSupplyCatalogue_Orders];
GO
IF OBJECT_ID(N'[dbo].[FK_OrdersSupplyCatalogue_SupplyCatalogue]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrdersSupplyCatalogue] DROP CONSTRAINT [FK_OrdersSupplyCatalogue_SupplyCatalogue];
GO
IF OBJECT_ID(N'[dbo].[FK_SuppliersSupplyCatalogue]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SupplyCatalogues] DROP CONSTRAINT [FK_SuppliersSupplyCatalogue];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductsSupplyCatalogue]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SupplyCatalogues] DROP CONSTRAINT [FK_ProductsSupplyCatalogue];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Clients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clients];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Suppliers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Suppliers];
GO
IF OBJECT_ID(N'[dbo].[SupplyCatalogues]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SupplyCatalogues];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[OrdersSupplyCatalogue]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrdersSupplyCatalogue];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Clients'
CREATE TABLE [dbo].[Clients] (
    [ClientId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Suppliers'
CREATE TABLE [dbo].[Suppliers] (
    [SupplierId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SupplyCatalogues'
CREATE TABLE [dbo].[SupplyCatalogues] (
    [ItemId] int IDENTITY(1,1) NOT NULL,
    [SuppliersSupplierId] int  NOT NULL,
    [ProductsProductId] int  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderId] int IDENTITY(1,1) NOT NULL,
    [ClientsClientId] int  NOT NULL
);
GO

-- Creating table 'OrdersSupplyCatalogue'
CREATE TABLE [dbo].[OrdersSupplyCatalogue] (
    [Orders_OrderId] int  NOT NULL,
    [Item_ItemId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ClientId] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [PK_Clients]
    PRIMARY KEY CLUSTERED ([ClientId] ASC);
GO

-- Creating primary key on [ProductId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- Creating primary key on [SupplierId] in table 'Suppliers'
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [PK_Suppliers]
    PRIMARY KEY CLUSTERED ([SupplierId] ASC);
GO

-- Creating primary key on [ItemId] in table 'SupplyCatalogues'
ALTER TABLE [dbo].[SupplyCatalogues]
ADD CONSTRAINT [PK_SupplyCatalogues]
    PRIMARY KEY CLUSTERED ([ItemId] ASC);
GO

-- Creating primary key on [OrderId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [Orders_OrderId], [Item_ItemId] in table 'OrdersSupplyCatalogue'
ALTER TABLE [dbo].[OrdersSupplyCatalogue]
ADD CONSTRAINT [PK_OrdersSupplyCatalogue]
    PRIMARY KEY CLUSTERED ([Orders_OrderId], [Item_ItemId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ClientsClientId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_ClientsOrders]
    FOREIGN KEY ([ClientsClientId])
    REFERENCES [dbo].[Clients]
        ([ClientId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientsOrders'
CREATE INDEX [IX_FK_ClientsOrders]
ON [dbo].[Orders]
    ([ClientsClientId]);
GO

-- Creating foreign key on [Orders_OrderId] in table 'OrdersSupplyCatalogue'
ALTER TABLE [dbo].[OrdersSupplyCatalogue]
ADD CONSTRAINT [FK_OrdersSupplyCatalogue_Orders]
    FOREIGN KEY ([Orders_OrderId])
    REFERENCES [dbo].[Orders]
        ([OrderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Item_ItemId] in table 'OrdersSupplyCatalogue'
ALTER TABLE [dbo].[OrdersSupplyCatalogue]
ADD CONSTRAINT [FK_OrdersSupplyCatalogue_SupplyCatalogue]
    FOREIGN KEY ([Item_ItemId])
    REFERENCES [dbo].[SupplyCatalogues]
        ([ItemId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdersSupplyCatalogue_SupplyCatalogue'
CREATE INDEX [IX_FK_OrdersSupplyCatalogue_SupplyCatalogue]
ON [dbo].[OrdersSupplyCatalogue]
    ([Item_ItemId]);
GO

-- Creating foreign key on [SuppliersSupplierId] in table 'SupplyCatalogues'
ALTER TABLE [dbo].[SupplyCatalogues]
ADD CONSTRAINT [FK_SuppliersSupplyCatalogue]
    FOREIGN KEY ([SuppliersSupplierId])
    REFERENCES [dbo].[Suppliers]
        ([SupplierId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SuppliersSupplyCatalogue'
CREATE INDEX [IX_FK_SuppliersSupplyCatalogue]
ON [dbo].[SupplyCatalogues]
    ([SuppliersSupplierId]);
GO

-- Creating foreign key on [ProductsProductId] in table 'SupplyCatalogues'
ALTER TABLE [dbo].[SupplyCatalogues]
ADD CONSTRAINT [FK_ProductsSupplyCatalogue]
    FOREIGN KEY ([ProductsProductId])
    REFERENCES [dbo].[Products]
        ([ProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductsSupplyCatalogue'
CREATE INDEX [IX_FK_ProductsSupplyCatalogue]
ON [dbo].[SupplyCatalogues]
    ([ProductsProductId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------