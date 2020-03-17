package com.nkl.admin.action;

import java.io.File;
import org.apache.commons.io.FileUtils;
import java.io.IOException;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
	private File myFile;//这是用户已上传的实际文件
	private String myFileContentType;
	private String myFileFileName;//上传的文件的名称
	private String destPath;

	public String execute() {
		/* 将文件复制到一个安全的文件夹 C盘upload */
		destPath = "C:/upload/";

		try {
			if (myFile == null || myFileFileName == null) {
				return ERROR;
			}
			System.out.println("Src File name: " + myFile);
			System.out.println("Dst File name: " + myFileFileName);

			File destFile = new File(destPath, myFileFileName);
			FileUtils.copyFile(myFile, destFile);

		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}

		return SUCCESS;
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileContentType() {
		return myFileContentType;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}
}