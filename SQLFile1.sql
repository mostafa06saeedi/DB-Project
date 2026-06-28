CREATE TABLE [patient] (
  [nationalID]  nvarchar(255) NOT NULL,
  [insuranceID] int           NULL,
  [name]        nvarchar(255) NULL,
  [datebirth]   date          NULL,
  [gender]      nvarchar(255) NULL,
  [phone]       nvarchar(255) NULL,
  [address]     nvarchar(255) NULL,
  CONSTRAINT [PK_patient] PRIMARY KEY ([nationalID])
)

CREATE TABLE [medicalrecord] (
  [id]          int           IDENTITY(1,1) NOT NULL,
  [patientID]   nvarchar(255) NULL,
  [perMedicalRecord] nvarchar(255) NULL,
  [predrugconsumption] nvarchar(255) NULL,
  [weight] 	float         NULL,
  [height] 	float         NULL,
  [bloodpressure] nvarchar(255) NULL,
  CONSTRAINT [PK_medicalrecord] PRIMARY KEY ([id]),
  CONSTRAINT [UQ_medicalrecord_patientID] UNIQUE ([patientID])
)

CREATE TABLE [insurance] (
  [id]          int           IDENTITY(1,1) NOT NULL,
  [name]        nvarchar(255) NULL,
  [type]		nvarchar(255) NULL,
  [coveragepercet]		float NULL,
  [isActive]		bit NULL,
  CONSTRAINT [PK_insurance] PRIMARY KEY ([id])
)

CREATE TABLE [icddisease] (
  [id]          int           IDENTITY(1,1) NOT NULL,
  [code]        nvarchar(255) NULL,
  [name]        nvarchar(255) NULL,
  CONSTRAINT [PK_icddisease] PRIMARY KEY ([id])
)

CREATE TABLE [doctordiagnosis] (
  [id]            int       IDENTITY(1,1) NOT NULL,
  [appointmentID] int       NULL,
  [admissionID]   int       NULL,
  [icdID]         int       NULL,
  [description]   nvarchar(255) NULL,
  CONSTRAINT [PK_doctordiagnosis] PRIMARY KEY ([id])
)

CREATE TABLE [department] (
  [id]          int           IDENTITY(1,1) NOT NULL,
  [name]        nvarchar(255) NULL,
  CONSTRAINT [PK_department] PRIMARY KEY ([id])
)