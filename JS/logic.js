var length = [ "m", "dm", "cm", "mm" , "Km","in", "ft", "yard", "miles", "NM"];
var temperature = ["°C","K","°F"];
var mass = ["g","kg", "hg", "dg", "cg" , "mg", "lb", "oz"];
var time = ["'","''","ms","h","days","months","years"];

function selectArrayOfValues(id){
    switch(id){
        case "Test" : return length;
        case "Length" : return length;
        case "Temperature" : return temperature;
        case "Mass" : return mass;
        case "Time" : return time;
    }
}

function in_array(value, array) {
    for(var i = 0; i < array.length; i++) {
        if(value === array[i]) {
            return true;
        }
    }
    return false;
}

function converter(value,unit_from,unit_to){
    if(in_array(unit_from,length)){
        return converterL(value,unit_from,unit_to);
    }
    else{
        if(in_array(unit_from,temperature)){
            return converterT(value,unit_from,unit_to);
        }
        else{
            if(in_array(unit_from,mass)){
                return converterM(value,unit_from,unit_to);
            }
            else{
                return converterS(value,unit_from,unit_to);
            }
        }
    }
}

// Length
function toMeter(value,unit){
    switch(unit){
        case "Km": return value*1000;
        case "m":  return value;
        case "dm": return value/10;
        case "cm": return value/100;
        case "mm": return value/1000;
        case "in": return value*0.0254;
        case "ft": return value*0.3048;
        case "yard": return value*0.9144;
        case "miles": return value*1609.344;
        case "NM": return value*1852;
    }
}

function fromMeter(value,unit){
    switch(unit){
        case "Km": return value/1000;
        case "m":  return value;
        case "dm": return value*10;
        case "cm": return value*100;
        case "mm": return value*1000;
        case "in": return value*39.370;
        case "ft": return value*3.28084;
        case "yard": return value*1.09361;
        case "miles": return value*0.000621371;
        case "NM": return value*0.000539954;
    }
}

function converterL(value,unit_from,unit_to){
    return fromMeter(toMeter(value,unit_from),unit_to);
}

// Mass
function toG(value,unit){
    switch(unit){
        case "kg": return value*1000;
        case "hg": return value*100;
        case "g": return value;
        case "dg": return value/10;
        case "cg": return value/100;
        case "mg": return value/1000;
        case "lb": return value*453.6;
        case "oz": return value*28.35;
    }
}

function fromG(value,unit){
    switch(unit){
    case "kg": return value/1000;
    case "hg": return value/100;
    case "g": return value;
    case "dg": return value*10;
    case "cg": return value*100;
    case "mg": return value*1000;
    case "lb": return value*0.002205;
    case "oz": return value*0.0352;
    }
}

function converterM(value,unit_from,unit_to){
    return fromG(toG(value,unit_from),unit_to);
}

// Temperature
function toKelvin(value,unit){
    switch(unit){
        case "°C": return value+273.15;
        case "K": return value;
        case "°F": return (value + 459.67) / 1.8;
    }
}

function fromKelvin(value,unit){
    switch(unit) {
        case "°C": return value-273.15;
        case "K": return value;
        case "°F": return (value*1.8) - 459.67;
    }
}

function converterT(value,unit_from,unit_to){
    return fromKelvin(toKelvin(value,unit_from),unit_to);
}

// Time
function toS(value,unit){
    switch(unit){
        case "'": return value;
        case "''": return value*60;
        case "ms": return value/1000;
        case "h": return value*3600;
        case "days": return value*86400;
        case "months": return value*2629800;
        case "years": return value*31557600;
    }
}

function fromS(value,unit){
    switch(unit){
        case "'": return value;
        case "''": return value/60;
        case "ms": return value*1000;
        case "h": return value/3600;
        case "days": return value/86400;
        case "months": return value/2629800;
        case "years": return value/31557600;
    }
}

function converterS(value,unit_from,unit_to){
    return fromS(toS(value,unit_from),unit_to);
}
