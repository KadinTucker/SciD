module scid.Datum;

import std.algorithm;

import scid.data.Unit;

/**
 * A piece of data
 * Includes uncertainty and allows for error propogation
 * TODO: Implement operator overloads
 */
class Datum(T) {

    private T value; ///The value of the datum
    private T uncertainty; ///The uncertainty, +/-, of the datum; always a positive value
    private Unit[UnitType] units; ///The units of this datum, multiplied together

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
    this(T value, T uncertainty=0, Unit[char] units=null) {
        this.value = value;
        this.uncertainty = uncertainty;
        this.units = units;
    }

    void addUnit(Unit unit) {
        if(!units.keys.canFind(unit.name)) {
            units[unit.name] = Unit(unit.name, unit.magnitude, unit.power);
        } else {
            units[unit.name].power += unit.power;
        }
    }

    /**
     * Adds a datum to this one
     * Fails if the data have differing units; returns this
     */
    Datum!T add(Datum!T other) {
        if(this.units != other.units) {
            return this;
        }
        return new Datum!T(this.value + other.value, this.error + other.error);
    }

    /**
     * Subtracts a datum from this one
     * Fails if the data have differing units
     */
    Datum!T subtract(Datum!T other) {
        if(this.units != other.units) {
            return this;
        }
        return new Datum!T(this.value - other.value, this.error + other.error);
    }

    /**
     * Multiplies two data
     */
    Datum!T multiply(Datum!T other) {
        Datum newDatum = new Datum!T(this.value * other.value, 
                (this.error / this.value + other.error / other.value) * (this.value * other.value), other.units.dup);
        foreach(unit; this.units.values) {
            newDatum.addUnit(unit);
        }
        return newDatum;
    }

    /**
     * Divides this datum by another
     */
    Datum!T divide(Datum!T other) {
        Datum newDatum = new Datum!T(this.value / other.value, 
                (this.error / this.value + other.error / other.value) * (this.value / other.value), other.units.dup);
        foreach(unit; this.units.values) {
            newDatum.addUnit(unit);
        }
        return newDatum;
    }

}