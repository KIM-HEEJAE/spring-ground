package com.example.ground.calendar;

import java.util.Calendar;

public class CalendarUtil {
	public static String generateCalendar(int year, int month) {
        java.util.Calendar cal = java.util.Calendar.getInstance();
        int todayYear = cal.get(java.util.Calendar.YEAR);
        int todayMonth = cal.get(java.util.Calendar.MONTH) + 1;
        int todayDate = cal.get(java.util.Calendar.DAY_OF_MONTH);
        
        cal.set(year, month - 1, 1); // 월은 0부터 시작하므로 -1 해줍니다.
        int maxDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
        int startDay = cal.get(java.util.Calendar.DAY_OF_WEEK);

        StringBuilder html = new StringBuilder();
        html.append("<table border='1'>");
        html.append("<tr><th colspan='7'>" + year + "년 " + month + "월</th></tr>");
        html.append("<tr><th><a href='?year=" + getPreviousYear(year, month) + "&month=" + getPreviousMonth(month) + "'>&#8249;</a></th>");
        html.append("<th colspan='5'></th>");
        html.append("<th><a href='?year=" + getNextYear(year, month) + "&month=" + getNextMonth(month) + "'>&#8250;</a></th></tr>");
        html.append("<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>");

        int day = 1;
        for (int i = 0; i < 6; i++) {
            html.append("<tr>");
            for (int j = 0; j < 7; j++) {
                if (day <= maxDay && (i > 0 || j + 1 >= startDay)) {
                    if (year == todayYear && month == todayMonth && day == todayDate) {
                        html.append("<td class='today'>" + day + "</td>");
                    } else {
                        html.append("<td>" + day + "</td>");
                    }
                    day++;
                } else {
                    html.append("<td></td>");
                }
            }
            html.append("</tr>");
            if (day > maxDay)
                break;
        }
        html.append("</table>");

        return html.toString();
    }
    
    private static int getPreviousYear(int year, int month) {
        if (month == 1) {
            return year - 1;
        } else {
            return year;
        }
    }
    
    private static int getPreviousMonth(int month) {
        if (month == 1) {
            return 12;
        } else {
            return month - 1;
        }
    }
    
    private static int getNextYear(int year, int month) {
        if (month == 12) {
            return year + 1;
        } else {
            return year;
        }
    }
    
    private static int getNextMonth(int month) {
        if (month == 12) {
            return 1;
        } else {
            return month + 1;
        }
    }
}
