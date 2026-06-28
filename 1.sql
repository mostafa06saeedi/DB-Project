CREATE TABLE [appointment] (
  [id]               int           IDENTITY(1,1) NOT NULL,
  [employeeID]       int           NULL,
  [patientID]        nvarchar(255) NULL,
  [departmentID]     int           NULL,
  [date]             date          NULL,
  [time]             time          NULL,
  [status]           nvarchar(255) NULL,
  [appointment_type] nvarchar(255) NULL,
  CONSTRAINT [PK_appointment] PRIMARY KEY ([id])
)

CREATE TABLE [bed] (
  [id]           int           IDENTITY(1,1) NOT NULL,
  [departmentID] int           NULL,
  [status]       nvarchar(255) NULL,
  [room]         nvarchar(255) NULL,
  CONSTRAINT [PK_bed] PRIMARY KEY ([id])
)

CREATE TABLE [admission] (
  [id]            int           IDENTITY(1,1) NOT NULL,
  [patientID]     nvarchar(255) NULL,
  [bedID]         int           NULL,
  [employeeID]    int           NULL,
  [appointmentID] int           NULL,
  [entrydate]     date          NULL,
  [exitdate]      date          NULL,
  [reason]        nvarchar(255) NULL,
  CONSTRAINT [PK_admission] PRIMARY KEY ([id])
)

CREATE TABLE [patienttransfer] (
  [id]          int           IDENTITY(1,1) NOT NULL,
  [date]        date          NULL,
  [time]        time          NULL,
  [reason]      nvarchar(255) NULL,
  [admissionID] int           NULL,
  [fromBedID]   int           NULL,
  [toBedID]     int           NULL,
  CONSTRAINT [PK_patienttransfer] PRIMARY KEY ([id])
)

CREATE TABLE [Labimagingrequest] (
  [id]            int           IDENTITY(1,1) NOT NULL,
  [employeeID]    int           NULL,
  [appointmentID] int           NULL,
  [admissionID]   int           NULL,
  [type]          nvarchar(255) NULL,
  [date]          date          NULL,
  [status]        nvarchar(255) NULL,
  CONSTRAINT [PK_Labimagingrequest] PRIMARY KEY ([id])
)

CREATE TABLE [isCritical] (
  [id]               int           IDENTITY(1,1) NOT NULL,
  [type]             nvarchar(255) NULL,
  [referenceMin]     float         NULL,
  [referenceMax]     float         NULL,
  [isCritical_status] nvarchar(255) NULL,
  [unit]             nvarchar(255) NULL,
  CONSTRAINT [PK_isCritical] PRIMARY KEY ([id])
)

CREATE TABLE [labresult] (
  [id]                    int           IDENTITY(1,1) NOT NULL,
  [reportedbyemployeeID]  int           NULL,
  [isCritical]            int           NULL,
  [LabimagingrequestID]   int           NULL,
  [value]                 nvarchar(255) NULL,
  [status]                nvarchar(255) NULL,
  [date]                  date          NULL,
  [description]           nvarchar(255) NULL,
  CONSTRAINT [PK_labresult] PRIMARY KEY ([id])
)

CREATE TABLE [labalert] (
  [id]          int           IDENTITY(1,1) NOT NULL,
  [doctorID]    int           NULL,
  [labResultID] int           NULL,
  [severity]    nvarchar(255) NULL,
  [status]      nvarchar(255) NULL,
  [createdAt]   date          NULL,
  [resolvedAt]  date          NULL,
  CONSTRAINT [PK_labalert] PRIMARY KEY ([id])
)
