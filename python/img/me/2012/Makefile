all:
	$(MAKE) clean
	python static_img.py
	python animate.py
	convert -delay 10 -loop 0 temp/temp_*.png animated.gif # ImageMagick

.PHONY: clean

clean:
	$(RM) temp/temp_*.png
	$(RM) animated.gif