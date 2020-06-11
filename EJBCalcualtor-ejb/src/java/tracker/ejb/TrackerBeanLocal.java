/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tracker.ejb;

import javax.ejb.Local;

/**
 *
 * @author RozyZzx
 */
@Local
public interface TrackerBeanLocal {
    public String[] getHistoryEquation();
    public String[] getHistoryResult();
    public String calculate(String input);
}
