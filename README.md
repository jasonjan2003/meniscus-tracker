# meniscus-tracker

A MATLAB program to track menisci for the UW-Madison FESA Lab.

* * *

## Credits.

##### Engineers:
  - Prof. Arganthael Berson
  - Katy Jinkins

##### Developers:

 - Jason Jan (__[@jasonjan2005](http://twitter.com/jasonjan2005)__)
 
## Docs.

##### File Preparation
  - All the images should be in the same folder, named in the format
    
    `[prefix][index(0000 to 9999)].[extension]` ex. `someImage_0001.tiff`
  
  - The less surface scratches the better. 
  - The closer to parallel the slide is to the camera sensor, the better the results.
  - The straw supplying the solvent should be barely visible on the image.

##### Image Processing
  - The process is mostly automated. 
  - Select the folder in which the images are in.
  - Specify the file format as prompted on the GUI.
  - Load. The program will verify the images.
    - If all the images are verified, select the crop of the image in which the menisci are present.
    - If an error occurs, check the settings in the previous step.
  - Then, adjust the contrast either by the sliders on the histogram, or numeric inputs. Optionally, select the `Smoothing Range from center(%)` if the sides of the cropped image seems noisy.
  - Press `Preview` to show the fitness of the parameters. Repeat until the program correctly detects the menisci. Make sure this is true for most images in the data set by selecting the drop down menu on the bottom left corner.
  - When the desired parameters are set, `Process all images`. 

##### Data Processing
  - A graph displaying the menisci position at each frame will be shown on the right. 
  - If the substrate was lifted, and the corrected position is desired, enter the lift rate and fps. Enter the pixel size if known, otherwise, your will prompted through the process of finding the pixel size.
  - `Replot` to display the new graph.

##### Saving Results
  - At any point after processing all the images, the resulting data can be saved. The saved file and be loaded in the future to load in all the result to the user interface. The graph can also be saved in `.tiff` form.
  
