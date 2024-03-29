USE [OnBreak]
GO
/****** Object:  Table [dbo].[ActividadEmpresa]    Script Date: 10-01-2022 10:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadEmpresa](
	[IdActividadEmpresa] [int] NOT NULL,
	[Descripcion] [nvarchar](20) NOT NULL,
 CONSTRAINT [ActividadEmpresa_PK] PRIMARY KEY CLUSTERED 
(
	[IdActividadEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cenas]    Script Date: 10-01-2022 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cenas](
	[Numero] [nvarchar](12) NOT NULL,
	[IdTipoAmbientacion] [int] NOT NULL,
	[MusicaAmbiental] [bit] NOT NULL,
	[LocalOnBreak] [bit] NOT NULL,
	[OtroLocalOnBreak] [bit] NOT NULL,
	[ValorArriendo] [float] NOT NULL,
 CONSTRAINT [Key15] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10-01-2022 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[RutCliente] [nvarchar](10) NOT NULL,
	[RazonSocial] [nvarchar](50) NOT NULL,
	[NombreContacto] [nvarchar](50) NOT NULL,
	[MailContacto] [nvarchar](30) NOT NULL,
	[Direccion] [nvarchar](30) NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
	[IdActividadEmpresa] [int] NOT NULL,
	[IdTipoEmpresa] [int] NOT NULL,
 CONSTRAINT [Cliente_PK] PRIMARY KEY CLUSTERED 
(
	[RutCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cocktail]    Script Date: 10-01-2022 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cocktail](
	[Numero] [nvarchar](12) NOT NULL,
	[IdTipoAmbientacion] [int] NULL,
	[Ambientacion] [bit] NOT NULL,
	[MusicaAmbiental] [bit] NOT NULL,
	[MusicaCliente] [bit] NOT NULL,
 CONSTRAINT [Key14] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoffeeBreak]    Script Date: 10-01-2022 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoffeeBreak](
	[Numero] [nvarchar](12) NOT NULL,
	[Vegetariana] [bit] NOT NULL,
 CONSTRAINT [Key13] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contrato]    Script Date: 10-01-2022 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contrato](
	[Numero] [nvarchar](12) NOT NULL,
	[Creacion] [datetime] NOT NULL,
	[Termino] [datetime] NOT NULL,
	[RutCliente] [nvarchar](10) NOT NULL,
	[IdModalidad] [nvarchar](5) NOT NULL,
	[IdTipoEvento] [int] NOT NULL,
	[FechaHoraInicio] [datetime] NOT NULL,
	[FechaHoraTermino] [datetime] NOT NULL,
	[Asistentes] [int] NOT NULL,
	[PersonalAdicional] [int] NOT NULL,
	[Realizado] [bit] NOT NULL,
	[ValorTotalContrato] [float] NOT NULL,
	[Observaciones] [nvarchar](250) NOT NULL,
 CONSTRAINT [Key1] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModalidadServicio]    Script Date: 10-01-2022 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModalidadServicio](
	[IdModalidad] [nvarchar](5) NOT NULL,
	[IdTipoEvento] [int] NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[ValorBase] [float] NOT NULL,
	[PersonalBase] [int] NOT NULL,
 CONSTRAINT [Key2] PRIMARY KEY CLUSTERED 
(
	[IdModalidad] ASC,
	[IdTipoEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAmbientacion]    Script Date: 10-01-2022 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAmbientacion](
	[IdTipoAmbientacion] [int] NOT NULL,
	[Descripcion] [nvarchar](15) NOT NULL,
 CONSTRAINT [Key16] PRIMARY KEY CLUSTERED 
(
	[IdTipoAmbientacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpresa]    Script Date: 10-01-2022 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpresa](
	[IdTipoEmpresa] [int] NOT NULL,
	[Descripcion] [nvarchar](20) NOT NULL,
 CONSTRAINT [TipoEmpresa_PK] PRIMARY KEY CLUSTERED 
(
	[IdTipoEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEvento]    Script Date: 10-01-2022 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEvento](
	[IdTipoEvento] [int] NOT NULL,
	[Descripcion] [nvarchar](15) NOT NULL,
 CONSTRAINT [Key3] PRIMARY KEY CLUSTERED 
(
	[IdTipoEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cenas]  WITH CHECK ADD  CONSTRAINT [Cena_TipoAmbientacion_FK1] FOREIGN KEY([IdTipoAmbientacion])
REFERENCES [dbo].[TipoAmbientacion] ([IdTipoAmbientacion])
GO
ALTER TABLE [dbo].[Cenas] CHECK CONSTRAINT [Cena_TipoAmbientacion_FK1]
GO
ALTER TABLE [dbo].[Cenas]  WITH CHECK ADD  CONSTRAINT [Contrato_Cenas_FK1] FOREIGN KEY([Numero])
REFERENCES [dbo].[Contrato] ([Numero])
GO
ALTER TABLE [dbo].[Cenas] CHECK CONSTRAINT [Contrato_Cenas_FK1]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [Cliente_ActividadEmpresa_FK1] FOREIGN KEY([IdActividadEmpresa])
REFERENCES [dbo].[ActividadEmpresa] ([IdActividadEmpresa])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [Cliente_ActividadEmpresa_FK1]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [Cliente_TipoEmpresa_FK1] FOREIGN KEY([IdTipoEmpresa])
REFERENCES [dbo].[TipoEmpresa] ([IdTipoEmpresa])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [Cliente_TipoEmpresa_FK1]
GO
ALTER TABLE [dbo].[Cocktail]  WITH CHECK ADD  CONSTRAINT [Cocktail_TipoAmbientacion_FK1] FOREIGN KEY([IdTipoAmbientacion])
REFERENCES [dbo].[TipoAmbientacion] ([IdTipoAmbientacion])
GO
ALTER TABLE [dbo].[Cocktail] CHECK CONSTRAINT [Cocktail_TipoAmbientacion_FK1]
GO
ALTER TABLE [dbo].[Cocktail]  WITH CHECK ADD  CONSTRAINT [Contrato_Cocktail_FK1] FOREIGN KEY([Numero])
REFERENCES [dbo].[Contrato] ([Numero])
GO
ALTER TABLE [dbo].[Cocktail] CHECK CONSTRAINT [Contrato_Cocktail_FK1]
GO
ALTER TABLE [dbo].[CoffeeBreak]  WITH CHECK ADD  CONSTRAINT [Contrato_CoffeeBreak_FK1] FOREIGN KEY([Numero])
REFERENCES [dbo].[Contrato] ([Numero])
GO
ALTER TABLE [dbo].[CoffeeBreak] CHECK CONSTRAINT [Contrato_CoffeeBreak_FK1]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [Contrato_Cliente_FK1] FOREIGN KEY([RutCliente])
REFERENCES [dbo].[Cliente] ([RutCliente])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [Contrato_Cliente_FK1]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [Contrato_ModalidadEvento_FK1] FOREIGN KEY([IdModalidad], [IdTipoEvento])
REFERENCES [dbo].[ModalidadServicio] ([IdModalidad], [IdTipoEvento])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [Contrato_ModalidadEvento_FK1]
GO
ALTER TABLE [dbo].[ModalidadServicio]  WITH CHECK ADD  CONSTRAINT [ModalidadServicio_TipoEvento_FK1] FOREIGN KEY([IdTipoEvento])
REFERENCES [dbo].[TipoEvento] ([IdTipoEvento])
GO
ALTER TABLE [dbo].[ModalidadServicio] CHECK CONSTRAINT [ModalidadServicio_TipoEvento_FK1]
GO
