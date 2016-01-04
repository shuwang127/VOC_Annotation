#include <iostream>
#include <stdlib.h> 
#include <string>
#include <highgui.h>
#include <cv.h>

using namespace std;
using namespace cv;

int main(int argc, char **argv)
{
	CvCapture* g_capture = cvCreateFileCapture(argv[1]);  

	int i = 0;
	char savepath[] = "../_cache/000000.jpg";
	while(1)
	{
		IplImage* frame = cvQueryFrame(g_capture);  
		if(!frame) 
			break;  

		int num = ++i;		
		int p = 0;
		for (int j=0; j<6; j++)
		{
			p = num % 10;
			num /= 10;
			savepath[15-j] = p + 48;
		}		
		if (0 == i % 5)
		{
			cvSaveImage(savepath, frame);
		}
	}

	return 0;
}
