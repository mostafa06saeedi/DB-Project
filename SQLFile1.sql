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
  [id]               int           IDENTITY(1,1) NOT NULL,
  [patientID]        nvarchar(255) NULL,
  [preMedicalRecord] nvarchar(255) NULL,
  [predrugconsumption] nvarchar(255) NULL,
  [weight]           float         NULL,
  [height]           float         NULL,
  [bloodpressure]    nvarchar(255) NULL,
  CONSTRAINT [PK_medicalrecord] PRIMARY KEY ([id]),
  CONSTRAINT [UQ_medicalrecord_patientID] UNIQUE ([patientID])
)


CREATE TABLE [insurance] (
  [id]              int           IDENTITY(1,1) NOT NULL,
  [name]            nvarchar(255) NULL,
  [type]            nvarchar(255) NULL,
  [coveragepercent] float         NULL,
  [isActive]        bit           NULL,     
  CONSTRAINT [PK_insurance] PRIMARY KEY ([id])
)


CREATE TABLE [icddisease] (
  [id]   int           IDENTITY(1,1) NOT NULL,
  [code] nvarchar(255) NULL,
  [name] nvarchar(255) NULL,
  CONSTRAINT [PK_icddisease] PRIMARY KEY ([id])
)


CREATE TABLE [doctordiagnosis] (
  [id]          int           IDENTITY(1,1) NOT NULL,
  [appointmentID] int         NULL,
  [admissionID] int           NULL,
  [icdID]       int           NULL,
  [description] nvarchar(255) NULL,
  CONSTRAINT [PK_doctordiagnosis] PRIMARY KEY ([id])
)


CREATE TABLE [department] (
  [id]   int           IDENTITY(1,1) NOT NULL,
  [name] nvarchar(255) NULL,
  [type] nvarchar(255) NULL,
  CONSTRAINT [PK_department] PRIMARY KEY ([id])
)


CREATE TABLE [employee] (
  [id]            int           IDENTITY(1,1) NOT NULL,
  [departmentID]  int           NULL,
  [name]          nvarchar(255) NULL,
  [contractType]  nvarchar(255) NULL,
  [phone]         nvarchar(255) NULL,
  [role]          nvarchar(255) NULL,
  [specialization] nvarchar(255) NULL,
  [medicalsystemID] nvarchar(255) NULL,
  CONSTRAINT [PK_employee] PRIMARY KEY ([id])
)


CREATE TABLE [doctor] (
  [employeeID]      int           NOT NULL,  /*PK is also FK to employee*/
  [specialization]  nvarchar(255) NULL,
  [medicalLicenseNo] nvarchar(255) NULL,
  CONSTRAINT [PK_doctor] PRIMARY KEY ([employeeID])
)


CREATE TABLE [surgeon] (
  [employeeID]      int           NOT NULL,
  [surgicalSpecialty] nvarchar(255) NULL,
  CONSTRAINT [PK_surgeon] PRIMARY KEY ([employeeID])
)


CREATE TABLE [nurse] (
  [employeeID] int           NOT NULL,
  [grade]      nvarchar(255) NULL,
  CONSTRAINT [PK_nurse] PRIMARY KEY ([employeeID])
)


CREATE TABLE [adminstaff] (
  [employeeID] int           NOT NULL,
  [role]       nvarchar(255) NULL,
  CONSTRAINT [PK_adminstaff] PRIMARY KEY ([employeeID])
)


CREATE TABLE [shift] (
  [id]        int           IDENTITY(1,1) NOT NULL,
  [shiftDate] date          NULL,
  [startTime] time          NULL,
  [endTime]   time          NULL,
  [shiftType] nvarchar(255) NULL,
  CONSTRAINT [PK_shift] PRIMARY KEY ([id])
)


CREATE TABLE [employeeshift] (
  [id]         int IDENTITY(1,1) NOT NULL,
  [employeeID] int NULL,
  [shiftID]    int NULL,
  CONSTRAINT [PK_employeeshift] PRIMARY KEY ([id])
)