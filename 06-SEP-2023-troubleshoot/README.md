# Workflow triggering Workflow
Rock v14.2

- [Workflow triggering Workflow](#workflow-triggering-workflow)
- [One-sentence description](#one-sentence-description)
- [A more-detailed description](#a-more-detailed-description)
  - [Exception Details](#exception-details)
- [How to Recreate Problem](#how-to-recreate-problem)

# One-sentence description
i'm trying to troubleshoot why Workflow_1 cannot trigger Workflow_2 successfully.

# A more-detailed description
- i have a big workflow, i'll call it Workflow_1, this contains a multi-page form that someone would submit if they want to volunteer with our Youth Group
- i have a smaller workflow, i'll call it Workflow_2, this contains essentially three Activities: (1) Send Background Check to PMM, (2) Process Result, (3) "FINISH" sequence
- The intended flow is that someone would submit Workflow_1, and Workflow_1 would proceed to creating Connection Request, updating Rock Person Profile, sending email notification to appropriate staff member, etc. While also, Workflow_1 would trigger Workflow_2 and send the required variables for it to send a Background Check Request to PMM (such as Name, SSN, and DOB)
- The idea was that Workflow_1 would not need to remain Active while waiting for PMM's background check result.

When testing this, my test user gets this error upon submitting Workflow_1:  
([screenshot of Error that my user sees](./screenshot_error.png))
> (i'm renaming the Activities and Actions for the sake of making it easier to read)
> 
> Error in Activity: Resolve Background Check; Action: Activate Workflow_2 (Activate Workflow action type)
> 
> Error in Activity: Send Background Check Request; Action: Submit Request (Background Check Request action type)
> 
> An error occurred while updating the entries. See the inner exception for details.
>

## Exception Details
([screenshot of Exception Detail](./screenshot_exception_detail.png))
| Id             | 2493909 |
|----------------|-----|
| Exception Type | System.Data.Entity.Infrastructure.DbUpdateException |
| Source         | EntityFramework |
| Description    | An error occurred while updating the entries. See the inner exception for details. |
Stack Trace:
```
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
   at Rock.Data.DbContext.SaveChanges(SaveChangesArgs args) in C:\GitHub\Rock14\Rock\Data\DbContext.cs:line 330
   at Rock.Data.DbContext.SaveChanges(Boolean disablePrePostProcessing) in C:\GitHub\Rock14\Rock\Data\DbContext.cs:line 261
   at Rock.Security.BackgroundCheck.ProtectMyMinistry.SendRequest(RockContext rockContext, Workflow workflow, AttributeCache personAttribute, AttributeCache ssnAttribute, AttributeCache requestTypeAttribute, AttributeCache billingCodeAttribute, List`1& errorMessages) in C:\GitHub\Rock14\Rock\Security\BackgroundCheck\ProtectMyMinistry.cs:line 355
```

| Id             | 2493910 |
|----------------|-----|
| Exception Type | System.Data.Entity.Core.UpdateException |
| Source         | EntityFramework |
| Description    | An error occurred while updating the entries. See the inner exception for details. |
Stack Trace:
```
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   at System.Data.Entity.Internal.InternalContext.SaveChanges()
```

| Id             | 2493911 |
|----------------|-----|
| Exception Type | System.Data.SqlClient.SqlException |
| Source         | .Net SqlClient Data Provider |
| Description    | The INSERT statement conflicted with the FOREIGN KEY constraint "FK_dbo.BackgroundCheck_dbo.Workflow_WorkflowId". The conflict occurred in database "rockPRD", table "dbo.Workflow", column 'Id'. The statement has been terminated. |
Stack Trace:
```
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   at System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   at System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
```

# How to Recreate Problem
- Workflow_1
  - Activity_1: 
    - Action_1_1: (Form) Some Form with Workflow Attributes
    - Action_1_2: (Connection Request Create)
  - Activity_2: 
    - Action_2_1: (Lava Run) sets a boolean value of whether or not Background Check is necessary
    - Action_2_2: (Activate Workflow) if boolean=TRUE, Activates Workflow_2
      - Workflow Attribute: Person
      - Workflow Attribute: SSN
      - Workflow Attribute: ConnectionRequest
  - Actiity_3:
    - Action_3_1: Update some records
    - Action_3_2: (Email send) Send confirmation/notification email
    - Action_3_3: (Workflow Complete) Complete Workflow
    - 
- Workflow_2
  - Activity_1:
    - Action_1_1: (Background Check Send Request)
    - Action_1_2: (Activate Activity) Activate Activity_2 if ERROR
    - Action_1_3: (Activate Activity) Activate Activity_3 if Background Check Returns
  - Activity_2:
    - Action_2_1: (Workflow Set Status) Set status as 'Error'
    - Action_2_2: (Activity Assign to Person) Assign to Rock Admin
  - Activity_3:
    - Action_3_1: (Person Attribute Set) various attributes such as 'Background Check Date'
    - Action_3_2: (Entity Attribute Set) Update corresponding Connection Request
  - Activity_4:
    - Action_4_1: (Attribute Set Value) Clear SSN
    - Action_4_2: (Email Send) Notify Rock Admin of Success
    - Action_4_3: (Workflow Complete)
