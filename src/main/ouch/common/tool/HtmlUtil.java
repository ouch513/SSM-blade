package main.ouch.common.tool;

public class HtmlUtil {

    public static String html2Code(String str){
        str = str.replace("&ldquo;", "“");
        str = str.replace("&rdquo;", "”");
        str = str.replace("&nbsp;", " ");
        str = str.replace("&", "&amp;");
        str = str.replace("&#39;", "'");
        str = str.replace("&rsquo;", "’");
        str = str.replace("&mdash;", "—");
        str = str.replace("&ndash;", "–");
        return str;
    }

    public static String code2Html(String str){
        str = str.replace("“","&ldquo;" );
        str = str.replace("”","&rdquo;");
        str = str.replace(" ","&nbsp;");
        str = str.replace("&","&amp;");
        str = str.replace("'","&#39;");
        str = str.replace("’","&rsquo;");
        str = str.replace("—","&mdash;");
        str = str.replace("–","&ndash;");
        return str;
    }
}
