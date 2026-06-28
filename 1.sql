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