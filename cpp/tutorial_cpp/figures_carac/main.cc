#include <iostream>

using namespace std;

int main(void)
{
  const int x_max = 11;
  const int y_max = 11;

  const char chr = '*';
  
  /*
***********
***********
***********
***********
***********
***********
***********
***********
***********
***********
***********
   */
  cout << "1" << endl;
  for (int i=0 ; i<y_max ; ++i)
    {
      for (int j=0 ; j<x_max ; ++j)
	{
	  cout << chr;
	}
      cout << endl;
    }
  cout << endl;



  /*
*         
**        
***
****
*****
******
*******
********
*********
**********
***********
   */
  cout << "2" << endl;
  for (int i=0 ; i<y_max ; ++i)
    {
      for (int j=0 ; j<i+1 ; ++j)
	{
	  cout << chr;
	}
      cout << endl;
    }
  cout << endl;



  /*
***********
 **********
  *********
   ********
    *******
     ******
      *****
       ****
        ***
         **
          *
   */
  cout << "3" << endl;
  for (int i=0 ; i<y_max ; ++i)
    {
      for (int j=0 ; j<x_max ; ++j)
	{
	  if (j<i)
	    {
	      cout << " ";
	    }
	  else
	    {
	      cout << chr;
	    }
	}
      cout << endl;
    }
  cout << endl;





  /*
***********
 ********* 
  *******  
   *****   
    ***
     *
   */
  cout << "4" << endl;
  for (int i=0 ; i<=y_max/2 ; ++i)
    {
      for (int j=0 ; j<x_max ; ++j)
	{
	  if (j<i || j>x_max-i-1)
	    {
	      cout << " ";
	    }
	  else
	    {
	      cout << chr;
	    }
	}
      cout << endl;
    }
  cout << endl;





  /*
     *
    ***    
   *****   
  *******  
 ********* 
***********
   */


  // TO_FIX

  /*
  cout << "5" << endl;
  for (int i=(y_max-1)/2 ; i<y_max ; ++i)
    {
      for (int j=0 ; j<x_max ; ++j)
	{
	  if (j<x_max-i || j>i)
	    {
	      cout << " ";
	    }
	  else
	    {
	      cout << chr;
	    }
	}
      cout << endl;
    }
  cout << endl;
  */


  return EXIT_SUCCESS;
}
