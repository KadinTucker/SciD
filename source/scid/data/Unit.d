module scid.data.Unit;

import std.algorithm;

enum UnitPrefix {
    PICO = 0.000000000001,
    NANO = 0.000000001,
    MICRO = 0.000001,
    MILLI = 0.001,
    CENTI = 0.01,
    DECI = 0.1,
    NONE = 1,
    DEKA = 10,
    HECTO = 100,
    KILO = 1000,
    MEGA = 1000000,
    GIGA = 1000000000,
    TERA = 1000000000000
}

enum UnitType {
    GRAM = "g",
    METER = "m",
    LITER = "L",
    SECOND = "s",
    NEWTON = "N",
    JOULE = "J",
    WATT = "W",
    KELVIN = "K",
    COULOMB = "C",
    VOLT = "V",
    AMPERE = "A",
    OHM = "\u03A9",
    ATMOSPHERE = "atm",
    TORR = "torr",
    MMHG = "mmHg",
    PASCAL = "Pa"
}

/**
 * A structure denoting multiplicity and magnitude of a unit
 */
struct Unit {

    UnitPrefix magnitude; ///The prefix which determines the unit's magnitude
    int power; ///The multiplicity of the unit

}

/**
 * A class that represents a set of units
 */
class UnitSet {

    Unit[UnitType] allUnits;

    void addUnit(UnitType toAdd, int amount=1) {
        if(allUnits.keys.canFind(toAdd)) {
            allUnits[toAdd].power += amount;
        } else {
            allUnits[UnitType] = Unit(UnitPrefix.NONE, amount);
        }
    }

}