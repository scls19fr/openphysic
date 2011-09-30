#ifndef SIGNAL_H
#define SIGNAL_H

class Signal {
public:
  Signal(void);
  //Signal(double a0);
  ~Signal(void);

  double get_a0() const;
  double get_f1() const;
  double get_a1() const;
  double get_amplitude(int n) const;
  double get_phase(int n) const;

  void set_a0(double const a0);
  void set_f1(double const f1);
  void set_a1(double const a1);
  void set_amplitude(int const n, double const amplitude);
  void set_phase(int const n, double const phase);

  double get_value(double const time);
  
  void Test_Signal(void);
  void Test_value(void);

private:
  static const int N = 11; // Nb max d'harmoniques = N - 1

  double m_a0;
  double m_f1;
  double m_a1;

  double m_a[N];  // amplitude des harmoniques
  double m_ph[N]; // phase des harmoniques


};

#endif
