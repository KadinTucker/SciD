module scid.Datum;

/**
 * A piece of data
 * Includes uncertainty and allows for error propogation
 */
class Datum(T) {

    private T value; ///The value of the datum
    private T uncertainty; ///The uncertainty, +/-, of the datum; always a positive value

    alias value this;

    /**
     * Returns the uncertainty of the datum
     */
    @property T error() {
        return this.uncertainty;
    }

    /**
     * Constructs a datum with value and uncertainty
     */
    this(T value, T uncertainty) {
        this.value = value;
        this.uncertainty = uncertainty;
    }

    /**
     * Adds a datum to this one
     */
    Datum!T add(Datum!T other) {
        return new Datum!T(this.value + other.value, this.error + other.error);
    }

    /**
     * Subtracts a datum from this one
     */
    Datum!T subtract(Datum!T other) {
        return new Datum!T(this.value - other.value, this.error + other.error);
    }

    /**
     * Multiplies two data
     */
    Datum!T multiply(Datum!T other) {
        return new Datum!T(this.value * other.value, (this.error / this.value + other.error / other.value) * (this.value * other.value));
    }

    /**
     * Divides this datum by another
     */
    Datum!T divide(Datum!T other) {
        return new Datum!T(this.value / other.value, (this.error / this.value + other.error / other.value) * (this.value / other.value));
    }

}