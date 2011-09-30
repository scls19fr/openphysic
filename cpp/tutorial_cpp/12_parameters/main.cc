#include <iostream>
using namespace std;

int main(int argc, char** argv)
{
  // argument 0 : nom de l'executable
  // argument 1 : 1er argument
  // ...

  cout << "argc = " << argc << endl;

  while (--argc > 1)
    {
      cout << *(++argv) << endl;
    }

  return EXIT_SUCCESS;
}
