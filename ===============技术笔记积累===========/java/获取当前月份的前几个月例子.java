package com.hjhz.report.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Timecs {
	private static String[] hzYearMonth = new String[6];//汉字格式日期
	private static String[] zcYc = new String[6];//正常格式日期
	private static String[] zcYd = new String[6];//正常格式日期

	public static void getYearMonth() {
	int leng = 0;
	/*这里的i初始值，你可以根据自己的需要来改变，也可以变成变量*/
	for(int i=-6; i<0; i++) {
	Calendar calendar = Calendar.getInstance();
	/*
	* i是正数就是后i月，i是负数就是前i月，i是几就加几月，这里的例子是前6个月
	* */
	calendar.add(Calendar.DATE, i); //得到某一天
	calendar.add(Calendar.MONTH, i); //得到某一个月

	int year = calendar.get(Calendar.YEAR);
	int month = calendar.get(Calendar.MONTH)+1;//这里月要加1

	/*下面的是根据我自己需要用到的日期格式加的一些小处理*/
	String dateTime = year + "-" + month;
	dateTime += "-" + getDayCount(dateTime);
	hzYearMonth[leng] = year + "年" + month + "月";
	zcYc[leng] = year + "-" + month + "-1";
	zcYd[leng] = dateTime;

	System.out.println(hzYearMonth[leng] + "*-*-*" + zcYc[leng] + "*-*-*" + zcYd[leng]);
	leng++;
	}
	}

	/*给一个yyyy-MM(2009-11)日期格式，判断出所传月一共多少天*/
	public static int getDayCount(String dateTime) {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	/*GregorianCalendar 是 Calendar 的一个具体子类，
	* 提供了世界上大多数国家/地区使用的标准日历系统。*/
	Calendar calendar = new GregorianCalendar();
	try {
	/*使用给定的 Date 设置此 Calendar 的时间*/
	calendar.setTime(sdf.parse(dateTime));
	} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	/*返回此日历字段可能具有的最大值。DAY_OF_MONTH 用于指示一个月的某天*/
	int day = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	return day;
	}
	public static void main(String[] args) throws ParseException {
	getYearMonth();

	}}
