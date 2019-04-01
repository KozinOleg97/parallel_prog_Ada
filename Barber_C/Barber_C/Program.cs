using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Barber_C
{
    class Program
    {
        public static int clientsInTheHall = 0;
        public static bool mutex = true; // resource
        public static int[] chairs;
        public static int chairsCount;
        public static int clientsQ;
        public static Random rnd = new Random();

        static void Main(string[] args)
        {
            Console.WriteLine("Queue length?");
            chairsCount = int.Parse(Console.ReadLine());
            chairs = new int[chairsCount + 1];
            for (int i = 0; i < chairsCount + 1; i++)
            {
                chairs[i] = -1;
            }

            clientsQ = -1;

            Thread HC = new Thread(Work)
            {
                Name = "Barber"
            };
            HC.Start();

            if (clientsQ == -1)
            {
                while (true)
                {
                    for (int i = 0; i < 100; i++) // index 
                    {
                        Thread C = new Thread(NeedHaircut)
                        {
                            Name = i.ToString()
                        };
                        C.Start();
                        Thread.Sleep(rnd.Next(5, 200));
                    }
                }
            }
        }

        public static void Work()
        {
            while (true)
            {
                while (CanISleep())
                {
                    Console.Write("\rBarber is sleeping");
                }
                Console.WriteLine("Barber got up");
                Console.WriteLine("Barber is working with client #{0} now", chairs[0]);
                Thread.Sleep(rnd.Next(100, 1000));
                while (!(mutex)) ; // mutex
                mutex = false;
                chairs[0] = -1;
                MoveQueque();
                clientsInTheHall--;
                mutex = true;
                Console.WriteLine("Barber finished");
            }
        }

        public static void NeedHaircut()
        {
            while (!(mutex)) ; // mutex
            mutex = false;
            Console.WriteLine("\nClient {0} come to hall ", Thread.CurrentThread.Name);
            if (clientsInTheHall == chairsCount)
            {
                Console.WriteLine("Client {0} went away", Thread.CurrentThread.Name);
            }
            else
            {
                for (int i = 0; i < chairsCount; i++)
                {
                    if (chairs[i] == -1)
                    {
                        chairs[i] = int.Parse(Thread.CurrentThread.Name);
                                        Console.WriteLine("Client {0} is waiting on the place #{1}", Thread.CurrentThread.Name, i);
                        break;
                    }
                }
                clientsInTheHall++;
            }
            mutex = true;
        }

        public static bool CanISleep()
        {
            while (!(mutex)) ;
            mutex = false;
            bool a = clientsInTheHall == 0; // Is someone waiting?
            mutex = true;
            return a;
        }

        public static void MoveQueque()
        {
            for (int i = 0; i < chairsCount; i++)
            {
                chairs[i] = chairs[i + 1];
            }
        }
    }
}