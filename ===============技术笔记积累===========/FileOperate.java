package com.xian.home2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class FileOperate {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		FileOperate fo = new FileOperate();
//		String filepath = "G:\\02";
//		fo.getFileList(filepath);
		getCreateTime();
	}

	public List<File> getFileList(String filepath) {

		try {
			File file = new File(filepath);
			if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File Ifile = new File(filepath + "\\" + filelist[i]);
					FileInputStream fis = new FileInputStream(Ifile);
					
					 long modifiedTime = Ifile.lastModified();
                      Date date=new Date(modifiedTime);
                      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:MM");
                      String dd=sdf.format(date);
					System.out.println("File name:" + Ifile.getName()
							+ " \tFile size: "
							+ (double) ((double) fis.available() / 1024 / 1024)
							+ "M"+ " \tFile create Time: "+dd);

				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;

	}
	
	/**  
     * 读取文件创建时间  
     */  
    public static void getCreateTime(){   
        String filePath = "G:\\02\\123.txt";   
        String strTime = null;   
        try {   
            Process p = Runtime.getRuntime().exec("cmd /C dir "            
                    + filePath   
                    + "/tc" );   
            InputStream is = p.getInputStream();    
            BufferedReader br = new BufferedReader(new InputStreamReader(is));              
            String line;   
            while((line = br.readLine()) != null){   
                if(line.endsWith(".txt")){   
                    strTime = line.substring(0,17);   
                    break;   
                }                              
             }    
        } catch (IOException e) {   
            e.printStackTrace();   
        }          
        System.out.println("创建时间    " + strTime);      
        //输出：创建时间   2009-08-17  10:21   
    }   
    /**  
     * 读取文件修改时间的方法1  
     */    
    @SuppressWarnings("deprecation")   
    public static void getModifiedTime_1(){   
        File f = new File("C:\\test.txt");               
        Calendar cal = Calendar.getInstance();   
        long time = f.lastModified();   
        cal.setTimeInMillis(time);     
        //此处toLocalString()方法是不推荐的，但是仍可输出   
        System.out.println("修改时间[1] " + cal.getTime().toLocaleString());    
        //输出：修改时间[1]    2009-8-17 10:32:38   
    }   
       
    /**  
     * 读取修改时间的方法2  
     */  
    public static void getModifiedTime_2(){   
        File f = new File("C:\\test.txt");               
        Calendar cal = Calendar.getInstance();   
        long time = f.lastModified();   
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");          
        cal.setTimeInMillis(time);     
        System.out.println("修改时间[2] " + formatter.format(cal.getTime()));      
        //输出：修改时间[2]    2009-08-17 10:32:38   
    }   

}
