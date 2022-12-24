CREATE TABLE IF NOT EXISTS cs_admin_tickets (
    ticketID int NOT NULL AUTO_INCREMENT,
    ticketOwner varchar(55),
	ticketContent varchar(255),
    createTime varchar(15),
    PRIMARY KEY(ticketID)
);