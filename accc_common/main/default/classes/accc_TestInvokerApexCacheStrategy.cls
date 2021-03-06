/**
 * Copyright (c) 2016-2020, Bill Anderson.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *
 *   * Neither the name of Bill Anderson nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *
 * @author Bill Anderson
 * @description Used to test accc_IApexCacheStrategyInvocation [FOR TESTING ONLY]
 * Class MUST BE public for visibility (creation)
 * @group Common Test Layer
 */
public class accc_TestInvokerApexCacheStrategy implements accc_IApexCacheStrategyInvocation {
	string testSoql;
	/**
	* Getter Method to get the SoqlQuery. Exposed to consumer via the interface
	*/
	public string getTheSoqlQuery() {
		return this.testSoql;
	} // end of getTheSoqlQuery
	/**
	 * Setter Method to set the SoqlQuery.
	 */
	public void setTheSoqlQuery(string soql) {
		this.testSoql = soql;
	} // end of setTheSoqlQuery

	/**
	*
	 * @description nothing special here but return true for testing based on input
	 *
	 * @param string, our soql statement
	 * @param CacheInformation, our data caching informaiton
	 *
	 * @return true, if the information associated with this query should be cached.
	 *
	 *  Note, parameter sniffing is not done as there is no access to the execution plan.
	 *  Instead, you can look at the query and the parameters in 'CacheInformation' to
	 *  ascertain the validity of the request. Of course, you can create your own
	 *  strategy by inheriting from accc_IApexCacheStrategyInvocation
	 *
	 *  CacheInformation contains:
	 *    string DeveloperName		-- the name
	 *    string Label				-- the label
	 *      :
	 *    boolean isCachingEnabled 	-- is this
	 *	  String containFields		-- any fields associated with the query
	 *	  integer timeToLiveMS		-- time to live in Milliseconds (-1 == forever, if possible)
	 *
	 */
	public boolean invokeCacheStrategy(String mysoql, accc_DataCachingDataModel.CacheInformation invocationInformation) {
		return invocationInformation != null && mysoql != null && invocationInformation.isCachingEnabled;
	} // end of invokeCacheStrategy

} // end of accc_TestInvokerApexCacheStrategyForTesting