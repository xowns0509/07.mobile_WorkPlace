<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%><%!public Integer toInt(String x) {
		int a = 0;
		try {
			a = Integer.parseInt(x);
		} catch (Exception e) {
		}
		return a;
	}%>
<%
	int pageno = toInt(request.getParameter("pageno"));
	if (pageno < 1) {//���� ������
		pageno = 1;
	}
	int total_record = 117; //�� ���ڵ� ��
	int page_per_record_cnt = 10; //������ �� ���ڵ� ��
	int group_per_page_cnt = 10; //������ �� ������ ��ȣ ��[1],[2],[3],[4],[5]
	// [6],[7],[8],[9],[10] 
	int record_end_no = pageno * page_per_record_cnt;
	int record_start_no = record_end_no - (page_per_record_cnt - 1);
	if (record_end_no > total_record) {
		record_end_no = total_record;
	}
	int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0);
	if (pageno > total_page) {
		pageno = total_page;
	}
	// ���� ������(����) / �� ������ �� ������ ���� ��ȣ ��(����) + (�׷� ��ȣ�� ���� ������(����) % �������� �� ������ ���� ��ȣ ��(����)>0 ? 1 : 0)
	int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);
	// ���� �׷��ȣ = ���������� / �������� ������ ��ȣ�� (���� ������ % �������� ������ ��ȣ ��>0 ? 1:0) 
	// ex) 14 = 13(��) = (66 / 5) 1 (1(������) =66 % 5) 
	int page_eno = group_no * group_per_page_cnt;
	// ���� �׷� �� ��ȣ = ���� �׷��ȣ * �������� ������ ��ȣ 
	// ex) 70 = 14 * 5
	int page_sno = page_eno - (group_per_page_cnt - 1);
	// ���� �׷� ���� ��ȣ = ���� �׷� �� ��ȣ - (�������� ������ ��ȣ �� -1)
	// ex) 66 = 70 - 4 (5 -1)
	if (page_eno > total_page) {
		// ���� �׷� �� ��ȣ�� ��ü������ �� ���� Ŭ ��� 
		page_eno = total_page;
		// ���� �׷� �� ��ȣ�� = ��ü������ ���� ����
	}
	int prev_pageno = page_sno - group_per_page_cnt; //<<*[����]* [21],[22],[23]... [30] [����]>>
	// ���� ������ ��ȣ = ���� �׷� ���� ��ȣ - �������� ������ ��ȣ�� 
	// ex) 46 = 51 - 5 
	int next_pageno = page_sno + group_per_page_cnt; //<<[����] [21],[22],[23]... [30] *[����]*>>
	// ���� ������ ��ȣ = ���� �׷� ���� ��ȣ + �������� ������ ��ȣ��
	// ex) 56 = 51 - 5
	if (prev_pageno < 1) {
		// ���� ������ ��ȣ�� 1���� ���� ��� 
		prev_pageno = 1;
		// ���� �������� 1��
	}
	if (next_pageno > total_page) {
		// ���� ���������� ��ü������ ������ Ŭ��� 
		next_pageno = total_page / group_per_page_cnt * group_per_page_cnt + 1;
		// next_pageno=total_page
		// ���� ������ = ��ü�������� / �������� ������ ��ȣ�� * �������� ������ ��ȣ�� + 1 
		// ex) = 76 / 5 * 5 + 1 ???????? 
	}
	// [1][2][3].[10]
	// [11][12]
	System.out.println("next_pageno = " + next_pageno);
	System.out.println("prev_pageno = " + prev_pageno);
	System.out.println("page_eno = " + page_eno);
%>���� ������ (pageno) :<%=pageno%><br />
��ü ������ �� (total_record) :<%=total_record%><br />
�������� �� ���ڵ� �� (page_per_record_cnt) :<%=page_per_record_cnt%><br />
�������� �� ������ ���� ��ȣ �� (group_per_page_cnt) :<%=group_per_page_cnt%><br />
<hr />
���ڵ� ���� ��ȣ (record_start_no) :<%=record_start_no%><br />
���ڵ� �� ��ȣ (record_end_no) :<%=record_end_no%><br />
��ü������ �� (total_page) :<%=total_page%><br />
<hr />
���� �׷��ȣ [1] (group_no):<%=group_no%><br />
���� �׷� ���� ��ȣ(page_sno):<%=page_sno%><br />
���� �׷� �� ��ȣ (page_eno):<%=page_eno%><br />
���� ������ ��ȣ (prev_pageno)<%=prev_pageno%><br />
���� ������ ��ȣ (next_pageno)<%=next_pageno%><br />
<hr />
<a href="test2.jsp?pageno=1">[�Ǿ�����]</a>
<a href="test2.jsp?pageno=<%=prev_pageno%>">[����]</a>
<%
	for (int i = page_sno; i <= page_eno; i++) {
%><a href="test2.jsp?pageno=<%=i%>"> <%
 	if (pageno == i) {
 %> [<%=i%>] <%
 	} else {
 %><%=i%> <%
 	}
 %>
</a>
<%-- �޸� --%>
<%
	if (i < page_eno) {
%>
,
<%
	}
%>
<%
	}
%><a href="test2.jsp?pageno=<%=next_pageno%>">[����]</a>
<a href="test2.jsp?pageno=<%=total_page%>">[�ǵڷ�]</a>
