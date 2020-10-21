SELECT 
    'Go ' + Char(13) + Char(10) + 'ALTER TABLE [' +  OBJECT_SCHEMA_NAME(parent_object_id) +
    '].[' + OBJECT_NAME(parent_object_id) + 
    '] DROP CONSTRAINT [' + name + ']'
FROM sys.foreign_keys
--WHERE referenced_object_id = object_id('Person')

ALTER TABLE [dbo].[PrescriptionOrder] DROP CONSTRAINT [FK_PrescriptionOrder_EncounterLocationID]
ALTER TABLE [dbo].[OperationRequest] DROP CONSTRAINT [FK_OperationRequest_EncounterLocation]
ALTER TABLE [dbo].[CancerDisket] DROP CONSTRAINT [FK_CancerDisket_EncounterLocation]
ALTER TABLE [dbo].[MealBed] DROP CONSTRAINT [FK_MealBed_EncounterLocation]
ALTER TABLE [dbo].[OrderSheet] DROP CONSTRAINT [FK_OrderSheet_EncounterLocation]
ALTER TABLE [dbo].[OperationSession] DROP CONSTRAINT [FK_OperationSession_EncounterLocation]
ALTER TABLE [dbo].[PhysiotherapyEncounterInfo] DROP CONSTRAINT [FK_PhysiotherapyEncounterInfo_EncounterLocation]
ALTER TABLE [dbo].[DialysisEncounterInfo] DROP CONSTRAINT [FK_DialysisEncounterInfo_EncounterLocation]


ALTER TABLE [dbo].[DeathReason] DROP CONSTRAINT [FK_DeathReason_PatientDeath]


ALTER TABLE [dbo].[ServiceGoods] DROP CONSTRAINT [FK_ServiceGoods_Salable]
ALTER TABLE [dbo].[Privileged] DROP CONSTRAINT [FK_Privileged_Salable]
ALTER TABLE [dbo].[WHRequestItem] DROP CONSTRAINT [FK_WHRequestItem_Salable]
ALTER TABLE [dbo].[StockItem] DROP CONSTRAINT [FK_StockItem_Salable]
ALTER TABLE [dbo].[Threshold] DROP CONSTRAINT [FK_Threshold_Salable]
ALTER TABLE [dbo].[DrugstoreDocItem] DROP CONSTRAINT [FK_DrugstoreDocItem_Salable]
ALTER TABLE [dbo].[GaurXSalable] DROP CONSTRAINT [FK_GaurXSalable_Salable]
ALTER TABLE [dbo].[InventoryTUserCount] DROP CONSTRAINT [FK_InventoryTakingUserCount_Salable]
ALTER TABLE [dbo].[PrescriptionOrderItem] DROP CONSTRAINT [FK_PrescriptionOrderItem_Salable]
ALTER TABLE [dbo].[WardRequestItem] DROP CONSTRAINT [FK_WardRequestItem_Salable]
ALTER TABLE [dbo].[PrescriptionItem] DROP CONSTRAINT [FK_PrescriptionItem_Salable]
ALTER TABLE [dbo].[Storage] DROP CONSTRAINT [FK_Storage_Salable]
ALTER TABLE [dbo].[SalablePackaging] DROP CONSTRAINT [FK_SalablePackaging_Salable]
ALTER TABLE [dbo].[SalableLog] DROP CONSTRAINT [FK_SalableLog_Salable]
ALTER TABLE [dbo].[PresTemplItem] DROP CONSTRAINT [FK_PresTemplItem_Salable]
ALTER TABLE [dbo].[PrescribeRule] DROP CONSTRAINT [FK_PrescribeRule_Salable]
ALTER TABLE [dbo].[DRGSOrderFormat] DROP CONSTRAINT [FK_DRGSOrderFormat_Salable]
ALTER TABLE [dbo].[DeptSalable] DROP CONSTRAINT [FK_DeptSalable_Salable]
ALTER TABLE [dbo].[AcceptedApprovalDoc] DROP CONSTRAINT [FK_AcceptedApprovalDoc_Salable]
ALTER TABLE [dbo].[CategoryChild] DROP CONSTRAINT [FK_CategoryChild_Salable]
ALTER TABLE [dbo].[CombinedSalableItem] DROP CONSTRAINT [FK_CombinedSalableItem_Salable]
ALTER TABLE [dbo].[CompanyXSalable] DROP CONSTRAINT [FK_CompanyXSalable_Salable]
ALTER TABLE [dbo].[CombinedSalableItem] DROP CONSTRAINT [FK_CombinedSalableItem_Salable1]


ALTER TABLE [dbo].[DeptSalable] DROP CONSTRAINT [FK_DeptSalable_Dept]
ALTER TABLE [dbo].[DrugStoreDoc] DROP CONSTRAINT [FK_DrugStoreDoc_Dept1]
ALTER TABLE [dbo].[DrugStoreDoc] DROP CONSTRAINT [FK_DrugStoreDoc_Dept]
ALTER TABLE [dbo].[Threshold] DROP CONSTRAINT [FK_Threshold_Dept]
ALTER TABLE [dbo].[Prescription] DROP CONSTRAINT [FK_Prescription_Dept]
ALTER TABLE [dbo].[InventoryTaking] DROP CONSTRAINT [FK_InventoryTaking_Dept]
ALTER TABLE [dbo].[Storage] DROP CONSTRAINT [FK_Storage_Dept]
ALTER TABLE [dbo].[PrescribeRule] DROP CONSTRAINT [FK_PrescribeRule_Dept1]
ALTER TABLE [dbo].[WHRequest] DROP CONSTRAINT [FK_WHRequest_Dept]
ALTER TABLE [dbo].[PhyFee] DROP CONSTRAINT [FK_PhyFee_Dept]
ALTER TABLE [dbo].[DeptXSalableCategory] DROP CONSTRAINT [FK_Dept_DeptXSalableCategory]


