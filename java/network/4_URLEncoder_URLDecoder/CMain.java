import java.net.*;

class CMain {
    public static void main(String [] args) {
	String str = "http://www.monadresse.fr?champ1=un espace&champ2=accentuéèàçêôî";
	System.out.println(str);
	
	String strEncode = URLEncoder.encode(str);
	System.out.println(strEncode);

	String strDecode = URLDecoder.decode(strEncode);
	System.out.println(strDecode);
    }
}
