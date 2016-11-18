package com.chb.service.txn.txn0901;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONString;

import com.chb.digitbr.rs.S01A0007.S01A0007RsBody;
import com.chb.service.DigitBrBussiness;
import com.chb.validator.ValidateResult;
import com.chb.web.PostMsgObject.StandardRQBean;
import com.chb.web.PostMsgObject.StandardRSBean;
import com.cs.util.StringUtils;
import com.google.gson.Gson;
import com.neux.garden.dbmgr.DaoFactory;
import com.neux.garden.dbmgr.WebFlowDao;
import com.neux.utility.orm.ORMAPI;
import com.neux.utility.orm.bean.DataObject;
import com.neux.utility.orm.dal.dao.module.IDao;
import com.neux.utility.utils.date.DateUtil;
import com.neux.utility.utils.jsp.info.JSPQueryStringInfo;

public class Txn0901Bussiness extends DigitBrBussiness
{

	private IDao dao;

	public Txn0901Bussiness()
	{
		dao = new WebFlowDao("", DaoFactory.getDefaultDao());
	}

	@Override
	protected ValidateResult validate(JSPQueryStringInfo queryStringInfo) throws Exception
	{
		return new Txn0901Validator().valid(queryStringInfo);
	}

	@Override
	protected Map<String, String> buildTxnRqMap(String txnNo, JSPQueryStringInfo queryStringInfo) throws Exception
	{
		Map<String, String> rq = new HashMap<String, String>();

		Map<String, String> params = queryStringInfo.getAllParams();

		String key = null;
		String value = null;

		for (Entry<String, String> entry : params.entrySet())
		{
			key = entry.getKey();
			value = entry.getValue();

			if (key.equals("clientIp") || key.equals("pmtid"))
			{
				continue;
			}

			rq.put(key.toUpperCase(), value);
		}

		return rq;
	}

	@Override
	protected DataObject saveLog(JSPQueryStringInfo queryStringInfo, Map<String, String> rq) throws Exception
	{
		Map<String, String> params = queryStringInfo.getAllParams();

		String key = null;
		String value = null;

		if (DaoFactory.getDefaultDao() == null)
		{
			ORMAPI.openORM();
		}

		if (dao == null)
		{
			dao = new WebFlowDao("", DaoFactory.getDefaultDao());
		}

		DataObject data = DaoFactory.getDefaultDataObject("TXN0901LOG");

		data.setValue("TXN0901LOGKEY", "0");
		data.setValue("PMTID", queryStringInfo.getParam("pmtid"));
		data.setValue("LOGDATETIME", DateUtil.getTodayString());
		data.setValue("TXNDATE", DateUtil.getShortTodayString());
		data.setValue("CLIENTIP", queryStringInfo.getParam("clientIp"));
		// data.setValue("TXNNO", "TXN0901");
		data.setValue("TXNNO", queryStringInfo.getParam("txnNo"));
		data.setValue("STATUS", "0");
		// data.setValue("RCODE", "");
		data.setValue("RQ", rq.toString());
		// data.setValue("RS", "");
		data.setValue("APPTNO", "");

		// data.setValue("PURPOSE", "");
		// data.setValue("PURPOSE_1", "");
		// data.setValue("NAME", "");
		// data.setValue("PHONE", "");
		// data.setValue("EMAIL", "");
		// data.setValue("NOTE", "");
		for (Entry<String, String> entry : params.entrySet())
		{
			key = entry.getKey();
			value = entry.getValue();

			if (key.equals("clientIp") || key.equals("pmtid"))
			{
				continue;
			}

			data.setValue(entry.getKey().toUpperCase(), entry.getValue());
		}

		if (data.getValue("PURPOSE") == null || data.getValue("PURPOSE").equals(""))
		{
			switch (data.getValue("PURPOSE"))
			{
			case "1":
				data.setValue("PURPOSE", "¡ ´Œ(´ÿ)¶Ì¶v");
			case "2":
				data.setValue("PURPOSE", "≠◊¬µ¶Ì¶v");
			case "3":
				data.setValue("PURPOSE", "¡ ∏m®T®Æ");
			case "4":
				data.setValue("PURPOSE", "≤z∞]∂g¬‡");
			case "5":
				data.setValue("PURPOSE", "®‰•L≠”§H§p√B´H∂U");
			case "6":
				data.setValue("PURPOSE", "®‰•L");
			default:
				data.setValue("PURPOSE", "");
			}
		}

		dao.insert(data);

		return data;
	}

	@Override
	protected int updLog(JSPQueryStringInfo queryStringInfo, StandardRSBean rs, DataObject data) throws Exception
	{
		S01A0007RsBody body = (S01A0007RsBody) rs.getRs().getRsBody();

		data.setValue("RCODE", rs.getRespCode());
		// data.setValue("RESPDESC", rs.getRespDesc());
		data.setValue("RS", rs.getOriginalXmlString());
		data.setValue("APPTNO", body.getAPPTNo());

		dao.update(data);

		return 0;
	}

	@Override
	protected String getTxnId()
	{
		// TODO Auto-generated method stub
		return "S01A0007";
	}

	public String testRs(String txnId)
	{
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		strBuf.append("<CFX>");
		strBuf.append("	<HEAD>");
		strBuf.append("		<Ver>V1.0</Ver>");
		strBuf.append("		<TxCode>S01A0008</TxCode>");
		strBuf.append("	</HEAD>");
		strBuf.append("	<BODY>");
		strBuf.append("		<RespCode>0000</RespCode>");
		strBuf.append("		<RespDesc>??êÂ??</RespDesc>");
		strBuf.append("		<APPTNo>201601011200999</APPTNo>");
		strBuf.append("		<CanFiLLStatus>4</CanFiLLStatus>");
		strBuf.append("	</BODY>");
		strBuf.append("</CFX>");
		return strBuf.toString();
	}

	@Override
	protected void buildReturnJson(JSONObject jsonObject, HttpServletRequest request, HttpServletResponse response,
			StandardRSBean rs)
	{
		S01A0007RsBody body = (S01A0007RsBody) rs.getRs().getRsBody();

		try
		{
			jsonObject.put("RespCode", body.getRespCode());
			jsonObject.put("RespDesc", body.getRespDesc());
			jsonObject.put("APPTNo", body.getAPPTNo());
			jsonObject.put("CanFiLLStatus", body.getCanFiLLStatus());
		}
		catch (JSONException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
