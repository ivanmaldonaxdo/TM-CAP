USE [master]
GO
SET IDENTITY_INSERT [dbo].[rol] ON
GO
INSERT [dbo].[rol] ([id_rol], [nombre_rol], [estado]) VALUES (5, N'administrador', 1)
GO
INSERT [dbo].[rol] ([id_rol], [nombre_rol], [estado]) VALUES (6, N'cliente', 1)
GO
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellidos], [fecha_nac], [email], [clave], [rut], [id_rol], [direccion], [telefono], [estado]) VALUES (1, N'Paulo', N'Rivera', CAST(N'2000-07-12' AS Date), N'paulo@gmail.com', N'123', N'19.959.337-4', 6, N'Los alamos 333', 123456, N'activo')
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellidos], [fecha_nac], [email], [clave], [rut], [id_rol], [direccion], [telefono], [estado]) VALUES (3, N'Javier', N'Contreras Pinto', CAST(N'1995-08-27' AS Date), N'javier@gmail.com', N'0011p', N'11.111.111-1', 6, N'La Granja 7200', 223439234, N'activo')
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellidos], [fecha_nac], [email], [clave], [rut], [id_rol], [direccion], [telefono], [estado]) VALUES (4, N'Jose', N'Sanchez Salas', CAST(N'1980-09-15' AS Date), N'jose@gmail.com', N'30pa00', N'17.321.234-2', 6, N'Asturias 335', 973476792, N'activo')
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellidos], [fecha_nac], [email], [clave], [rut], [id_rol], [direccion], [telefono], [estado]) VALUES (5, N'Maria', N'Zamorano Gonzalez', CAST(N'1985-01-20' AS Date), N'maria@gmail.com', N'mari4321', N'11.345.456-2', 5, N'Apoquindo7721', 934587898, N'activo')
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellidos], [fecha_nac], [email], [clave], [rut], [id_rol], [direccion], [telefono], [estado]) VALUES (6, N'Josefa', N'Chavez Gatica', CAST(N'1975-03-12' AS Date), N'josefa@gmail.com', N'98jo21', N'10.321.547-k', 6, N'Av. Pomaire 225', 223457765, N'inactivo')
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellidos], [fecha_nac], [email], [clave], [rut], [id_rol], [direccion], [telefono], [estado]) VALUES (7, N'Andres', N'Mendez Tapia', CAST(N'1976-12-04' AS Date), N'andres@gmail.com', N'00andre1', N'11.555.456-7', 5, N'La palmilla 123 casa 20', 998765456, N'activo')
GO
INSERT [dbo].[usuario] ([id_usuario], [nombre], [apellidos], [fecha_nac], [email], [clave], [rut], [id_rol], [direccion], [telefono], [estado]) VALUES (8, N'Martin', N'Olea Opazo', CAST(N'1968-07-03' AS Date), N'martin@gmail.com', N'09mart_ol1', N'9.324.989-8', 6, N'Pedro fontova 5678', 976345657, N'activo')
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO

