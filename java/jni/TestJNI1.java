class TestJNI1 {
    public native void afficherBonjour();
    static {
	System.loadLibrary("mabibjni");
    }
    
    public static void main(String[] args) {
	new TestJNI1().afficherBonjour();
    }
}