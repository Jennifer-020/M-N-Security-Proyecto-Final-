

/* Nombre: Jennifer Guillermina Mora Caraballo Matricula: 18-siit-1-020 Seccion: 0541 */

/* Nombre: Arelis Navarro Matricula: 18-siit-1-030 Seccion: 0541 */



USE [master]
GO
/****** Object:  Database [Proyectobd]    Script Date: 12/19/2020 1:11:43 PM ******/
CREATE DATABASE [Proyectobd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyectobd', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\Proyectobd.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyectobd_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\Proyectobd_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Proyectobd] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyectobd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyectobd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyectobd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyectobd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyectobd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyectobd] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyectobd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyectobd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyectobd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyectobd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyectobd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyectobd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyectobd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyectobd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyectobd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyectobd] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyectobd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyectobd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyectobd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyectobd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyectobd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyectobd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyectobd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyectobd] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyectobd] SET  MULTI_USER 
GO
ALTER DATABASE [Proyectobd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyectobd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyectobd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyectobd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyectobd] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyectobd] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Proyectobd] SET QUERY_STORE = OFF
GO
USE [Proyectobd]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 12/19/2020 1:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 12/19/2020 1:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha_factura] [date] NOT NULL,
	[cantidad_producto] [int] NOT NULL,
	[producto_nombre] [varchar](50) NOT NULL,
	[valor_producto] [numeric](18, 0) NOT NULL,
	[total_factura] [numeric](18, 0) NOT NULL,
	[FK_id_cliente] [int] NOT NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 12/19/2020 1:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[cantidad_disponible] [numeric](18, 0) NOT NULL,
	[cantidad_vendida] [numeric](18, 0) NOT NULL,
	[nombre_producto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto_factura]    Script Date: 12/19/2020 1:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto_factura](
	[id_producto_factura] [int] IDENTITY(1,1) NOT NULL,
	[FK_id_producto] [int] NOT NULL,
	[FK_id_factura] [int] NOT NULL,
 CONSTRAINT [PK_producto_factura] PRIMARY KEY CLUSTERED 
(
	[id_producto_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (1, N'Gousse inc', N'santiago', CAST(8098427654 AS Numeric(18, 0)))
INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (3, N'Maria Santos ', N'carretera mella', CAST(8093456721 AS Numeric(18, 0)))
INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (4, N'Bravo', N'san vicente ', CAST(8498765434 AS Numeric(18, 0)))
INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (5, N'Jumbo', N'almirante ', CAST(8295786573 AS Numeric(18, 0)))
INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (6, N'Jhon', N'samana', CAST(8093456798 AS Numeric(18, 0)))
INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (7, N'huaweii', N'maximo gomez', CAST(8497683415 AS Numeric(18, 0)))
INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (11, N'Natcom', N'san luis', CAST(8297658495 AS Numeric(18, 0)))
INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (16, N'corripio ', N'higuey', CAST(8093467281 AS Numeric(18, 0)))
INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (17, N'Lemite', N'independencia', CAST(8095642516 AS Numeric(18, 0)))
INSERT [dbo].[clientes] ([id_cliente], [nombre_cliente], [direccion], [telefono]) VALUES (18, N'invimenca', N'villa juana', CAST(8095671211 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[factura] ON 

INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (1, CAST(N'2020-01-01' AS Date), 1, N'Msecure1', CAST(2500 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), 1)
INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (2, CAST(N'2020-01-03' AS Date), 1, N'Msecure2', CAST(2500 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), 3)
INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (3, CAST(N'2020-01-04' AS Date), 2, N'Msecure3', CAST(2500 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 4)
INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (4, CAST(N'2020-01-06' AS Date), 1, N'Msecure4', CAST(2500 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), 5)
INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (5, CAST(N'2020-01-09' AS Date), 3, N'Msecure5', CAST(2500 AS Numeric(18, 0)), CAST(7500 AS Numeric(18, 0)), 6)
INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (6, CAST(N'2020-01-12' AS Date), 1, N'Msecure6', CAST(2500 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), 7)
INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (7, CAST(N'2020-01-13' AS Date), 1, N'Msecure7', CAST(2500 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), 11)
INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (8, CAST(N'2020-01-15' AS Date), 2, N'Msecure8', CAST(2500 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 16)
INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (9, CAST(N'2020-01-17' AS Date), 1, N'Msecure9', CAST(2500 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), 17)
INSERT [dbo].[factura] ([id_factura], [fecha_factura], [cantidad_producto], [producto_nombre], [valor_producto], [total_factura], [FK_id_cliente]) VALUES (10, CAST(N'2020-01-18' AS Date), 1, N'Msecure10', CAST(2500 AS Numeric(18, 0)), CAST(2500 AS Numeric(18, 0)), 18)
SET IDENTITY_INSERT [dbo].[factura] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (1, CAST(50 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Msecure1')
INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (2, CAST(49 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Msecure2')
INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (3, CAST(48 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'Msecure3')
INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (4, CAST(46 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Msecure4')
INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (5, CAST(45 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'Msecure5')
INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (6, CAST(42 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Msecure6')
INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (7, CAST(41 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Msecure7')
INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (8, CAST(40 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'Msecure8')
INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (9, CAST(38 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Msecure9')
INSERT [dbo].[producto] ([id_producto], [cantidad_disponible], [cantidad_vendida], [nombre_producto]) VALUES (10, CAST(37 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Msecure10')
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET IDENTITY_INSERT [dbo].[producto_factura] ON 

INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (1, 1, 1)
INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (2, 2, 2)
INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (3, 3, 3)
INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (4, 4, 4)
INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (5, 5, 5)
INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (6, 6, 6)
INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (7, 7, 7)
INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (8, 8, 8)
INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (9, 9, 9)
INSERT [dbo].[producto_factura] ([id_producto_factura], [FK_id_producto], [FK_id_factura]) VALUES (10, 10, 10)
SET IDENTITY_INSERT [dbo].[producto_factura] OFF
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_clientes] FOREIGN KEY([FK_id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_clientes]
GO
ALTER TABLE [dbo].[producto_factura]  WITH CHECK ADD  CONSTRAINT [FK_producto_factura_factura] FOREIGN KEY([FK_id_factura])
REFERENCES [dbo].[factura] ([id_factura])
GO
ALTER TABLE [dbo].[producto_factura] CHECK CONSTRAINT [FK_producto_factura_factura]
GO
ALTER TABLE [dbo].[producto_factura]  WITH CHECK ADD  CONSTRAINT [FK_producto_factura_producto] FOREIGN KEY([FK_id_producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[producto_factura] CHECK CONSTRAINT [FK_producto_factura_producto]
GO
USE [master]
GO
ALTER DATABASE [Proyectobd] SET  READ_WRITE 
GO
