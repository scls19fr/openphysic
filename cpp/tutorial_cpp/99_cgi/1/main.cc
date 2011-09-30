// GNU cgicc (libcgicc)

#include <iostream>
#include <vector>
#include <string>

#include "cgicc/Cgicc.h"
#include "cgicc/HTTPHTMLHeader.h"
#include "cgicc/HTMLClasses.h"

using namespace std;
using namespace cgicc;

int main(int argc, char **argv)
{
   try {
      Cgicc cgi;

      // Send HTTP header
      cout << HTTPHTMLHeader() << endl;

      // Set up the HTML document
      cout << html() << head(title("Cgicc example")) << endl;
      cout << body() << endl;

      cout << "<h1>Hello CGI with GNU cgicc</h1>" << endl;

      // Print out the submitted element
      form_iterator name = cgi.getElement("name");
      if(name != cgi.getElements().end()) {
         cout << "Your name: " << **name << endl;
      }

      // Close the HTML document
      cout << body() << html();
   }
   catch(exception& e) {
      // handle any errors - omitted for brevity
   }
}
