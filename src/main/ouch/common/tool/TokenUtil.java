package main.ouch.common.tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TokenUtil {

    public static String createToken(String userId) {

        Date dateTime = new Date();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String tokenTest = userId + df.format(dateTime);

        return ValueUtil.md5(tokenTest);
    }

    public static String nowDate(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        return df.format(now);
    }

    public static boolean checkTime(String date_str){

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date when = null;
        try {
            when = df.parse(date_str);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Date now = new Date();

        long firstDateMilliSeconds = now.getTime();
        long secondDateMilliSeconds = when.getTime();

        //得到两者之差
        long over = (firstDateMilliSeconds - secondDateMilliSeconds)/1000/60;

        return over < 120;
    }
}
