all: clean learner tester AnomalyDetection

clean:
	rm -f AnomalyDetection
	rm -f learner
	rm -f tester
#	chmod +x clean.sh
#	./clean.sh

learner:
	g++ -o learner code/learner.cpp -O2 -I/usr/include/opencv -I/usr/local/include/opencv -L/usr/lib -L/usr/local/lib -larmadillo -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video

tester:
	g++ -o tester code/tester.cpp -O2 -I/usr/include/opencv -I/usr/local/include/opencv -L/usr/lib -L/usr/local/lib -larmadillo -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video

AnomalyDetection:
	g++ -o AnomalyDetection code/main.cpp code/ParameterInfo.cpp code/DisplayImage.cpp code/AnomalyDetection.cpp -O2 -I/usr/include/opencv -I/usr/local/include/opencv -L/usr/lib -L/usr/local/lib -larmadillo -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video

