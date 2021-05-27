USE [master]
GO
/****** Object:  Database [IceCreamDB]    Script Date: 4/20/2021 9:23:03 PM ******/
CREATE DATABASE [IceCreamDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IceCreamDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\IceCreamDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IceCreamDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\IceCreamDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IceCreamDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IceCreamDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IceCreamDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IceCreamDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IceCreamDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IceCreamDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IceCreamDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IceCreamDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IceCreamDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IceCreamDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IceCreamDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IceCreamDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IceCreamDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IceCreamDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IceCreamDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IceCreamDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IceCreamDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IceCreamDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IceCreamDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IceCreamDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IceCreamDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IceCreamDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IceCreamDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IceCreamDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IceCreamDB] SET RECOVERY FULL 
GO
ALTER DATABASE [IceCreamDB] SET  MULTI_USER 
GO
ALTER DATABASE [IceCreamDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IceCreamDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IceCreamDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IceCreamDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IceCreamDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IceCreamDB', N'ON'
GO
ALTER DATABASE [IceCreamDB] SET QUERY_STORE = OFF
GO
USE [IceCreamDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [IceCreamDB]
GO
/****** Object:  User [IceCream]    Script Date: 4/20/2021 9:23:03 PM ******/
CREATE USER [IceCream] FOR LOGIN [IceCream] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IceCream]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[adminid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NOT NULL,
	[adminstatusid] [int] NOT NULL,
	[first_name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
 CONSTRAINT [PrimaryKey_Admin] PRIMARY KEY CLUSTERED 
(
	[adminid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adminlogin]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adminlogin](
	[adminloginid] [int] IDENTITY(1,1) NOT NULL,
	[adminid] [int] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
 CONSTRAINT [PrimaryKey_Adminlogin] PRIMARY KEY CLUSTERED 
(
	[adminloginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminStatus]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminStatus](
	[adminstatusid] [int] IDENTITY(1,1) NOT NULL,
	[admin_status] [varchar](100) NULL,
 CONSTRAINT [PrimaryKey_AdminStatus] PRIMARY KEY CLUSTERED 
(
	[adminstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[billid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NOT NULL,
	[billstatusid] [int] NOT NULL,
	[total_bill] [money] NULL,
	[bill_date] [date] NULL,
 CONSTRAINT [PrimaryKey_Bill] PRIMARY KEY CLUSTERED 
(
	[billid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillStatus]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillStatus](
	[billstatusid] [int] IDENTITY(1,1) NOT NULL,
	[bill_status] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_BillStatus] PRIMARY KEY CLUSTERED 
(
	[billstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityList]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityList](
	[cityid] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](100) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_CityList] PRIMARY KEY CLUSTERED 
(
	[cityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryList]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryList](
	[countryid] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [varchar](100) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_CountryList] PRIMARY KEY CLUSTERED 
(
	[countryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerid] [int] IDENTITY(1,1) NOT NULL,
	[customeraddressid] [int] NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[last_name] [varchar](30) NOT NULL,
	[phone] [varchar](30) NOT NULL,
	[email] [varchar](100) NOT NULL,
 CONSTRAINT [PrimaryKey_Customer] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddress](
	[customeraddressid] [int] IDENTITY(1,1) NOT NULL,
	[countryid] [int] NULL,
	[stateid] [int] NULL,
	[cityid] [int] NULL,
	[zipcodeid] [int] NULL,
	[streetid] [int] NULL,
 CONSTRAINT [PrimaryKey_CustomerAddress] PRIMARY KEY CLUSTERED 
(
	[customeraddressid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerStatus]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerStatus](
	[customerstatusid] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NOT NULL,
	[customer_status] [varchar](100) NOT NULL,
 CONSTRAINT [PrimaryKey_CustomerStatus] PRIMARY KEY CLUSTERED 
(
	[customerstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employeeid] [int] IDENTITY(1,1) NOT NULL,
	[employeeaddressid] [int] NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[last_name] [varchar](30) NOT NULL,
	[phone] [varchar](30) NOT NULL,
	[email] [varchar](100) NOT NULL,
 CONSTRAINT [PrimaryKey_Employee] PRIMARY KEY CLUSTERED 
(
	[employeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeAddress]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAddress](
	[employeeaddressid] [int] IDENTITY(1,1) NOT NULL,
	[countryid] [int] NOT NULL,
	[stateid] [int] NOT NULL,
	[cityid] [int] NOT NULL,
	[zipcodeid] [int] NOT NULL,
	[streetid] [int] NOT NULL,
 CONSTRAINT [PrimaryKey_EmployeeAddress] PRIMARY KEY CLUSTERED 
(
	[employeeaddressid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeCertificate]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeCertificate](
	[employeecertificateid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NOT NULL,
	[employee_certificate] [varchar](255) NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employeecertificateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLogin]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLogin](
	[employeeloginid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NOT NULL,
	[username] [varchar](35) NOT NULL,
	[password] [varchar](30) NOT NULL,
 CONSTRAINT [PrimaryKey_EmployeeLogin] PRIMARY KEY CLUSTERED 
(
	[employeeloginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeStatus]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeStatus](
	[employeestatusid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NOT NULL,
	[employee_status] [varchar](100) NOT NULL,
 CONSTRAINT [PrimaryKey_EmployeeStatus] PRIMARY KEY CLUSTERED 
(
	[employeestatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[equipmentid] [int] IDENTITY(1,1) NOT NULL,
	[vendorid] [int] NOT NULL,
	[equipmentconditionid] [int] NOT NULL,
	[equipment_type] [varchar](35) NOT NULL,
	[equipment_name] [varchar](30) NOT NULL,
	[equipment_price] [money] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_Equipment] PRIMARY KEY CLUSTERED 
(
	[equipmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentCondition]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentCondition](
	[equipmentconditionid] [int] IDENTITY(1,1) NOT NULL,
	[equipment_condition] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_ EquipmentCondition] PRIMARY KEY CLUSTERED 
(
	[equipmentconditionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlavorPrice]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlavorPrice](
	[flavorpriceid] [int] IDENTITY(1,1) NOT NULL,
	[flavor_price] [money] NULL,
 CONSTRAINT [Primary_Key] PRIMARY KEY CLUSTERED 
(
	[flavorpriceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlavorType]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlavorType](
	[flavortypeid] [int] IDENTITY(1,1) NOT NULL,
	[flavorpriceid] [int] NOT NULL,
	[flavor_type] [varchar](30) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_Type] PRIMARY KEY CLUSTERED 
(
	[flavortypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IceCream]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IceCream](
	[icecreamid] [int] IDENTITY(1,1) NOT NULL,
	[flavortypeid] [int] NOT NULL,
	[sizeid] [int] NOT NULL,
	[toppingid] [int] NOT NULL,
 CONSTRAINT [PrimaryKey_IceCream] PRIMARY KEY CLUSTERED 
(
	[icecreamid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NOT NULL,
	[icecreamid] [int] NOT NULL,
	[orderstatusid] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_Order] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[orderstatusid] [int] IDENTITY(1,1) NOT NULL,
	[order_status] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey _OrderStatus] PRIMARY KEY CLUSTERED 
(
	[orderstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Premium]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Premium](
	[premiumid] [int] IDENTITY(1,1) NOT NULL,
	[premiumstatusid] [int] NOT NULL,
	[customerid] [int] NOT NULL,
 CONSTRAINT [PrimaryKey_Premium] PRIMARY KEY CLUSTERED 
(
	[premiumid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PremiumStatus]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PremiumStatus](
	[premiumstatusid] [int] IDENTITY(1,1) NOT NULL,
	[premium_status] [varchar](100) NOT NULL,
 CONSTRAINT [PrimaryKey _PremiumStatus] PRIMARY KEY CLUSTERED 
(
	[premiumstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[reservationid] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NOT NULL,
	[reservationstatusid] [int] NOT NULL,
	[reservation_date] [date] NOT NULL,
 CONSTRAINT [PrimaryKey_Reservation] PRIMARY KEY CLUSTERED 
(
	[reservationid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationStatus]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatus](
	[reservationstatusid] [int] IDENTITY(1,1) NOT NULL,
	[reservation_status] [varchar](100) NOT NULL,
 CONSTRAINT [PRIMARYKEY_ReservationStatus] PRIMARY KEY CLUSTERED 
(
	[reservationstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[sizeid] [int] IDENTITY(1,1) NOT NULL,
	[sizepriceid] [int] NOT NULL,
	[size] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_Size] PRIMARY KEY CLUSTERED 
(
	[sizeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizePrice]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizePrice](
	[sizepriceid] [int] IDENTITY(1,1) NOT NULL,
	[size_price] [money] NULL,
 CONSTRAINT [PrimaryKey_SizePrice] PRIMARY KEY CLUSTERED 
(
	[sizepriceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateList]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateList](
	[stateid] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [varchar](100) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_StateList] PRIMARY KEY CLUSTERED 
(
	[stateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StreetList]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreetList](
	[streetid] [int] IDENTITY(1,1) NOT NULL,
	[street_name] [varchar](100) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_StreetList] PRIMARY KEY CLUSTERED 
(
	[streetid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topping]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topping](
	[toppingid] [int] IDENTITY(1,1) NOT NULL,
	[toppingpriceid] [int] NOT NULL,
	[topping] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_Topping] PRIMARY KEY CLUSTERED 
(
	[toppingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToppingPrice]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToppingPrice](
	[toppingpriceid] [int] IDENTITY(1,1) NOT NULL,
	[topping_price] [money] NULL,
 CONSTRAINT [PrimaryKey_ToppingPrice] PRIMARY KEY CLUSTERED 
(
	[toppingpriceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[vendorid] [int] IDENTITY(1,1) NOT NULL,
	[vendoraddressid] [int] NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[last_name] [varchar](30) NOT NULL,
	[phone] [varchar](30) NOT NULL,
	[email] [varchar](100) NOT NULL,
 CONSTRAINT [PrimaryKey_Vendor] PRIMARY KEY CLUSTERED 
(
	[vendorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorAddress]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorAddress](
	[vendoraddressid] [int] IDENTITY(1,1) NOT NULL,
	[countryid] [int] NOT NULL,
	[stateid] [int] NOT NULL,
	[cityid] [int] NOT NULL,
	[zipcodeid] [int] NOT NULL,
	[streetid] [int] NOT NULL,
 CONSTRAINT [PrimaryKey_VendorAddress] PRIMARY KEY CLUSTERED 
(
	[vendoraddressid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorStatus]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorStatus](
	[vendorstatusid] [int] IDENTITY(1,1) NOT NULL,
	[vendorid] [int] NOT NULL,
	[vendor_status] [varchar](100) NOT NULL,
 CONSTRAINT [PrimaryKey_VendorStatus] PRIMARY KEY CLUSTERED 
(
	[vendorstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipcodeList]    Script Date: 4/20/2021 9:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipcodeList](
	[zipcodeid] [int] IDENTITY(1,1) NOT NULL,
	[zipcode_number] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PrimaryKey_ZipcodeList] PRIMARY KEY CLUSTERED 
(
	[zipcodeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([adminid], [employeeid], [adminstatusid], [first_name], [last_name]) VALUES (2, 2, 1, N'Josh', N'Drake')
INSERT [dbo].[Admin] ([adminid], [employeeid], [adminstatusid], [first_name], [last_name]) VALUES (3, 3, 1, N'Michelle', N'Travis')
INSERT [dbo].[Admin] ([adminid], [employeeid], [adminstatusid], [first_name], [last_name]) VALUES (4, 4, 1, N'John', N'Smith')
INSERT [dbo].[Admin] ([adminid], [employeeid], [adminstatusid], [first_name], [last_name]) VALUES (6, 2, 1, N'josh', N'drake')
INSERT [dbo].[Admin] ([adminid], [employeeid], [adminstatusid], [first_name], [last_name]) VALUES (7, 13, 2, N'Johnny', N'Perdue')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Adminlogin] ON 

INSERT [dbo].[Adminlogin] ([adminloginid], [adminid], [username], [password]) VALUES (2, 2, N'user', N'pwd')
INSERT [dbo].[Adminlogin] ([adminloginid], [adminid], [username], [password]) VALUES (3, 3, N'username', N'password')
INSERT [dbo].[Adminlogin] ([adminloginid], [adminid], [username], [password]) VALUES (5, 6, N'user', N'pass')
INSERT [dbo].[Adminlogin] ([adminloginid], [adminid], [username], [password]) VALUES (6, 7, N'Jadmin', N'password')
SET IDENTITY_INSERT [dbo].[Adminlogin] OFF
GO
SET IDENTITY_INSERT [dbo].[AdminStatus] ON 

INSERT [dbo].[AdminStatus] ([adminstatusid], [admin_status]) VALUES (1, N'true')
INSERT [dbo].[AdminStatus] ([adminstatusid], [admin_status]) VALUES (2, N'false')
SET IDENTITY_INSERT [dbo].[AdminStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([billid], [orderid], [billstatusid], [total_bill], [bill_date]) VALUES (7, 7, 2, 3.5600, CAST(N'2021-03-21' AS Date))
INSERT [dbo].[Bill] ([billid], [orderid], [billstatusid], [total_bill], [bill_date]) VALUES (102, 104, 2, 9.5000, CAST(N'2021-04-18' AS Date))
INSERT [dbo].[Bill] ([billid], [orderid], [billstatusid], [total_bill], [bill_date]) VALUES (103, 105, 2, 8.5000, CAST(N'2021-04-19' AS Date))
INSERT [dbo].[Bill] ([billid], [orderid], [billstatusid], [total_bill], [bill_date]) VALUES (104, 106, 2, 10.0000, CAST(N'2021-04-20' AS Date))
INSERT [dbo].[Bill] ([billid], [orderid], [billstatusid], [total_bill], [bill_date]) VALUES (105, 107, 2, 11.0000, CAST(N'2021-04-20' AS Date))
INSERT [dbo].[Bill] ([billid], [orderid], [billstatusid], [total_bill], [bill_date]) VALUES (106, 108, 2, 8.5000, CAST(N'2021-04-20' AS Date))
INSERT [dbo].[Bill] ([billid], [orderid], [billstatusid], [total_bill], [bill_date]) VALUES (107, 109, 2, 3.5000, CAST(N'2021-04-20' AS Date))
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillStatus] ON 

INSERT [dbo].[BillStatus] ([billstatusid], [bill_status], [Active]) VALUES (2, N'paid', 1)
INSERT [dbo].[BillStatus] ([billstatusid], [bill_status], [Active]) VALUES (21, N'unpaid', 1)
INSERT [dbo].[BillStatus] ([billstatusid], [bill_status], [Active]) VALUES (22, N'processing', 0)
SET IDENTITY_INSERT [dbo].[BillStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[CityList] ON 

INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (1, N'Portales', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (2, N'San Antonio', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (3, N'Dallas', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (4, N'Austin', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (5, N'Fort Worth', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (6, N'El Paso', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (7, N'Arlington', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (8, N'Corpus Christi', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (9, N'Plano', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (10, N'Laredo', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (11, N'Lubbock', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (12, N'Garland', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (13, N'Irving', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (14, N'Amarillo', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (15, N'Grand Prairie', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (16, N'Brownsville', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (17, N'Pasadena', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (18, N'McKinney', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (19, N'Mesquite', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (20, N'McAllen', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (21, N'Killeen', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (22, N'Frisco', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (23, N'Waco', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (24, N'Carrollton', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (25, N'Denton', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (26, N'Midland', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (27, N'Abilene', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (28, N'Beaumont', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (29, N'Round Rock', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (30, N'Odessa', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (31, N'Wichita Falls', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (32, N'Tyler', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (33, N'Richardson', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (34, N'Lewisville', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (35, N'College Station', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (36, N'Pearland', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (37, N'San Angelo', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (38, N'The Woodlands (CDP)', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (39, N'Allen', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (40, N'League City', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (41, N'Sugar Land', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (42, N'Longview', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (43, N'Edinburg', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (44, N'Mission', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (45, N'Bryan', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (46, N'Baytown', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (47, N'Pharr', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (48, N'Temple', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (49, N'Missouri City', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (50, N'Flower Mound', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (51, N'Harlingen', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (52, N'Atascocita (CDP)', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (53, N'North Richland Hills', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (54, N'Victoria', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (55, N'Conroe', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (56, N'New Braunfels', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (57, N'Mansfield', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (58, N'Cedar Park', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (59, N'Rowlett', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (60, N'Spring (CDP)', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (61, N'Port Arthur', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (62, N'Euless', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (63, N'Georgetown', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (64, N'Pflugerville', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (65, N'DeSoto', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (66, N'San Marcos', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (67, N'Memphis', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (68, N'Boston', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (69, N'Seattle', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (70, N'Denver', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (71, N'Washington', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (72, N'Nashville', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (73, N'Baltimore', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (74, N'Louisville', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (75, N'Portland', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (76, N'Oklahoma City', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (77, N'Milwaukee', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (78, N'Las Vegas', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (79, N'Albuquerque', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (80, N'Tucson', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (81, N'Fresno', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (82, N'Sacramento', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (83, N'Long Beach', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (84, N'Kansas City', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (85, N'Mesa', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (86, N'Virginia Beach', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (87, N'Atlanta', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (88, N'Colorado Springs', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (89, N'Raleigh', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (90, N'Miami', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (91, N'Oakland', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (92, N'Tulsa', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (93, N'Minneapolis', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (94, N'Cleveland', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (95, N'Wichita', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (96, N'Chula Vista', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (97, N'Madison', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (98, N'Reno', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (99, N'Freemont', 1)
GO
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (100, N'Anchorage', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (101, N'Clovis', 1)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (102, N'New York', 0)
INSERT [dbo].[CityList] ([cityid], [city_name], [Active]) VALUES (103, N'Yorker', 0)
SET IDENTITY_INSERT [dbo].[CityList] OFF
GO
SET IDENTITY_INSERT [dbo].[CountryList] ON 

INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (1, N'United States', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (3, N'Vietnam', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (4, N'Switzerland', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (6, N'Japan', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (7, N'Taiwan', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (8, N'Pakistan', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (9, N'Jordan', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (10, N'Italy', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (11, N'Barbados', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (12, N'Angola', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (13, N'Argentina', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (14, N'South Sudan', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (15, N'Poland', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (16, N'United Kingdom', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (17, N'Austria', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (18, N'Libya', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (19, N'Bahrain', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (20, N'South Africa', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (21, N'Palau', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (22, N'Macedonia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (23, N'Canada', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (24, N'Papua New Guinea', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (25, N'Turkey', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (26, N'China', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (27, N'Macao', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (28, N'Germany', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (29, N'Nepal', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (30, N'Malaysia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (31, N'Bhutan', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (32, N'Bermuda', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (33, N'Turkmenistan', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (34, N'Cuba', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (35, N'France', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (36, N'Iraq', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (37, N'Egypt', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (38, N'Turkmenistan', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (39, N'Cambodia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (40, N'Trinidad and Tobago', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (41, N'Guyana', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (42, N'Azerbaijan', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (43, N'Estonia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (44, N'Denmark', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (45, N'Montenegro', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (46, N'Fiji', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (47, N'Reunion', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (48, N'Somalia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (49, N'Mexico', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (50, N'Zambia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (51, N'Singapore', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (52, N'Austria', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (53, N'Columbia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (54, N'Belarus', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (55, N'Poland', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (56, N'Laos', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (57, N'Phillipines', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (58, N'Russia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (59, N'Trinidad and Tobago', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (60, N'C(te D''Ivoire (Ivory Coast)', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (61, N'Bahrain', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (62, N'Botswana', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (63, N'Yemen', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (64, N'Mongolia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (65, N'Pitcairn Islands', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (66, N'Vanuatu', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (67, N'Burkina Faso', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (68, N'Hungary', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (69, N'Papua New Guinea', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (70, N'Syria', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (71, N'Saint Pierre and Miquelon', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (72, N'Switzerland', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (73, N'Curatao', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (74, N'Micronesia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (75, N'Brazil', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (76, N'Comoros', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (77, N'El Salvador', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (78, N'Saint Pierre and Miquelon', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (79, N'Bulgaria', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (80, N'Comoros', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (81, N'Suriname', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (82, N'Kuwait', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (83, N'Montenegro', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (84, N'New Caledonia', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (85, N'Haiti', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (86, N'Samoa', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (87, N'Ecuador', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (88, N'Angola', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (89, N'Swaziland', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (90, N'Jersey', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (91, N'Romania', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (92, N'Puerto Rico', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (93, N'Burkina Faso', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (94, N'Mauritania', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (95, N'United Kingdom', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (96, N'Austria', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (97, N'Nepal', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (98, N'Ireland', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (99, N'Benin', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (100, N'Greece', 1)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (101, N'small', 0)
GO
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (102, N'Canada', 0)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (103, N'', 0)
INSERT [dbo].[CountryList] ([countryid], [country_name], [Active]) VALUES (104, N'Pakistan', 0)
SET IDENTITY_INSERT [dbo].[CountryList] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (3, 3, N'Fran', N'Bosnell', N'907-990-0658', N'fbosnell2@flickr.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (4, 4, N'Colline', N'Kerrey', N'465-440-3248', N'ckerrey3@barnesandnoble.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (5, 5, N'Stanleigh', N'Hurkett', N'240-783-0480', N'shurkett4@feedburner.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (6, 6, N'bobby', N'billy', N'523-523-1513', N'sthie@htrias.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (7, 7, N'Janka', N'Giorgietto', N'915-352-5805', N'jgiorgietto6@blogspot.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (8, 8, N'Mac', N'Liddy', N'882-709-1641', N'mliddy7@mayoclinic.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (9, 9, N'Sanders', N'Croix', N'917-165-2896', N'scroix8@opensource.org')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (10, 10, N'Agnola', N'Kenna', N'191-494-4751', N'akenna9@prlog.org')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (11, 11, N'Shayne', N'Cassley', N'737-339-1637', N'scassleya@latimes.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (12, 12, N'Marley', N'Wolver', N'542-147-4447', N'mwolverb@theatlantic.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (13, 13, N'Whittaker', N'Paik', N'250-764-7364', N'wpaikc@t-online.de')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (14, 14, N'Ethelind', N'Ranyard', N'272-650-1551', N'eranyardd@tamu.edu')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (15, 15, N'Harper', N'Glassmen', N'323-515-1231', N'dwdd@dsdad.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (16, 16, N'Billie', N'Baudinet', N'674-565-1160', N'bbaudinetf@japanpost.jp')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (17, 17, N'Othelia', N'Mulqueen', N'843-397-1632', N'omulqueeng@wired.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (18, 18, N'Tiffani', N'Trethowan', N'460-257-3870', N'ttrethowanh@hp.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (19, 19, N'Annetta', N'Ancliff', N'367-739-4263', N'aancliffi@foxnews.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (20, 20, N'Teresina', N'Dioniso', N'988-826-0658', N'tdionisoj@simplemachines.org')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (21, 21, N'Meg', N'Belshaw', N'624-758-4870', N'mbelshawk@tumblr.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (22, 22, N'Gillan', N'Scudders', N'459-722-9886', N'gscuddersl@hhs.gov')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (23, 23, N'Wally', N'Baybutt', N'961-931-1241', N'wbaybuttm@moonfruit.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (24, 24, N'Floris', N'Hendonson', N'710-102-1636', N'fhendonsonn@instagram.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (25, 25, N'Rutger', N'Sperski', N'920-341-0301', N'rsperskio@cdbaby.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (26, 26, N'Addie', N'Iaduccelli', N'788-656-0666', N'aiaduccellip@list-manage.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (27, 27, N'Van', N'Lescop', N'340-494-9667', N'vlescopq@privacy.gov.au')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (28, 28, N'Diandra', N'Hunnawill', N'148-709-5515', N'dhunnawillr@blogger.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (29, 29, N'Britt', N'Le Monnier', N'464-199-6045', N'blemonniers@netscape.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (30, 30, N'Gardener', N'June', N'516-710-0818', N'gjunet@cyberchimps.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (31, 31, N'Erminia', N'Owtram', N'672-808-6725', N'eowtramu@plala.or.jp')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (32, 32, N'Alla', N'Coumbe', N'848-204-8344', N'acoumbev@amazon.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (33, 33, N'Kim', N'Jewel', N'653-870-6293', N'kjewelw@businessinsider.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (34, 34, N'Madelon', N'Haacker', N'350-750-0462', N'mhaackerx@independent.co.uk')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (35, 35, N'Judye', N'Gussie', N'926-816-1738', N'jgussiey@arizona.edu')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (36, 36, N'Christoph', N'Guilloud', N'654-902-8028', N'cguilloudz@amazon.co.jp')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (37, 37, N'Ellie', N'Zoane', N'582-866-2135', N'ezoane10@ca.gov')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (38, 38, N'Martica', N'Jannasch', N'784-136-1394', N'mjannasch11@telegraph.co.uk')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (39, 39, N'Garrik', N'Letson', N'879-175-5435', N'gletson12@storify.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (40, 40, N'Raquel', N'Loader', N'506-760-2979', N'rloader13@sciencedirect.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (41, 41, N'Lindon', N'Sacher', N'298-509-3334', N'lsacher14@webs.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (42, 42, N'Hubie', N'Jehaes', N'452-149-8029', N'hjehaes15@intel.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (43, 43, N'Nancee', N'Patman', N'633-115-9334', N'npatman16@last.fm')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (44, 44, N'Jemima', N'Harlock', N'925-182-6468', N'jharlock17@nationalgeographic.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (45, 45, N'Gill', N'Gerry', N'807-401-6990', N'ggerry18@un.org')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (46, 46, N'Adolf', N'Gartery', N'240-583-8628', N'agartery19@cbsnews.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (47, 47, N'Doralia', N'Bohike', N'839-430-3742', N'dbohike1a@dropbox.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (48, 48, N'Lacy', N'Gladman', N'357-505-9343', N'lgladman1b@utexas.edu')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (49, 49, N'Truda', N'Stannard', N'776-960-7568', N'tstannard1c@tripadvisor.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (50, 50, N'Michelina', N'Gresty', N'221-533-3481', N'mgresty1d@foxnews.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (51, 51, N'Kirbee', N'Twitchett', N'989-442-1513', N'ktwitchett1e@mlb.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (52, 52, N'Jodie', N'Sauvain', N'423-513-5232', N'sdada@jdk.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (53, 53, N'Cad', N'MacAlinden', N'733-594-8929', N'cmacalinden1g@miitbeian.gov.cn')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (54, 54, N'Emlyn', N'Daud', N'258-178-6756', N'edaud1h@ucsd.edu')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (55, 55, N'Maighdiln', N'Seers', N'851-342-2798', N'mseers1i@si.edu')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (56, 56, N'Norry', N'Waszczykowski', N'157-509-4157', N'nwaszczykowski1j@dion.ne.jp')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (57, 57, N'Timothy', N'Sissens', N'978-328-0851', N'tsissens1k@prweb.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (58, 58, N'Deina', N'Revell', N'889-107-0344', N'drevell1l@google.cn')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (59, 59, N'Linea', N'MacFadzan', N'732-881-4129', N'lmacfadzan1m@vk.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (60, 60, N'Bea', N'Lampart', N'106-545-0362', N'blampart1n@scribd.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (61, 61, N'Nixie', N'Gomery', N'915-583-7010', N'ngomery1o@springer.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (62, 62, N'Lodovico', N'Alison', N'641-530-1411', N'lalison1p@cnbc.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (63, 63, N'Tova', N'Feldmesser', N'823-154-4561', N'tfeldmesser1q@bigcartel.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (64, 64, N'Lucine', N'Canape', N'562-636-5618', N'lcanape1r@liveinternet.ru')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (65, 65, N'Wernher', N'Spadazzi', N'430-547-6908', N'wspadazzi1s@people.com.cn')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (66, 66, N'Harmonie', N'Swiffan', N'612-586-3209', N'hswiffan1t@last.fm')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (67, 67, N'Saxe', N'Gierhard', N'590-925-2543', N'sgierhard1u@ed.gov')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (68, 68, N'Melisenda', N'Roakes', N'797-321-5100', N'mroakes1v@gmpg.org')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (69, 69, N'Huntley', N'Abrey', N'477-357-4143', N'habrey1w@geocities.jp')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (70, 70, N'Ami', N'Derrick', N'895-114-5873', N'aderrick1x@about.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (71, 71, N'Lexine', N'Janus', N'420-191-3374', N'ljanus1y@tmall.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (72, 72, N'Willy', N'Canby', N'113-118-1441', N'wcanby1z@theguardian.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (73, 73, N'Nanete', N'Wilshaw', N'265-994-0241', N'nwilshaw20@guardian.co.uk')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (74, 74, N'Gustavo', N'Georgel', N'750-664-3034', N'ggeorgel21@yandex.ru')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (75, 75, N'Ardath', N'Egre', N'738-695-7766', N'aegre22@netscape.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (76, 76, N'Lexy', N'Waldram', N'197-897-0450', N'lwaldram23@weather.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (77, 77, N'Charla', N'Pechet', N'542-307-0535', N'cpechet24@over-blog.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (78, 78, N'Mathe', N'Tosdevin', N'339-103-6819', N'mtosdevin25@ed.gov')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (79, 79, N'Donielle', N'Thorald', N'233-198-8660', N'dthorald26@issuu.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (80, 80, N'Tabby', N'McAuslene', N'449-949-5432', N'tmcauslene27@hexun.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (81, 81, N'Myrwyn', N'Huygens', N'438-512-8948', N'mhuygens28@ebay.co.uk')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (82, 82, N'Camel', N'Canario', N'861-391-3610', N'ccanario29@behance.net')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (83, 83, N'Orelia', N'Marnes', N'386-915-2765', N'omarnes2a@bandcamp.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (84, 84, N'Euell', N'McIlmurray', N'940-333-1262', N'emcilmurray2b@cdbaby.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (85, 85, N'Reyna', N'Minci', N'823-312-1654', N'rminci2c@comcast.net')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (86, 86, N'Isidora', N'Chilley', N'227-227-9267', N'ichilley2d@facebook.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (87, 87, N'Robbie', N'Bertson', N'706-323-5024', N'rbertson2e@google.com.au')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (88, 88, N'Curr', N'Josephs', N'100-827-0050', N'cjosephs2f@google.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (89, 89, N'Seymour', N'Lawrinson', N'894-981-7718', N'slawrinson2g@wp.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (90, 90, N'Meade', N'Fenix', N'674-915-8700', N'mfenix2h@hao123.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (91, 91, N'Marybeth', N'Randals', N'243-310-3520', N'mrandals2i@google.es')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (92, 92, N'Otto', N'Grossier', N'609-550-8381', N'ogrossier2j@linkedin.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (93, 93, N'Towney', N'Calbert', N'352-485-0642', N'tcalbert2k@a8.net')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (94, 94, N'Helaina', N'Wroth', N'812-516-5262', N'hwroth2l@booking.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (95, 95, N'Joy', N'Burman', N'633-822-4370', N'jburman2m@go.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (96, 96, N'Lorine', N'Bourges', N'272-895-1704', N'lbourges2n@uol.com.br')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (97, 97, N'Dilan', N'Gantz', N'151-965-1071', N'dgantz2o@whitehouse.gov')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (98, 98, N'Derrick', N'Cleave', N'390-849-4037', N'dcleave2p@w3.org')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (99, 99, N'Kathy', N'Harkins', N'328-843-1138', N'kharkins2q@google.co.jp')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (100, 100, N'Dun', N'De Matteis', N'311-795-0149', N'ddematteis2r@aol.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (101, 101, N'Matt', N'Jones', N'555-555-5555', N'mj@gmail.com')
GO
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (102, 103, N'bob', N'thonry', N'323-423-6165', N'doglk@asdas.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (103, 104, N'Joe', N'Smoe', N'323-541-5231', N'hsir@asda.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (104, 105, N'Joe', N'Smoe', N'323-541-5231', N'hsir@asda.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (105, 106, N'Mr', N'Bob', N'433-423-4131', N'sdhda@ada.com')
INSERT [dbo].[Customer] ([customerid], [customeraddressid], [first_name], [last_name], [phone], [email]) VALUES (106, 107, N'Happy', N'Johnson', N'423-423-5151', N'3251@ada.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerAddress] ON 

INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (2, 3, 43, 1, 24, 2)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (3, 3, 43, 1, 25, 3)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (4, 3, 43, 1, 5, 4)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (5, 3, 43, 1, 6, 5)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (6, 1, 3, 2, 1, 3)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (7, 3, 43, 1, 7, 7)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (8, 3, 43, 1, 9, 8)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (9, 3, 43, 1, 50, 9)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (10, 3, 43, 1, 40, 10)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (11, 3, 43, 1, 69, 11)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (12, 3, 43, 1, 10, 12)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (13, 3, 43, 1, 8, 13)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (14, 3, 43, 1, 79, 14)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (15, 1, 3, 1, 2, 29)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (16, 3, 43, 1, 25, 16)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (17, 3, 43, 1, 5, 17)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (18, 3, 43, 1, 6, 18)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (19, 3, 43, 1, 78, 19)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (20, 3, 43, 1, 7, 20)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (21, 3, 43, 1, 9, 21)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (22, 3, 43, 1, 50, 22)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (23, 3, 43, 1, 40, 23)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (24, 3, 43, 1, 69, 24)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (25, 3, 43, 1, 10, 25)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (26, 3, 43, 1, 8, 26)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (27, 3, 43, 1, 79, 27)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (28, 3, 43, 1, 24, 28)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (29, 3, 43, 1, 25, 29)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (30, 3, 43, 1, 5, 30)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (31, 3, 43, 1, 6, 31)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (32, 3, 43, 1, 78, 32)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (33, 3, 43, 1, 7, 33)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (34, 3, 43, 1, 9, 34)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (35, 3, 43, 1, 50, 35)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (36, 3, 43, 1, 40, 36)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (37, 3, 43, 1, 69, 37)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (38, 3, 43, 1, 10, 38)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (39, 3, 43, 1, 8, 39)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (40, 3, 43, 1, 79, 40)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (41, 3, 43, 1, 24, 41)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (42, 3, 43, 1, 25, 42)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (43, 3, 43, 1, 5, 43)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (44, 3, 43, 1, 6, 44)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (45, 3, 43, 1, 78, 45)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (46, 3, 43, 1, 7, 46)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (47, 3, 43, 1, 9, 47)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (48, 3, 43, 1, 50, 48)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (49, 3, 43, 1, 40, 49)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (50, 3, 43, 1, 69, 50)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (51, 3, 43, 1, 10, 51)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (52, 45, 4, 2, 2, 2)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (53, 3, 43, 1, 79, 53)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (54, 3, 43, 1, 24, 54)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (55, 3, 43, 1, 25, 55)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (56, 3, 43, 1, 5, 56)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (57, 3, 43, 1, 6, 57)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (58, 3, 43, 1, 78, 58)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (59, 3, 43, 1, 7, 59)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (60, 3, 43, 1, 9, 60)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (61, 3, 43, 1, 50, 61)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (62, 3, 43, 1, 40, 62)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (63, 3, 43, 1, 69, 63)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (64, 3, 43, 1, 10, 64)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (65, 3, 43, 1, 8, 65)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (66, 3, 43, 1, 79, 66)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (67, 3, 43, 1, 24, 67)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (68, 3, 43, 1, 25, 68)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (69, 3, 43, 1, 5, 69)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (70, 3, 43, 1, 6, 70)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (71, 3, 43, 1, 78, 71)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (72, 3, 43, 1, 7, 72)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (73, 3, 43, 1, 9, 73)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (74, 3, 43, 1, 50, 74)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (75, 3, 43, 1, 40, 75)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (76, 3, 43, 1, 69, 76)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (77, 3, 43, 1, 10, 77)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (78, 3, 43, 1, 8, 78)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (79, 3, 43, 1, 79, 79)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (80, 3, 43, 1, 24, 80)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (81, 3, 43, 1, 25, 81)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (82, 3, 43, 1, 5, 82)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (83, 3, 43, 1, 6, 83)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (84, 3, 43, 1, 78, 84)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (85, 3, 43, 1, 7, 85)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (86, 3, 43, 1, 9, 86)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (87, 3, 43, 1, 50, 87)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (88, 3, 43, 1, 40, 88)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (89, 3, 43, 1, 69, 89)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (90, 3, 43, 1, 10, 90)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (91, 3, 43, 1, 8, 91)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (92, 3, 43, 1, 79, 92)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (93, 3, 43, 1, 24, 93)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (94, 3, 43, 1, 25, 94)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (95, 3, 43, 1, 5, 95)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (96, 3, 43, 1, 6, 96)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (97, 3, 43, 1, 78, 98)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (98, 3, 43, 1, 7, 99)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (99, 3, 43, 1, 9, 100)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (100, 3, 43, 1, 50, 101)
GO
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (101, NULL, NULL, NULL, NULL, 515)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (102, 3, 43, 1, 8, 96)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (103, 1, 2, 2, 4, 3)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (104, 1, 3, 2, 2, 2)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (105, 1, 3, 2, 2, 2)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (106, 1, 3, 1, 2, 2)
INSERT [dbo].[CustomerAddress] ([customeraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (107, 1, 43, 1, 2, 3)
SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerStatus] ON 

INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (1, 3, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (2, 4, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (3, 5, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (4, 6, N'false')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (5, 7, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (6, 8, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (7, 9, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (8, 10, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (9, 11, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (10, 12, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (11, 13, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (12, 14, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (13, 15, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (14, 16, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (15, 17, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (16, 18, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (17, 19, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (18, 20, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (19, 21, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (20, 22, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (21, 23, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (22, 24, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (23, 25, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (24, 26, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (25, 27, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (26, 28, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (27, 29, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (28, 30, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (29, 31, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (30, 32, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (31, 33, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (32, 34, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (33, 35, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (34, 36, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (35, 37, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (36, 38, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (37, 39, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (38, 40, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (39, 41, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (40, 42, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (41, 43, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (42, 44, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (43, 45, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (44, 46, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (45, 47, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (46, 48, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (47, 49, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (48, 50, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (49, 51, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (50, 52, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (51, 53, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (52, 54, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (53, 55, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (54, 56, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (55, 57, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (56, 58, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (57, 59, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (58, 60, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (59, 61, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (60, 62, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (61, 63, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (62, 64, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (63, 65, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (64, 66, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (65, 67, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (66, 68, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (67, 69, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (68, 70, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (69, 71, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (70, 72, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (71, 73, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (72, 74, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (73, 75, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (74, 76, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (75, 77, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (76, 78, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (77, 79, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (78, 80, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (79, 81, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (80, 82, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (81, 83, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (82, 84, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (83, 85, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (84, 86, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (85, 87, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (86, 88, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (87, 89, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (88, 90, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (89, 91, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (90, 92, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (91, 93, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (92, 94, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (93, 95, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (94, 96, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (95, 97, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (96, 98, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (97, 99, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (98, 100, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (99, 101, N'true')
GO
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (100, 102, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (101, 103, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (102, 104, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (103, 105, N'true')
INSERT [dbo].[CustomerStatus] ([customerstatusid], [customerid], [customer_status]) VALUES (104, 106, N'false')
SET IDENTITY_INSERT [dbo].[CustomerStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (2, 2, N'Michael', N'Drake', N'832-612-7000', N'midrake@gmail.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (3, 3, N'Michelle', N'Travis', N'713-969-7723', N'mitravis@gmail.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (4, 4, N'Marty', N'Brown', N'713-913-4089.33333', N'mabrown@gmail.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (5, 5, N'John', N'Miller', N'713-210-4044', N'jomiller@gmail.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (6, 6, N'', N'', N'', N'')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (7, 7, N'Matt', N'Garcia', N'523-523-5413', N'dsad@gmail.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (8, 8, N'Estella', N'Rodriguez', N'323-413-3231', N'dasd@asdsa.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (9, 9, N'Betty', N'Wilson', N'713-398-3866.83333', N'bewilson@gmail.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (10, 10, N'Brenda', N'Jones', N'323-451-4531', N'shdsd@hdsad.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (11, 10, N'John', N'Smith', N'555-555-5555', N'js@gmail.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (12, 13, N'bobby', N'bill', N'423-542-1513', N'asdsa@adsa.com')
INSERT [dbo].[Employee] ([employeeid], [employeeaddressid], [first_name], [last_name], [phone], [email]) VALUES (13, 14, N'Johnny', N'Perdue', N'523-513-5232', N'hihoh@hasda.com')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeAddress] ON 

INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (2, 1, 45, 1, 24, 92)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (3, 1, 45, 1, 25, 93)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (4, 1, 45, 1, 5, 94)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (5, 1, 45, 1, 6, 95)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (6, 1, 45, 1, 78, 96)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (7, 4, 5, 3, 4, 5)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (8, 1, 43, 2, 2, 2)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (9, 1, 45, 1, 50, 99)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (10, 1, 45, 1, 40, 100)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (11, 1, 45, 1, 24, 90)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (12, 1, 45, 1, 24, 90)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (13, 1, 4, 3, 2, 4)
INSERT [dbo].[EmployeeAddress] ([employeeaddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (14, 1, 2, 2, 11, 11)
SET IDENTITY_INSERT [dbo].[EmployeeAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeCertificate] ON 

INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (2, 2, N'Food Manager Certificate', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (3, 3, N'Food Saftey Manager', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (4, 4, N'Taste Tester', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (11, 6, N'Food Taste Tester', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (12, 7, N'Food Taste Tester', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (13, 8, N'Food Handler Certificate', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (14, 9, N'Food Taste Tester', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (15, 10, N'Food Handler Certificate', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (16, 11, N'Food Taste Tester', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (18, 12, N'Tester', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (19, 9, N'Quality', 0)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (20, 13, N'Ice cream supervisor', 1)
INSERT [dbo].[EmployeeCertificate] ([employeecertificateid], [employeeid], [employee_certificate], [Active]) VALUES (21, 13, N'Ice cream supervisor', 0)
SET IDENTITY_INSERT [dbo].[EmployeeCertificate] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeLogin] ON 

INSERT [dbo].[EmployeeLogin] ([employeeloginid], [employeeid], [username], [password]) VALUES (3, 3, N'UR', N'passw')
INSERT [dbo].[EmployeeLogin] ([employeeloginid], [employeeid], [username], [password]) VALUES (4, 4, N'userr', N'pass')
INSERT [dbo].[EmployeeLogin] ([employeeloginid], [employeeid], [username], [password]) VALUES (5, 5, N'useer', N'pswrd')
INSERT [dbo].[EmployeeLogin] ([employeeloginid], [employeeid], [username], [password]) VALUES (6, 6, N'', N'')
INSERT [dbo].[EmployeeLogin] ([employeeloginid], [employeeid], [username], [password]) VALUES (7, 7, N'usser', N'paswd')
INSERT [dbo].[EmployeeLogin] ([employeeloginid], [employeeid], [username], [password]) VALUES (8, 8, N'Estella', N'pass123')
INSERT [dbo].[EmployeeLogin] ([employeeloginid], [employeeid], [username], [password]) VALUES (9, 13, N'john', N'fondue')
SET IDENTITY_INSERT [dbo].[EmployeeLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeStatus] ON 

INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (2, 2, N'false')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (3, 3, N'true')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (4, 4, N'false')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (5, 5, N'false')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (6, 6, N'true')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (7, 7, N'true')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (8, 8, N'true')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (9, 9, N'false')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (11, 11, N'false')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (12, 12, N'true')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (13, 10, N'true')
INSERT [dbo].[EmployeeStatus] ([employeestatusid], [employeeid], [employee_status]) VALUES (14, 13, N'false')
SET IDENTITY_INSERT [dbo].[EmployeeStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([equipmentid], [vendorid], [equipmentconditionid], [equipment_type], [equipment_name], [equipment_price], [Active]) VALUES (7, 34, 1, N'Appliance', N'Waffle Cone Maker', 249.9900, 1)
INSERT [dbo].[Equipment] ([equipmentid], [vendorid], [equipmentconditionid], [equipment_type], [equipment_name], [equipment_price], [Active]) VALUES (8, 22, 1, N'Appliance', N'Pump Condiment Dispenser', 129.9900, 1)
INSERT [dbo].[Equipment] ([equipmentid], [vendorid], [equipmentconditionid], [equipment_type], [equipment_name], [equipment_price], [Active]) VALUES (9, 6, 1, N'Appliance', N'Serving Utensils', 29.9900, 1)
INSERT [dbo].[Equipment] ([equipmentid], [vendorid], [equipmentconditionid], [equipment_type], [equipment_name], [equipment_price], [Active]) VALUES (11, 6, 1, N'Appliance', N'Scoop', 15.9900, 1)
INSERT [dbo].[Equipment] ([equipmentid], [vendorid], [equipmentconditionid], [equipment_type], [equipment_name], [equipment_price], [Active]) VALUES (12, 6, 3, N'Appliance', N'Frosty Machine', 350.0000, 1)
INSERT [dbo].[Equipment] ([equipmentid], [vendorid], [equipmentconditionid], [equipment_type], [equipment_name], [equipment_price], [Active]) VALUES (13, 2, 1, N'Appliance', N'Freezer', 500.0000, 1)
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[EquipmentCondition] ON 

INSERT [dbo].[EquipmentCondition] ([equipmentconditionid], [equipment_condition], [Active]) VALUES (1, N'new', 1)
INSERT [dbo].[EquipmentCondition] ([equipmentconditionid], [equipment_condition], [Active]) VALUES (3, N'used', 1)
INSERT [dbo].[EquipmentCondition] ([equipmentconditionid], [equipment_condition], [Active]) VALUES (11, N'repairing', 1)
INSERT [dbo].[EquipmentCondition] ([equipmentconditionid], [equipment_condition], [Active]) VALUES (12, N'processing', 0)
INSERT [dbo].[EquipmentCondition] ([equipmentconditionid], [equipment_condition], [Active]) VALUES (13, N'repaired', 0)
SET IDENTITY_INSERT [dbo].[EquipmentCondition] OFF
GO
SET IDENTITY_INSERT [dbo].[FlavorPrice] ON 

INSERT [dbo].[FlavorPrice] ([flavorpriceid], [flavor_price]) VALUES (20, 1.0000)
INSERT [dbo].[FlavorPrice] ([flavorpriceid], [flavor_price]) VALUES (21, 2.0000)
INSERT [dbo].[FlavorPrice] ([flavorpriceid], [flavor_price]) VALUES (22, 3.0000)
INSERT [dbo].[FlavorPrice] ([flavorpriceid], [flavor_price]) VALUES (23, 3.0000)
INSERT [dbo].[FlavorPrice] ([flavorpriceid], [flavor_price]) VALUES (24, 2.0000)
INSERT [dbo].[FlavorPrice] ([flavorpriceid], [flavor_price]) VALUES (25, 2.0000)
INSERT [dbo].[FlavorPrice] ([flavorpriceid], [flavor_price]) VALUES (26, 2.0000)
SET IDENTITY_INSERT [dbo].[FlavorPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[FlavorType] ON 

INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (3, 24, N'Chocolate Chip', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (4, 20, N'Butter Pecan', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (5, 20, N'Chocolate Chip Cookie Dough', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (6, 20, N'Eggnog', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (7, 20, N'Eskimo', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (8, 20, N'Strawberry', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (9, 20, N'Horchata', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (10, 20, N'Lemon Custard', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (11, 20, N'Cookies ''N Cream', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (12, 20, N'Mint Chocolate Chip', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (13, 20, N'Moose Tracks', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (14, 20, N'Neapolitan', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (15, 20, N'Cotton Candy', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (16, 20, N'Butterscotch', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (17, 20, N'German Chocolate Cake', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (18, 20, N'Matcha', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (19, 20, N'Teaberry', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (20, 20, N'Ube', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (21, 20, N'Peanut Butter Cup Cream', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (22, 20, N'Cherry Garcia', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (23, 20, N'Rocky Road', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (24, 20, N'PeanutButterJelly', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (25, 20, N'Mango', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (26, 20, N'Pralines n Cream', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (27, 20, N'Chunky Monkey', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (28, 20, N'Salted Caramel', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (29, 20, N'Superboy', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (30, 20, N'The Tonight Dough', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (31, 20, N'Banana', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (32, 20, N'Vanilla', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (33, 20, N'Chocolate Vanilla', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (35, 20, N'Swirly', 0)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (36, 23, N'Peanut Butter', 1)
INSERT [dbo].[FlavorType] ([flavortypeid], [flavorpriceid], [flavor_type], [Active]) VALUES (37, 26, N'Fudge', 0)
SET IDENTITY_INSERT [dbo].[FlavorType] OFF
GO
SET IDENTITY_INSERT [dbo].[IceCream] ON 

INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (3, 3, 3, 6)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (4, 4, 1, 3)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (5, 5, 1, 2)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (7, 7, 1, 8)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (8, 8, 2, 9)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (9, 9, 3, 10)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (10, 10, 1, 2)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (11, 3, 2, 10)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (12, 12, 3, 7)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (13, 13, 1, 8)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (14, 14, 2, 6)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (15, 15, 3, 5)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (16, 16, 1, 9)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (17, 17, 2, 4)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (19, 19, 1, 2)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (20, 20, 2, 3)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (21, 21, 3, 5)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (22, 22, 1, 10)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (23, 23, 2, 3)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (24, 24, 3, 9)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (25, 25, 1, 8)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (26, 26, 2, 7)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (27, 27, 3, 5)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (28, 28, 1, 2)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (29, 29, 2, 4)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (30, 30, 3, 6)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (31, 31, 2, 6)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (34, 4, 2, 3)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (35, 3, 2, 2)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (36, 4, 2, 8)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (37, 4, 2, 8)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (38, 3, 2, 6)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (39, 3, 2, 2)
INSERT [dbo].[IceCream] ([icecreamid], [flavortypeid], [sizeid], [toppingid]) VALUES (40, 4, 1, 2)
SET IDENTITY_INSERT [dbo].[IceCream] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (7, 7, 7, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (9, 9, 9, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (10, 10, 10, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (11, 11, 11, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (12, 12, 12, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (13, 13, 13, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (14, 14, 14, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (15, 15, 15, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (16, 16, 16, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (17, 17, 17, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (19, 19, 19, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (20, 20, 20, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (21, 21, 21, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (22, 22, 22, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (23, 23, 23, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (24, 24, 24, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (25, 25, 25, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (26, 26, 26, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (27, 27, 27, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (28, 28, 28, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (29, 29, 29, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (30, 30, 30, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (31, 31, 31, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (34, 34, 34, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (35, 35, 35, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (36, 36, 36, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (37, 37, 37, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (38, 38, 38, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (39, 39, 39, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (40, 40, 40, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (41, 41, 41, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (42, 42, 42, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (43, 43, 43, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (44, 44, 44, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (45, 45, 45, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (46, 46, 46, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (47, 47, 47, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (48, 48, 48, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (49, 49, 49, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (50, 50, 50, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (51, 51, 51, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (52, 52, 52, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (53, 53, 53, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (54, 54, 54, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (55, 55, 55, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (56, 56, 56, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (57, 57, 57, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (58, 58, 58, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (59, 59, 59, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (60, 60, 60, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (61, 61, 61, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (62, 62, 62, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (63, 63, 63, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (64, 64, 64, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (65, 65, 65, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (66, 66, 66, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (67, 67, 67, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (68, 68, 68, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (69, 69, 69, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (70, 70, 70, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (71, 71, 71, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (72, 72, 72, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (73, 73, 73, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (74, 74, 74, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (75, 75, 75, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (76, 76, 76, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (77, 77, 77, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (78, 78, 78, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (79, 79, 79, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (80, 80, 80, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (81, 81, 81, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (82, 82, 82, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (83, 83, 83, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (84, 84, 84, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (85, 85, 85, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (86, 86, 86, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (87, 87, 87, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (88, 88, 88, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (89, 89, 89, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (90, 90, 90, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (91, 91, 91, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (92, 92, 92, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (93, 93, 93, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (94, 94, 94, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (95, 95, 95, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (96, 96, 96, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (97, 97, 97, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (98, 98, 98, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (99, 99, 99, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (100, 100, 100, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (101, 101, 31, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (104, 7, 34, 2, 0)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (105, 102, 35, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (106, 106, 37, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (107, 7, 38, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (108, 11, 39, 1, 1)
INSERT [dbo].[Orders] ([orderid], [customerid], [icecreamid], [orderstatusid], [Active]) VALUES (109, 105, 40, 2, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([orderstatusid], [order_status], [Active]) VALUES (1, N'complete', 1)
INSERT [dbo].[OrderStatus] ([orderstatusid], [order_status], [Active]) VALUES (2, N'in progress', 1)
INSERT [dbo].[OrderStatus] ([orderstatusid], [order_status], [Active]) VALUES (22, N'processing', 1)
INSERT [dbo].[OrderStatus] ([orderstatusid], [order_status], [Active]) VALUES (23, N'', 0)
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Premium] ON 

INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (4, 1, 4)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (5, 1, 5)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (6, 2, 6)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (7, 1, 7)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (8, 1, 8)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (9, 1, 9)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (10, 1, 10)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (11, 1, 11)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (12, 1, 12)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (13, 1, 13)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (14, 1, 14)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (15, 1, 15)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (16, 1, 16)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (17, 1, 17)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (18, 1, 18)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (19, 1, 19)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (20, 1, 20)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (21, 1, 21)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (22, 1, 22)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (23, 1, 23)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (24, 1, 24)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (25, 1, 25)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (26, 1, 26)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (27, 1, 27)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (28, 1, 28)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (29, 1, 29)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (30, 1, 30)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (31, 1, 31)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (32, 1, 32)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (33, 1, 33)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (34, 1, 34)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (35, 1, 35)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (36, 1, 36)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (37, 1, 37)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (38, 1, 38)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (39, 1, 39)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (40, 1, 40)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (41, 1, 41)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (42, 1, 42)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (43, 1, 43)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (44, 1, 44)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (45, 1, 45)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (46, 1, 46)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (47, 1, 47)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (48, 1, 48)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (49, 1, 49)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (50, 1, 50)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (51, 1, 51)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (52, 1, 52)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (53, 1, 53)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (54, 1, 54)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (55, 1, 55)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (56, 1, 56)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (57, 1, 57)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (58, 1, 58)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (59, 1, 59)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (60, 1, 60)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (61, 1, 61)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (62, 1, 62)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (63, 1, 63)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (64, 1, 64)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (65, 1, 65)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (66, 1, 66)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (67, 1, 67)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (68, 1, 68)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (69, 1, 69)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (70, 1, 70)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (71, 1, 71)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (72, 1, 72)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (73, 1, 73)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (74, 1, 74)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (75, 1, 75)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (76, 1, 76)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (77, 1, 77)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (78, 1, 78)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (79, 1, 79)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (80, 1, 80)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (81, 1, 81)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (82, 1, 82)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (83, 1, 83)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (84, 1, 84)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (85, 1, 85)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (86, 1, 86)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (87, 1, 87)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (88, 1, 88)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (89, 1, 89)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (90, 1, 90)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (91, 1, 91)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (92, 1, 92)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (93, 1, 93)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (94, 1, 94)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (95, 1, 95)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (96, 1, 96)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (97, 1, 97)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (98, 1, 98)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (99, 1, 99)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (100, 1, 100)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (101, 1, 101)
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (102, 1, 105)
GO
INSERT [dbo].[Premium] ([premiumid], [premiumstatusid], [customerid]) VALUES (103, 2, 106)
SET IDENTITY_INSERT [dbo].[Premium] OFF
GO
SET IDENTITY_INSERT [dbo].[PremiumStatus] ON 

INSERT [dbo].[PremiumStatus] ([premiumstatusid], [premium_status]) VALUES (1, N'true')
INSERT [dbo].[PremiumStatus] ([premiumstatusid], [premium_status]) VALUES (2, N'false')
SET IDENTITY_INSERT [dbo].[PremiumStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([reservationid], [customerid], [reservationstatusid], [reservation_date]) VALUES (1, 6, 5, CAST(N'2021-04-20' AS Date))
INSERT [dbo].[Reservation] ([reservationid], [customerid], [reservationstatusid], [reservation_date]) VALUES (5, 21, 1, CAST(N'2021-04-01' AS Date))
INSERT [dbo].[Reservation] ([reservationid], [customerid], [reservationstatusid], [reservation_date]) VALUES (9, 66, 1, CAST(N'2021-06-07' AS Date))
INSERT [dbo].[Reservation] ([reservationid], [customerid], [reservationstatusid], [reservation_date]) VALUES (11, 105, 1, CAST(N'2021-04-20' AS Date))
INSERT [dbo].[Reservation] ([reservationid], [customerid], [reservationstatusid], [reservation_date]) VALUES (12, 106, 5, CAST(N'2021-04-20' AS Date))
SET IDENTITY_INSERT [dbo].[Reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[ReservationStatus] ON 

INSERT [dbo].[ReservationStatus] ([reservationstatusid], [reservation_status]) VALUES (1, N'true')
INSERT [dbo].[ReservationStatus] ([reservationstatusid], [reservation_status]) VALUES (5, N'false')
SET IDENTITY_INSERT [dbo].[ReservationStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([sizeid], [sizepriceid], [size], [Active]) VALUES (1, 9, N'super tiny', 0)
INSERT [dbo].[Size] ([sizeid], [sizepriceid], [size], [Active]) VALUES (2, 2, N'Medium', 1)
INSERT [dbo].[Size] ([sizeid], [sizepriceid], [size], [Active]) VALUES (3, 8, N'Very Large', 1)
INSERT [dbo].[Size] ([sizeid], [sizepriceid], [size], [Active]) VALUES (4, 3, N'tiny', 1)
INSERT [dbo].[Size] ([sizeid], [sizepriceid], [size], [Active]) VALUES (5, 6, N'Large', 1)
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[SizePrice] ON 

INSERT [dbo].[SizePrice] ([sizepriceid], [size_price]) VALUES (1, 1.0000)
INSERT [dbo].[SizePrice] ([sizepriceid], [size_price]) VALUES (2, 6.5000)
INSERT [dbo].[SizePrice] ([sizepriceid], [size_price]) VALUES (3, 7.7500)
INSERT [dbo].[SizePrice] ([sizepriceid], [size_price]) VALUES (4, 1.0000)
INSERT [dbo].[SizePrice] ([sizepriceid], [size_price]) VALUES (5, 8.0000)
INSERT [dbo].[SizePrice] ([sizepriceid], [size_price]) VALUES (6, 8.1500)
INSERT [dbo].[SizePrice] ([sizepriceid], [size_price]) VALUES (7, 1.5000)
INSERT [dbo].[SizePrice] ([sizepriceid], [size_price]) VALUES (8, 9.0000)
INSERT [dbo].[SizePrice] ([sizepriceid], [size_price]) VALUES (9, 1.5000)
SET IDENTITY_INSERT [dbo].[SizePrice] OFF
GO
SET IDENTITY_INSERT [dbo].[StateList] ON 

INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (2, N'Alaska', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (3, N'Arizona', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (4, N'Arkansas', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (5, N'California', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (6, N'Colorado', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (7, N'Connecticut', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (8, N'Delaware', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (9, N'Florida', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (10, N'Georgia', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (11, N'Hawaii', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (12, N'Idaho', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (13, N'Illinois', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (14, N'Indiana', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (15, N'Iowa', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (16, N'Kansas', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (17, N'Kentucky', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (18, N'Louisiana', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (19, N'Maine', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (20, N'Maryland', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (21, N'Massachusetts', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (22, N'Michigan', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (23, N'Minnesota', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (24, N'Mississippi', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (25, N'Missouri', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (26, N'Montana', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (27, N'Nebraska', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (28, N'Nevada', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (29, N'New Hampshire', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (30, N'New Jersey', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (31, N'New Mexico', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (32, N'New York', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (33, N'North Carolina', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (34, N'North Dakota', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (35, N'Ohio', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (36, N'Oklahoma', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (37, N'Oregon', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (38, N'Pennsylvania', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (39, N'Rhode Island', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (40, N'South Carolina', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (41, N'South Dakota', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (42, N'Tennessee', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (43, N'Texas', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (44, N'Utah', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (45, N'Vermont', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (46, N'Virginia', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (47, N'Washington', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (48, N'West Virginia', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (49, N'Wisconsin', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (50, N'Wyoming', 1)
INSERT [dbo].[StateList] ([stateid], [state_name], [Active]) VALUES (51, N'Guam', 1)
SET IDENTITY_INSERT [dbo].[StateList] OFF
GO
SET IDENTITY_INSERT [dbo].[StreetList] ON 

INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (2, N'Summerview Drive', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (3, N'Butterfield Avenue', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (4, N'Norway Maple Hill', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (5, N'Hovde Lane', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (6, N'Sunbrook Place', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (7, N'Heffernan Street', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (8, N' Ludington Terrace', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (9, N'Goodland Avenue', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (10, N'Fieldstone Point', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (11, N'Harper Junction', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (12, N' North Avenue', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (13, N'Mitchell Junction', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (14, N'Eastlawn Terrace', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (15, N'Gordo Lane', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (16, N'Onsgard Point', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (17, N'American Point', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (18, N'Eliot Crossing', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (19, N'Forster Terrace', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (20, N'Melby Pass', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (21, N'Anzinger Lane', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (22, N'Ryan Crossing', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (23, N'Northland Point', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (24, N'Dapin Circle', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (25, N'Mendota Junction', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (26, N' Badeau Hill', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (27, N'Jackson Pass', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (28, N'Vidon Junction', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (29, N'Scofield Point', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (30, N'Mallory Road', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (31, N'Stoughton Trail', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (32, N'Gulseth Point', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (33, N'Lerdahl Junction', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (34, N'Macpherson Alley', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (35, N'Roth Drive', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (36, N'Dennis Center', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (37, N'Declaration Hill', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (38, N' Green Pass', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (39, N' North Way', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (40, N'Dryden Circle', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (41, N'Mallard Parkway', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (42, N'Buena Vista Park', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (43, N'Washington Terrace', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (44, N'Commercial Way', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (45, N'Fieldstone Park', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (46, N'Lawn Park', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (47, N' Maple Wood Drive', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (48, N'Mendota Crossing', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (49, N'Wayridge Plaza', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (50, N'Trail dr', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (51, N'Packers Drive', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (52, N'Evergreen Terrace', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (53, N'Merchant Terrace', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (54, N' Ohio Place', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (55, N' Russell Parkway', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (56, N' Bellgrove Center', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (57, N' Trail Dr', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (58, N'Algoma Way', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (59, N'Monument Crossing', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (60, N'Oneill Trail', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (61, N'Iowa Drive', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (62, N' Loeprich Court', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (63, N'Ohio Lane', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (64, N'Chivo Place', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (65, N' Sunbrook Crossing', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (66, N'Kingsford Circle', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (67, N'Logan Parkway', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (68, N'Stone Corner Court', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (69, N' Helena Pass', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (70, N'Clove Crossing', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (71, N'Grasskamp Plaza', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (72, N'Lakeland Pass', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (73, N' Court', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (74, N' Farmco Circle', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (75, N'Bayside Avenue', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (76, N' Randy Drive', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (77, N'Mcguire Terrace', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (78, N'Forest Run Point', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (79, N'Heffernan Crossing', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (80, N'Mallory Crossing', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (81, N'Sage Road', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (82, N'Mayfield Court', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (83, N'Karstens Pass', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (84, N'Erie Alley', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (85, N'Cottonwood Point', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (86, N'Kropf Lane', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (87, N' Mallory Road', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (88, N'Dwight Avenue', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (89, N'Di Loreto Park', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (90, N'Johnson Lane', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (91, N'Red Cloud Court', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (92, N'Rusk Pass', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (93, N'Arrowood Place', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (94, N'Clarendon Avenue', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (95, N'Monument Alley', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (96, N'Vermont Center', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (97, N'Center Parkway', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (98, N'Barby Park', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (99, N'Eastwood Crossing', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (100, N'Prairie Rose Plaza', 1)
GO
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (101, N'Street ave', 1)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (102, N'Rainbow Road', 0)
INSERT [dbo].[StreetList] ([streetid], [street_name], [Active]) VALUES (103, N'York ave', 0)
SET IDENTITY_INSERT [dbo].[StreetList] OFF
GO
SET IDENTITY_INSERT [dbo].[Topping] ON 

INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (2, 2, N'Sprinkles', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (3, 3, N'm&m', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (4, 4, N'Caramel', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (5, 5, N'Oreos', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (6, 6, N'Hard Chocolate Coating', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (7, 7, N'Melted Marshmallows', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (8, 8, N'Nuts', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (9, 9, N'Fruits', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (10, 10, N'Cereal', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (11, 2, N'fudge', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (12, 7, N'Cookie', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (13, 8, N'Peanut', 1)
INSERT [dbo].[Topping] ([toppingid], [toppingpriceid], [topping], [Active]) VALUES (14, 13, N'Peanut butter', 0)
SET IDENTITY_INSERT [dbo].[Topping] OFF
GO
SET IDENTITY_INSERT [dbo].[ToppingPrice] ON 

INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (2, 1.0000)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (3, 2.0000)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (4, 1.0000)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (5, 3.5000)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (6, 3.5000)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (7, 3.0000)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (8, 2.5000)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (9, 2.7500)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (10, 2.7500)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (11, 0.6900)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (12, 4.2000)
INSERT [dbo].[ToppingPrice] ([toppingpriceid], [topping_price]) VALUES (13, 4.2000)
SET IDENTITY_INSERT [dbo].[ToppingPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (2, 2, N'bobby', N'billy', N'123-123-5413', N'sdsad@asd.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (3, 3, N'Godfrey', N'Burland', N'222-222-2222', N'gburland2@blogs.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (4, 4, N'Liva', N'Spellsworth', N'171-608-7085', N'lspellsworth3@epa.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (5, 5, N'Sibley', N'Leuren', N'523-272-9079', N'sleuren4@nbcnews.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (6, 6, N'Nick', N'Titmarsh', N'363-746-8123', N'ntitmarsh5@spiegel.de')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (7, 7, N'Timmy ', N'Bompass', N'312-541-4131', N'ASDSA@asda.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (8, 8, N'Katharina', N'Kinleyside', N'390-635-4061', N'kkinleyside7@sun.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (9, 9, N'Sullivan', N'Filippello', N'952-310-5773', N'sfilippello8@ovh.net')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (10, 10, N'Enriqueta', N'Jellico', N'554-178-9611', N'ejellico9@vk.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (11, 11, N'Anatola', N'Antrag', N'966-124-7120', N'aantraga@privacy.gov.au')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (12, 12, N'Mannie', N'Docker', N'238-321-2211', N'mdockerb@slideshare.net')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (13, 13, N'Andree', N'Polhill', N'112-592-4493', N'apolhillc@cloudflare.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (14, 14, N'Werner', N'Tumpane', N'173-540-4256', N'wtumpaned@hud.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (15, 15, N'Michelle', N'Easterfield', N'707-753-3850', N'measterfielde@is.gd')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (16, 16, N'Janene', N'Scole', N'243-411-0411', N'jscolef@163.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (17, 17, N'Hedvige', N'Laister', N'384-828-4143', N'hlaisterg@gov.uk')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (18, 18, N'Armand', N'Hilbourne', N'226-286-2087', N'ahilbourneh@cbc.ca')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (19, 19, N'Northrop', N'Darragh', N'193-961-2509', N'ndarraghi@loc.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (20, 20, N'Leigha', N'Prahl', N'691-257-7882', N'lprahlj@paginegialle.it')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (21, 21, N'Enrichetta', N'Sproule', N'914-893-2132', N'esproulek@salon.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (22, 22, N'Leanna', N'Stoving', N'464-399-0264', N'lstovingl@house.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (23, 23, N'Geoffry', N'Baltzar', N'711-839-8224', N'gbaltzarm@noaa.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (24, 24, N'Rodger', N'Huey', N'926-517-0878', N'rhueyn@seesaa.net')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (25, 25, N'Aristotle', N'Maleby', N'900-865-9890', N'amalebyo@cdc.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (26, 26, N'Nadine', N'Dewfall', N'506-636-1482', N'ndewfallp@twitpic.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (27, 27, N'Tito', N'Arling', N'860-952-0481', N'tarlingq@usa.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (28, 28, N'Dotty', N'Quipp', N'950-743-8563', N'dquippr@dot.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (29, 29, N'Valene', N'Crambie', N'153-290-1052', N'vcrambies@uiuc.edu')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (30, 30, N'Consuelo', N'Stiling', N'368-515-1404', N'cstilingt@unesco.org')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (31, 31, N'Timmy', N'Walkley', N'168-408-0780', N'twalkleyu@blogtalkradio.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (32, 32, N'Parker', N'McGroarty', N'202-827-8942', N'pmcgroartyv@gov.uk')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (33, 33, N'Nettie', N'Ellicombe', N'300-191-1298', N'nellicombew@wikispaces.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (34, 34, N'Carissa', N'Getch', N'767-667-0174', N'cgetchx@youku.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (35, 35, N'Anett', N'Vasyutichev', N'643-291-9718', N'avasyutichevy@sbwire.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (36, 36, N'Javier', N'Sellman', N'102-968-9109', N'jsellmanz@admin.ch')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (37, 37, N'Mycah', N'Children', N'160-482-5680', N'mchildren10@tuttocitta.it')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (38, 38, N'Adelice', N'Pinnion', N'434-546-6659', N'apinnion11@howstuffworks.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (39, 39, N'Belita', N'Shilvock', N'972-972-2857', N'bshilvock12@msu.edu')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (40, 40, N'Weston', N'Munns', N'387-248-6244', N'wmunns13@paginegialle.it')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (41, 41, N'Rachel', N'Snelle', N'305-250-1783', N'rsnelle14@ezinearticles.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (42, 42, N'Bary', N'Sabater', N'120-230-9997', N'bsabater15@netlog.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (43, 43, N'Adelaida', N'Fanning', N'532-633-7379', N'afanning16@irs.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (44, 44, N'Shaina', N'Straneo', N'211-710-1063', N'sstraneo17@reverbnation.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (45, 45, N'Trudie', N'Raoult', N'792-345-7843', N'traoult18@google.pl')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (46, 46, N'Helga', N'Artus', N'845-963-7279', N'hartus19@mapquest.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (47, 47, N'Euphemia', N'Sunock', N'741-574-9529', N'esunock1a@yale.edu')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (48, 48, N'Benjamin', N'Pilgram', N'945-474-2493', N'bpilgram1b@auda.org.au')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (49, 49, N'Floria', N'Stubbert', N'412-660-3763', N'fstubbert1c@google.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (50, 50, N'Danie', N'Laughlin', N'560-842-0498', N'dlaughlin1d@vk.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (51, 51, N'Richmound', N'Magnay', N'502-384-6224', N'rmagnay1e@slashdot.org')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (52, 52, N'Mateo', N'Bisco', N'320-771-5649', N'mbisco1f@amazon.de')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (53, 53, N'Guido', N'Breagan', N'355-506-6787', N'gbreagan1g@shutterfly.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (54, 54, N'Aylmar', N'Rutter', N'986-508-5956', N'arutter1h@chronoengine.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (55, 55, N'Lizbeth', N'Pennings', N'352-668-8280', N'lpennings1i@tamu.edu')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (56, 56, N'Orton', N'O''Duilleain', N'298-307-5608', N'ooduilleain1j@mozilla.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (57, 57, N'Linoel', N'Oke', N'719-549-2799', N'loke1k@photobucket.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (58, 58, N'Myrta', N'Marshallsay', N'622-441-4431', N'mmarshallsay1l@mozilla.org')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (59, 59, N'Cordi', N'Tippin', N'291-798-2445', N'ctippin1m@nyu.edu')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (60, 60, N'Almira', N'Weems', N'356-390-2768', N'aweems1n@geocities.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (61, 61, N'Fawn', N'Luce', N'891-404-2910', N'fluce1o@umich.edu')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (62, 62, N'Gaylene', N'Abramson', N'775-748-9598', N'gabramson1p@exblog.jp')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (63, 63, N'Korry', N'Storr', N'462-532-4106', N'kstorr1q@instagram.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (64, 64, N'Beau', N'Midlar', N'546-202-0360', N'bmidlar1r@tmall.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (65, 65, N'Garry', N'Freeman', N'322-832-9946', N'gfreeman1s@tuttocitta.it')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (66, 66, N'Wilden', N'Blampey', N'581-125-3772', N'wblampey1t@icq.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (67, 67, N'Revkah', N'Dayborne', N'889-696-0962', N'rdayborne1u@forbes.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (68, 68, N'Lorrayne', N'Kerr', N'993-142-7976', N'lkerr1v@freewebs.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (69, 69, N'Pieter', N'Matyashev', N'229-479-9743', N'pmatyashev1w@reference.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (70, 70, N'Nefen', N'Doone', N'588-512-1755', N'ndoone1x@princeton.edu')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (71, 71, N'Etty', N'Eisikowitz', N'464-721-1053', N'eeisikowitz1y@paginegialle.it')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (72, 72, N'Morganne', N'Scollard', N'707-422-1241', N'mscollard1z@wordpress.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (73, 73, N'Camille', N'Brea', N'817-945-6709', N'cbrea20@360.cn')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (74, 74, N'Dennie', N'Gofforth', N'748-570-0908', N'dgofforth21@cmu.edu')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (75, 75, N'Johan', N'Sonnenschein', N'941-301-2642', N'jsonnenschein22@bbb.org')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (76, 76, N'Alameda', N'Fooks', N'499-517-1321', N'afooks23@taobao.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (77, 77, N'Brett', N'Aggs', N'807-163-2627', N'baggs24@e-recht24.de')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (78, 78, N'Jacinthe', N'Pickford', N'413-218-8628', N'jpickford25@cargocollective.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (79, 79, N'Linda', N'Kegan', N'779-464-3175', N'lkegan26@zimbio.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (80, 80, N'Audrey', N'Binning', N'130-327-2186', N'abinning27@fda.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (81, 81, N'Willamina', N'Gissing', N'971-554-0729', N'wgissing28@sciencedaily.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (82, 82, N'Sonia', N'Paradine', N'778-947-3330', N'sparadine29@nbcnews.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (83, 83, N'Noell', N'Gabey', N'720-621-2044', N'ngabey2a@narod.ru')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (84, 84, N'Candace', N'Tineman', N'537-208-0039', N'ctineman2b@alexa.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (85, 85, N'Janifer', N'Bradtke', N'212-320-3030', N'jbradtke2c@hhs.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (86, 86, N'Flss', N'Oats', N'317-575-4886', N'foats2d@fema.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (87, 87, N'Ilyssa', N'Gerrett', N'214-880-7927', N'igerrett2e@tiny.cc')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (88, 88, N'Branden', N'Carlin', N'472-719-3970', N'bcarlin2f@loc.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (89, 89, N'Redford', N'Waitland', N'586-194-6504', N'rwaitland2g@blogspot.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (90, 90, N'Chery', N'Winsborrow', N'496-743-3204', N'cwinsborrow2h@is.gd')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (91, 91, N'Simmonds', N'Oxbie', N'247-296-6187', N'soxbie2i@is.gd')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (92, 92, N'Tirrell', N'Prover', N'892-131-4718', N'tprover2j@census.gov')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (93, 93, N'Abbe', N'Plevin', N'374-603-9331', N'aplevin2k@prnewswire.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (94, 94, N'Brade', N'Keemer', N'589-217-2346', N'bkeemer2l@histats.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (95, 95, N'Virgilio', N'McKoy', N'747-970-5465', N'vmckoy2m@phpbb.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (96, 96, N'Hazlett', N'Lortz', N'919-591-1748', N'hlortz2n@ebay.co.uk')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (97, 97, N'Barton', N'Strodder', N'906-134-8536', N'bstrodder2o@who.int')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (98, 98, N'Vivi', N'Veall', N'186-537-7529', N'vveall2p@alibaba.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (99, 99, N'Genevieve', N'Spaldin', N'458-435-0424', N'gspaldin2q@columbia.edu')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (100, 100, N'Dory', N'Tingey', N'460-496-6689', N'dtingey2r@imgur.com')
GO
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (101, 96, N'John', N'Business', N'555-555-5555', N'jb@gmail.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (102, 96, N'John', N'Business', N'555-555-5555', N'jb@gmail.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (103, 100, N'Boby', N'bobb', N'548-412-1451', N'bob@angola.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (104, 100, N'Boby', N'bobb', N'548-412-1451', N'bob@angola.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (105, 105, N'Billy ', N'bob', N'323-131-3231', N'sdasd@asdas.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (106, 106, N'mall', N'ban', N'231-511-5211', N'ma@bda.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (107, 107, N'ada', N'bob', N'515-321-5123', N'dsadh@hsd.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (108, 108, N'adada', N'bobob', N'232-131-3131', N'sda@aasd.com')
INSERT [dbo].[Vendor] ([vendorid], [vendoraddressid], [first_name], [last_name], [phone], [email]) VALUES (109, 109, N'Tony', N'Stark', N'523-523-5131', N'hihd@adssa.com')
SET IDENTITY_INSERT [dbo].[Vendor] OFF
GO
SET IDENTITY_INSERT [dbo].[VendorAddress] ON 

INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (2, 1, 2, 1, 4, 2)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (3, 1, 43, 1, 25, 48)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (4, 1, 43, 1, 5, 49)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (5, 1, 43, 1, 6, 50)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (6, 1, 43, 1, 78, 51)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (7, 1, 2, 9, 10, 7)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (8, 1, 43, 1, 9, 53)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (9, 1, 43, 1, 50, 54)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (10, 1, 43, 1, 40, 55)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (11, 1, 43, 1, 69, 56)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (12, 1, 43, 1, 10, 57)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (13, 1, 43, 1, 8, 58)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (14, 1, 43, 1, 79, 59)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (15, 1, 43, 1, 24, 60)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (16, 1, 43, 1, 25, 61)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (17, 1, 43, 1, 5, 62)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (18, 1, 43, 1, 6, 63)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (19, 1, 43, 1, 78, 64)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (20, 1, 43, 1, 7, 65)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (21, 1, 43, 1, 9, 66)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (22, 1, 43, 1, 50, 67)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (23, 1, 43, 1, 40, 68)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (24, 1, 43, 1, 69, 69)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (25, 1, 43, 1, 10, 70)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (26, 1, 43, 1, 8, 71)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (27, 1, 43, 1, 79, 72)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (28, 1, 43, 1, 24, 73)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (29, 1, 43, 1, 25, 74)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (30, 1, 43, 1, 5, 75)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (31, 1, 43, 1, 6, 76)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (32, 1, 43, 1, 78, 77)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (33, 1, 43, 1, 7, 78)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (34, 1, 43, 1, 9, 79)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (35, 1, 43, 1, 50, 80)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (36, 1, 43, 1, 40, 81)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (37, 1, 43, 1, 69, 82)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (38, 1, 43, 1, 10, 83)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (39, 1, 43, 1, 8, 84)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (40, 1, 43, 1, 79, 85)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (41, 1, 43, 1, 24, 86)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (42, 1, 43, 1, 25, 87)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (43, 1, 43, 1, 5, 88)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (44, 1, 43, 1, 6, 89)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (45, 1, 43, 1, 78, 90)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (46, 1, 43, 1, 7, 46)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (47, 1, 43, 1, 9, 47)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (48, 1, 43, 1, 50, 48)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (49, 1, 43, 1, 40, 49)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (50, 1, 43, 1, 69, 50)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (51, 1, 43, 1, 10, 51)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (52, 1, 43, 1, 8, 52)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (53, 1, 43, 1, 79, 53)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (54, 1, 43, 1, 24, 54)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (55, 1, 43, 1, 25, 55)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (56, 1, 43, 1, 5, 56)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (57, 1, 43, 1, 6, 57)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (58, 1, 43, 1, 78, 58)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (59, 1, 43, 1, 7, 59)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (60, 1, 43, 1, 9, 60)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (61, 1, 43, 1, 50, 61)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (62, 1, 43, 1, 40, 62)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (63, 1, 43, 1, 69, 63)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (64, 1, 43, 1, 10, 64)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (65, 1, 43, 1, 8, 65)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (66, 1, 43, 1, 79, 66)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (67, 1, 43, 1, 24, 67)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (68, 1, 43, 1, 25, 68)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (69, 1, 43, 1, 5, 69)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (70, 1, 43, 1, 6, 70)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (71, 1, 43, 1, 78, 71)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (72, 1, 43, 1, 7, 72)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (73, 1, 43, 1, 9, 73)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (74, 1, 43, 1, 50, 74)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (75, 1, 43, 1, 40, 75)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (76, 1, 43, 1, 69, 76)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (77, 1, 43, 1, 10, 77)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (78, 1, 43, 1, 8, 78)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (79, 1, 43, 1, 79, 79)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (80, 1, 43, 1, 24, 80)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (81, 1, 43, 1, 25, 81)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (82, 1, 43, 1, 5, 82)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (83, 1, 43, 1, 6, 83)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (84, 1, 43, 1, 78, 84)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (85, 1, 43, 1, 7, 85)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (86, 1, 43, 1, 9, 86)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (87, 1, 43, 1, 50, 87)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (88, 1, 43, 1, 40, 88)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (89, 1, 43, 1, 69, 89)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (90, 1, 43, 1, 10, 90)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (91, 1, 43, 1, 8, 46)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (92, 1, 43, 1, 79, 47)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (93, 1, 43, 1, 24, 48)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (94, 1, 43, 1, 25, 49)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (95, 1, 43, 1, 5, 50)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (96, 1, 43, 1, 6, 52)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (97, 1, 43, 1, 78, 53)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (98, 1, 43, 1, 7, 54)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (99, 1, 43, 1, 9, 55)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (100, 3, 43, 1, 50, 56)
GO
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (101, 1, 43, 1, 5, 47)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (102, 10, 5, 7, 2, 10)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (103, 12, 8, 13, 20, 7)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (104, 12, 8, 13, 20, 7)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (105, 3, 2, 3, 4, 3)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (106, 7, 25, 35, 22, 21)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (107, 1, 23, 4, 13, 30)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (108, 3, 5, 3, 5, 6)
INSERT [dbo].[VendorAddress] ([vendoraddressid], [countryid], [stateid], [cityid], [zipcodeid], [streetid]) VALUES (109, 1, 43, 2, 1, 7)
SET IDENTITY_INSERT [dbo].[VendorAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[VendorStatus] ON 

INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (1, 2, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (2, 3, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (3, 4, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (4, 5, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (5, 6, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (6, 7, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (7, 8, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (8, 9, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (9, 10, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (10, 11, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (11, 12, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (12, 13, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (13, 14, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (14, 15, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (15, 16, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (16, 17, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (17, 18, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (18, 19, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (19, 20, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (20, 21, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (21, 22, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (22, 23, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (23, 24, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (24, 25, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (25, 26, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (26, 27, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (27, 28, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (28, 29, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (29, 30, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (30, 31, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (31, 32, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (32, 33, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (33, 34, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (34, 35, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (35, 36, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (36, 37, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (37, 38, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (38, 39, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (39, 40, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (40, 41, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (41, 42, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (42, 43, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (43, 44, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (44, 45, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (45, 46, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (46, 47, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (47, 48, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (48, 49, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (49, 50, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (50, 51, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (51, 52, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (52, 53, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (53, 54, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (54, 55, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (55, 56, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (56, 57, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (57, 58, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (58, 59, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (59, 60, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (60, 61, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (61, 62, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (62, 63, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (63, 64, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (64, 65, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (65, 66, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (66, 67, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (67, 68, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (68, 69, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (69, 70, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (70, 71, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (71, 72, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (72, 73, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (73, 74, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (74, 75, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (75, 76, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (76, 77, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (77, 78, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (78, 79, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (79, 80, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (80, 81, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (81, 82, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (82, 83, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (83, 84, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (84, 85, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (85, 86, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (86, 87, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (87, 88, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (88, 89, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (89, 90, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (90, 91, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (91, 92, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (92, 93, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (93, 94, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (94, 95, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (95, 96, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (96, 97, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (97, 98, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (98, 99, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (99, 100, N'true')
GO
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (100, 101, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (101, 102, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (102, 103, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (103, 104, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (104, 105, N'false')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (105, 106, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (106, 107, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (107, 108, N'true')
INSERT [dbo].[VendorStatus] ([vendorstatusid], [vendorid], [vendor_status]) VALUES (108, 109, N'true')
SET IDENTITY_INSERT [dbo].[VendorStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ZipcodeList] ON 

INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (1, N'65665', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (2, N'83773', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (4, N'73664', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (5, N'77378', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (6, N'77430', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (7, N'77484', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (8, N'77898', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (9, N'77494', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (10, N'77787', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (11, N'78943', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (12, N'89876', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (13, N'67890', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (14, N'73637', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (15, N'78909', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (16, N'75054', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (17, N'87909', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (18, N'10807', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (19, N'19470', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (20, N'56789', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (21, N'76890', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (22, N'78937', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (23, N'75435', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (24, N'77250', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (25, N'77365', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (26, N'76890', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (27, N'81001', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (28, N'76543', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (29, N'31230', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (30, N'65436', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (31, N'76578', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (32, N'76543', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (33, N'76890', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (34, N'54368', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (35, N'765476', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (36, N'781223', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (37, N'87934', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (38, N'30103', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (39, N'76567', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (40, N'77777', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (41, N'70707', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (42, N'188649', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (43, N'76767', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (44, N'78782', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (45, N'43234', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (46, N'76543', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (47, N'55565', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (48, N'694210', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (49, N'33445', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (50, N'77730', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (51, N'65678', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (52, N'360231', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (53, N'87654', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (54, N'70000', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (55, N'874900', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (56, N'722222', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (57, N'78000', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (58, N'17500', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (59, N'706018', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (60, N'93715', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (61, N'73222', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (62, N'76111', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (63, N'452974', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (64, N'495070', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (65, N'238530', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (66, N'682529', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (67, N'220085', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (68, N'276901', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (69, N'77777', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (70, N'76453', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (71, N'76767', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (72, N'35510', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (73, N'78787', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (74, N'13019', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (75, N'79797', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (76, N'70678', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (77, N'78744', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (78, N'77443', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (79, N'77112', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (80, N'391334', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (81, N'1616', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (82, N'8113', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (83, N'76521', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (84, N'87890', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (85, N'65436', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (86, N'78634', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (87, N'54235', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (88, N'65242', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (89, N'73837', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (90, N'474074', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (91, N'87367', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (92, N'39804', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (93, N'73673', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (94, N'86753', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (95, N'67893', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (96, N'67356', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (97, N'76353', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (98, N'76543', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (99, N'76543', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (100, N'65347', 1)
GO
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (101, N'78108', 1)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (102, N'65555', 0)
INSERT [dbo].[ZipcodeList] ([zipcodeid], [zipcode_number], [Active]) VALUES (103, N'86757', 1)
SET IDENTITY_INSERT [dbo].[ZipcodeList] OFF
GO
ALTER TABLE [dbo].[BillStatus] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[CityList] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[CountryList] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[EmployeeCertificate] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Equipment] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[EquipmentCondition] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[FlavorType] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[OrderStatus] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Size] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[StateList] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[StreetList] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Topping] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ZipcodeList] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Admin]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Admin] FOREIGN KEY([employeeid])
REFERENCES [dbo].[Employee] ([employeeid])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [ForeignKey_Admin]
GO
ALTER TABLE [dbo].[Admin]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Admin1] FOREIGN KEY([adminstatusid])
REFERENCES [dbo].[AdminStatus] ([adminstatusid])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [ForeignKey_Admin1]
GO
ALTER TABLE [dbo].[Adminlogin]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Adminlogin] FOREIGN KEY([adminid])
REFERENCES [dbo].[Admin] ([adminid])
GO
ALTER TABLE [dbo].[Adminlogin] CHECK CONSTRAINT [ForeignKey_Adminlogin]
GO
ALTER TABLE [dbo].[Bill]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Bill] FOREIGN KEY([orderid])
REFERENCES [dbo].[Orders] ([orderid])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [ForeignKey_Bill]
GO
ALTER TABLE [dbo].[Bill]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Bill1] FOREIGN KEY([billstatusid])
REFERENCES [dbo].[BillStatus] ([billstatusid])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [ForeignKey_Bill1]
GO
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Customer] FOREIGN KEY([customeraddressid])
REFERENCES [dbo].[CustomerAddress] ([customeraddressid])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [ForeignKey_Customer]
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_CustomerAddress] FOREIGN KEY([countryid])
REFERENCES [dbo].[CountryList] ([countryid])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [ForeignKey_CustomerAddress]
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_CustomerAddress1] FOREIGN KEY([stateid])
REFERENCES [dbo].[StateList] ([stateid])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [ForeignKey_CustomerAddress1]
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_CustomerAddress2] FOREIGN KEY([cityid])
REFERENCES [dbo].[CityList] ([cityid])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [ForeignKey_CustomerAddress2]
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_CustomerAddress3] FOREIGN KEY([zipcodeid])
REFERENCES [dbo].[ZipcodeList] ([zipcodeid])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [ForeignKey_CustomerAddress3]
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_CustomerAddress4] FOREIGN KEY([streetid])
REFERENCES [dbo].[StreetList] ([streetid])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [ForeignKey_CustomerAddress4]
GO
ALTER TABLE [dbo].[CustomerStatus]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_CustomerStatus] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customer] ([customerid])
GO
ALTER TABLE [dbo].[CustomerStatus] CHECK CONSTRAINT [ForeignKey_CustomerStatus]
GO
ALTER TABLE [dbo].[Employee]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Employee] FOREIGN KEY([employeeaddressid])
REFERENCES [dbo].[EmployeeAddress] ([employeeaddressid])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [ForeignKey_Employee]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_EmployeeAddress] FOREIGN KEY([countryid])
REFERENCES [dbo].[CountryList] ([countryid])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [ForeignKey_EmployeeAddress]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_EmployeeAddress1] FOREIGN KEY([stateid])
REFERENCES [dbo].[StateList] ([stateid])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [ForeignKey_EmployeeAddress1]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_EmployeeAddress2] FOREIGN KEY([cityid])
REFERENCES [dbo].[CityList] ([cityid])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [ForeignKey_EmployeeAddress2]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_EmployeeAddress3] FOREIGN KEY([zipcodeid])
REFERENCES [dbo].[ZipcodeList] ([zipcodeid])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [ForeignKey_EmployeeAddress3]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_EmployeeAddress4] FOREIGN KEY([streetid])
REFERENCES [dbo].[StreetList] ([streetid])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [ForeignKey_EmployeeAddress4]
GO
ALTER TABLE [dbo].[EmployeeCertificate]  WITH NOCHECK ADD FOREIGN KEY([employeeid])
REFERENCES [dbo].[Employee] ([employeeid])
GO
ALTER TABLE [dbo].[EmployeeLogin]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_EmplopyeeLogin] FOREIGN KEY([employeeid])
REFERENCES [dbo].[Employee] ([employeeid])
GO
ALTER TABLE [dbo].[EmployeeLogin] CHECK CONSTRAINT [ForeignKey_EmplopyeeLogin]
GO
ALTER TABLE [dbo].[EmployeeStatus]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_EmployeeStatus] FOREIGN KEY([employeeid])
REFERENCES [dbo].[Employee] ([employeeid])
GO
ALTER TABLE [dbo].[EmployeeStatus] CHECK CONSTRAINT [ForeignKey_EmployeeStatus]
GO
ALTER TABLE [dbo].[Equipment]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Equipment1] FOREIGN KEY([vendorid])
REFERENCES [dbo].[Vendor] ([vendorid])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [ForeignKey_Equipment1]
GO
ALTER TABLE [dbo].[Equipment]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Equipment2] FOREIGN KEY([equipmentconditionid])
REFERENCES [dbo].[EquipmentCondition] ([equipmentconditionid])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [ForeignKey_Equipment2]
GO
ALTER TABLE [dbo].[FlavorType]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Type] FOREIGN KEY([flavorpriceid])
REFERENCES [dbo].[FlavorPrice] ([flavorpriceid])
GO
ALTER TABLE [dbo].[FlavorType] CHECK CONSTRAINT [ForeignKey_Type]
GO
ALTER TABLE [dbo].[IceCream]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Iceream] FOREIGN KEY([flavortypeid])
REFERENCES [dbo].[FlavorType] ([flavortypeid])
GO
ALTER TABLE [dbo].[IceCream] CHECK CONSTRAINT [ForeignKey_Iceream]
GO
ALTER TABLE [dbo].[IceCream]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Iceream1] FOREIGN KEY([sizeid])
REFERENCES [dbo].[Size] ([sizeid])
GO
ALTER TABLE [dbo].[IceCream] CHECK CONSTRAINT [ForeignKey_Iceream1]
GO
ALTER TABLE [dbo].[IceCream]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Iceream2] FOREIGN KEY([toppingid])
REFERENCES [dbo].[Topping] ([toppingid])
GO
ALTER TABLE [dbo].[IceCream] CHECK CONSTRAINT [ForeignKey_Iceream2]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_ Order1] FOREIGN KEY([icecreamid])
REFERENCES [dbo].[IceCream] ([icecreamid])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [ForeignKey_ Order1]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_ Order2] FOREIGN KEY([orderstatusid])
REFERENCES [dbo].[OrderStatus] ([orderstatusid])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [ForeignKey_ Order2]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Order] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customer] ([customerid])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [ForeignKey_Order]
GO
ALTER TABLE [dbo].[Premium]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Premium] FOREIGN KEY([premiumstatusid])
REFERENCES [dbo].[PremiumStatus] ([premiumstatusid])
GO
ALTER TABLE [dbo].[Premium] CHECK CONSTRAINT [ForeignKey_Premium]
GO
ALTER TABLE [dbo].[Premium]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Premium1] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customer] ([customerid])
GO
ALTER TABLE [dbo].[Premium] CHECK CONSTRAINT [ForeignKey_Premium1]
GO
ALTER TABLE [dbo].[Reservation]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Reservation] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customer] ([customerid])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [ForeignKey_Reservation]
GO
ALTER TABLE [dbo].[Reservation]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Reservation1] FOREIGN KEY([reservationstatusid])
REFERENCES [dbo].[ReservationStatus] ([reservationstatusid])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [ForeignKey_Reservation1]
GO
ALTER TABLE [dbo].[Size]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Size] FOREIGN KEY([sizepriceid])
REFERENCES [dbo].[SizePrice] ([sizepriceid])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [ForeignKey_Size]
GO
ALTER TABLE [dbo].[Topping]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Topping] FOREIGN KEY([toppingpriceid])
REFERENCES [dbo].[ToppingPrice] ([toppingpriceid])
GO
ALTER TABLE [dbo].[Topping] CHECK CONSTRAINT [ForeignKey_Topping]
GO
ALTER TABLE [dbo].[Vendor]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_Vendor] FOREIGN KEY([vendoraddressid])
REFERENCES [dbo].[VendorAddress] ([vendoraddressid])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [ForeignKey_Vendor]
GO
ALTER TABLE [dbo].[VendorAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_VendorAddress] FOREIGN KEY([countryid])
REFERENCES [dbo].[CountryList] ([countryid])
GO
ALTER TABLE [dbo].[VendorAddress] CHECK CONSTRAINT [ForeignKey_VendorAddress]
GO
ALTER TABLE [dbo].[VendorAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_VendorAddress1] FOREIGN KEY([stateid])
REFERENCES [dbo].[StateList] ([stateid])
GO
ALTER TABLE [dbo].[VendorAddress] CHECK CONSTRAINT [ForeignKey_VendorAddress1]
GO
ALTER TABLE [dbo].[VendorAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_VendorAddress2] FOREIGN KEY([cityid])
REFERENCES [dbo].[CityList] ([cityid])
GO
ALTER TABLE [dbo].[VendorAddress] CHECK CONSTRAINT [ForeignKey_VendorAddress2]
GO
ALTER TABLE [dbo].[VendorAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_VendorAddress3] FOREIGN KEY([zipcodeid])
REFERENCES [dbo].[ZipcodeList] ([zipcodeid])
GO
ALTER TABLE [dbo].[VendorAddress] CHECK CONSTRAINT [ForeignKey_VendorAddress3]
GO
ALTER TABLE [dbo].[VendorAddress]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_VendorAddress4] FOREIGN KEY([streetid])
REFERENCES [dbo].[StreetList] ([streetid])
GO
ALTER TABLE [dbo].[VendorAddress] CHECK CONSTRAINT [ForeignKey_VendorAddress4]
GO
ALTER TABLE [dbo].[VendorStatus]  WITH NOCHECK ADD  CONSTRAINT [ForeignKey_VendorStatus] FOREIGN KEY([vendorid])
REFERENCES [dbo].[Vendor] ([vendorid])
GO
ALTER TABLE [dbo].[VendorStatus] CHECK CONSTRAINT [ForeignKey_VendorStatus]
GO
USE [master]
GO
ALTER DATABASE [IceCreamDB] SET  READ_WRITE 
GO
