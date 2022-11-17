package com.lucky.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.store.model.StoreService;
import com.lucky.model.LuckyService;
import com.lucky.model.LuckyVO;
import com.lucky.model.*;

public class LuckyServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getAll".equals(action)) {
			/***************************�}�l�d�߸�� ****************************************/
			LuckyDAO dao = new LuckyDAO();
			List<LuckyVO> list = dao.getAll();

			/***************************�d�ߧ���,�ǳ����(Send the Success view)*************/
			HttpSession session = req.getSession();
			session.setAttribute("list", list);    // ��Ʈw���X��list����,�s�Jsession
			// Send the Success view
			String url = "/lucky/listAllLucky2_getFromSession.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\���listAllLucky2_getFromSession.jsp
			successView.forward(req, res);
			return;
		}


		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllLucky.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/lucky/listAllLucky.jsp�j 		
			
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer luckyId = Integer.valueOf(req.getParameter("luckyId"));
				
				/***************************2.�}�l�d�߸��****************************************/
				LuckyService LuckySvc = new LuckyService();
				LuckyVO LuckyVO = LuckySvc.getOneLucky(luckyId);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("LuckyVO", LuckyVO); // ��Ʈw���X��LuckyVO����,�s�Jreq
				String url = "/lucky/update_lucky_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���update_lucky_input.jsp
				successView.forward(req, res);
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_lucky_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/lucky/listAllLucky.jsp�j 
		
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer luckyId = Integer.valueOf(req.getParameter("luckyId").trim());
				
				String lkName = req.getParameter("lkName");
				String lkNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
				if (lkName == null || lkName.trim().length() == 0) {
					errorMsgs.add("�ֳU�W��: �ФŪť�");
				} else if(!lkName.trim().matches(lkNameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�ֳU�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��30����");
	            }
				
				Integer lkStat = null;
				try {
					lkStat = Integer.valueOf(req.getParameter("lkPrc").trim());
				} catch (NumberFormatException e) {
					lkStat = 0;
					errorMsgs.add("�ֳU���A�ж�0��1.");
				}						
				
				java.sql.Date lkTime = null;
				try {
					lkTime = java.sql.Date.valueOf(req.getParameter("lkTime").trim());
				} catch (IllegalArgumentException e) {
					lkTime=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}

				Integer lkPrc = null;
				try {
					lkPrc = Integer.valueOf(req.getParameter("lkPrc").trim());
				} catch (NumberFormatException e) {
					lkPrc = 0;
					errorMsgs.add("����ж�Ʀr.");
				}

				String lkCont = req.getParameter("lkName");
				String lkContReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,200}$";
				if (lkCont == null || lkCont.trim().length() == 0) {
					errorMsgs.add("�ֳU���e: �ФŪť�");
				} else if(!lkCont.trim().matches(lkContReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("�ֳU���e: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��200����");
				}

				Integer storeId = Integer.valueOf(req.getParameter("storeId").trim());

				LuckyVO LuckyVO = new LuckyVO();
				LuckyVO.setLuckyId(luckyId);
				LuckyVO.setLkName(lkName);
				LuckyVO.setLkStat(lkStat);
				LuckyVO.setLkTime(lkTime);
				LuckyVO.setLkPrc(lkPrc);
				LuckyVO.setLkCont(lkCont);
				LuckyVO.setStoreId(storeId);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("LuckyVO", LuckyVO); // �t����J�榡���~��LuckyVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/lucky/update_lucky_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				LuckyService LuckySvc = new LuckyService();
				LuckyVO = LuckySvc.updateLucky(luckyId, storeId, lkStat, lkName, lkCont, lkPrc, lkTime);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/				
				StoreService storeSvc = new StoreService();
				if(requestURL.equals("/store/listLuckys_ByStoreId.jsp") || requestURL.equals("/store/listAllstore.jsp"))
					req.setAttribute("listLuckys_ByStoreId",storeSvc.getLuckysByStoreId(storeId)); // ��Ʈw���X��list����,�s�Jrequest

                String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);   // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);
		}

        if ("insert".equals(action)) { // �Ӧ�addLucky.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
			Integer luckyId = Integer.valueOf(req.getParameter("luckyId").trim());
			
			String lkName = req.getParameter("lkName");
			String lkNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
			if (lkName == null || lkName.trim().length() == 0) {
				errorMsgs.add("�ֳU�W��: �ФŪť�");
			} else if(!lkName.trim().matches(lkNameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
				errorMsgs.add("�ֳU�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��30����");
            }
			
			Integer lkStat = null;
			try {
				lkStat = Integer.valueOf(req.getParameter("lkPrc").trim());
			} catch (NumberFormatException e) {
				lkStat = 0;
				errorMsgs.add("�ֳU���A�ж�0��1.");
			}						
			
			java.sql.Date lkTime = null;
			try {
				lkTime = java.sql.Date.valueOf(req.getParameter("lkTime").trim());
			} catch (IllegalArgumentException e) {
				lkTime=new java.sql.Date(System.currentTimeMillis());
				errorMsgs.add("�п�J���!");
			}

			Integer lkPrc = null;
			try {
				lkPrc = Integer.valueOf(req.getParameter("lkPrc").trim());
			} catch (NumberFormatException e) {
				lkPrc = 0;
				errorMsgs.add("����ж�Ʀr.");
			}

			String lkCont = req.getParameter("lkName");
			String lkContReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,200}$";
			if (lkCont == null || lkCont.trim().length() == 0) {
				errorMsgs.add("�ֳU���e: �ФŪť�");
			} else if(!lkCont.trim().matches(lkContReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
				errorMsgs.add("�ֳU���e: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��200����");
			}
				
				Integer storeId = Integer.valueOf(req.getParameter("storeId").trim());

				LuckyVO LuckyVO = new LuckyVO();
				LuckyVO.setLkName(lkName);
				LuckyVO.setLkStat(lkStat);
				LuckyVO.setLkTime(lkTime);
				LuckyVO.setLkPrc(lkPrc);
				LuckyVO.setLkCont(lkCont);
				LuckyVO.setStoreId(storeId);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("LuckyVO", LuckyVO); // �t����J�榡���~��LuckyVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/lucky/addLucky.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				LuckyService LuckySvc = new LuckyService();
				LuckyVO = LuckySvc.addLucky(storeId, lkStat, lkName, lkCont, lkPrc, lkTime);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/lucky/listAllLucky.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllLucky.jsp
				successView.forward(req, res);				
		}
		
       
		if ("delete".equals(action)) { // �Ӧ�listAllLucky.jsp ��  /store/listLuckys_ByStoreId.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�R�����ӷ��������|: �i�ର�i/lucky/listAllLucky.jsp�j ��  �i/store/listLuckyS_BystoreId.jsp�j �� �i /store/listAllstore.jsp�j

				/***************************1.�����ШD�Ѽ�***************************************/
				Integer luckyId = Integer.valueOf(req.getParameter("luckyId"));
				
				/***************************2.�}�l�R�����***************************************/
				LuckyService LuckySvc = new LuckyService();
				LuckyVO LuckyVO = LuckySvc.getOneLucky(luckyId);
				LuckySvc.deleteLucky(luckyId);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/
				StoreService storeSvc = new StoreService();
				if(requestURL.equals("/store/listLuckyS_BystoreId.jsp") || requestURL.equals("/store/listAllstore.jsp"))
					req.setAttribute("listLuckyS_BystoreId",storeSvc.getLuckysByStoreId(LuckyVO.getStoreId())); // ��Ʈw���X��list����,�s�Jrequest
				
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
		}
		
		if ("listLuckyS_ByCompositeQuery".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				
				/***************************1.�N��J����ରMap**********************************/ 
				//�ĥ�Map<String,String[]> getParameterMap()����k 
				//�`�N:an immutable java.util.Map 
				Map<String, String[]> map = req.getParameterMap();
				
				/***************************2.�}�l�ƦX�d��***************************************/
				LuckyService LuckySvc = new LuckyService();
				List<LuckyVO> list  = LuckySvc.getAll();
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("listLuckyS_ByCompositeQuery", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/lucky/listLuckyS_ByCompositeQuery.jsp"); // ���\���listLuckyS_ByCompositeQuery.jsp
				successView.forward(req, res);
		}
	}
}
