package finalproj;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.*;

import net.proteanit.sql.DbUtils;


public class Home extends JFrame {
	JButton construct,cons,b1,b2,b3,b4,b5,b6,b7,bf1,bf2,bf3;
	Panel panel1,pan;
	JPanel wpan;
	JLabel lb,lb1;
	int i=0,row,j=0,a=100;
	JProgressBar p;
	Timer t1;
	JTable table1;
	JScrollPane sp1;
	ResultSet rs;
	Connection conn1;
	String cli,nam;
	PreparedStatement pst;
	Thread th1,th2,th3,th4,th5,th6;
	Home(){
		
		panel1 = new Panel(3);
		wpan = new JPanel();
		add(panel1);
		pan = new Panel(2);
		pan.setBounds(310,250,140,100);
		wpan.setBounds(520, 130, 570, 480);
		wpan.setBackground(new Color(0,0,0,120));
		panel1.add(pan);
		panel1.add(wpan);
		wpan.setVisible(false);
		table1 = new JTable();
		sp1 = new JScrollPane(table1);
		sp1.setBounds(10, 200, 545, 180);
		table1.setBackground(Color.DARK_GRAY);
		sp1.setBackground(Color.DARK_GRAY);
		table1.setForeground(Color.WHITE);
		wpan.add(sp1);
		conn1 = Pgconn.dbConnector();
		
		
		
		construct = new JButton("Constructions");
		construct.setBounds(160, 100, 165, 35);
		construct.setFont(new Font("", Font.BOLD, 16));
		panel1.add(construct);
		
		cons = new JButton("client_details");
		cons.setBounds(120, 160,  165, 35);
		cons.setFont(new Font("", Font.BOLD, 16));
		panel1.add(cons);
		
		b1 = new JButton("site_details");
		b1.setBounds(80, 220,  165, 35);
		b1.setFont(new Font("", Font.BOLD, 17));
		panel1.add(b1);
		
		b2 = new JButton("staff_details");
		b2.setBounds(40, 280, 165, 35);
		b2.setFont(new Font("", Font.BOLD, 17));
		panel1.add(b2);
		
		b3 = new JButton("retailer");
		b3.setBounds(10, 340,  165, 35);
		b3.setFont(new Font("", Font.BOLD, 17));
		panel1.add(b3);
		
		b4 = new JButton("buildings");
		b4.setBounds(40, 400,  165, 35);
		b4.setFont(new Font("", Font.BOLD, 17));
		panel1.add(b4);
		
		b5 = new JButton("materials_with_retailer");
		b5.setBounds(160, 580,  185, 35);
		b5.setFont(new Font("", Font.BOLD, 14));
		panel1.add(b5);
		
		b6 = new JButton("site_works");
		b6.setBounds(120, 520,  165, 35);
		b6.setFont(new Font("", Font.BOLD, 17));
		panel1.add(b6);
		
		b7 = new JButton("work");
		b7.setBounds(80, 460,  175, 35);
		b7.setFont(new Font("", Font.BOLD, 17));
		panel1.add(b7);
		
		
		bf1 = new JButton("insert");
		bf2 = new JButton("delete");
		bf3 = new JButton("update");
		
		bf1.setBounds(75, 70, 90, 30);
		bf2.setBounds(230, 70, 90, 30);
		
		wpan.add(bf1);
		wpan.add(bf2);
		
		
		
		
		p = new JProgressBar(0,20);
		p.setBounds(280,375,200,22);
		panel1.add(p);
		p.setStringPainted(true);
		p.setForeground(Color.black);
		p.setVisible(false);
		pan.setVisible(false);
		
		lb = new JLabel("Shine Builders");
		lb.setFont(new Font("Arial Rounded MT Bold", Font.BOLD, 40));
		lb.setForeground(Color.WHITE);
		lb.setBounds(425, 50, 300, 35);
		panel1.add(lb);
		lb1 = new JLabel("");
		lb1.setFont(new Font("Arial Rounded MT Bold", Font.BOLD, 20));
		wpan.add(lb1);
		
		construct.addActionListener((e)->{
			th1 = new Thread(()->{
				ramp();
				try{th1.sleep(1000);}catch(Exception ex){}
		
				
				try {
					String query = "SELECT client_details.client_details_name,buildings.buildings_type from client_details INNER JOIN site_details  ON client_details.client_details_name = site_details.client_details_name\r\n"
							+ "INNER JOIN buildings ON site_details.buildings_type = buildings.buildings_type;";
					nam = cli;
					pst = conn1.prepareStatement(query);
					rs = pst.executeQuery();
					table1.setModel(DbUtils.resultSetToTableModel(rs));
				} catch (SQLException e1) {
					
					e1.printStackTrace();
				}
				wpan.setVisible(true);
			});
			th1.start();


		});
		cons.addActionListener((e)->{
			th2 = new Thread(()->{
				ramp();
				try{th2.sleep(1000);}catch(Exception ex){}
				wpan.setVisible(true);
				try {exe(cons.getText());} catch (SQLException e1) {e1.printStackTrace();}
			});
			wpan.setVisible(false);
			th2.start();
		});
		
		b1.addActionListener((e)->{
			th3 = new Thread(()->{
				ramp();
				try{th3.sleep(1000);}catch(Exception ex){}
				wpan.setVisible(true);
				try {exe(b1.getText());} catch (SQLException e1) {e1.printStackTrace();}
			});
			wpan.setVisible(false);
			th3.start();
		});
		
		b2.addActionListener((e)->{
			th4= new Thread(()->{
				ramp();
				try{th4.sleep(1000);}catch(Exception ex){}
				wpan.setVisible(true);
				try {exe(b2.getText());} catch (SQLException e1) {e1.printStackTrace();}
			});
			wpan.setVisible(false);
			th4.start();
		});
		
		b3.addActionListener((e)->{
			th5 = new Thread(()->{
				ramp();
				try{th5.sleep(1000);}catch(Exception ex){}
				wpan.setVisible(true);
				try {exe(b3.getText());} catch (SQLException e1) {e1.printStackTrace();}
			});
			wpan.setVisible(false);
			th5.start();
		});
		
		b4.addActionListener((e)->{
			th6 = new Thread(()->{
				ramp();
				try{th6.sleep(1000);}catch(Exception ex){}
				wpan.setVisible(true);
				try {exe(b4.getText());} catch (SQLException e1) {e1.printStackTrace();}
			});
			wpan.setVisible(false);
			th6.start();
		});
		b5.addActionListener((e)->{
			th6 = new Thread(()->{
				ramp();
				try{th6.sleep(1000);}catch(Exception ex){}
				wpan.setVisible(true);
				try {exe(b5.getText());} catch (SQLException e1) {e1.printStackTrace();}
			});
			wpan.setVisible(false);
			th6.start();
		});
		b6.addActionListener((e)->{
			bf3 = new JButton("update");
			bf3.setBounds(385, 70, 90, 30);
			wpan.add(bf3);
			bf1.addActionListener((ex)->{
				new Insert(2);
			});
			bf3.addActionListener((ex)->{
			});
			th6 = new Thread(()->{
				ramp();
				try{th6.sleep(1000);}catch(Exception ex){}
				wpan.setVisible(true);
				try {exe(b6.getText());} catch (SQLException e1) {e1.printStackTrace();}
			});
			wpan.setVisible(false);
			th6.start();
		});
		b7.addActionListener((e)->{
			th6 = new Thread(()->{
				ramp();
				try{th6.sleep(1000);}catch(Exception ex){}
				wpan.setVisible(true);
				try {exe(b7.getText());} catch (SQLException e1) {e1.printStackTrace();}
			});
			wpan.setVisible(false);
			th6.start();
		});
		
		bf2.addActionListener((e)->{
					
				try{del(table1.getSelectedRow());}catch(Exception ex) {
					JOptionPane.showMessageDialog(null,"Select to delete" );
				}
		});
		
		wpan.setLayout(null);
		panel1.setLayout(null);
		setDefaultCloseOperation(3);
		setVisible(true);
		setSize(1100,700);
		setResizable(false);
	}
	
