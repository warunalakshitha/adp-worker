// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/url;

# This is a generated connector for [ADP Workers API v2](https://developers.adp.com/articles/api/workers-v2-api) OpenAPI specification.
# The Workers API provides the capability to obtain a list of all workers in an organization and to get information about work assignments.
# A worker is a person who performs duties and responsibilities for an organization. In that capacity, a worker fills one or more positions via a work assignment. 
# For a given work assignment, a worker is related to the organization as an employee or contractor.
@display {label: "ADP Workers", iconPath: "resources/adp.workers.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [ADP account](https://www.adp.com/) and obtain tokens by following [this guide](https://developers.adp.com/articles/guide/auth-process-data-conn-request-access-token).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Workers
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + prefer - Used to indicate that particular server behaviors are preferred by the client.Required in Asynchronous call. 
    # + accept - “Accept” “: ” ( “*/*” | (type“/” “*”) | (type“/”subtype)) [“; ” “q” “=”qvalue]. Describes media type(s) and subtype(s) that are acceptable for the response. The optional qvalue represents an acceptable quality level for acceptable types. 
    # + 'select - The OData $select parameter MUST be used to specify the selection criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1/mobile-user-accounts?$select=/mobileUserAccounts/associateOID,/mobileUserAccounts/governmentID 
    # + skip - The OData $skip parameter MUST be used to specify the start sequence criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1/dashboards?$top =10&amp;$skip=20 
    # + top - The OData $top parameter MUST be used to specify the maximum number criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1dashboards?$top =10&amp;$skip=20 
    # + count - The OData $count parameter MUST be used to specify the total number criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1/dashboards?$count=true 
    # + return - Workers 
    remote isolated function listWorkers(string roleCode, string? filter = (), string? prefer = (), string? accept = (), string? 'select = (), string? skip = (), string? top = (), boolean? count = ()) returns Workers|error {
        string  path = string `/hr/v2/workers`;
        map<anydata> queryParam = {"$filter": filter, "$select": 'select, "$skip": skip, "$top": top, "$count": count};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "Prefer": prefer, "Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Workers response = check self.clientEp-> get(path, accHeaders, targetType = Workers);
        return response;
    }
    # Worker
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + 'select - The OData $select parameter MUST be used to specify the selection criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1/mobile-user-accounts?$select=/mobileUserAccounts/associateOID,/mobileUserAccounts/governmentID 
    # + return - Worker 
    remote isolated function getWorker(string aoid, string roleCode, string? filter = (), string? 'select = ()) returns json|error {
        string  path = string `/hr/v2/workers/${aoid}`;
        map<anydata> queryParam = {"$filter": filter, "$select": 'select};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Worker Meta
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + return - Meta data 
    remote isolated function getMeta(string roleCode) returns MetaData|error {
        string  path = string `/hr/v2/workers/meta`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MetaData response = check self.clientEp-> get(path, accHeaders, targetType = MetaData);
        return response;
    }
    # Specific Worker Meta
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + return - Worker meta data 
    remote isolated function getSpecificMeta(string aoid, string roleCode) returns json|error {
        string  path = string `/hr/v2/workers/${aoid}/meta`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Worker Data Image
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + return - Worker data image 
    remote isolated function getDataImage(string aoid, string roleCode) returns json|error {
        string  path = string `/hr/v2/workers/${aoid}/worker-data-image`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Worker Photo
    #
    # + sorId - System of Record ID 
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + aoid - Associate OID 
    # + photoId - Associate Photo ID 
    # + adpActingSessionid - ADP Acting Session ID 
    # + accept - Used with a method to make it conditional; the method is performed only if the client entity (via the given entity tag, ETag header) does not match the server entity. 
    # + return - Photo 
    remote isolated function getPhoto(string sorId, string roleCode, string aoid, string photoId, string adpActingSessionid, string? accept = ()) returns json|error {
        string  path = string `/static-content/${sorId}/hr/associates/${aoid}/photos/${photoId}`;
        map<anydata> queryParam = {"ADP-Acting-SessionID": adpActingSessionid};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
