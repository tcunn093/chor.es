Create Database IF NOT EXISTS ChoresDB;


Create table if not exists Floor_T (

	floorID int auto_increment,
    
    constraint pk_task_t primary key (floorID)
    
);


create table if not exists Room_T (

	roomID int auto_increment,
    roomType ENUM('Bedroom', 'Living Room', 'Bathroom', 'Hallway', 'Kitchen', 'Dining Room'),
    roomNote varchar(20),
    roomFloor int,
    
    constraint pk_room_t primary key (roomID),
    constraint fk_room_t_floorID foreign key (roomFloor) references Floor_t(floorID)
    
);


create table if not exists Chore_T (

	choreID int auto_increment,
    choreType ENUM('Sweep', 'Mop', 'Clean', 'Dishes', 'Fold', 'Sort', 'Walk', 'Garbage'),
    choreNote varchar(20),
    choreRoom int,
    choreDue date,
    
    constraint pk_chore_t primary key(choreID),
    constraint fk_chore_t_roomID foreign key (choreRoom) references Room_T (roomID)
	
);









