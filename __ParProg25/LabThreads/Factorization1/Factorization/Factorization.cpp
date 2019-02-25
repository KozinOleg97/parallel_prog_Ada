#include <iostream>
#include <vector>
#include <windows.h>

using namespace std;

#define NUM_NUMBERS 100000
#define NUM_THREADS 2

vector<int> divisors[NUM_NUMBERS+1];

DWORD WINAPI factorization1(LPVOID);
DWORD WINAPI factorization2(LPVOID);
DWORD WINAPI factorization3(LPVOID);

void main()
{
  HANDLE tHandle[NUM_THREADS];
  int    tNum[NUM_THREADS];

  // creation of threads
  for (int i=0; i<NUM_THREADS; i++)
  {
    tNum[i] = i;
    tHandle[i] = CreateThread(NULL, 0, factorization1, &tNum[i], 0, NULL);
  }

  // waiting
  WaitForMultipleObjects(NUM_THREADS, tHandle, TRUE, INFINITE);

  // check-up
  for (int i=0; i<10; i++)
  {
    int randomIdx = 1 + rand()%NUM_NUMBERS;
    cout << randomIdx << ":\t";
    for (int j=0; j< static_cast<int>(divisors[randomIdx].size());j++)
    {
      cout << divisors[randomIdx][j] << "\t";
    }
    cout << endl;
  }
}

DWORD WINAPI factorization1(LPVOID pArg) 
{
  int tid = *(int*)pArg;
  int start, end;

  start = (NUM_NUMBERS / NUM_THREADS) * tid + 1;
  end   = (NUM_NUMBERS / NUM_THREADS) * (tid+1) + 1;

  for (int i=start; i<end; i++)
  {
    int number = i;
    int idx = number;

    for (int j=2; j<NUM_NUMBERS+1; j++)
    {
      if (number == 1) break; 

      int q, r;

      q = number / j;
      r = number % j;

      if (r == 0)
      {
        number /= j;
        divisors[idx].push_back(j);
        j--;
      }
    }    
  }

  return 0;
}

DWORD WINAPI factorization2(LPVOID pArg)
{
  int tid = *(int*)pArg;

  for (int i=0; i<NUM_NUMBERS/NUM_THREADS; i++)
  {
    int number = i*NUM_THREADS + tid + 1;
    int idx = number;

    for (int j=2; j<NUM_NUMBERS+1; j++)
    {
      if (number == 1) break; 

      int q, r;

      q = number / j;
      r = number % j;

      if (r == 0)
      {
        divisors[idx].push_back(j);
        number /= j;
        j--;
      }
    }    
  }

  return 0;
}

#define GRAIN_SIZE  1000

DWORD WINAPI factorization3(LPVOID pArg)
{
  int tid = *(int*)pArg;

  int numberOfGrains = NUM_NUMBERS/NUM_THREADS/GRAIN_SIZE;
  int begin, end;

  int number;
  int q, r;

  for (int g = 0; g < numberOfGrains; g++)
  {
    begin = (NUM_THREADS*g + tid)*GRAIN_SIZE + 1;
    end   = (NUM_THREADS*g + tid + 1)*GRAIN_SIZE + 1;
    for (int i = begin; i < end; i++)
    {
      number = i;
      int idx = number;

      for (int j = 2; j < NUM_NUMBERS+1; j++)
      {
        if (number == 1) break;

        q = number / j;
        r = number % j;

        if (r == 0)
        {
          divisors[idx].push_back(j);
          number /= j;
          j--;
        }
      }
    }
  }

  return 0;
}