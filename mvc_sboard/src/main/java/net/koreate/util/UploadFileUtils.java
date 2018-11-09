package net.koreate.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	public static String uploadFile(String originalName, String uploadPath, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString()+"_"+originalName;
		String path = calcPath(uploadPath);
		File file = new File(uploadPath+path,savedName);
		FileCopyUtils.copy(fileData,  file);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadfileName = "";
		System.out.println("formatName : " + formatName);
		if(MediaUtils.getMediaType(formatName)  != null ) {
			uploadfileName = makeThumnail(uploadPath,path,savedName);
			System.out.println("uploadfileName : " + uploadfileName);
			
		}else
			
			uploadfileName = makeIcon(uploadPath,path,savedName);
		
		
		return uploadfileName;
		
	}

	private static String makeIcon(String uploadPath, String path, String savedName) {
		
		String iconName = uploadPath+path+File.separator+savedName;
		System.out.println(iconName);
		
		String name = iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		System.out.println(name);
		return name;
	}

	private static String makeThumnail(String uploadPath, String path, String savedName)
	throws IOException {
		
		BufferedImage fileImage = ImageIO.read(new File(uploadPath+path,savedName)); 
		
		BufferedImage sourceImg = Scalr.resize(fileImage, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumnail = uploadPath+path+File.separator+"s_"+savedName;
		
		File thumFile = new File(thumnail);
		
		String formatName = savedName.substring(savedName.lastIndexOf(".")+1);
		
		ImageIO.write(sourceImg, formatName.toUpperCase(), thumFile);
		
		String name = thumnail.substring(uploadPath.length()).replace(File.separatorChar, '/'); 
		
		System.out.println(name);
		
		return name;
	}

	public static String calcPath(String uploadPath) {

		// 싱글톤 : 객체가 생성되어있으면 기존에 생성되어있는 객체를 반환.
		Calendar cal = Calendar.getInstance();

		String yearPath = File.separator + cal.get(Calendar.YEAR);
		// separator 는 파일구분자

		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		// 객체 단위의 '달'을 가져올때 0부터 시작하기때문에 +1 해쥼

		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		mkDir(uploadPath,yearPath,monthPath,datePath);
		System.out.println(datePath);
		return datePath;
	}

	public static void mkDir(String uploadPath, String... paths) {
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir();

			}
		}
	}
}
