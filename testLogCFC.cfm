<!---
(c) 2006 by terbach
http://www.terbach.com

author			: Timo Erbach
creation date	: 23.10.2006
last changed	: 24.10.2006
fileName		: testLogCFC.cfm
version			: 1.0
description		: Test the CFC and demonstrate how to use it with multiple objects.
--->


<cfset variables.myFolder = expandPath(".") & "\">

<cfset myLog = createObject("component", "cLog")>
<cfset myLog.init("#variables.myFolder#", "logging.log", "debug", "UTF-8")>

<cfset success = myLog.writeLogEntry("Message 1 - type info", "info")>
<cfset success = myLog.writeLogEntry("Message 2 - type debug", "debug")>

<cfset myLog.setLevel("warning")>

<cfset success = myLog.writeLogEntry("Message 3 - type warning", "warning")>
<cfset success = myLog.writeLogEntry("Message 4 - type error", "error")>

<cfoutput>All messages have been logged at location #variables.myFolder#!</cfoutput>