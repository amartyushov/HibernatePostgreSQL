CREATE TABLE users (
    "id" 			UUID   			NOT NULL,
    "name" 			varchar(50)   	NOT NULL,
    "birthdate" 	date   			NOT NULL,
    "version" 		int   			NOT NULL,
    "created_at" 	timestamptz   	NOT NULL,
    "updated_at" 	timestamptz   	NOT NULL,

    CONSTRAINT "pk_users" PRIMARY KEY ("id")
);