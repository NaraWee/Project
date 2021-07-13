package com.tuna.can.controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;

public class Test implements ActionListener{

	JFrame oldFrame;
	JFrame newFrame;
	
	public Test() {}
	
	public Test(JFrame oldFrame, JFrame newFrame) {
		this.oldFrame = oldFrame;
		this.newFrame = newFrame;
		this.newFrame.setVisible(false);
	}
	

	@Override
	public void actionPerformed(ActionEvent e) {
		oldFrame.setVisible(false);
		newFrame.dispose();
		newFrame.setVisible(true);
		
	}
}
