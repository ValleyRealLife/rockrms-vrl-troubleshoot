SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialScheduledTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionFrequencyValueId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[NumberOfPayments] [int] NULL,
	[NextPaymentDate] [date] NULL,
	[LastStatusUpdateDateTime] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[TransactionCode] [nvarchar](50) NULL,
	[GatewayScheduleId] [nvarchar](max) NULL,
	[CardReminderDate] [date] NULL,
	[LastRemindedDate] [date] NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedByPersonAliasId] [int] NULL,
	[ModifiedByPersonAliasId] [int] NULL,
	[ForeignKey] [nvarchar](100) NULL,
	[AuthorizedPersonAliasId] [int] NOT NULL,
	[FinancialGatewayId] [int] NULL,
	[FinancialPaymentDetailId] [int] NULL,
	[ForeignGuid] [uniqueidentifier] NULL,
	[ForeignId] [int] NULL,
	[SourceTypeValueId] [int] NULL,
	[TransactionTypeValueId] [int] NULL,
	[Summary] [nvarchar](max) NULL,
	[ForeignCurrencyCodeValueId] [int] NULL,
	[InactivateDateTime] [datetime] NULL,
	[Status] [int] NULL,
	[StatusMessage] [nvarchar](200) NULL,
	[PreviousGatewayScheduleIdsJson] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] ADD  CONSTRAINT [PK_dbo.FinancialScheduledTransaction] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AuthorizedPersonAliasId] ON [dbo].[FinancialScheduledTransaction]
(
	[AuthorizedPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CreatedByPersonAliasId] ON [dbo].[FinancialScheduledTransaction]
(
	[CreatedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FinancialGatewayId] ON [dbo].[FinancialScheduledTransaction]
(
	[FinancialGatewayId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FinancialPaymentDetailId] ON [dbo].[FinancialScheduledTransaction]
(
	[FinancialPaymentDetailId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ForeignCurrencyCodeValueId] ON [dbo].[FinancialScheduledTransaction]
(
	[ForeignCurrencyCodeValueId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[FinancialScheduledTransaction]
(
	[Guid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ModifiedByPersonAliasId] ON [dbo].[FinancialScheduledTransaction]
(
	[ModifiedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SourceTypeValueId] ON [dbo].[FinancialScheduledTransaction]
(
	[SourceTypeValueId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionFrequencyValueId] ON [dbo].[FinancialScheduledTransaction]
(
	[TransactionFrequencyValueId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionTypeValueId] ON [dbo].[FinancialScheduledTransaction]
(
	[TransactionTypeValueId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] ADD  DEFAULT ((0)) FOR [AuthorizedPersonAliasId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.DefinedValue_ForeignCurrencyCodeValueId] FOREIGN KEY([ForeignCurrencyCodeValueId])
REFERENCES [dbo].[DefinedValue] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.DefinedValue_ForeignCurrencyCodeValueId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.DefinedValue_SourceTypeValueId] FOREIGN KEY([SourceTypeValueId])
REFERENCES [dbo].[DefinedValue] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.DefinedValue_SourceTypeValueId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.DefinedValue_TransactionFrequencyValueId] FOREIGN KEY([TransactionFrequencyValueId])
REFERENCES [dbo].[DefinedValue] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.DefinedValue_TransactionFrequencyValueId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.DefinedValue_TransactionTypeValueId] FOREIGN KEY([TransactionTypeValueId])
REFERENCES [dbo].[DefinedValue] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.DefinedValue_TransactionTypeValueId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.FinancialGateway_FinancialGatewayId] FOREIGN KEY([FinancialGatewayId])
REFERENCES [dbo].[FinancialGateway] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.FinancialGateway_FinancialGatewayId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.FinancialPaymentDetail_FinancialPaymentDetailId] FOREIGN KEY([FinancialPaymentDetailId])
REFERENCES [dbo].[FinancialPaymentDetail] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.FinancialPaymentDetail_FinancialPaymentDetailId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.PersonAlias_AuthorizedPersonAliasId] FOREIGN KEY([AuthorizedPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.PersonAlias_AuthorizedPersonAliasId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.PersonAlias_CreatedByPersonAliasId] FOREIGN KEY([CreatedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.PersonAlias_CreatedByPersonAliasId]
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.PersonAlias_ModifiedByPersonAliasId] FOREIGN KEY([ModifiedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialScheduledTransaction] CHECK CONSTRAINT [FK_dbo.FinancialScheduledTransaction_dbo.PersonAlias_ModifiedByPersonAliasId]
GO
