module scid.plot;

/**
 * A set of parameters on a plot which can be exported and compiled into an image
 */
abstract class Plot {

    double leftBound; ///The left bound of the scale on the plot
    double rightBound; ///The right bound of the scale on the plot
    double upperBound; ///The upper bound of the scale on the plot 
    double lowerBound; ///The lower bound of the scale on the plot

    abstract void setBounds();
    abstract void exportGraph();
    

}

/**
 * A plot consisting of various points
 */
class ScatterPlot : Plot {

    double[2] points; ///All of the points on the scatter plot

}