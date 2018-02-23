module scid.data.Unit;

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
    GRAM = 'g',
    METER = 'm',
    LITER = 'L',
    SECOND = 's',
    NEWTON = 'N',
    JOULE = 'J',
    WATT = 'W',
    KELVIN = 'K',
    COULOMB = 'C',
    VOLT = 'V',
    AMPERE = 'A',
    OHM = 'O'
}

struct Unit {

    char name; ///A character representing this unit
    UnitPrefix magnitude; ///The prefix which determines the unit's magnitude
    int power; ///The multiplicity of the unit

}