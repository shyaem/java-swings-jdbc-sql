package finalproj;

import java.awt.*;

import java.sql.*;

import javax.swing.*;

public class FrontEnd {

	public static void main(String[] args) {
		new Inter();
	}

}

class Inter extends JFrame{
	JTextField tex1;
	JLabel lab1,lab2,lab3;
	JPasswordField pass;
	JButton btn1,btn2,btn3;

	Inter(){
		Panel panel = new Panel(1);
		add(panel);
		
		
		
	
		lab3 = new JLabel("Login");
		lab3.setFont(new Font("Times New Roman", Font.BOLD, 35));
		lab3.setForeground(Color.orange);
		lab3.setBounds(180, 95, 170, 35);
		
		tex1 = new JTextField();
		lab1 = new JLabel("Username");
		lab1.setFont(new Font("Times New Roman", Font.BOLD, 22));
		lab1.setForeground(Color.orange);
		tex1.setBackground(Color.DARK_GRAY);
        tex1.setForeground(Color.orange);
        tex1.setFont(new Font("", Font.BOLD, 15));
		lab1.setBounds(85, 173, 170, 35);
		tex1.setBounds(230, 175, 170, 26);
		
		pass = new JPasswordField();
		lab2 = new JLabel("Password");
		lab2.setFont(new Font("Times New Roman", Font.BOLD, 22));
		lab2.setForeground(Color.orange);
		pass.setBackground(Color.DARK_GRAY);
        pass.setForeground(Color.orange);
        pass.setFont(new Font("", Font.PLAIN, 15));
		lab2.setBounds(85, 242, 170, 35);
		pass.setBounds(230, 245, 170, 26);
		
		btn1 = new JButton("Reset");
        btn1.setFont(new Font("Times New Roman", Font.PLAIN, 18));
        btn1.setBackground(Color.DARK_GRAY);
        btn1.setForeground(Color.orange);
        btn1.setBounds(100, 321, 95, 35);
		
		btn2 = new JButton("SignIn");
        btn2.setFont(new Font("Times New Roman", Font.PLAIN, 18));
        btn2.setBackground(Color.DARK_GRAY);
        btn2.setForeground(Color.orange);
        btn2.setBounds(290, 320, 95, 35);
        
        btn3 = new JButton("Help");
        btn3.setFont(new Font("Times New Roman", Font.PLAIN, 18));
        btn3.setBackground(Color.DARK_GRAY);
        btn3.setForeground(Color.orange);
        btn3.setBounds(10, 10, 70, 30);
		
		panel.add(lab1);
		panel.add(tex1);
		panel.add(lab2);
		panel.add(pass);
		panel.add(lab3);
		panel.add(btn1);
		panel.add(btn2);
		panel.add(btn3);
		
		btn3.addActionListener((event)->{
			JOptionPane.showMessageDialog(btn3, "Forgot PassWord : please consult your manager"+"\n\n"+"for urgent access contact IT department");
		});
		
		btn1.addActionListener((event)->{
			tex1.setText("");
			pass.setText("");
			
		});
		btn2.addActionListener((event) ->{
			
			String name = tex1.getText();
			String password = pass.getText();
			try {
				Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/construction","shyam","123456");
				PreparedStatement st = con.prepareStatement("SELECT name,password FROM STUDENT WHERE name=? and password=?;");
				st.setString(1, name);
				st.setString(2, password);
				ResultSet rs = st.executeQuery();
				if(rs.next()) {
					JOptionPane.showMessageDialog(btn2, "You have successfully logged in");
					dispose();
                    new Home();
				}
				else {
					JOptionPane.showMessageDialog(btn2, "Wrong Username & Password "+"\n"+"Try Again!");
				}
			}
			catch(SQLException e) {
				System.out.println("error at 74."+e);
			}
		});
		panel.setLayout(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		setSize(480,450);
		setResizable(false);
	}
}