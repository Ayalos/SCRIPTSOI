USE [master]
GO
/****** Object:  Database [ImportadorOI]    Script Date: 03/08/2019 14:50:45 ******/
CREATE DATABASE [ImportadorOI] ON  PRIMARY 
( NAME = N'ImportadorOI', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ImportadorOI.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ImportadorOI_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\ImportadorOI_log.ldf' , SIZE = 18240KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ImportadorOI] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ImportadorOI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ImportadorOI] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ImportadorOI] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ImportadorOI] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ImportadorOI] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ImportadorOI] SET ARITHABORT OFF
GO
ALTER DATABASE [ImportadorOI] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ImportadorOI] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ImportadorOI] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ImportadorOI] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ImportadorOI] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ImportadorOI] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ImportadorOI] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ImportadorOI] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ImportadorOI] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ImportadorOI] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ImportadorOI] SET  DISABLE_BROKER
GO
ALTER DATABASE [ImportadorOI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ImportadorOI] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ImportadorOI] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ImportadorOI] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ImportadorOI] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ImportadorOI] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ImportadorOI] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ImportadorOI] SET  READ_WRITE
GO
ALTER DATABASE [ImportadorOI] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ImportadorOI] SET  MULTI_USER
GO
ALTER DATABASE [ImportadorOI] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ImportadorOI] SET DB_CHAINING OFF
GO
USE [ImportadorOI]
GO
/****** Object:  Table [dbo].[Serial]    Script Date: 03/08/2019 14:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Serial](
	[Filial] [varchar](100) NULL,
	[Serial] [varchar](90) NULL,
	[RFID] [varchar](10) NULL,
	[Produto] [varchar](90) NULL,
	[Descricao] [varchar](100) NULL,
	[Cod_Comercial] [varchar](120) NULL,
	[Data_Compra] [datetime] NULL,
	[Fornecedor] [varchar](50) NULL,
	[Fabricante] [varchar](40) NULL,
	[NfCompra] [int] NULL,
	[Filial_Entrada] [varchar](60) NULL,
	[Custo_Nf] [varchar](10) NULL,
	[Valor_Venda] [varchar](10) NULL,
	[Disponivel] [varchar](5) NULL,
	[Deposito_Atual] [varchar](50) NULL,
	[EAN] [varchar](50) NULL,
	[Dias_Estoque] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProdutosFULL]    Script Date: 03/08/2019 14:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProdutosFULL](
	[Filial] [varchar](100) NULL,
	[Deposito] [varchar](50) NULL,
	[Produto] [int] NULL,
	[Descricao] [varchar](120) NULL,
	[Grupo] [varchar](50) NULL,
	[SubGrupo] [varchar](50) NULL,
	[Familia] [varchar](15) NULL,
	[Fabricante] [varchar](20) NULL,
	[Marca] [varchar](20) NULL,
	[NCM] [varchar](12) NULL,
	[CEST] [varchar](8) NULL,
	[EAN] [varchar](15) NULL,
	[SaldoDisponivel] [int] NULL,
	[CustoTotal] [varchar](10) NULL,
	[CustoMedio] [varchar](10) NULL,
	[CustoLiquido] [varchar](10) NULL,
	[PrecoVenda] [varchar](10) NULL,
	[EstoqueVenda] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 03/08/2019 14:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produtos](
	[Filial] [varchar](100) NULL,
	[Deposito] [varchar](90) NULL,
	[Produto] [varchar](50) NULL,
	[Descricao] [varchar](120) NULL,
	[Cod_Comercial] [varchar](120) NULL,
	[Grupo] [varchar](50) NULL,
	[SubGrupo] [varchar](50) NULL,
	[Familia] [varchar](50) NULL,
	[Fabricante] [varchar](50) NULL,
	[Categoria] [varchar](40) NULL,
	[Marca] [varchar](100) NULL,
	[Custo] [varchar](20) NULL,
	[Estoque] [int] NULL,
	[Estoque_Minimo] [int] NULL,
	[Reposicao] [int] NULL,
	[Reservado] [int] NULL,
	[Disponivel] [int] NULL,
	[Data_Movimento] [date] NULL,
	[Custo_Venda] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fornecedores]    Script Date: 03/08/2019 14:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fornecedores](
	[CNPJ] [varchar](50) NULL,
	[Fantasia] [varchar](50) NULL,
	[Razao_Social] [varchar](100) NULL,
	[Rua] [varchar](200) NULL,
	[Numero] [varchar](9) NULL,
	[Complemento] [varchar](50) NULL,
	[Bairro] [varchar](50) NULL,
	[CEP] [varchar](10) NULL,
	[Cidade] [varchar](30) NULL,
	[UF] [varchar](2) NULL,
	[EMAIL] [varchar](50) NULL,
	[FONE] [varchar](20) NULL,
	[IE] [varchar](20) NULL,
	[Estrangeiro] [varchar](3) NULL,
	[Regime_Fiscal] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
