CREATE TABLE [storage] (
  [id]        int           IDENTITY(1,1) NOT NULL,
  [name]      nvarchar(255) NULL,
  [inventory] int           NULL,
  [type]      nvarchar(255) NULL,
  CONSTRAINT [PK_storage] PRIMARY KEY ([id])
)

CREATE TABLE [storage_transaction] (
  [id]        int           IDENTITY(1,1) NOT NULL,
  [drugID]    int           NULL,
  [storageID] int           NULL,
  [date]      date          NULL,
  [type]      nvarchar(255) NULL,
  [quantity]  int           NULL,
  [reason]    nvarchar(255) NULL,
  CONSTRAINT [PK_storage_transaction] PRIMARY KEY ([id])
)

CREATE TABLE [paymentmethod] (
  [id]   int           IDENTITY(1,1) NOT NULL,
  [type] nvarchar(255) NULL,
  CONSTRAINT [PK_paymentmethod] PRIMARY KEY ([id])
)

CREATE TABLE [invoice] (
  [id]              int           IDENTITY(1,1) NOT NULL,
  [patientID]       nvarchar(255) NULL,
  [admissionID]     int           NULL,
  [appointmentID]   int           NULL,
  [insuranceId]     int           NULL,
  [paymentmethodID] int           NULL,
  [total_amount]    float         NULL,
  [status]          nvarchar(255) NULL,
  [date]            date          NULL,
  CONSTRAINT [PK_invoice] PRIMARY KEY ([id])
)

CREATE TABLE [invoiceitem] (
  [id]          int           IDENTITY(1,1) NOT NULL,
  [invoiceID]   int           NULL,
  [item]        nvarchar(255) NULL,
  [type]        nvarchar(255) NULL,
  [description] nvarchar(255) NULL,
  [amount]      float         NULL,
  CONSTRAINT [PK_invoiceitem] PRIMARY KEY ([id])
)
GO

CREATE TABLE [iotdevice] (
  [id]               int           IDENTITY(1,1) NOT NULL,
  [macaddress]       nvarchar(255) NULL,
  [type]             nvarchar(255) NULL,
  [status]           nvarchar(255) NULL,
  [installationdate] date          NULL,
  CONSTRAINT [PK_iotdevice] PRIMARY KEY ([id])
)


CREATE TABLE [devicetransfer] (
  [id]          int           IDENTITY(1,1) NOT NULL,
  [patientID]   nvarchar(255) NULL,
  [admissionID] int           NULL,
  [departmentID] int          NULL,
  [bedID]       int           NULL,
  [iotdeviceID] int           NULL,
  [assignedAt]  date          NULL,
  [unassignedAt] date         NULL,
  CONSTRAINT [PK_devicetransfer] PRIMARY KEY ([id])
)


CREATE TABLE [logs] (
  [id]        int           IDENTITY(1,1) NOT NULL,
  [deviceID]  int           NULL,
  [timestamp] datetime      NULL,
  [type]      nvarchar(255) NULL,
  [value]     float         NULL,
  [unit]      nvarchar(255) NULL,
  CONSTRAINT [PK_logs] PRIMARY KEY ([id])
)


CREATE TABLE [alert] (
  [id]                       int           IDENTITY(1,1) NOT NULL,
  [logID]                    int           NULL,
  [alertThresholdID]         int           NULL,
  [acknowledgedbyemployeeID] int           NULL,
  [severity]                 nvarchar(255) NULL,
  [status]                   nvarchar(255) NULL,
  [createdtime]              datetime      NULL,
  [resolvedtime]             datetime      NULL,
  CONSTRAINT [PK_alert] PRIMARY KEY ([id])
)


CREATE TABLE [AlertThreshold] (
  [id]              int           IDENTITY(1,1) NOT NULL,
  [measurementType] nvarchar(255) NULL,
  [minValue]        float         NULL,
  [maxValue]        float         NULL,
  [severity]        nvarchar(255) NULL,
  [isGlobal]        bit           NULL,       
  [employeeID]      int           NULL,
  [patientID]       nvarchar(255) NULL,
  [createdate]      date          NULL,
  CONSTRAINT [PK_AlertThreshold] PRIMARY KEY ([id])
)