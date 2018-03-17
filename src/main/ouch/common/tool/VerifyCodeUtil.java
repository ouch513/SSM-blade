package main.ouch.common.tool;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

public class VerifyCodeUtil {
    private int width = 70;
    private int height = 35;
    private Random random = new Random();
    private String[] fontFamily = {"宋体","华文楷体","黑体","微软雅黑","楷体_GB2312"};
    private String code = "1234567890";
    private Color bgColor = new Color(210,255,198);
    private String text;
    private int n = 4;       //验证码长度
    private int lines = 3;   //干扰线条数

    /*****
     * @METHOD_NAME:  getPic()
     * @PARAMETERS:  null
     * @RETRUN_TYPE:  BufferedImage
     * @DESCRIPTION:  返回验证码图片
     ***
     * @AUTHOR:  郑好 - Ouch
     * @DATE:  2018/1/2 11:38
     */
    public BufferedImage getPic() {
        //创建图片缓冲区
        BufferedImage pic = createImage();
        //得到绘制环境
        Graphics2D g2 = (Graphics2D)pic.getGraphics();
        //装载验证码文本
        StringBuilder sb = new StringBuilder();
        //图片中生成四个字符
        for(int i=0;i<n;i++){
            String s = randomChar()+"";         //随机生成一个字符
            sb.append(s);                       //添加至验证码文本
            float x = i * 1.0F * width / n;     //设置当前字符 x 轴坐标
            g2.setFont(randomFont());           //随机生成字体样式
            g2.setColor(randomColor());         //随机生成字体颜色
            g2.drawString(s,x,height-5);    //图片上生成字符
        }
        this.text=sb.toString();
        drawLine(pic);                          //添加干扰线
        return pic;
    }

    /*****
     * @METHOD_NAME:  getText()
     * @PARAMETERS:  null
     * @RETRUN_TYPE:  String
     * @DESCRIPTION:  返回验证码值
     ***
     * @AUTHOR:  郑好 - Ouch
     * @DATE:  2018/1/2 11:39
     */
    public String getText(){
        return text;
    }

    /*****
     * @METHOD_NAME:  output()
     * @PARAMETERS:  [BufferedImage pic, OutputStream os]
     * @RETRUN_TYPE:  void
     * @DESCRIPTION:  输出图片至指定位置
     ***
     * @AUTHOR:  郑好 - Ouch
     * @DATE:  2018/1/2 11:40
     */
    public static void output(BufferedImage pic, OutputStream os){
        try {
            ImageIO.write(pic,"JPEG",os);
        } catch (IOException e) {}
    }

    private Color randomColor(){
        int red = random.nextInt(150);       //让值低于150，以至于字符颜色不过分偏白色
        int green = random.nextInt(150);
        int blue = random.nextInt(150);
        return new Color(red,green,blue);
    }

    private void drawLine(BufferedImage pic) {
        Graphics2D g2 = (Graphics2D)pic.getGraphics();
        for(int i=0;i<lines;i++){
            int x1 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int x2= random.nextInt(width);
            int y2= random.nextInt(height);
            g2.setStroke(new BasicStroke(1.5F));
            g2.setColor(randomColor());
            g2.drawLine(x1,y1,x2,y2);
        }
    }

    private BufferedImage createImage() {
        BufferedImage pic = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
        Graphics2D g2 = (Graphics2D)pic.getGraphics();
        g2.setColor(this.bgColor);
        g2.fillRect(0,0,width,height);
        return  pic;
    }

    private Font randomFont() {
        int index = random.nextInt(fontFamily.length);
        String font = fontFamily[index];
        int style = random.nextInt(4);      //0 - 无样式 1 - 粗体 2 - 斜体 3 - 粗体+斜体
        int size = random.nextInt(5)+24;    //随机字号：24-28
        return new Font(font,style,size);
    }

    private char randomChar() {
        int index = random.nextInt(code.length());
        return code.charAt(index);
    }


    public void setWidth(int width) {
        this.width = width;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public void setFontFamily(String[] fontFamily) {
        this.fontFamily = fontFamily;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setBgColor(Color bgColor) {
        this.bgColor = bgColor;
    }

    public void setNum(int n) {
        this.n = n;
    }

    public void setLines(int lines) {
        this.lines = lines;
    }

}
