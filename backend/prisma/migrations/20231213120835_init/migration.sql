/*
  Warnings:

  - Changed the type of `runTime` on the `Movie` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Movie" DROP COLUMN "runTime",
ADD COLUMN     "runTime" TIME NOT NULL;
