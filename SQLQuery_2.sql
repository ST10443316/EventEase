-- Table: Venue
CREATE TABLE Venue (
    VenueId INT IDENTITY(1,1) PRIMARY KEY,
    VenueName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(200) NOT NULL,
    Capacity INT NOT NULL,
    ImageUrl NVARCHAR(MAX) NULL
);

-- Table: Event
CREATE TABLE Event (
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    EventName NVARCHAR(100) NOT NULL,
    EventDate DATETIME NOT NULL,
    Description NVARCHAR(MAX) NULL,
    VenueId INT NULL,
    FOREIGN KEY (VenueId) REFERENCES Venue (VenueId)
);

-- Table: Booking
CREATE TABLE Booking (
    BookingId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    VenueId INT NOT NULL,
    BookingDate DATETIME NOT NULL,
    FOREIGN KEY (EventId) REFERENCES Event (EventId),
    FOREIGN KEY (VenueId) REFERENCES Venue (VenueId),
    CONSTRAINT UQ_Booking UNIQUE (EventId, VenueId)
);