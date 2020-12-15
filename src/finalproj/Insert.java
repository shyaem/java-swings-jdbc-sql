package finalproj;

import java.awt.Font;
import java.sql.*;

import javax.swing.*;

public class Insert extends JFrame{
	JLabel jl1,jl2,jl3,jl4,jl5,jl6;
	JTextField jt1,jt2;
	String country[]={"completed","pending","not started"};
	String worktype[]={"plumbering","painting","builder","decor","plastering","technition","carpenter","welder"};
	String sitename[] ={"Logan","Independence","Mitchell","Redwing","Forster","Anhalt","Coolidge","Marquette","6th","Stephen","Sycamore","Anderson","Havey","Jenna","Ludington"};
	String staffname[] = {"Dewdney","Pengilly","Pendall","Pringley","Karadzas","Ramsbotham","Fraine","Hellard","Weine","Mandrier","Woodwing","Stoven","Webburn","Scurrer","Pittem"};
	String que;
	JComboBox cb1,cb2,cb3,cb4;
	JButton jb1,jb6;
	Connection conn2;

	Insert(int one){
		if(one==1) {
			jb6 = new JButton("update");
			jb6.setBounds(160, 250, 85, 22);
			add(jb6);
			
			jl6 = new JLabel("update user");
			jl6.setBounds(115, 10, 200, 28);
			jl6.setFont(new Font("Times New Roman", Font.BOLD, 20));
			add(jl6);
		}
		if(one>=1) {
		conn2 = Pgconn.dbConnector();
		jl1= new JLabel("sitename");
		jl2= new JLabel("worktype");
		jl3= new JLabel("staffname");
		jl4= new JLabel("status");
		jl5= new JLabel("Insert into site_works");
		/*
		jt1 = new JTextField();
		jt2 = new JTextField();
		jt1.setBounds(190, 50, 95, 22);
		jt2.setBounds(190, 150, 95, 22);
		add(jt1);
		add(jt2);
		*/
		
		jb1 = new JButton("Save");
		jb1.setBounds(70, 250, 80, 22);
		
		
		
		
		jl1.setBounds(50, 50, 80, 28);
		jl2.setBounds(50, 100, 80, 28);
		jl3.setBounds(50, 150, 80, 28);
		jl4.setBounds(50, 200, 80, 28);
		if(one>1) {
		jl5.setBounds(65, 10, 200, 28);
		jl5.setFont(new Font("Times New Roman", Font.BOLD, 20));
		add(jl5);
		}
		add(jl1);
		add(jl2);
		add(jl3);
		add(jl4);
		
		add(jb1);
		
	    cb1=new JComboBox(worktype);   
	    cb1.setBounds(190, 100,90,20); 
	    cb2=new JComboBox(country);    
	    cb2.setBounds(190, 200,90,20); 
	    cb3=new JComboBox(sitename);    
	    cb3.setBounds(190, 50, 95, 22); 
	    cb4=new JComboBox(staffname);    
	    cb4.setBounds(190, 150, 95, 22);
	    add(cb1);
	    add(cb2);
	    add(cb3);
	    add(cb4);
		}
	    jb1.addActionListener((e)->{
	    	que = "insert into site_works(site_details_name, work_type, staff_details_name, site_details_work_status) values (?,?,?,?);";
	    	try {
				PreparedStatement st = conn2.prepareStatement(que);
				st.setString(1,cb3.getSelectedItem().toString());
				st.setString(2, cb1.getSelectedItem().toString());
				st.setString(3,cb4.getSelectedItem().toString());
				st.setString(4, cb2.getSelectedItem().toString());
				st.executeUpdate();
				
				JOptionPane.showMessageDialog(null, "row inserted");		
				dispose();
			
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(null, "row notinserted"+e1);
			}
	    });
	    setLayout(null);
		setDefaultCloseOperation(3);
		setVisible(true);
		setSize(365,350);
		setResizable(false);
		
	}



}
