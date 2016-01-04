# VOC_Annotation
This is a VOC-like Database Annotation Program.

### Introduction
**VOC_Annotation** is a Matlab-based Program which is used to make annotations for PASCAL VOC-like database, such as the database built by ourselves.

This program is designed and written by 5HU W@N9 in Dec 2015.

### License
VOC_Annotation is released under the GPL v2 License (refer to the LICENSE file for details).

### Contents
1. [File Structure](#File Structure)
2. [Requirements](#requirements)
3. [Program List](#Program List)
4. [Usage](#Usage)

### File Structure
   1. JPEGImages - This folder is used to store the original images which are saved as JPEG format.
   2. Annotations - This folder is used to store the annotation files of original images which are saved as .xml format.
   3. GTImages - This folder is used to store the ground truth images that make the annotation files visiable.
   4. ImageSet - This folder is used to store the image list file specifying which images are used in the training process.
   5. Segmentation - This folder is used to store the segmentation images which are segmented from the original images.
   6. SelectiveSearchData - This folder is used to store the selective search results of original images.
   7. Program - This folder is used to store all program files, and you can see the [Program List](#Program List) for more details.
   
**Note** The Database only contains *JPEGImages/*, *Annotations/*, *ImageSet/* and *SelectiveSearchData/*.

### Requirements
   1. Matlab R2014a or higher version
   2. g++ (optional for part of programs)
   3. OpenCV 3.0+ (optional for part of programs)
   4. gtk-config (optional for part of programs)

### Program List
   1. preproc.cpp - used to convert the original video into the dividual video frames which are saved in *_cache/*.
   2. preproc.m - used to pre-process the video frames into the original images saved in *JPEGImages/* such as cut, resize.
   3. demo.m - used to make annotations for original images, generating the .xml files, GT images and Segmentation images.
   4. makelist.m - aim to make a train image list which is saved in *ImageSet/Main/*.
   5. demo_proposals.m - used to make proposals for original images which will saved in *SelectiveSearchData/*.

### Usage
   1. preproc.cpp
   
   Type the following command to compile preproc.cpp :
   ``` Shell
   $ sudo chmod a+x compile.sh
   $ ./compile.sh 
   ```
   This command will make the folder *_cache/* and generate the executable file *preproc*.
   
   Execute the preproc program to convert the video into dividual video frames
   ``` Shell
   $ ./preproc PATH_TO_THE_VIDEO
   ```
   
   2. preproc.m
   
   Open Matlab R2014a and run this file.
   ``` Shell
   $ matlab -nodesktop -nosplash
   >> preproc
   ```
   Once you finish running this program, you can delete the _cache folder safely.
   ``` Shell
   $ rm -r _cache
   ```
   
   3. demo.m
   
   This part of illustration is written in Program/README.txt which is written by Chinese language.
   
   You can check this file and see what you should do in details.

   4. makelist.m
   
   5. demo_proposals.m
