all: learner tester AnomalyDetection

clean:
	chmod +x clean.sh
	./clean.sh

learner: code/learner.cpp
	g++ -o learner code/learner.cpp -O2 -I/usr/include/opencv -I/usr/local/include/opencv -L/usr/lib -L/usr/local/lib -larmadillo -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video

tester: code/tester.cpp
	g++ -o tester code/tester.cpp -O2 -I/usr/include/opencv -I/usr/local/include/opencv -L/usr/lib -L/usr/local/lib -larmadillo -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video

AnomalyDetection: code/main.cpp code/ParameterInfo.cpp code/DisplayImage.cpp code/AnomalyDetection.cpp
	g++ -o AnomalyDetection code/main.cpp code/ParameterInfo.cpp code/DisplayImage.cpp code/AnomalyDetection.cpp -O2 -I/usr/include/opencv -I/usr/local/include/opencv -L/usr/lib -L/usr/local/lib -larmadillo -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video

