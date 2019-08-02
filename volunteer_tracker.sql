CREATE TABLE "projects" (
	"id" serial NOT NULL,
	"title" varchar(255) NOT NULL,
	CONSTRAINT "projects_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "volunteers" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"project_id" serial(255) NOT NULL,
	CONSTRAINT "volunteers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "volunteers" ADD CONSTRAINT "volunteers_fk0" FOREIGN KEY ("project_id") REFERENCES "projects"("id");

