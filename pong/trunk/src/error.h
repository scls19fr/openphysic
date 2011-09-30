#ifndef ERROR_HPP
#define ERROR_HPP

#include <iostream>
namespace Error{
  struct error{
    const char* p;
    error(const char* q)
    {
      p = q;
      std::cerr << q << std::endl;
    }
  };
}

#endif
