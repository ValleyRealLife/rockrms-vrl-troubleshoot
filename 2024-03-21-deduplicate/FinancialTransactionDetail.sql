SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialTransactionDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Summary] [nvarchar](500) NULL,
	[EntityTypeId] [int] NULL,
	[EntityId] [int] NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedByPersonAliasId] [int] NULL,
	[ModifiedByPersonAliasId] [int] NULL,
	[ForeignKey] [nvarchar](100) NULL,
	[ForeignGuid] [uniqueidentifier] NULL,
	[ForeignId] [int] NULL,
	[FeeAmount] [decimal](18, 2) NULL,
	[FeeCoverageAmount] [decimal](18, 2) NULL,
	[ForeignCurrencyAmount] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialTransactionDetail] ADD  CONSTRAINT [PK_dbo.FinancialTransactionDetail] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountId] ON [dbo].[FinancialTransactionDetail]
(
	[AccountId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountId_TransactionId_Amount] ON [dbo].[FinancialTransactionDetail]
(
	[AccountId] ASC
)
INCLUDE([TransactionId],[Amount]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CreatedByPersonAliasId] ON [dbo].[FinancialTransactionDetail]
(
	[CreatedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EntityTypeId_EntityId] ON [dbo].[FinancialTransactionDetail]
(
	[EntityTypeId] ASC,
	[EntityId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[FinancialTransactionDetail]
(
	[Guid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ModifiedByPersonAliasId] ON [dbo].[FinancialTransactionDetail]
(
	[ModifiedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionId] ON [dbo].[FinancialTransactionDetail]
(
	[TransactionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialTransactionDetail] ADD  DEFAULT ((0)) FOR [FeeAmount]
GO
ALTER TABLE [dbo].[FinancialTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.EntityType_EntityTypeId] FOREIGN KEY([EntityTypeId])
REFERENCES [dbo].[EntityType] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.EntityType_EntityTypeId]
GO
ALTER TABLE [dbo].[FinancialTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.FinancialAccount_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[FinancialAccount] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.FinancialAccount_AccountId]
GO
ALTER TABLE [dbo].[FinancialTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.FinancialTransaction_TransactionId] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[FinancialTransaction] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FinancialTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.FinancialTransaction_TransactionId]
GO
ALTER TABLE [dbo].[FinancialTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.PersonAlias_CreatedByPersonAliasId] FOREIGN KEY([CreatedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.PersonAlias_CreatedByPersonAliasId]
GO
ALTER TABLE [dbo].[FinancialTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.PersonAlias_ModifiedByPersonAliasId] FOREIGN KEY([ModifiedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialTransactionDetail_dbo.PersonAlias_ModifiedByPersonAliasId]
GO
