package finalproj;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.JPanel;

public class Panel extends JPanel{

    private BufferedImage image;

    public Panel(int a) {
    		if(a==1) {
		       try {                
		          image = ImageIO.read(new File("D:/big.JPG"));
		       } catch (IOException ex) {
		    	   System.out.println("image handler"+ ex);
		       }
    		}
    		if(a==2) {
 		       try {                
 		          image = ImageIO.read(new File("D:/named.GIF"));
 		       } catch (IOException ex) {
 		    	   System.out.println("image handler"+ ex);
 		       }
     		}
    		if(a==3) {
  		       try {                
  		          image = ImageIO.read(new File("D:/build.JPG"));
  		       } catch (IOException ex) {
  		    	   System.out.println("image handler"+ ex);
  		       }
      		}
    }

    
    public void paintComponent(Graphics g) {
        g.drawImage(image, 0, 0, null);   
    }

}