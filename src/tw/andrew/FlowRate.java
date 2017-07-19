package tw.andrew;

import java.math.BigDecimal;

class FlowRate {
	double flowSetPoint = 100.0; // Unit: L/min
	double flowAccuracy = 0.005;
	double flowRange = flowSetPoint * (Math.random() * flowAccuracy);
	double tempFlow;
	
	String getFlowRate() {
		if ( (int)(Math.random()*2) == 1) { // Set Point + Range
			tempFlow = flowSetPoint + flowRange;	
		}else { // Set Point - Range
			tempFlow = flowSetPoint - flowRange;		
		}
		BigDecimal flow;
		flow = new BigDecimal(tempFlow).setScale(1, BigDecimal.ROUND_HALF_UP); // 取小數點後第一位，四捨五入
		String flowrate = flow.toString();
		
		return flowrate;
	}

}
