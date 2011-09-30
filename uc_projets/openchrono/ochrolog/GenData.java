class Data {
    Data() {
	
    }

    void set(double _t, double _RPM, double _V, double _Ax, double _Ay) {
	t = _t;
	RPM = _RPM;
	V = _V;
	Ax = _Ax;
	Ay = _Ay;
    }
 
    public double t = 0;
    public double RPM = 0;
    public double V = 0;
    public double Ax = 0;
    public double Ay = 0;

    final String DATA_SEP = " "; //",";

    void print() {
	System.out.println( t + DATA_SEP +
			    RPM + DATA_SEP +
			    V + DATA_SEP +
			    Ax + DATA_SEP +
			    Ay //+ DATA_SEP
			    );
    }
}

class Data_Calc {
    Data_Calc() {
	
    }
 
    public double t = 0;
    public double RPM = 0;
    public double V = 0;
    public double Ax = 0;
    public double Ay = 0;

    public double Vx = 0;
    public double Vy = 0;
    public double x = 0;
    public double y = 0;

    final String DATA_SEP = " "; //",";

    void copy_data(Data dat) {
	t = dat.t;
	RPM = dat.RPM;
	V = dat.V;
	Ax = dat.Ax;
	Ay = dat.Ay;
    }

    void print() {
	System.out.println( t + DATA_SEP +
			    RPM + DATA_SEP +
			    V + DATA_SEP +
			    Ax + DATA_SEP +
			    Ay //+ DATA_SEP
			    );
    }
}

class GenData {
    private static double RPM(double t) { // vitesse calculee
	//return 0.0;
	if (t<5.0) {
	    return 2000.0 * t;
	} else {
	    return 10000.0;
	}
    }

    private static double V(double t) { // vitesse mesuree (roue)
	//return 0.0;
	//return 60.0;
	return RPM(t)*0.01;
    }

    private static double Ax(double t) { // acceleration laterale
	return 0.0;
    }

    private static double Ay(double t) { // acceleration longitudinale
	if (t<5.0) {
	    return 1.3*9.81;
	} else {
	    return 0.0;
	}
    }    

    public static void main (String[] args){
	//System.out.println("Generating data");

	double delta_t = 0.1;
	double t = 0.0;
	final double t_max = 10.0;

	Data data = new Data();

	//Data datas[;
	
	while( t < t_max ) {
	    t += delta_t;
	    data.set(t, RPM(t), V(t), Ax(t), Ay(t));
	    data.print();
	}
    }   
}