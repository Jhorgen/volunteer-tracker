CREATE TABLE "projects" (
	"id" serial NOT NULL,
	"volunteer_ID" integer NOT NULL,
	"title" varchar(255) NOT NULL,
	CONSTRAINT "project_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "volunteers" (
	"id" serial NOT NULL,
	"name" serial(255) NOT NULL,
	"title" varchar(255) NOT NULL,
	CONSTRAINT "volunteer_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "project" ADD CONSTRAINT "project_fk0" FOREIGN KEY ("volunteer_ID") REFERENCES "volunteer"("id");
ALTER TABLE "project" ADD CONSTRAINT "project_fk1" FOREIGN KEY ("project_name") REFERENCES "Untitled"("project_ID");

ALTER TABLE "volunteer" ADD CONSTRAINT "volunteer_fk0" FOREIGN KEY ("project_name") REFERENCES "project"("project_name");
