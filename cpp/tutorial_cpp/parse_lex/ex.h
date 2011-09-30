#ifndef _EX_H
#define _EX_H
// -*- mode:C++ -*-
#include <iostream>
#include <string>
#include <vector>
#include <cmath>

class object;
class entier;
class flottant;
class vecteur;
class symbole;
class algebrique;
class ex;

std::ostream & operator << (std::ostream & o,const ex &e);

class ex {
public:
  object * ptr;
  int * ref_count; // NB -1 is used for symbol which are allocated by the lexer
  ex(double d); 
  ex(int i); 
  ex();
  ex(const std::string & s);
  ex(const vecteur & v);
  ex(const symbole & s);
  ex(const algebrique & s);
  ex(const ex & e);
  ex & operator = (const ex & e) ;
  ~ex();
  ex eval() const ;
  void dbgprint() const;
};

ex operator +(const ex & a,const ex & b) ;
ex sum(const ex & e);
ex sin(const ex & e);
ex symb_sin(const ex & e);

class object {
public:
  virtual bool is_zero() const=0;
  virtual ex operator +(const ex & e) const=0;
  virtual ex eval() const=0;
  virtual void print(std::ostream &) const =0;
  virtual ex sin() const =0;
};

class flottant:public object{
public:
  double d;
  flottant(double d0): d(d0) {};
  virtual bool is_zero() const { return d==0;}
  virtual ex operator +(const ex & e) const;
  virtual ex eval() const { return d; };
  virtual void print(std::ostream & o ) const { o << d ;}
  virtual ex sin() const { return std::sin(d); }
};

class entier:public object{
public:
  int d;
  entier(int d0): d(d0) {};
  virtual bool is_zero() const { return d==0;}
  virtual ex operator +(const ex & e) const;
  virtual ex eval() const { return d; };
  virtual void print(std::ostream & o ) const { o << d ;}
  virtual ex sin() const { return std::sin(double(d)); }
};

class symbole:public object {
public:
  std::string name;
  ex * value;
  symbole(const std::string & s): name(s),value(0) {};
  virtual bool is_zero() const { if (!value) return false; return value->ptr->is_zero();}  
  virtual ex operator +(const ex & e) const;
  virtual ex eval() const { if (value) return *value; else return *this; };
  virtual void print(std::ostream & o ) const { o << name ;}
  virtual ex sin() const { return symb_sin(*this); }
};

typedef ex (*unary_f) (const ex &);

class algebrique:public object {
public:
  unary_f f;
  std::string fname;
  ex args;
  algebrique(unary_f myf,const std::string & s,const ex & myargs):f(myf),fname(s),args(myargs) {};
  virtual bool is_zero() const { return false; }
  virtual ex operator +(const ex & e) const;
  virtual ex eval() const { return f(args.eval()); };
  virtual void print(std::ostream & o ) const { 
    o << fname << "(" << args << ")";
  }
  virtual ex sin() const { return symb_sin(*this); }
};

class vecteur:public object {
public:
  std::vector<ex> v;
  vecteur(const std::vector<ex> & w):v(w){};
  vecteur(int i):v(i){};
  virtual bool is_zero() const { if (v.size()==0) return true; return false;}
  virtual ex operator +(const ex & e) const;
  virtual ex eval() const ;
  virtual ex sin() const { return symb_sin(*this); }
  virtual void print(std::ostream & o ) const { 
    std::vector<ex>::const_iterator it=v.begin(),itend=v.end();
    for (;;){
      if (it==itend)
	break;
      o << *it;
      ++it;
      if (it!=itend)
	o << ",";
    }
  }
};

#endif
