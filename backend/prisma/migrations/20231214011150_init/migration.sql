/*
  Warnings:

  - You are about to drop the `Shedule` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "MovieSchedule" DROP CONSTRAINT "MovieSchedule_scheduleId_fkey";

-- DropTable
DROP TABLE "Shedule";

-- CreateTable
CREATE TABLE "Schedule" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "time" VARCHAR(255) NOT NULL,
    "hall" "Hall" NOT NULL,

    CONSTRAINT "Schedule_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MovieSchedule" ADD CONSTRAINT "MovieSchedule_scheduleId_fkey" FOREIGN KEY ("scheduleId") REFERENCES "Schedule"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
