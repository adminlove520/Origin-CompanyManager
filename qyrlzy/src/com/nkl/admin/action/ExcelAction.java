package com.nkl.admin.action;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.nkl.admin.allservice.AdminService;

public class ExcelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("111111111");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		AdminService adminService = new AdminService();
		InputStream stream = null;
		try {
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);// 判断请求中是否有enctype="multipart/form-data“这种标示。
			if (isMultipart == true) {// (2)1
				// 首先得到文件的输入流，并不上传文件
				ServletFileUpload upload = new ServletFileUpload();// 文件上传组件处理文件上传的核心高级
				// isMultipartContent方法方法用于判断请求消息中的内容是否是“multipart/form-data”类型，是则返回true，
				// 否则返回false。isMultipartContent方法是一个静态方法，不用创建ServletFileUpload类的实例对象即可被调用。
				upload.setHeaderEncoding("UTF-8");// 解决文件名中文乱码
				FileItemIterator iter = upload.getItemIterator(request);
				if (iter.hasNext()) {
					FileItemStream item = iter.next();
					stream = item.openStream();// 读取
					adminService.addinfoBatch(stream);
				}
			} else {
				throw new Exception("导入文件表单属性应为enctype='multipart/form-data'");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stream != null)
				stream.close();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
