all:
	javac TestJNI1.java
	javah -jni TestJNI1
	gcc TestJNI.c -c -I/Developer/SDKs/MacOSX10.4u.sdk/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Headers/
	#gcc -c -I”C:\j2sdk1.4.2_02\include” -I”C:\j2sdk1.4.2_02\include\win32” -o TestJNI.o TestJNI.c
	gcc -shared -o mabibjni.dll TestJNI.c TestJNI.def
	java TestJNI1

clean:
	$(RM) *~ *.class TestJNI1.h *.o

# http://www.jmdoudoux.fr/java/dej/chap030.htm
# JNI (Java Native Interface)