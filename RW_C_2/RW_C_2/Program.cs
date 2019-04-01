using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace RW_C_2
    {
        class rwt
        {
            static int buffer;
            static int readCount = 0;
            static int writersCount = 1;
            static int readersCount = 3;
            static Thread[] writers = new Thread[writersCount];
            static Thread[] readers = new Thread[readersCount];

            
            static Semaphore readCountAccess;
            static Semaphore databaseAccess;

            static void Main(string[] args)
            {                
                readCountAccess = new Semaphore(1, 3);
                databaseAccess = new Semaphore(1, 1);

                for (int i = 0; i < writersCount; i++)
                {
                    writers[i] = new Thread(new ParameterizedThreadStart(WriterThread));
                writers[i].Priority = ThreadPriority.Lowest;
                }

                for (int i = 0; i < readersCount; i++)
                {
                    readers[i] = new Thread(new ParameterizedThreadStart(ReaderThread));
                    readers[i].Priority = ThreadPriority.Normal;
                }

                for (int i = 0; i < writersCount; i++)
                {
                    writers[i].Start(i);                    
                }

                for (int i = 0; i < readersCount; i++)
                {
                    readers[i].Start(i);
                }

                for (int i = 0; i < writersCount; i++)
                {
                    writers[i].Join();
                }

                for (int i = 0; i < readersCount; i++)
                {
                    readers[i].Join();
                }
            }

            static void WriterThread(object num)
            {
                int cnt = 0;
                Random rand = new Random();
                for (;;)
                {
                    Thread.Sleep(rand.Next(100, 2000));
                    Console.WriteLine("\tWriter {0} trying to write -----------------==={1}", num, cnt);
                    databaseAccess.WaitOne();
                    buffer = rand.Next() % 20;
                    Console.WriteLine("\tWriter {0} is writing {1}", num, buffer);
                    Thread.Sleep(rand.Next(50, 500));
                    databaseAccess.Release();
                    cnt++;
                }
            }
            static void ReaderThread(object num)
            {
                int cnt = 0;
                Random rand = new Random();
                for (;;)
                {
                    Thread.Sleep(rand.Next(90, 1000));
                    Console.WriteLine("Reader {0} trying to read" + "----------------------------------{0}--{1}", num, cnt);
                    databaseAccess.WaitOne();
                    
                    Console.WriteLine("Reader {0} is reading {1}", num, buffer);
                    Thread.Sleep(rand.Next(50, 500));
                    databaseAccess.Release();
                    cnt++;
                }
            }
        }
    }