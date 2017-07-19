package tw.andrew;

import java.math.BigDecimal;

class Temperature {
	double tempSetPoint = 200.0; // Unit: degree C
	double tempAccuracy = 0.005;
	double tempRange = tempSetPoint * (Math.random() * tempAccuracy);
	double tempTemp;
	
	String getTemperature() {
		if ( (int)(Math.random()*2) == 1) { // Set Point + Range
			tempTemp = tempSetPoint + tempRange;		
		}else { // Set Point - Range
			tempTemp = tempSetPoint - tempRange;		
		}
		BigDecimal temp;
		temp = new BigDecimal(tempTemp).setScale(1, BigDecimal.ROUND_HALF_UP); // 取小數點後第一位，四捨五入
		String temperature = temp.toString();
		
		return temperature;
	}
}
