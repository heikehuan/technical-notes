package com.hjhz.report.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Timecs {
	private static String[] hzYearMonth = new String[6];//���ָ�ʽ����
	private static String[] zcYc = new String[6];//������ʽ����
	private static String[] zcYd = new String[6];//������ʽ����

	public static void getYearMonth() {
	int leng = 0;
	/*�����i��ʼֵ������Ը����Լ�����Ҫ���ı䣬Ҳ���Ա�ɱ���*/
	for(int i=-6; i<0; i++) {
	Calendar calendar = Calendar.getInstance();
	/*
	* i���������Ǻ�i�£�i�Ǹ�������ǰi�£�i�Ǽ��ͼӼ��£������������ǰ6����
	* */
	calendar.add(Calendar.DATE, i); //�õ�ĳһ��
	calendar.add(Calendar.MONTH, i); //�õ�ĳһ����

	int year = calendar.get(Calendar.YEAR);
	int month = calendar.get(Calendar.MONTH)+1;//������Ҫ��1

	/*������Ǹ������Լ���Ҫ�õ������ڸ�ʽ�ӵ�һЩС����*/
	String dateTime = year + "-" + month;
	dateTime += "-" + getDayCount(dateTime);
	hzYearMonth[leng] = year + "��" + month + "��";
	zcYc[leng] = year + "-" + month + "-1";
	zcYd[leng] = dateTime;

	System.out.println(hzYearMonth[leng] + "*-*-*" + zcYc[leng] + "*-*-*" + zcYd[leng]);
	leng++;
	}
	}

	/*��һ��yyyy-MM(2009-11)���ڸ�ʽ���жϳ�������һ��������*/
	public static int getDayCount(String dateTime) {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	/*GregorianCalendar �� Calendar ��һ���������࣬
	* �ṩ�������ϴ��������/����ʹ�õı�׼����ϵͳ��*/
	Calendar calendar = new GregorianCalendar();
	try {
	/*ʹ�ø����� Date ���ô� Calendar ��ʱ��*/
	calendar.setTime(sdf.parse(dateTime));
	} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	/*���ش������ֶο��ܾ��е����ֵ��DAY_OF_MONTH ����ָʾһ���µ�ĳ��*/
	int day = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	return day;
	}
	public static void main(String[] args) throws ParseException {
	getYearMonth();

	}}
