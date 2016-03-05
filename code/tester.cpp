#include"inc.h"
#include"main.h"

int main(int argc, char** argv){
  cv::VideoCapture cap(0);
  cv::BackgroundSubtractorMOG2 bg = cv::BackgroundSubtractorMOG2();
  int i = 0;

  cv::Mat lixo;
  cv::Mat luxo;

  cap >> lixo;

  bg(lixo, luxo, 0.0001); //removes background

  cap >> lixo;
    cv::cvtColor(lixo, lixo, CV_BGR2GRAY);
  bg(lixo, luxo, 0.0001); //removes background
  //gather the input images and their foreground masks
  while(i < 300){
    cv::Mat image, bw; //frame to be saved
    cap >> image;
    cv::resize(image, image, cv::Size(238, 158), 0, 0, CV_INTER_CUBIC);

    cv::Mat frame = image.clone(); //frame to be modified and obtain foreground mask

    cv::cvtColor(image, bw, CV_RGB2GRAY);
    cv::cvtColor(frame, frame, CV_RGB2GRAY);
	  
    cv::blur(frame, frame, cv::Size(5,5));
	  
    cv::Mat morphologicalKernel= cv::getStructuringElement(cv::MORPH_RECT,
							   cv::Size(7,7),
							   cv::Point(3,3));

    cv::dilate(frame, frame, morphologicalKernel);
    cv::erode(frame, frame, morphologicalKernel);

    cv::erode(frame, frame, morphologicalKernel);
    cv::dilate(frame, frame, morphologicalKernel);

    cv::Mat foreground; //foreground mask
    bg(frame, foreground, 0.0001); //removes background

    cv::threshold(foreground, foreground, 125, 255, CV_THRESH_BINARY); //gets foreground mask
	  
    //saves image
    char filename[64];
    sprintf(filename, "input/test/img/%03d.tif", i);
    imwrite(filename, bw); //writes image to file

    char maskname[64];
    sprintf(maskname, "input/test/mask/%03d.png", i);
    imwrite(maskname, foreground);
    
    if(i % 10 == 0) cout << i << "\n";  
    i++;

    imshow("Feed", image);
  }
}
