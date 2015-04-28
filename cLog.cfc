<!---
(c) 2006 by terbach
http://www.terbach.com

author			: Timo Erbach
creation date	: 23.10.2006
last changed	: 24.10.2006
fileName		: cLog.cfc
version			: 1.0
description		: This CFC helps you to log everything in textFiles.
--->

<cfcomponent name="cLog" hint="Logs messages to the logfile." output="true">
	<!--- constructor --->
	<cfset variables.folder = "log/">
	<cfset variables.folder = "logfile.log">
	<cfset variables.level = "info">
	<cfset variables.encoding = "UTF-8">

	<cffunction name="init" returntype="void" access="public" output="false" hint="Initialization of the component (constructor).">
		<cfargument name="folder" type="string" required="true" hint="The folder where the logFile is stored.">
		<cfargument name="logFile" type="string" required="true" hint="The logFile where the message will be logged.">
		<cfargument name="level" type="string" required="true" hint="The level for logging.">
		<cfargument name="encoding" type="string" required="false" default="UTF-8" hint="The encoding for the logFile.">

		<cfset variables.folder = trim(arguments.folder)>
		<cfset variables.logFile = trim(arguments.logFile)>
		<cfset setLevel(trim(arguments.level))>
		<cfset variables.encoding = trim(arguments.encoding)>
	</cffunction>

	<cffunction name="writeLogEntry" returntype="boolean" access="public" output="true" hint="Logs a message to a specified logFile">
		<cfargument name="message" type="string" required="true" hint="The message that will be logged.">
		<cfargument name="level" type="string" required="true" hint="The level for logging messages.">

		<!--- local settings --->
		<cfset var error = false>
		<cfset var lMessage = lsDateFormat(now()) & '-' & lsTimeFormat(now()) & " --- " & trim(arguments.message)>

		<cfif getLevel() eq trim(arguments.level)>
			<cfset variables.fileName = getFolder() & getLogFile()>
			<cftry>
				<cffile action="append" file="#variables.fileName#" output="#lMessage#" addnewline="true" charset="#getCharset()#">

				<cfcatch type="any">
					<cfset error = true>
				</cfcatch>
			</cftry>
		</cfif>

		<cfreturn not error>
	</cffunction>



	<!--- setter --->
	<cffunction name="setLevel" returntype="string" access="public" output="false" hint="Returns the current level for logging.">
		<cfargument name="level" type="string" required="true" hint="The level for logging messages.">

		<cfset variables.level = trim(arguments.level)>
	</cffunction>



	<!--- getter --->
	<cffunction name="getFolder" returntype="string" access="public" output="false" hint="Returns the folder where the logFile is stored.">
		<cfreturn trim(variables.folder)>
	</cffunction>

	<cffunction name="getLogFile" returntype="string" access="public" output="false" hint="Returns the logFile where the message will be stored.">
		<cfreturn trim(variables.logFile)>
	</cffunction>

	<cffunction name="getLevel" returntype="string" access="public" output="false" hint="Returns the current level for logging.">
		<cfreturn trim(variables.level)>
	</cffunction>

	<cffunction name="getCharset" returntype="string" access="public" output="false" hint="Returns the encoding for the logFile.">
		<cfreturn trim(variables.encoding)>
	</cffunction>
</cfcomponent>