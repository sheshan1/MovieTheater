// Not woking nned to test

const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function main() {
    const createMovie = await prisma.movie.create({
        data: [{
            title: 'Inception',
            rating: 8.8,
            releasedDate: new Date('2023-07-16'),
            showsUntil: new Date('2023-10-16'),
            runTime: "2:10",
            actors: {
                create: [
                    {
                        actor: {
                            create: [
                            {
                                firstName: 'Leonardo',
                                lastName: 'DiCaprio',
                            },
                            {
                                firstName: 'Ellen',
                                lastName: 'Page',
                            }
                        ]
                        }
                    }
                ]
            },
            schedules: {
                create: [
                    {
                        schedule: {
                            create: [
                            {
                                date: new Date('2023-07-16'),
                                time: "10:30",
                                hall: "ONE",
                            },
                            {
                                date: new Date('2023-08-16'),
                                time: "10:00",
                                hall: "TWO",
                            },
                            {
                                date: new Date('2023-09-16'),
                                time: "13:40",
                                hall: "THREE",
                            },
                            {
                                date: new Date('2023-07-18'),
                                time: "17:10",
                                hall: "THREE",
                            }
                        ]
                        },
                    }
                ]
            }
        },
        {
            title: 'Oppenhiemer',
            rating: 7.9,
            releasedDate: new Date('2023-10-12'),
            showsUntil: new Date('2023-12-14'),
            runTime: "2:20",
            actors: {
                create: [
                    {
                        actor: {
                            create: [
                            {
                                firstName: 'Killian',
                                lastName: 'Murphy',
                            },
                            {
                                firstName: 'Ellen',
                                lastName: 'Page',
                            }
                        ]
                        }
                    }
                ]
            },
            schedules: {
                create: [
                    {
                        schedule: {
                            create: [
                            {
                                date: new Date('2023-07-16'),
                                time: "10:30",
                                hall: "Three",
                            },
                            {
                                date: new Date('2023-08-16'),
                                time: "10:00",
                                hall: "TWO",
                            },
                            {
                                date: new Date('2023-11-14'),
                                time: "13:40",
                                hall: "ONE",
                            },
                            {
                                date: new Date('2023-12-01'),
                                time: "17:10",
                                hall: "TWO",
                            }
                        ]
                        },
                    }
                ]
            }
        }]
    })
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })