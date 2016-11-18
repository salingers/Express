package com.chb.service.txn.txn0901;

import java.util.Map;

import com.chb.validator.ValidateResult;
import com.neux.utility.utils.jsp.info.JSPQueryStringInfo;

/**
 * @author
 *
 */
public class Txn0901Validator
{
	public ValidateResult valid(JSPQueryStringInfo queryStringInfo)
	{
		ValidateResult result = new ValidateResult();

		@SuppressWarnings("unchecked")
		Map<String, String> parameterMap = queryStringInfo.getAllParams();
		result.sqlValidate("txnNo", queryStringInfo.getParam("txnNo"));

		return result;
	}
}