USE [master]
GO
SET IDENTITY_INSERT [dbo].[compra] ON
GO
INSERT [dbo].[compra] ([id_compra], [fecha_compra], [id_usuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [impuesto], [total], [estado]) VALUES (1, CAST(N'2022-01-13' AS Date), 1, N'boleta', N'1', N'001', CAST(10.00 AS Decimal(11, 2)), 80000, N'pagado')
GO
INSERT [dbo].[compra] ([id_compra], [fecha_compra], [id_usuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [impuesto], [total], [estado]) VALUES (2, CAST(N'2021-12-01' AS Date), 3, N'boleta', N'2', N'002', CAST(10.00 AS Decimal(11, 2)), 100000, N'no pagado')
GO
INSERT [dbo].[compra] ([id_compra], [fecha_compra], [id_usuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [impuesto], [total], [estado]) VALUES (3, CAST(N'2021-01-30' AS Date), 4, N'boleta', N'3', N'003', CAST(12.00 AS Decimal(11, 2)), 95000, N'pagado')
GO
INSERT [dbo].[compra] ([id_compra], [fecha_compra], [id_usuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [impuesto], [total], [estado]) VALUES (4, CAST(N'2019-07-23' AS Date), 6, N'factura', N'4', N'004', CAST(12.00 AS Decimal(11, 2)), 150000, N'pagado')
GO
INSERT [dbo].[compra] ([id_compra], [fecha_compra], [id_usuario], [tipo_comprobante], [serie_comprobante], [num_comprobante], [impuesto], [total], [estado]) VALUES (5, CAST(N'2019-05-20' AS Date), 8, N'factura', N'5', N'005', CAST(14.00 AS Decimal(11, 2)), 70000, N'pagado')
GO
SET IDENTITY_INSERT [dbo].[compra] OFF
GO
------- HEAD

USE [master]
GO
SET IDENTITY_INSERT [dbo].[categoria] ON
GO
--CATEGORIA
INSERT INTO CATEGORIA (ID_CATEGORIA,NOMBRE,ESTADO)VALUES(1,'Administración',1);
INSERT INTO CATEGORIA (ID_CATEGORIA,NOMBRE,ESTADO)VALUES(2,'Computación e Informática',1);
INSERT INTO CATEGORIA (ID_CATEGORIA,NOMBRE,ESTADO)VALUES(3,'Educación y capacitación',1);
INSERT INTO CATEGORIA (ID_CATEGORIA,NOMBRE,ESTADO)VALUES(4,'Salud, Nutrición y Dietética',1);
INSERT INTO CATEGORIA (ID_CATEGORIA,NOMBRE,ESTADO)VALUES(5,'Servicio a las Personas',1);

SET IDENTITY_INSERT [dbo].[categoria] OFF

USE [master]
GO
SET IDENTITY_INSERT [dbo].[producto] ON
GO
--PRODUCTO
INSERT [dbo].[producto] ([ID_PRODUCTO],[nombre], [descripcion], [precio], [id_categoria], [codigo], [stock], [estado], [imagen]) VALUES (1,N'Administración De Bodega Y Manejo De Inventario (30 Hrs Pedagógicas)', N'Administración De Bodega Y Manejo De Inventario (30 Hrs Pedagógicas)', 99000, 1, N'ABI30HR', 100, 1, NULL)
GO
INSERT [dbo].[producto] ([ID_PRODUCTO],[nombre], [descripcion], [precio], [id_categoria], [codigo], [stock], [estado], [imagen]) VALUES (2,N'Adobe Premiere Pro Básico (40 Hrs Pedagógicas)', N'Curso de Adobe Premiere Pro Nivel Básico (40 Hrs Pedagógicas) para la edicion de videos', 100000, 2, N'ADB40HR', 100, 1, NULL)
GO
INSERT [dbo].[producto] ([ID_PRODUCTO],[nombre], [descripcion], [precio], [id_categoria], [codigo], [stock], [estado], [imagen]) VALUES (3,N'Conducción Vehiculos 4×4 Todo Terreno (21 Hrs Pedagógicas)', N'Curso de Conducción Vehiculos 4×4 Todo Terreno con duracion de (21 Hrs Pedagógicas)', 100000, 3, N'CVT21HR', 100, 1, NULL)
GO
INSERT [dbo].[producto] ([ID_PRODUCTO],[nombre], [descripcion], [precio], [id_categoria], [codigo], [stock], [estado], [imagen]) VALUES (4,N'Reanimación Cardiopulmonar RCP (21 Hrs Pedagógicas)', N'Curso de RCP', 40000, 4, N'RCP21HR', 100, 1, NULL)
GO
INSERT [dbo].[producto] ([ID_PRODUCTO],[nombre], [descripcion], [precio], [id_categoria], [codigo], [stock], [estado], [imagen]) VALUES (5,N'After Effects (40 Hrs Pedagógicas)', N'Curso de After Effects para edicion de efectos en movimiento videos', 100000, 2, N'AFT40HR', 100, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[producto] OFF
--------
USE [master]
GO
SET IDENTITY_INSERT [dbo].[detalle_compra] ON 
GO
INSERT [dbo].[detalle_compra] ([id_detalle], [cantidad], [precio], [id_compra], [id_producto], [descuento]) VALUES (1, 1, 80000, 1, 1, 5)
GO
INSERT [dbo].[detalle_compra] ([id_detalle], [cantidad], [precio], [id_compra], [id_producto], [descuento]) VALUES (2, 1, 40000, 1, 2, 0)
GO
INSERT [dbo].[detalle_compra] ([id_detalle], [cantidad], [precio], [id_compra], [id_producto], [descuento]) VALUES (3, 1, 100000, 2, 4, 0)
GO
INSERT [dbo].[detalle_compra] ([id_detalle], [cantidad], [precio], [id_compra], [id_producto], [descuento]) VALUES (4, 1, 60000, 3, 3, 8)
GO
INSERT [dbo].[detalle_compra] ([id_detalle], [cantidad], [precio], [id_compra], [id_producto], [descuento]) VALUES (5, 1, 70000, 4, 5, 0)
GO
INSERT [dbo].[detalle_compra] ([id_detalle], [cantidad], [precio], [id_compra], [id_producto], [descuento]) VALUES (6, 1, 100000, 4, 4, 10)
GO
INSERT [dbo].[detalle_compra] ([id_detalle], [cantidad], [precio], [id_compra], [id_producto], [descuento]) VALUES (7, 1, 40000, 5, 2, 0)
GO
SET IDENTITY_INSERT [dbo].[detalle_compra] OFF
----------
GO

USE [master]
GO
SET IDENTITY_INSERT [dbo].[solicitud] ON
GO
INSERT [dbo].[solicitud] ([id_solicitud],[mensaje], [telefono], [mail], [fecha]) VALUES (1,N'Cuando suben algun curso de photoshop?', 911223344, N'juanperez@gmail.com', CAST(N'2022-01-10' AS Date))
GO
INSERT [dbo].[solicitud] ([id_solicitud],[mensaje], [telefono], [mail], [fecha]) VALUES (2,N'Que cursos existen en la categoria Servicio a las Personas?', 922113344, N'josegonzalez@gmail.com', CAST(N'2022-01-11' AS Date))
GO
INSERT [dbo].[solicitud] ([id_solicitud],[mensaje], [telefono], [mail], [fecha]) VALUES (3,N'Se pueden realizar transferencia como forma de pago a un curso?', 922441155, N'mariamorales@gmail.com', CAST(N'2022-01-11' AS Date))
GO
SET IDENTITY_INSERT [dbo].[solicitud] OFF
GO