module scid.plot;

import derelict.sdl.sdl2;

/**
 * A set of parameters on a plot which can be exported and compiled into an image
 */
abstract class Plot {

    double leftBound; ///The left bound of the scale on the plot
    double rightBound; ///The right bound of the scale on the plot
    double upperBound; ///The upper bound of the scale on the plot 
    double lowerBound; ///The lower bound of the scale on the plot

    abstract void setBounds(); ///Sets the boundaries of the plot
    abstract void exportGraph(); ///Exports the graph to a bitmap image

}

/**
 * A plot consisting of various points
 */
class ScatterPlot : Plot {

    double[2] points; ///All of the points on the scatter plot

    /**
     * Sets the bounds according to the maximum and minimum values on the plot
     */
    override void setBounds() {
        if(this.points.length == 0){
            this.leftBound = 0;
            this.rightBound = 0;
            this.upperBound = 0;
            this.lowerBound = 0;
        } else {
            this.rightBound = this.points[0][0];
            this.leftBound = this.points[0][1];
            this.upperBound = this.points[0][0];
            this.lowerBound = this.points[0][1];
            foreach(double[2] point; this.points) {
                if(rightBound < point[0]) {
                    rightBound = point[0];
                }if(leftBound > point[0]) {
                    leftBound = point[0];
                }if(upperBound < point[1]) {
                    upperBound = point[1];
                }if(lowerBound > point[1]) {
                    lowerBound = point[1];
                }
            }
        }
    }

}