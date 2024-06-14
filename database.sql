-- CREATE DATABASE "first-look"

-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!
-- CREATE TABLE "user" (
--     "id" SERIAL PRIMARY KEY,
--     "username" VARCHAR (80) UNIQUE NOT NULL,
--     "password" VARCHAR (1000) NOT NULL,
--     "access_level" INT DEFAULT 0
-- );

-- CREATE TABLE "pets" (
--     "id" SERIAL PRIMARY KEY,
--     "name" VARCHAR(80) NOT NULL,
--     "user_id" INT REFERENCES "user"
-- );

-- For the solo project
CREATE TABLE "user" (
	"id" SERIAL PRIMARY KEY,
	"username" VARCHAR(100) NOT NULL,
	"password" VARCHAR(100) NOT NULL,
	"image_url" text,
	"admin" boolean
);

SELECT * FROM "user";

CREATE TABLE "cooks" (
	"cook_id" SERIAL PRIMARY KEY,
	"user_id"  int NOT NULL REFERENCES "user",
	"cook_name" VARCHAR(500) NOT NULL,
	"date" date,
	"location" VARCHAR(100),
	"recipe_notes" VARCHAR,
	"cook_status" VARCHAR
);

CREATE TABLE "cooks_uploads" (
	"cook_id" int REFERENCES "cooks",
	"upload_id" int REFERENCES "uploads"
	);

CREATE TABLE "uploads" (
	"id" SERIAL PRIMARY KEY,
	"image_url" text,
	"cook_id" int NOT NULL 
);

CREATE TABLE "comments" (
	"comment_id" SERIAL PRIMARY KEY,
	"post_id" int REFERENCES "cooks",
	"user_id" int REFERENCES "user",
	"comment_text" VARCHAR
);

CREATE TABLE "cookLikes" (
	"like_id" SERIAL PRIMARY KEY,
	"post_id" int NOT NULL REFERENCES "cooks",
	"user_id" int NOT NULL REFERENCES "user"
);

-- ALTER TABLE "Users" ADD CONSTRAINT "Users_fk0" FOREIGN KEY ("user_id") REFERENCES "cooks"("user_id");
-- ALTER TABLE "Cooks" ADD CONSTRAINT "Cooks_fk0" FOREIGN KEY ("cook_id") REFERENCES "images"("post_id");

-- ALTER TABLE "Cooks" ADD CONSTRAINT "Cooks_fk7" FOREIGN KEY ("image_id") REFERENCES "uploads"("image_id");
-- ALTER TABLE "uploads" ADD CONSTRAINT "uploads_fk2" FOREIGN KEY ("cook_id") REFERENCES "Cooks"("cook_id");