	public synchronized void ramp() {
		j=j+1;
		if(j==1) {
		t1 = new Timer(a,(event)->{
			p.setVisible(true);
			pan.setVisible(true);
			i++;
			p.setValue(i);
			if((p.getValue()) == 20) {
				p.setVisible(false);
				pan.setVisible(false);
				
				p.setValue(0);
				i=0;
				j=0;
				t1.stop();
			}
			
		});
		}
		t1.start();
	}
	public void exe(String cli) throws SQLException {
			String query = "SELECT * FROM "+ cli+";";
			nam = cli;
			pst = conn1.prepareStatement(query);
			rs = pst.executeQuery();
			table1.setModel(DbUtils.resultSetToTableModel(rs));
	}
	
	public void del(int a) {
			
		try {
			if(rs!=null) {
				String cell = table1.getModel().getValueAt(a, 0).toString();
				String sql = "DELETE FROM "+nam+" WHERE "+nam+"_id="+cell+";";
				pst = conn1.prepareStatement(sql);
				pst.execute();
				JOptionPane.showMessageDialog(null,"deleted succesfully" );
				
			}
			else {
				JOptionPane.showMessageDialog(null,"Table is Empty!" );
			}
			exe(nam);
		}catch(SQLException w) {
			JOptionPane.showMessageDialog(null," not deleted "+nam+" has references to other table");
			
		}
		
		
	}
	public static void main(String[] args) {
		new Home();
	}

	
}
