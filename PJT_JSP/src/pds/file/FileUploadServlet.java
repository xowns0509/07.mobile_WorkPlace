package pds.file;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import pds.model.PdsItem;
import pds.service.AddPdsItemService;

public class FileUploadServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");

		String contentType = req.getContentType();
		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {

			PdsItem uploadedItem = saveUploadFile(req);
			// PdsItem: 파일 이름, 경로, 사이즈, 다운 수, 설명.
			// saveUploadFile는 저장행위 하는 놈

			req.setAttribute("uploadedItem", uploadedItem);
			// 업로드 아이템을 이 이름으로 저장.
			// 포워딩 하기 전에 저장해서 끌고와야지

			RequestDispatcher dispatcher = req.getRequestDispatcher("/09_upload_class/2_pds/uploaded.jsp");
			dispatcher.forward(req, resp);

		} else {

			RequestDispatcher dispatcher = req.getRequestDispatcher("/09_upload_class/2_pds/invalid.jsp");
			dispatcher.forward(req, resp);

		}
	}

	private PdsItem saveUploadFile(HttpServletRequest req) throws IOException, ServletException {

		Part descPart = req.getPart("description");
		String description = readParameterValue(descPart);
		Part filePart = req.getPart("file");
		String fileName = getFileName(filePart);

		// ------------------################## 실제 경로로 변경
		String realPath = FileSaveHelper.save("D:\\Dropbox\\Html_Workplace\\JSP\\WebContent\\09_upload_class\\upload\\",
				filePart.getInputStream());

		PdsItem addRequest = new PdsItem();
		addRequest.setFileName(fileName);
		addRequest.setFileSize(filePart.getSize());
		addRequest.setDescription(description);
		addRequest.setRealPath(realPath);

		// 파일의 정보가 담긴 놈을 DB에 저장하고
		// 받아내는 놈.
		PdsItem pdsItem = AddPdsItemService.getInstance().add(addRequest);
		return pdsItem;

	}

	private String getFileName(Part part) throws UnsupportedEncodingException {

		for (String cd : part.getHeader("Content-Disposition").split(";")) {

			if (cd.trim().startsWith("filename")) {

				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	private String readParameterValue(Part part) throws IOException {

		InputStreamReader reader = new InputStreamReader(part.getInputStream(), "euc-kr");

		char[] data = new char[512];

		int len = -1;
		StringBuilder builder = new StringBuilder();

		while ((len = reader.read(data)) != -1) {
			builder.append(data, 0, len);
		}
		return builder.toString();
	}

}
