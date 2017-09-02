package fileupload.temp;


import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class UploadServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");

		resp.setContentType("text/html; charset=euc-kr");

		PrintWriter writer = resp.getWriter();
		writer.println("<html><body>");

		// 컨텐트타입을 얻어와 mulitpart/form-data 인지 확인한다.
		String contentType = req.getContentType();
		if (contentType != null
				&& contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(req, writer);
		} else {
			writer.println("multipart가 아님");
		}
		writer.println("</body></html>");
	}

	private void printPartInfo(HttpServletRequest req, PrintWriter writer)
			throws IOException, ServletException {
		
		// HttpServletRequest의 getParts()나 getPart("name")를 이용하여 해당 Part를 얻어온다
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			writer.println("<br/> name = " + part.getName());
			String contentType = part.getContentType();
			writer.println("<br/> contentType = " + contentType);
			
			// 파일 파라미터인지 일반 파라미터 인지 확인
			// 파일인 경우는 application/으로 시작한다지만 이미지등 다른 파일들을 일반으로 취급하기에 문제됨
			if (contentType != null ){ //&& contentType.startsWith("application/")) {
				long size = part.getSize();
				writer.println("<br/> size = " + size);
				String fileName = getFileName(part);
				writer.println("<br/> filename = " + fileName);
				// 파일이 존재한다면 업로드 파일을 저장
				if (size > 0) {
					part.write("D:\\Dropbox\\Html_Workplace\\JSP\\WebContent\\09_upload_class\\upload\\" + fileName);
					part.delete();
					// 서블릿 3.0에 의해 임시폴더에 저장되기에 이를 지운다고 하는데 지워지지 않는다. ( 이것도 문제일세 )
				}
			} else {
				String value = readParameterValue(part);
				writer.println("<br/> value = " + value);
			}
			writer.println("<hr/>");
		}
	}

	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}

	private String readParameterValue(Part part)
			throws IOException {
		InputStreamReader reader = 
				new InputStreamReader(part.getInputStream(), "euc-kr");
		char[] data = new char[512];
		int len = -1;
		StringBuilder builder = new StringBuilder();
		while ((len = reader.read(data)) != -1) {
			builder.append(data, 0, len);
		}
		return builder.toString();
	}

}
