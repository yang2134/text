package com.util;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class uploadFile extends HttpServlet {

	private File file = null;

	/**
	* Constructor of the object.
	*/
	public uploadFile() {
		super();
	}

	/**
	* Destruction of the servlet. <br>
	*/
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public String UploadF(HttpServletRequest request)
	throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");  //设置编码

		String path = request.getSession().getServletContext().getRealPath("/upload");

		//获得磁盘文件条目工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();

		//如果没以下两行设置的话,上传大的文件会占用很多内存，
		//设置暂时存放的存储室,这个存储室可以和最终存储文件的目录不同
		/**
		* 原理: 它是先存到暂时存储室，然后再真正写到对应目录的硬盘上，
		* 按理来说当上传一个文件时，其实是上传了两份，第一个是以 .tem 格式的
		* 然后再将其真正写到对应目录的硬盘上
		*/
		factory.setRepository(file);
		//设置缓存的大小，当上传文件的容量超过该缓存时，直接放到暂时存储室
		factory.setSizeThreshold(1024 * 1024);
		//高水平的API文件上传处理
		ServletFileUpload upload = new ServletFileUpload(factory);
		String fname = "";

		try {
			List<FileItem> list = upload.parseRequest(request);
			FileItem picture = null;
			for (FileItem item : list) {
				//获取表单的属性名字
				String name = item.getFieldName();
				fname = item.getName();
				//System.out.println(name);
				//如果获取的表单信息是普通的 文本 信息
				if (item.isFormField()) {
					//获取用户具体输入的字符串
					String value = item.getString();
					request.setAttribute(name, value);
					} else {
					picture = item;
				}
			}

			String destPath = path + "/" + fname;

			//真正写到磁盘上
			File file = new File(destPath);
			OutputStream out = new FileOutputStream(file);
			InputStream in = picture.getInputStream();
			int length = 0;
			byte[] buf = new byte[1024];
			// in.read(buf) 每次读到的数据存放在buf 数组中
			while ((length = in.read(buf)) != -1) {
				//在buf数组中取出数据写到（输出流）磁盘上
				out.write(buf, 0, length);
			}

			System.out.println(fname);
			in.close();
			out.close();
			} catch (FileUploadException e1) {
			} catch (Exception e) {

			System.out.println(e);
		}

		return "/upload/" + fname;
	}

	/**
	* Initialization of the servlet. <br>
	*
	* @throws ServletException if an error occurs
	*/
	public void init() throws ServletException {
		// Put your code here
	}

	public static String[] uploadfile(MultipartFile[] files, HttpServletRequest request) {
		String dir = request.getSession().getServletContext().getRealPath("/upload");
		//String dir = "C:\\nodejs\\app\\mini2048\\static";
		//String dir = "D:\\static";
		String[] b = null;

		for (MultipartFile file : files) {
			//  System.out.println("文件类型:"+file.getContentType());
			String filename = file.getOriginalFilename();

			//按照时间生成文件名，精确到毫秒，防止重复
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String str = sdf.format(date);
			String flname2 = str;

			String suffix = filename.substring(filename.lastIndexOf("."));
			//String suffix = filename.substring(filename.length() - 3);
			//  System.out.println("文件名:"+filename);
			//  System.out.println("文件后缀:"+suffix);
			// System.out.println("文件大小:"+file.getSize()/1024+"KB");

			String path = flname2 + suffix;

			//上传文件
			try {
				file.transferTo(new File(dir + "/" + path));
				b = new String[2];
				b[0] = path;
				b[1] = suffix;
				} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return b;
	}

}

