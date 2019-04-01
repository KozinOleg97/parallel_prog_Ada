using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Diagnostics;

namespace DiningPhilosophers
{
    class Program
    {
        private const int PHILOSOPHER_COUNT = 5;


        static void Main(string[] args)
        {

            Servant serv = new Servant();
            var philosophers = InitializePhilosophers(serv);


            Console.WriteLine("Dinner is starting!"); // Start


            var philosopherThreads = new List<Thread>();
            foreach (var philosopher in philosophers)
            {
                var philosopherThread = new Thread(new ThreadStart(philosopher.EatAll));
                philosopherThreads.Add(philosopherThread);
                philosopherThread.Start();
            }





            foreach (var thread in philosopherThreads) // finish eating
            {
                thread.Join();
            }


            Console.WriteLine("Dinner is over!");
            Console.ReadKey();
        }

        private static List<Philosopher> InitializePhilosophers(Servant serv)
        {
            var philosophers = new List<Philosopher>(PHILOSOPHER_COUNT);
            for (int i = 0; i < PHILOSOPHER_COUNT; i++)
            {
                philosophers.Add(new Philosopher(philosophers, i, serv));
            }


            foreach (var philosopher in philosophers) // Assign chopsticks to philosophers
            {
                philosopher.LeftChopstick = philosopher.LeftPhilosopher.RightChopstick ?? new Chopstick();

                philosopher.RightChopstick = philosopher.RightPhilosopher.LeftChopstick ?? new Chopstick();
            }

            return philosophers;
        }
    }


    public class Servant
    {
        public int x = 0;
        object locker = new object();

        public bool takePlace()
        {
            lock (locker)
                Console.WriteLine(x);
            {
                if (x < 4)
                {
                    x++;
                    return true;
                }
                else
                {
                    return false;
                }
            }            
        }

        public void freePlace()
        {
            x--;
        }
    }

    [DebuggerDisplay("Name = {Name}")]
    public class Philosopher
    {
        private const int TIMES_TO_EAT = 5;
        private int _timesEaten = 0;
        private readonly List<Philosopher> _allPhilosophers;
        private readonly int _index;
        private Servant _serv;
        private object locker = new object();
        public static Random rnd = new Random();

        public Philosopher(List<Philosopher> allPhilosophers, int index, Servant serv)
        {
            _serv = serv;
            _allPhilosophers = allPhilosophers;
            _index = index;
            this.Name = string.Format("Philosopher {0}", _index);
            this.State = State.Thinking;
        }

        public string Name { get; private set; }
        public State State { get; private set; }
        public Chopstick LeftChopstick { get; set; }
        public Chopstick RightChopstick { get; set; }

        public Philosopher LeftPhilosopher
        {
            get
            {
                if (_index == 0)
                    return _allPhilosophers[_allPhilosophers.Count - 1];
                else
                    return _allPhilosophers[_index - 1];
            }
        }

        public Philosopher RightPhilosopher
        {
            get
            {
                if (_index == _allPhilosophers.Count - 1)
                    return _allPhilosophers[0];
                else
                    return _allPhilosophers[_index + 1];
            }
        }

        public void EatAll()
        {
            
            while (true)//(_timesEaten < TIMES_TO_EAT)
            {
                this.Think();
                this.TakePlace();
                if (this.PickUp())
                {
                    
                    this.Eat();

                    
                    this.PutDownLeft(); // Release chopsticks
                    this.PutDownRight();

                    this.FreePlace();
                }
            }
        }

        private void FreePlace()
        {
            _serv.x--;
        }

        private void TakePlace()
        {

            _serv.takePlace();
            /*lock (locker)
                Console.WriteLine(this.Name + "  "  + _serv.x);
            {
                while ( _serv.x >= 4)
                {
                    
                }

                _serv.x++;               
            }*/
        }

        private bool PickUp()
        {
            
            if (Monitor.TryEnter(this.LeftChopstick)) // Try to pick up the left chopstick
            {
                Console.WriteLine(this.Name + " picks up left chopstick.");
                
                if (Monitor.TryEnter(this.RightChopstick)) // Try to pick up the right
                {
                    Console.WriteLine(this.Name + " picks up right chopstick.");                    
                    return true;
                }
                else
                {                    
                    this.PutDownLeft();
                }
            }

            
            return false; // Try again
        }

        private void Eat()
        {

            this.State = State.Eating;
            _timesEaten++;
            Console.WriteLine(this.Name + " eats.");
            Thread.Sleep(rnd.Next(10, 1000));
        }

        private void PutDownLeft()
        {
            Monitor.Exit(this.LeftChopstick);
            Console.WriteLine(this.Name + " puts down left chopstick.");
        }

        private void PutDownRight()
        {
            Monitor.Exit(this.RightChopstick);
            Console.WriteLine(this.Name + " puts down right chopstick.");
        }


        private void Think()
        {
            this.State = State.Thinking;
            Thread.Sleep(rnd.Next(10, 1000));
        }
    }

    public enum State
    {
        Thinking = 0,
        Eating = 1
    }

    [DebuggerDisplay("Name = {Name}")]
    public class Chopstick
    {
        private static int _count = 1;
        public string Name { get; private set; }

        public Chopstick()
        {
            this.Name = "Chopstick " + _count++;
        }
    }
}