ALTER TABLE [dbo].[PrescriptionOrderItem] DROP CONSTRAINT [FK_PrescriptionOrderItem_Packaging]
ALTER TABLE [dbo].[SalablePackaging] DROP CONSTRAINT [FK_SalablePackaging_Packaging]
ALTER TABLE [dbo].[ServiceGoods] DROP CONSTRAINT [FK_ServiceGoods_Packaging]
ALTER TABLE [dbo].[WardRequestItem] DROP CONSTRAINT [FK_WardRequestItem_Packaging]
ALTER TABLE [dbo].[WHRequestItem] DROP CONSTRAINT [FK_WHRequestItem_Packaging]
ALTER TABLE [dbo].[DRGSOrderFormat] DROP CONSTRAINT [FK_DRGSOrderFormat_Packaging]
ALTER TABLE [dbo].[DRGSOrderFormat] DROP CONSTRAINT [FK_DRGSOrderFormat_Packaging1]
ALTER TABLE [dbo].[PrescriptionItem] DROP CONSTRAINT [FK_PrescriptionItem_Packaging]
ALTER TABLE [dbo].[DrugstoreDocItem] DROP CONSTRAINT [FK_DrugstoreDocItem_Packaging]
ALTER TABLE [dbo].[PresTemplItem] DROP CONSTRAINT [FK_PresTemplItem_Packaging]
ALTER TABLE [dbo].[StockItem] DROP CONSTRAINT [FK_StockItem_Packaging]


ALTER TABLE [dbo].[WardRequest] DROP CONSTRAINT [FK_WardRequest_Prescription]
ALTER TABLE [dbo].[ServiceEvent] DROP CONSTRAINT [FK_ServiceEvent_Prescription]
ALTER TABLE [dbo].[Prescription] DROP CONSTRAINT [FK_Prescription_Prescription]
ALTER TABLE [dbo].[PrescriptionItem] DROP CONSTRAINT [FK_PrescriptionItem_Prescription]
ALTER TABLE [dbo].[PrescriptionLog] DROP CONSTRAINT [FK_PrescriptionLog_Prescription]
ALTER TABLE [dbo].[ApprovalDoc] DROP CONSTRAINT [FK_ApprovalDoc_Prescription]


ALTER TABLE [dbo].[PrescriptionOrderCardex] DROP CONSTRAINT [FK_PrescriptionOrderCardex_PrescriptionItem]
ALTER TABLE [dbo].[DRGSInteraction] DROP CONSTRAINT [FK_DRGSInteraction_PrescriptionItem]
ALTER TABLE [dbo].[DRGSInteraction] DROP CONSTRAINT [FK_DRGSInteraction_PrescriptionItem1]
ALTER TABLE [dbo].[PrescriptionItem] DROP CONSTRAINT [FK_PrescriptionItem_PrescriptionItem]

ALTER TABLE [dbo].[InventoryTakingItem] DROP CONSTRAINT [FK_InventoryTakingItem_DrugstoreDocItem1]

ALTER TABLE [dbo].[StorageChangeLog] DROP CONSTRAINT [FK_StorageChangeLog_Storage]
ALTER TABLE [dbo].[StorageLog] DROP CONSTRAINT [FK_StorageLog_Storage]
ALTER TABLE [dbo].[InventoryTakingItem] DROP CONSTRAINT [FK_InventoryTakingItem_Storage]
ALTER TABLE [dbo].[WardRequestItem] DROP CONSTRAINT [FK_WardRequestItem_Storage]

ALTER TABLE [dbo].[AutoCalcHistory] DROP CONSTRAINT [FK_AutoCalcHistory_Insurer]
ALTER TABLE [dbo].[GaurXInsurer] DROP CONSTRAINT [FK_GaurXInsurer_Insurer]
ALTER TABLE [dbo].[ServiceInsFormula] DROP CONSTRAINT [FK_ServiceInsFormula_Insurer]
ALTER TABLE [dbo].[InsurerPracService] DROP CONSTRAINT [FK_InsurerPracService_Insurer]
ALTER TABLE [dbo].[CaliforniaModifierNotInsured] DROP CONSTRAINT [FK_CaliforniaModifierNotInsured_Insurer]
ALTER TABLE [dbo].[InsurerService] DROP CONSTRAINT [FK_InsurerService_Insurer]
ALTER TABLE [dbo].[CouplePerson] DROP CONSTRAINT [FK_CouplePerson_Insurer]
ALTER TABLE [dbo].[InsurerServiceLog] DROP CONSTRAINT [FK_InsurerServiceLog_Insurer]
ALTER TABLE [dbo].[InsuranceContract] DROP CONSTRAINT [FK_InsuranceContract_Insurer]
ALTER TABLE [dbo].[AINDAccount] DROP CONSTRAINT [FK_AINDAccount_Insurer]

ALTER TABLE [dbo].[PatRecDoc] DROP CONSTRAINT [FK_PatRecDoc_OutPatientRecord]
ALTER TABLE [dbo].[PatRecLog] DROP CONSTRAINT [FK_PatRecLog_OutPatientRecord]

ALTER TABLE [dbo].[PatRecDoc] DROP CONSTRAINT [FK_PatRecDoc_PatientRecord]
ALTER TABLE [dbo].[PatRecLog] DROP CONSTRAINT [FK_PatRecLog_PatientRecord]


ALTER TABLE [dbo].[Patient] DROP CONSTRAINT [FK_Patient_Person]