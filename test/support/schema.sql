SET client_min_messages = warning;

DROP TABLE IF EXISTS "Posts_intermediate" CASCADE;
DROP TABLE IF EXISTS "Posts" CASCADE;
DROP TABLE IF EXISTS "Posts_retired" CASCADE;
DROP FUNCTION IF EXISTS "Posts_insert_trigger"();
DROP TABLE IF EXISTS "Users" CASCADE;

CREATE TABLE "Users" (
  "Id" SERIAL PRIMARY KEY
);

CREATE TABLE "Posts" (
  "Id" SERIAL PRIMARY KEY,
  "UserId" INTEGER,
  "createdAt" timestamp,
  "createdAtTz" timestamptz,
  "createdOn" date,
  CONSTRAINT "foreign_key_1" FOREIGN KEY ("UserId") REFERENCES "Users"("Id")
);

CREATE INDEX ON "Posts" ("createdAt");

INSERT INTO "Posts" ("createdAt", "createdAtTz", "createdOn") SELECT NOW(), NOW(), NOW() FROM generate_series(1, 10000) n;
