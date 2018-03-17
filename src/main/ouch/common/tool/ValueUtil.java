package main.ouch.common.tool;

import org.apache.commons.beanutils.BeanUtils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.UUID;

public class ValueUtil{

    /*****
     * @METHOD_NAME:  uuid()
     * @PARAMETERS:  null
     * @RETRUN_TYPE:  String
     * @DESCRIPTION:  Create and return a UUID ( A unique and 32-byte string)
     ***
     * @AUTHOR:  郑好 - Ouch
     * @DATE:  2017/12/30 18:58
     */
    public static String uuid(){
        return UUID.randomUUID().toString().replace("-","").toUpperCase();
    }

    /*****
     * @METHOD_NAME:  toBean()
     * @PARAMETERS:  [map, classname]
     * @RETRUN_TYPE:  T
     * @DESCRIPTION:  Change map data to Bean
     ***
     * @AUTHOR:  郑好 - Ouch
     * @DATE:  2018/1/4 16:30
     */
    public static <T> T toBean(Map map, Class<T> classname){
        try {
            T bean = classname.newInstance();
            BeanUtils.populate(bean,map);
            return bean;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    private static String encodeText = "Copyright by ZHENG_HAO (zheng188773231732163.com)";

    /*****
     * @METHOD_NAME:  md5()
     * @PARAMETERS:  String text
     * @RETRUN_TYPE:  String
     * @DESCRIPTION:  Encode your text by md5
     ***
     * @AUTHOR:  郑好 - Ouch
     * @DATE:  2018/3/14 16:30
     */
    public static String md5(String text){

        try {
            text = text + encodeText;
            MessageDigest digest = MessageDigest.getInstance("MD5");
            byte[] bs = digest.digest(text.getBytes());

            StringBuffer sb = new StringBuffer();
            for(byte b:bs){
                int i = b & 0xff;
                String hexString = Integer.toHexString(i);
                if(hexString.length() < 2){
                    hexString = "0" + hexString;
                }
                sb.append(hexString);
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            System.out.println("加密失败");
        }

        return "";
    }

    public static boolean isEmpty(String str){
        return str.trim().isEmpty();
    }

    public static boolean isMoreThan(int limit,String str){
        return str.length()>limit;
    }

    public static boolean isLessThan(int limit,String str){
        return str.length()<limit;
    }

    public static boolean checkLength(int min,int max,String str){
        return (str.length()<min)||(str.length()>max);
    }

    public static boolean checkEmail(String email) {
        return !email.matches("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+");
    }
}
