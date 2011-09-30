#include "ex.h"

using namespace std;

ex::ex(double d) {ptr = new flottant(d); ref_count=new int(1);}

ex::ex(int i) { ptr = new entier(i); ref_count=new int(1);}

ex::ex() { ptr=new entier(0); ref_count=new int(1); }

// -1 est utilise car tous les symbole de meme nom doivent pointer
// sur le meme symbole pour pouvoir etre evalues
ex::ex(const string & s){ 
  ptr=new symbole(s); ref_count=new int(-1); 
}

// Ici on doit utiliser l'adresse de s pour ptr, sinon on aura plusieurs
// symbole ayant le meme nom
ex::ex(const symbole & s){ 
  ptr=(object *) &s; ref_count=new int(-1); 
}

ex::ex(const algebrique & s){ ptr=new algebrique(s); ref_count=new int(1); }

ex::ex(const vecteur & v) { ptr=new vecteur(v); ref_count=new int(1);}

ex::ex(const ex & e) { 
  ptr=e.ptr; 
  ref_count=e.ref_count; 
  if (*ref_count!=-1)
    ++(*ref_count); 
}

ex::~ex() { 
  if (*ref_count!=-1)
    --(*ref_count); 
  if (!(*ref_count)){ delete ptr; delete ref_count; }
}

ex & ex::operator = (const ex & e) {
  if (*ref_count!=-1)
    --(*ref_count); 
  if (!(*ref_count)){ delete ptr; delete ref_count; }
  ref_count=e.ref_count;
  if (*ref_count!=-1)
    ++(*ref_count);
  ptr=e.ptr;
  return *this;
}

ex operator +(const ex & a,const ex & b) {
  return (*a.ptr)+b;
}

ex ex::eval() const { 
  return ptr->eval(); 
}

void ex::dbgprint() const {
  std::cerr << *this; 
}

ex symb_sum(const ex & a,const ex & b){
  vecteur V(2);
  V.v[0]=a;
  V.v[1]=b;
  return algebrique(sum,"+",V);
}

ex symb_sin(const ex & e){
  return algebrique(sin,"sin",e);
}

ex sin(const ex & e){
  return e.ptr->sin();
}

ex flottant::operator +(const ex & e) const{
  if (flottant * f=dynamic_cast<flottant *>(e.ptr)){
    return d+f->d;
  }
  if (entier * f=dynamic_cast<entier *>(e.ptr)){
    return d+f->d;
  }
  return symb_sum(d,e);
}

ex entier::operator +(const ex & e) const{
  if (entier * f=dynamic_cast<entier *>(e.ptr)){
    return d+f->d;
  }
  if (flottant * f=dynamic_cast<flottant *>(e.ptr)){
    return d+f->d;
  }
  return symb_sum(e,d);
}

std::ostream & operator << (std::ostream & o,const ex &e){
  e.ptr->print(o);
  return o;
}

ex sum(const ex & e){
  if (vecteur * f=dynamic_cast<vecteur *>(e.ptr)){
    ex res;
    vector<ex>::const_iterator it=f->v.begin(),itend=f->v.end();
    for (;it!=itend;++it)
      res=res+(*it);
    return res;
  }
}

ex symbole::operator +(const ex & e) const{
  return symb_sum(*this,e);
}

ex vecteur::operator +(const ex & e) const {
  return 0;
}

ex vecteur::eval() const {
  std::vector<ex> w(v);
  std::vector<ex>::iterator it=w.begin(),itend=w.end();
  for (;it!=itend;++it)
    *it=it->eval();
  return vecteur(w);
}

ex algebrique::operator +(const ex & e) const {
  return symb_sum(*this,e);
}

/*
int main(){
  ex f(1.5),g(0),h(1);
  cout << f.ptr->is_zero() << " " << g.ptr->is_zero() << " " << h.ptr->is_zero() << endl;
  h=f+g;
}
*/
