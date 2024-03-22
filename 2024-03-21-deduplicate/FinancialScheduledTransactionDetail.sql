SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialScheduledTransactionDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScheduledTransactionId] [int] NOT NULL,
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
	[FeeCoverageAmount] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail] ADD  CONSTRAINT [PK_dbo.FinancialScheduledTransactionDetail] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountId] ON [dbo].[FinancialScheduledTransactionDetail]
(
	[AccountId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CreatedByPersonAliasId] ON [dbo].[FinancialScheduledTransactionDetail]
(
	[CreatedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EntityTypeId_EntityId] ON [dbo].[FinancialScheduledTransactionDetail]
(
	[EntityTypeId] ASC,
	[EntityId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[FinancialScheduledTransactionDetail]
(
	[Guid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ModifiedByPersonAliasId] ON [dbo].[FinancialScheduledTransactionDetail]
(
	[ModifiedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ScheduledTransactionId] ON [dbo].[FinancialScheduledTransactionDetail]
(
	[ScheduledTransactionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.EntityType_EntityTypeId] FOREIGN KEY([EntityTypeId])
REFERENCES [dbo].[EntityType] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.EntityType_EntityTypeId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.FinancialAccount_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[FinancialAccount] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.FinancialAccount_AccountId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.FinancialScheduledTransaction_ScheduledTransactionId] FOREIGN KEY([ScheduledTransactionId])
REFERENCES [dbo].[FinancialScheduledTransaction] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.FinancialScheduledTransaction_ScheduledTransactionId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.PersonAlias_CreatedByPersonAliasId] FOREIGN KEY([CreatedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.PersonAlias_CreatedByPersonAliasId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.PersonAlias_ModifiedByPersonAliasId] FOREIGN KEY([ModifiedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransactionDetail] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransactionDetail_dbo.PersonAlias_ModifiedByPersonAliasId]
GO
