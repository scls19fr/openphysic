#include <iostream>

using namespace std;

int main(void)
{
  const int i_min = 0;
  const int i_max = 255;

  for (int i = i_min ; i<=i_max ; ++i)
    {
      cout << i << "\t" << (char) i << endl;
    }

  return EXIT_SUCCESS;
}
