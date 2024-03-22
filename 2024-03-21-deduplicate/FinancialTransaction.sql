SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BatchId] [int] NULL,
	[TransactionDateTime] [datetime] NULL,
	[TransactionCode] [nvarchar](50) NULL,
	[Summary] [nvarchar](max) NULL,
	[TransactionTypeValueId] [int] NOT NULL,
	[SourceTypeValueId] [int] NULL,
	[CheckMicrEncrypted] [nvarchar](max) NULL,
	[ScheduledTransactionId] [int] NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedByPersonAliasId] [int] NULL,
	[ModifiedByPersonAliasId] [int] NULL,
	[ForeignKey] [nvarchar](100) NULL,
	[ProcessedByPersonAliasId] [int] NULL,
	[ProcessedDateTime] [datetime] NULL,
	[CheckMicrHash] [nvarchar](128) NULL,
	[AuthorizedPersonAliasId] [int] NULL,
	[FinancialGatewayId] [int] NULL,
	[FinancialPaymentDetailId] [int] NULL,
	[MICRStatus] [int] NULL,
	[CheckMicrParts] [nvarchar](max) NULL,
	[ForeignGuid] [uniqueidentifier] NULL,
	[ForeignId] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[StatusMessage] [nvarchar](200) NULL,
	[IsSettled] [bit] NULL,
	[SettledGroupId] [nvarchar](100) NULL,
	[SettledDate] [datetime] NULL,
	[IsReconciled] [bit] NULL,
	[ShowAsAnonymous] [bit] NOT NULL,
	[FutureProcessingDateTime] [datetime] NULL,
	[NonCashAssetTypeValueId] [int] NULL,
	[SundayDate] [date] NULL,
	[TransactionDateKey] [int] NULL,
	[SettledDateKey] [int] NULL,
	[ForeignCurrencyCodeValueId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialTransaction] ADD  CONSTRAINT [PK_dbo.FinancialTransaction] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BatchId] ON [dbo].[FinancialTransaction]
(
	[BatchId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_CheckMicrHash] ON [dbo].[FinancialTransaction]
(
	[CheckMicrHash] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CreatedByPersonAliasId] ON [dbo].[FinancialTransaction]
(
	[CreatedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FinancialGatewayId] ON [dbo].[FinancialTransaction]
(
	[FinancialGatewayId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FinancialPaymentDetailId] ON [dbo].[FinancialTransaction]
(
	[FinancialPaymentDetailId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FutureProcessingDateTime] ON [dbo].[FinancialTransaction]
(
	[FutureProcessingDateTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[FinancialTransaction]
(
	[Guid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ModifiedByPersonAliasId] ON [dbo].[FinancialTransaction]
(
	[ModifiedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NonCashAssetTypeValueId] ON [dbo].[FinancialTransaction]
(
	[NonCashAssetTypeValueId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ProcessedByPersonAliasId] ON [dbo].[FinancialTransaction]
(
	[ProcessedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ScheduledTransactionId] ON [dbo].[FinancialTransaction]
(
	[ScheduledTransactionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SettledDateKey] ON [dbo].[FinancialTransaction]
(
	[SettledDateKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SourceTypeValueId] ON [dbo].[FinancialTransaction]
(
	[SourceTypeValueId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SundayDate] ON [dbo].[FinancialTransaction]
(
	[SundayDate] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_TransactionCode] ON [dbo].[FinancialTransaction]
(
	[TransactionCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionDateKey] ON [dbo].[FinancialTransaction]
(
	[TransactionDateKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionDateTime_SourceType_AuthorizedPerson_PaymentDetails] ON [dbo].[FinancialTransaction]
(
	[TransactionDateTime] ASC
)
INCLUDE([Id],[SourceTypeValueId],[AuthorizedPersonAliasId],[FinancialPaymentDetailId]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionDateTime_TransactionTypeValueId_Person] ON [dbo].[FinancialTransaction]
(
	[TransactionTypeValueId] ASC,
	[AuthorizedPersonAliasId] ASC,
	[TransactionDateTime] ASC
)
INCLUDE([Id],[Summary],[FinancialPaymentDetailId]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionTypeValueId_TransactionDateTime] ON [dbo].[FinancialTransaction]
(
	[TransactionTypeValueId] ASC,
	[TransactionDateTime] ASC
)
INCLUDE([Id],[AuthorizedPersonAliasId]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialTransaction] ADD  DEFAULT ((0)) FOR [ShowAsAnonymous]
GO
ALTER TABLE [dbo].[FinancialTransaction] ADD  DEFAULT ('1753-01-01T00:00:00.000') FOR [SundayDate]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.DefinedValue_NonCashAssetTypeValueId] FOREIGN KEY([NonCashAssetTypeValueId])
REFERENCES [dbo].[DefinedValue] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.DefinedValue_NonCashAssetTypeValueId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.DefinedValue_SourceTypeValueId] FOREIGN KEY([SourceTypeValueId])
REFERENCES [dbo].[DefinedValue] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.DefinedValue_SourceTypeValueId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.DefinedValue_TransactionTypeValueId] FOREIGN KEY([TransactionTypeValueId])
REFERENCES [dbo].[DefinedValue] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.DefinedValue_TransactionTypeValueId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.FinancialBatch_BatchId] FOREIGN KEY([BatchId])
REFERENCES [dbo].[FinancialBatch] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.FinancialBatch_BatchId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.FinancialGateway_FinancialGatewayId] FOREIGN KEY([FinancialGatewayId])
REFERENCES [dbo].[FinancialGateway] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.FinancialGateway_FinancialGatewayId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.FinancialPaymentDetail_FinancialPaymentDetailId] FOREIGN KEY([FinancialPaymentDetailId])
REFERENCES [dbo].[FinancialPaymentDetail] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.FinancialPaymentDetail_FinancialPaymentDetailId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.FinancialScheduledTransaction_ScheduledTransactionId] FOREIGN KEY([ScheduledTransactionId])
REFERENCES [dbo].[FinancialScheduledTransaction] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.FinancialScheduledTransaction_ScheduledTransactionId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.PersonAlias_AuthorizedPersonAliasId] FOREIGN KEY([AuthorizedPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.PersonAlias_AuthorizedPersonAliasId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.PersonAlias_CreatedByPersonAliasId] FOREIGN KEY([CreatedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.PersonAlias_CreatedByPersonAliasId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.PersonAlias_ModifiedByPersonAliasId] FOREIGN KEY([ModifiedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.PersonAlias_ModifiedByPersonAliasId]
GO
ALTER TABLE [dbo].[FinancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialTransaction_dbo.PersonAlias_ProcessedByPersonAliasId] FOREIGN KEY([ProcessedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialTransaction] CHECK CONSTRAINT [FK_dbo.FinancialTransaction_dbo.PersonAlias_ProcessedByPersonAliasId]
GO
