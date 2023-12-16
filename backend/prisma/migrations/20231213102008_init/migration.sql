-- CreateEnum
CREATE TYPE "Hall" AS ENUM ('ONE', 'TWO', 'THREE');

-- CreateTable
CREATE TABLE "Movie" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "releasedDate" TIMESTAMP(3) NOT NULL,
    "showsUntil" TIMESTAMP(3) NOT NULL,
    "runTime" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Movie_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Actor" (
    "id" SERIAL NOT NULL,
    "firstName" VARCHAR(255) NOT NULL,
    "lastName" VARCHAR(255) NOT NULL,

    CONSTRAINT "Actor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MovieActors" (
    "movieId" INTEGER NOT NULL,
    "actorId" INTEGER NOT NULL,

    CONSTRAINT "MovieActors_pkey" PRIMARY KEY ("movieId","actorId")
);

-- CreateTable
CREATE TABLE "Shedule" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "time" TIMESTAMP(3) NOT NULL,
    "hall" "Hall" NOT NULL,

    CONSTRAINT "Shedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MovieSchedule" (
    "movieId" INTEGER NOT NULL,
    "scheduleId" INTEGER NOT NULL,

    CONSTRAINT "MovieSchedule_pkey" PRIMARY KEY ("movieId","scheduleId")
);

-- AddForeignKey
ALTER TABLE "MovieActors" ADD CONSTRAINT "MovieActors_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieActors" ADD CONSTRAINT "MovieActors_actorId_fkey" FOREIGN KEY ("actorId") REFERENCES "Actor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieSchedule" ADD CONSTRAINT "MovieSchedule_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovieSchedule" ADD CONSTRAINT "MovieSchedule_scheduleId_fkey" FOREIGN KEY ("scheduleId") REFERENCES "Shedule"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
