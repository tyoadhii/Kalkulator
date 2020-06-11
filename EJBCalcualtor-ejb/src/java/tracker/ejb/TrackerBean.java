/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tracker.ejb;

import java.text.DecimalFormat;
import javax.ejb.Stateful;

/**
 *
 * @author RozyZzx
 */
@Stateful
public class TrackerBean implements TrackerBeanLocal {
    private DecimalFormat twoDigits = new DecimalFormat("");
    private String historyEquation = "", historyResult = "";
    
    private void addHistoryEquation(String item){
        historyEquation += item + ",";
    }
    private void addHistoryResult(String item){
        historyResult += item + ",";
    }
    private String[] getValues(String input) {
        String[] results = getHistoryResult(), res;
        input = input.replace("Ans", results[results.length - 1]);
        res = input.split(" ");
        return res;
    }
    
    @Override 
    public String[] getHistoryEquation(){
        return historyEquation.split(",");
    }
    @Override
    public String[] getHistoryResult(){
        return historyResult.split(",");
    }
    @Override
    public String calculate(String input){
        String[] values = getValues(input);
        double result;
        switch(values[1]){
            case "+":
                result = (Double.parseDouble(values[0]) + Double.parseDouble(values[2]));
                break;
            case "-":
                result = (Double.parseDouble(values[0]) - Double.parseDouble(values[2]));
                break;
            case "x":
                result = (Double.parseDouble(values[0]) * Double.parseDouble(values[2]));
                break;
            case "/":
                result = (Double.parseDouble(values[0]) / Double.parseDouble(values[2]));
                break;
            default:
                result = 0;
                break;
        }
        addHistoryEquation(input);
        addHistoryResult(twoDigits.format(result));
        return twoDigits.format(result);
    }
}
