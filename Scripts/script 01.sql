USE [Cachina]
GO
/****** Object:  Table [dbo].[EstoqueProduto]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstoqueProduto](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[CodigoProduto] [int] NULL,
	[CodigoEstoque] [int] NULL,
	[Quantidade] [float] NULL,
 CONSTRAINT [PK_EstoqueProduto] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estoque]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estoque](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[Descricao] [varchar](50) NULL,
	[CodigoSetor] [int] NULL,
 CONSTRAINT [PK_Estoque] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorias](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[Codificacao] [varchar](10) NULL,
	[Descricao] [varchar](200) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CaixaMovimentacao]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CaixaMovimentacao](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[CodigoCaixa] [int] NULL,
	[DataHora] [datetime] NULL,
	[Valor] [float] NULL,
	[CodigoCategoria] [int] NULL,
	[Observacao] [varchar](50) NULL,
	[Tipo] [varchar](20) NULL,
 CONSTRAINT [PK_CaixaMovimentacao] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Caixa]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Caixa](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[Descricao] [varchar](30) NULL,
	[ValorSaldo] [float] NULL,
	[Status] [varchar](10) NULL,
 CONSTRAINT [PK_Caixa] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pagamento]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pagamento](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[Data] [date] NULL,
	[Descricao] [varchar](50) NULL,
	[CodigoPessoa] [int] NULL,
	[Valor] [float] NULL,
	[CodigoCategoria] [int] NULL,
	[Situacao] [varchar](10) NULL,
	[CodigoCaixa] [int] NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[DataVencimento] [date] NULL,
	[CodigoFormaPagamento] [int] NULL,
	[Observacao] [varchar](100) NULL,
 CONSTRAINT [PK_Pagamento] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Saida]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Saida](
	[Codigo] [int] NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[Data] [datetime] NULL,
	[NumeroDocumento] [varchar](50) NOT NULL,
	[CodigoOrcamento] [int] NULL,
	[CodigoFuncionario] [int] NULL,
	[Aplicacao] [varchar](200) NULL,
 CONSTRAINT [PK_Saida] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recebimento]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recebimento](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[Data] [date] NULL,
	[Descricao] [varchar](50) NULL,
	[CodigoPessoa] [int] NULL,
	[Valor] [float] NULL,
	[CodigoCategoria] [int] NULL,
	[Situacao] [varchar](10) NULL,
	[CodigoCaixa] [int] NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[DataVencimento] [date] NULL,
	[CodigoFormaPagamento] [int] NULL,
	[Observacao] [varchar](100) NULL,
 CONSTRAINT [PK_Recebimento] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemSaida]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSaida](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[CodigoSaida] [int] NULL,
	[Ordem] [int] NULL,
	[CodigoProduto] [int] NULL,
	[Quantidade] [float] NULL,
	[Valor] [float] NULL,
	[CodigoEstoque] [int] NULL,
 CONSTRAINT [PK_ItemSaida] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemEntrada]    Script Date: 04/23/2014 15:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemEntrada](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFilial] [int] NOT NULL,
	[CodigoEntrada] [int] NULL,
	[Ordem] [int] NULL,
	[CodigoProduto] [int] NULL,
	[Quantidade] [float] NULL,
	[Valor] [float] NULL,
	[Desconto] [float] NULL,
	[Total] [float] NULL,
	[CodigoEstoque] [int] NULL,
 CONSTRAINT [PK_ItemEntrada] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC,
	[CodigoFilial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_ItemEntrada_Entrada]    Script Date: 04/23/2014 15:12:15 ******/
ALTER TABLE [dbo].[ItemEntrada]  WITH CHECK ADD  CONSTRAINT [FK_ItemEntrada_Entrada] FOREIGN KEY([CodigoEntrada], [CodigoFilial])
REFERENCES [dbo].[Entrada] ([Codigo], [CodigoFilial])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemEntrada] CHECK CONSTRAINT [FK_ItemEntrada_Entrada]
GO
/****** Object:  ForeignKey [FK_ItemEntrada_Produtos]    Script Date: 04/23/2014 15:12:15 ******/
ALTER TABLE [dbo].[ItemEntrada]  WITH CHECK ADD  CONSTRAINT [FK_ItemEntrada_Produtos] FOREIGN KEY([CodigoProduto], [CodigoFilial])
REFERENCES [dbo].[Produtos] ([Codigo], [CodigoFilial])
GO
ALTER TABLE [dbo].[ItemEntrada] CHECK CONSTRAINT [FK_ItemEntrada_Produtos]
GO
/****** Object:  ForeignKey [FK_ItemSaida_Produtos]    Script Date: 04/23/2014 15:12:15 ******/
ALTER TABLE [dbo].[ItemSaida]  WITH CHECK ADD  CONSTRAINT [FK_ItemSaida_Produtos] FOREIGN KEY([CodigoProduto], [CodigoFilial])
REFERENCES [dbo].[Produtos] ([Codigo], [CodigoFilial])
GO
ALTER TABLE [dbo].[ItemSaida] CHECK CONSTRAINT [FK_ItemSaida_Produtos]
GO
/****** Object:  ForeignKey [FK_ItemSaida_Saida]    Script Date: 04/23/2014 15:12:15 ******/
ALTER TABLE [dbo].[ItemSaida]  WITH CHECK ADD  CONSTRAINT [FK_ItemSaida_Saida] FOREIGN KEY([CodigoSaida], [CodigoFilial])
REFERENCES [dbo].[Saida] ([Codigo], [CodigoFilial])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemSaida] CHECK CONSTRAINT [FK_ItemSaida_Saida]
GO
/****** Object:  ForeignKey [FK_Itemv_Produtos]    Script Date: 04/23/2014 15:12:15 ******/
ALTER TABLE [dbo].[ItemSaida]  WITH CHECK ADD  CONSTRAINT [FK_Itemv_Produtos] FOREIGN KEY([CodigoProduto], [CodigoFilial])
REFERENCES [dbo].[Produtos] ([Codigo], [CodigoFilial])
GO
ALTER TABLE [dbo].[ItemSaida] CHECK CONSTRAINT [FK_Itemv_Produtos]
GO


CREATE TRIGGER [dbo].[tgInsertProdutos]
   ON  [dbo].[Produtos]
   AFTER INSERT
AS 
BEGIN
	insert into EstoqueProduto (CodigoFilial, CodigoProduto, CodigoEstoque, Quantidade)
	select  
	1,
	prod.Codigo,
	est.Codigo,
	0
	from
	inserted prod , Estoque est
END

GO

CREATE TRIGGER [dbo].[tgInsertItemEntrada] ON  [dbo].[ItemEntrada]  
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for trigger here
    
    update EstoqueProduto set Quantidade = est.Quantidade + item.Quantidade
    From
    EstoqueProduto est inner join Inserted item on 
                       est.CodigoProduto = item.CodigoProduto and est.CodigoEstoque = item.CodigoEstoque

END

GO


CREATE TRIGGER [dbo].[tgInsertItemSaida] ON  [dbo].[ItemSaida]  
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for trigger here
    
    update EstoqueProduto set Quantidade = est.Quantidade - item.Quantidade
    From
    EstoqueProduto est inner join Inserted item on 
                       est.CodigoProduto = item.CodigoProduto and est.CodigoEstoque = item.CodigoEstoque

END

GO