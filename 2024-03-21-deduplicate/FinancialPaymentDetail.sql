SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialPaymentDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumberMasked] [nvarchar](max) NULL,
	[CurrencyTypeValueId] [int] NULL,
	[CreditCardTypeValueId] [int] NULL,
	[NameOnCardEncrypted] [nvarchar](256) NULL,
	[ExpirationMonthEncrypted] [nvarchar](256) NULL,
	[ExpirationYearEncrypted] [nvarchar](256) NULL,
	[BillingLocationId] [int] NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedDateTime] [datetime] NULL,
	[CreatedByPersonAliasId] [int] NULL,
	[ModifiedByPersonAliasId] [int] NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[ForeignKey] [nvarchar](100) NULL,
	[ForeignGuid] [uniqueidentifier] NULL,
	[ForeignId] [int] NULL,
	[GatewayPersonIdentifier] [nvarchar](50) NULL,
	[FinancialPersonSavedAccountId] [int] NULL,
	[NameOnCard] [nvarchar](max) NULL,
	[CardExpirationDate] [datetime] NULL,
	[ExpirationMonth] [int] NULL,
	[ExpirationYear] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialPaymentDetail] ADD  CONSTRAINT [PK_dbo.FinancialPaymentDetail] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BillingLocationId] ON [dbo].[FinancialPaymentDetail]
(
	[BillingLocationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CreatedByPersonAliasId] ON [dbo].[FinancialPaymentDetail]
(
	[CreatedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CreditCardTypeValueId] ON [dbo].[FinancialPaymentDetail]
(
	[CreditCardTypeValueId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CurrencyTypeValueId] ON [dbo].[FinancialPaymentDetail]
(
	[CurrencyTypeValueId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FinancialPersonSavedAccountId] ON [dbo].[FinancialPaymentDetail]
(
	[FinancialPersonSavedAccountId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Guid] ON [dbo].[FinancialPaymentDetail]
(
	[Guid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ModifiedByPersonAliasId] ON [dbo].[FinancialPaymentDetail]
(
	[ModifiedByPersonAliasId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinancialPaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.DefinedValue_CreditCardTypeValueId] FOREIGN KEY([CreditCardTypeValueId])
REFERENCES [dbo].[DefinedValue] ([Id])
GO
ALTER TABLE [dbo].[FinancialPaymentDetail] CHECK CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.DefinedValue_CreditCardTypeValueId]
GO
ALTER TABLE [dbo].[FinancialPaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.DefinedValue_CurrencyTypeValueId] FOREIGN KEY([CurrencyTypeValueId])
REFERENCES [dbo].[DefinedValue] ([Id])
GO
ALTER TABLE [dbo].[FinancialPaymentDetail] CHECK CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.DefinedValue_CurrencyTypeValueId]
GO
ALTER TABLE [dbo].[FinancialPaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.FinancialPersonSavedAccount] FOREIGN KEY([FinancialPersonSavedAccountId])
REFERENCES [dbo].[FinancialPersonSavedAccount] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[FinancialPaymentDetail] CHECK CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.FinancialPersonSavedAccount]
GO
ALTER TABLE [dbo].[FinancialPaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.Location_BillingLocationId] FOREIGN KEY([BillingLocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[FinancialPaymentDetail] CHECK CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.Location_BillingLocationId]
GO
ALTER TABLE [dbo].[FinancialPaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.PersonAlias_CreatedByPersonAliasId] FOREIGN KEY([CreatedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialPaymentDetail] CHECK CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.PersonAlias_CreatedByPersonAliasId]
GO
ALTER TABLE [dbo].[FinancialPaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.PersonAlias_ModifiedByPersonAliasId] FOREIGN KEY([ModifiedByPersonAliasId])
REFERENCES [dbo].[PersonAlias] ([Id])
GO
ALTER TABLE [dbo].[FinancialPaymentDetail] CHECK CONSTRAINT [FK_dbo.FinancialPaymentDetail_dbo.PersonAlias_ModifiedByPersonAliasId]
GO
