package com.nkl.admin.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import com.nkl.admin.bean.Salary;

public class ExcelDao {
	// 导入学生基本信息
	public void importSalarys(InputStream stream, Connection conn)
			throws Exception {

		Workbook workbook = null;// workbook是一个工作簿 和创建一个输入流。。。类死把
		try {
			// 读取文件输入流中的内容
			workbook = Workbook.getWorkbook(stream);
			// 可以直接从输入流中读取 也可以直接读取文件Workbook.getWorkbook(new File(sourceFile))
			int count = workbook.getNumberOfSheets();// 获取工作簿中工作表的个数
			// System.out.println("表单数："+String.valueOf(count));
			List<Salary> Salarys = new ArrayList<Salary>();
			for (int m = 0; m < count; m++) {
				Sheet sheet = workbook.getSheet(m); // 获取第一个工作表对象，getSheet()中的参数表示第几张工作表，索引从0开始
				// int col=sheet.getColumns();
				int row = sheet.getRows();// Sheet页的总行数
				// System.out.println(String.valueOf(row));
				String sheetname = sheet.getName();// 返回Sheet标题 返回这张表的标题
				// System.out.println(sheetname);
				for (int i = 1; i < row; i++) {// 学生表一共就三列 学号，姓名，班级
												// trim()：去掉收尾字符串“ abc ”->“abc”
					String user_name = sheet.getCell(0, i).getContents().trim();// 返回第一行,第一列的值
																				// (0
																				// (第一个代表列),i
																				// (第i行))
					String salary_month = sheet.getCell(1, i).getContents();
					String salary_basic = sheet.getCell(2, i).getContents();// 获取单元格的内容
																			// 一行一列是22222
																			// 则返回22222
					String salary_award = sheet.getCell(3, i).getContents();
					String salary_subsidy = sheet.getCell(4, i).getContents();
					String salary_attend = sheet.getCell(5, i).getContents();
					String salary_money = sheet.getCell(6, i).getContents();
					String salary_note = sheet.getCell(7, i).getContents();
					String salary_baoxian = sheet.getCell(8, i).getContents();
					String salary_zhufang = sheet.getCell(9, i).getContents();
					String salary_yanglao = sheet.getCell(10, i).getContents();
					String salary_punish = sheet.getCell(11, i).getContents();
					if (user_name.equals(""))
						break;
					// 检查读入信息的有效性
					// if(!(stuid.length()==10))throw new
					// Exception("表单<"+sheetname+">中学号"+stuid+"出错,应为10位字符！");//越界
					Salary temp = new Salary();
					temp.setUser_name(user_name);
					temp.setSalary_month(salary_month);
					temp.setSalary_basic(Double.parseDouble(salary_basic));
					temp.setSalary_award(Double.parseDouble(salary_award));
					temp.setSalary_subsidy(Double.parseDouble(salary_subsidy));
					temp.setSalary_attend(Integer.parseInt(salary_attend));
					temp.setSalary_money(Double.parseDouble(salary_money));
					temp.setSalary_baoxian(Double.parseDouble(salary_baoxian));
					temp.setSalary_note(salary_note);
					temp.setSalary_punish(Double.parseDouble(salary_punish));
					temp.setSalary_yanglao(Double.parseDouble(salary_yanglao));
					temp.setSalary_zhufang(Double.parseDouble(salary_zhufang));
					Salarys.add(temp);// 添加到集合中
				}
			}
			// 将学生维护到数据库
			SalaryDao sDao = new SalaryDao();
			sDao.addinfoBatch(Salarys, conn);
		} catch (Exception e) {
			throw e;
		} finally {
			if (workbook != null)
				workbook.close();// 关闭Workbook对象，释放占用的内存空间一般 创建对象用完就释放掉 浪费。。
		}
	}

}
