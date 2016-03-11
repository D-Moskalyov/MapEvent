package com.mapevent.web.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeFormatter {
    public static String Format(String inputStr){
        String dd;
        String MM;
        String yyyy;
        String HH;
        String mm;

        //String EEE = inputStr.split(" ")[0];
        String start = inputStr.split(" ")[1];
        if(start.length() == 3) {
            String MMM = inputStr.split(" ")[1];
            MM = "01";
            if (MMM.equals("Jan")) MM = "01";
            if (MMM.equals("Feb")) MM = "02";
            if (MMM.equals("Mar")) MM = "03";
            if (MMM.equals("Apr")) MM = "04";
            if (MMM.equals("May")) MM = "05";
            if (MMM.equals("Jun")) MM = "06";
            if (MMM.equals("Jul")) MM = "07";
            if (MMM.equals("Aug")) MM = "08";
            if (MMM.equals("Sep")) MM = "09";
            if (MMM.equals("Oct")) MM = "10";
            if (MMM.equals("Nov")) MM = "11";
            if (MMM.equals("Dec")) MM = "12";
//        switch (MMM){
//            case "Jan": MM = "01";
//            case "Feb": MM = "02";
//            case "Mar": MM = "03";
//            case "Apr": MM = "04";
//            case "May": MM = "05";
//            case "Jun": MM = "06";
//            case "Jul": MM = "07";
//            case "Aug": MM = "08";
//            case "Sep": MM = "09";
//            case "Oct": MM = "10";
//            case "Nov": MM = "11";
//            case "Dec": MM = "12";
//            default: MM = "01";
//        }
            dd = inputStr.split(" ")[2];
            yyyy = inputStr.split(" ")[3];
            String HHmmss = inputStr.split(" ")[4];
            //String Z = inputStr.split(" ")[5];

            HH = HHmmss.split(":")[0];
            mm = HHmmss.split(":")[1];
        }

        else {//from DB
            String date = inputStr.split(" ")[0];
            String time = inputStr.split(" ")[1];

            if(date.contains("-")) {
                dd = date.split("-")[2];
                MM = date.split("-")[1];
                yyyy = date.split("-")[0];
            }
            else {
                dd = date.split("\\.")[0];
                MM = date.split("\\.")[1];
                yyyy = date.split("\\.")[2];
            }

            HH = time.split(":")[0];
            mm = time.split(":")[1];
        }

        return dd + "." + MM + "." + yyyy + " " + HH + ":" + mm;

    }

    public static Date FormatTimeZoneCorrect(String inputStr){
        String MMM = inputStr.split(" ")[1];
        String MM = "01";
        if (MMM.equals("Jan")) MM = "01";
        if (MMM.equals("Feb")) MM = "02";
        if (MMM.equals("Mar")) MM = "03";
        if (MMM.equals("Apr")) MM = "04";
        if (MMM.equals("May")) MM = "05";
        if (MMM.equals("Jun")) MM = "06";
        if (MMM.equals("Jul")) MM = "07";
        if (MMM.equals("Aug")) MM = "08";
        if (MMM.equals("Sep")) MM = "09";
        if (MMM.equals("Oct")) MM = "10";
        if (MMM.equals("Nov")) MM = "11";
        if (MMM.equals("Dec")) MM = "12";
//        switch (MMM){
//            case "Jan": MM = "01";
//            case "Feb": MM = "02";
//            case "Mar": MM = "03";
//            case "Apr": MM = "04";
//            case "May": MM = "05";
//            case "Jun": MM = "06";
//            case "Jul": MM = "07";
//            case "Aug": MM = "08";
//            case "Sep": MM = "09";
//            case "Oct": MM = "10";
//            case "Nov": MM = "11";
//            case "Dec": MM = "12";
//            default: MM = "01";
//        }
        String dd = inputStr.split(" ")[2];
        String yyyy = inputStr.split(" ")[3];
        String HHmmss = inputStr.split(" ")[4];
        String Z = inputStr.split(" ")[5];

        String HH = HHmmss.split(":")[0];
        String mm = HHmmss.split(":")[1];

        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
        Date dateBase = null;
        try {
            dateBase = formatter.parse(dd + "." + MM + "." + yyyy + " " + HH + ":" + mm);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(Z.contains("+")) {
            String corr = new String(Z.split("\\+")[1]);

            String corrH = corr.substring(0, 2);
            String corrM = corr.substring(2);
            int corrHInt = Integer.parseInt(corrH);
            int corrMInt = Integer.parseInt(corrM);
            dateBase = new Date(dateBase.getYear(), dateBase.getMonth(), dateBase.getDate(), dateBase.getHours() - corrHInt,
                    dateBase.getMinutes() - corrMInt);
//            int HHInt = Integer.parseInt(HH) + Integer.parseInt(corrH);
//            int mmInt = Integer.parseInt(mm) + Integer.parseInt(corrM);
        }
        else {
            String corr = Z.split("-")[1];
            String corrH = corr.substring(0, 1);
            String corrM = corr.substring(2, 3);
            int corrHInt = Integer.parseInt(corrH);
            int corrMInt = Integer.parseInt(corrM);
            dateBase = new Date(dateBase.getYear(), dateBase.getMonth(), dateBase.getDate(), dateBase.getHours() + corrHInt,
                    dateBase.getMinutes() + corrMInt);
//            int HHInt = Integer.parseInt(HH) - Integer.parseInt(corrH);
//            int mmInt = Integer.parseInt(mm) - Integer.parseInt(corrM);
        }



        return dateBase;
    }
}
