<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="14008000">
	<Property Name="CCSymbols" Type="Str"></Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Libraries" Type="Folder" URL="../Libraries">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Web Service" Type="Folder">
			<Item Name="subVIs" Type="Folder">
				<Item Name="Get ESP Template Path.vi" Type="VI" URL="../Web Service/subVIs/Get ESP Template Path.vi"/>
				<Item Name="Render ESP Error Handler.vi" Type="VI" URL="../Web Service/subVIs/Render ESP Error Handler.vi"/>
				<Item Name="Set Contact Template Variables.vi" Type="VI" URL="../Web Service/subVIs/Set Contact Template Variables.vi"/>
				<Item Name="StartStopServer.vi" Type="VI" URL="../Web Service/StartStopServer.vi"/>
			</Item>
			<Item Name="RCTrainServer" Type="Web Service">
				<Property Name="Bld_buildSpecName" Type="Str"></Property>
				<Property Name="Bld_version.build" Type="Int">53</Property>
				<Property Name="ws.autoIncrementVersion" Type="Bool">true</Property>
				<Property Name="ws.disconnectInline" Type="Bool">true</Property>
				<Property Name="ws.disconnectTypeDefs" Type="Bool">false</Property>
				<Property Name="ws.guid" Type="Str">{E35BB719-FA64-449B-87A5-EBA4BCE1E69D}</Property>
				<Property Name="ws.modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="ws.private_folder_name" Type="Str">Private Content</Property>
				<Property Name="ws.public_folder_name" Type="Str"></Property>
				<Property Name="ws.remoteDebugging" Type="Bool">true</Property>
				<Property Name="ws.removeLibraryItems" Type="Bool">true</Property>
				<Property Name="ws.removePolyVIs" Type="Bool">true</Property>
				<Property Name="ws.serveDefaultDoc" Type="Bool">true</Property>
				<Property Name="ws.SSE2" Type="Bool">true</Property>
				<Property Name="ws.static_permissions" Type="Str"></Property>
				<Property Name="ws.version.build" Type="Int">53</Property>
				<Property Name="ws.version.fix" Type="Int">0</Property>
				<Property Name="ws.version.major" Type="Int">1</Property>
				<Property Name="ws.version.minor" Type="Int">0</Property>
				<Item Name="Public Content" Type="Folder">
					<Item Name="Data" Type="Folder">
						<Item Name="jsimage.js" Type="Document" URL="../Web Service/Public Content/Data/jsimage.js"/>
					</Item>
					<Item Name="image.html" Type="Document" URL="../Web Service/Public Content/image.html"/>
					<Item Name="index - Copy.html" Type="Document" URL="../Web Service/Public Content/index - Copy.html"/>
					<Item Name="index.html" Type="Document" URL="../Web Service/Public Content/index.html"/>
				</Item>
				<Item Name="Private Content" Type="Folder">
					<Item Name="Templates" Type="Folder">
						<Item Name="Common" Type="Folder">
							<Item Name="Common.ejs" Type="Document" URL="../Web Service/Private Content/Templates/Common/Common.ejs"/>
							<Item Name="Error.esp" Type="Document" URL="../Web Service/Private Content/Templates/Common/Error.esp"/>
						</Item>
						<Item Name="Contacts" Type="Folder">
							<Item Name="Edit.esp" Type="Document" URL="../Web Service/Private Content/Templates/Contacts/Edit.esp"/>
							<Item Name="View.esp" Type="Document" URL="../Web Service/Private Content/Templates/Contacts/View.esp"/>
							<Item Name="ViewAll.esp" Type="Document" URL="../Web Service/Private Content/Templates/Contacts/ViewAll.esp"/>
							<Item Name="ViewSwitches.esp" Type="Document" URL="../Web Service/Private Content/Templates/Contacts/ViewSwitches.esp"/>
						</Item>
						<Item Name="Favorites" Type="Folder">
							<Item Name="Select.esp" Type="Document" URL="../Web Service/Private Content/Templates/Favorites/Select.esp"/>
							<Item Name="ViewAll.esp" Type="Document" URL="../Web Service/Private Content/Templates/Favorites/ViewAll.esp"/>
						</Item>
					</Item>
				</Item>
				<Item Name="Startup VIs" Type="Startup VIs Container"/>
				<Item Name="Web Resources" Type="HTTP WebResources Container">
					<Item Name="GET.vi" Type="VI" URL="../Web Service/GET.vi">
						<Property Name="ws.buffered" Type="Bool">true</Property>
						<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
						<Property Name="ws.keepInMemory" Type="Bool">true</Property>
						<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
						<Property Name="ws.method" Type="Int">1</Property>
						<Property Name="ws.outputFormat" Type="Int">2</Property>
						<Property Name="ws.outputType" Type="Int">1</Property>
						<Property Name="ws.permissions" Type="Str"></Property>
						<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
						<Property Name="ws.type" Type="Int">1</Property>
						<Property Name="ws.uri" Type="Str"></Property>
						<Property Name="ws.useHeaders" Type="Bool">false</Property>
						<Property Name="ws.useStandardURL" Type="Bool">true</Property>
					</Item>
					<Item Name="Addmap.vi" Type="VI" URL="../Web Service/Addmap.vi">
						<Property Name="ws.buffered" Type="Bool">true</Property>
						<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
						<Property Name="ws.keepInMemory" Type="Bool">true</Property>
						<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
						<Property Name="ws.method" Type="Int">3</Property>
						<Property Name="ws.outputFormat" Type="Int">2</Property>
						<Property Name="ws.outputType" Type="Int">0</Property>
						<Property Name="ws.permissions" Type="Str"></Property>
						<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
						<Property Name="ws.type" Type="Int">1</Property>
						<Property Name="ws.uri" Type="Str"></Property>
						<Property Name="ws.useHeaders" Type="Bool">true</Property>
						<Property Name="ws.useStandardURL" Type="Bool">true</Property>
					</Item>
					<Item Name="AddCursor.vi" Type="VI" URL="../Web Service/AddCursor.vi">
						<Property Name="ws.buffered" Type="Bool">true</Property>
						<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
						<Property Name="ws.keepInMemory" Type="Bool">true</Property>
						<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
						<Property Name="ws.method" Type="Int">3</Property>
						<Property Name="ws.outputFormat" Type="Int">2</Property>
						<Property Name="ws.outputType" Type="Int">0</Property>
						<Property Name="ws.permissions" Type="Str"></Property>
						<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
						<Property Name="ws.type" Type="Int">1</Property>
						<Property Name="ws.uri" Type="Str"></Property>
						<Property Name="ws.useHeaders" Type="Bool">true</Property>
						<Property Name="ws.useStandardURL" Type="Bool">true</Property>
					</Item>
					<Item Name="GETmap.vi" Type="VI" URL="../Web Service/GETmap.vi">
						<Property Name="ws.buffered" Type="Bool">true</Property>
						<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
						<Property Name="ws.keepInMemory" Type="Bool">true</Property>
						<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
						<Property Name="ws.method" Type="Int">1</Property>
						<Property Name="ws.outputFormat" Type="Int">2</Property>
						<Property Name="ws.outputType" Type="Int">1</Property>
						<Property Name="ws.permissions" Type="Str"></Property>
						<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
						<Property Name="ws.type" Type="Int">1</Property>
						<Property Name="ws.uri" Type="Str"></Property>
						<Property Name="ws.useHeaders" Type="Bool">false</Property>
						<Property Name="ws.useStandardURL" Type="Bool">true</Property>
					</Item>
					<Item Name="GETCursor.vi" Type="VI" URL="../Web Service/GETCursor.vi">
						<Property Name="ws.buffered" Type="Bool">true</Property>
						<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
						<Property Name="ws.keepInMemory" Type="Bool">true</Property>
						<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
						<Property Name="ws.method" Type="Int">1</Property>
						<Property Name="ws.outputFormat" Type="Int">2</Property>
						<Property Name="ws.outputType" Type="Int">1</Property>
						<Property Name="ws.permissions" Type="Str"></Property>
						<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
						<Property Name="ws.type" Type="Int">1</Property>
						<Property Name="ws.uri" Type="Str"></Property>
						<Property Name="ws.useHeaders" Type="Bool">false</Property>
						<Property Name="ws.useStandardURL" Type="Bool">true</Property>
					</Item>
					<Item Name="AdditionalOperations" Type="HTTP WebResources Container">
						<Item Name="Sub.vi" Type="VI" URL="../Web Service/Sub.vi">
							<Property Name="ws.buffered" Type="Bool">true</Property>
							<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
							<Property Name="ws.keepInMemory" Type="Bool">true</Property>
							<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
							<Property Name="ws.method" Type="Int">1</Property>
							<Property Name="ws.outputFormat" Type="Int">2</Property>
							<Property Name="ws.outputType" Type="Int">0</Property>
							<Property Name="ws.permissions" Type="Str"></Property>
							<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
							<Property Name="ws.type" Type="Int">1</Property>
							<Property Name="ws.uri" Type="Str"></Property>
							<Property Name="ws.useHeaders" Type="Bool">true</Property>
							<Property Name="ws.useStandardURL" Type="Bool">true</Property>
						</Item>
					</Item>
					<Item Name="Trains" Type="HTTP WebResources Container">
						<Item Name="NewContact.vi" Type="VI" URL="../Web Service/NewContact.vi">
							<Property Name="ws.buffered" Type="Bool">true</Property>
							<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
							<Property Name="ws.keepInMemory" Type="Bool">true</Property>
							<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
							<Property Name="ws.method" Type="Int">3</Property>
							<Property Name="ws.outputFormat" Type="Int">2</Property>
							<Property Name="ws.outputType" Type="Int">1</Property>
							<Property Name="ws.permissions" Type="Str"></Property>
							<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
							<Property Name="ws.type" Type="Int">1</Property>
							<Property Name="ws.uri" Type="Str"></Property>
							<Property Name="ws.useHeaders" Type="Bool">true</Property>
							<Property Name="ws.useStandardURL" Type="Bool">true</Property>
						</Item>
						<Item Name="EditContact.vi" Type="VI" URL="../Web Service/EditContact.vi">
							<Property Name="ws.buffered" Type="Bool">true</Property>
							<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
							<Property Name="ws.keepInMemory" Type="Bool">true</Property>
							<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
							<Property Name="ws.method" Type="Int">3</Property>
							<Property Name="ws.outputFormat" Type="Int">2</Property>
							<Property Name="ws.outputType" Type="Int">1</Property>
							<Property Name="ws.permissions" Type="Str"></Property>
							<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
							<Property Name="ws.type" Type="Int">1</Property>
							<Property Name="ws.uri" Type="Str"></Property>
							<Property Name="ws.useHeaders" Type="Bool">true</Property>
							<Property Name="ws.useStandardURL" Type="Bool">true</Property>
						</Item>
						<Item Name="DeleteContact.vi" Type="VI" URL="../Web Service/DeleteContact.vi">
							<Property Name="ws.buffered" Type="Bool">true</Property>
							<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
							<Property Name="ws.keepInMemory" Type="Bool">true</Property>
							<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
							<Property Name="ws.method" Type="Int">3</Property>
							<Property Name="ws.outputFormat" Type="Int">2</Property>
							<Property Name="ws.outputType" Type="Int">1</Property>
							<Property Name="ws.permissions" Type="Str"></Property>
							<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
							<Property Name="ws.type" Type="Int">1</Property>
							<Property Name="ws.uri" Type="Str"></Property>
							<Property Name="ws.useHeaders" Type="Bool">true</Property>
							<Property Name="ws.useStandardURL" Type="Bool">true</Property>
						</Item>
						<Item Name="ViewContact.vi" Type="VI" URL="../Web Service/ViewContact.vi">
							<Property Name="ws.buffered" Type="Bool">true</Property>
							<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
							<Property Name="ws.keepInMemory" Type="Bool">true</Property>
							<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
							<Property Name="ws.method" Type="Int">1</Property>
							<Property Name="ws.outputFormat" Type="Int">2</Property>
							<Property Name="ws.outputType" Type="Int">1</Property>
							<Property Name="ws.permissions" Type="Str"></Property>
							<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
							<Property Name="ws.type" Type="Int">1</Property>
							<Property Name="ws.uri" Type="Str"></Property>
							<Property Name="ws.useHeaders" Type="Bool">true</Property>
							<Property Name="ws.useStandardURL" Type="Bool">true</Property>
						</Item>
						<Item Name="ViewAll.vi" Type="VI" URL="../Web Service/ViewAll.vi">
							<Property Name="ws.buffered" Type="Bool">true</Property>
							<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
							<Property Name="ws.keepInMemory" Type="Bool">true</Property>
							<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
							<Property Name="ws.method" Type="Int">1</Property>
							<Property Name="ws.outputFormat" Type="Int">2</Property>
							<Property Name="ws.outputType" Type="Int">1</Property>
							<Property Name="ws.permissions" Type="Str"></Property>
							<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
							<Property Name="ws.type" Type="Int">1</Property>
							<Property Name="ws.uri" Type="Str"></Property>
							<Property Name="ws.useHeaders" Type="Bool">true</Property>
							<Property Name="ws.useStandardURL" Type="Bool">true</Property>
						</Item>
					</Item>
					<Item Name="MonitorUpdate.vi" Type="VI" URL="../Web Service/MonitorUpdate.vi">
						<Property Name="ws.buffered" Type="Bool">true</Property>
						<Property Name="ws.includeNameInURL" Type="Bool">true</Property>
						<Property Name="ws.keepInMemory" Type="Bool">true</Property>
						<Property Name="ws.loadAtStartup" Type="Bool">true</Property>
						<Property Name="ws.method" Type="Int">1</Property>
						<Property Name="ws.outputFormat" Type="Int">2</Property>
						<Property Name="ws.outputType" Type="Int">1</Property>
						<Property Name="ws.permissions" Type="Str"></Property>
						<Property Name="ws.requireAPIKey" Type="Bool">false</Property>
						<Property Name="ws.type" Type="Int">1</Property>
						<Property Name="ws.uri" Type="Str"></Property>
						<Property Name="ws.useHeaders" Type="Bool">true</Property>
						<Property Name="ws.useStandardURL" Type="Bool">true</Property>
					</Item>
				</Item>
			</Item>
		</Item>
		<Item Name="Components" Type="Folder" URL="../Components">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Documentation" Type="Folder" URL="../Documentation">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Methods" Type="Folder" URL="../Methods">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Controls" Type="Folder" URL="../Controls">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="OC Files" Type="Folder" URL="../OC Files">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="builds" Type="Folder" URL="../builds">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Main.vi" Type="VI" URL="../Main.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="NI_WebServices.lvlib" Type="Library" URL="/&lt;vilib&gt;/wsapi/NI_WebServices.lvlib"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="Read From XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File.vi"/>
				<Item Name="Read From XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(array).vi"/>
				<Item Name="Open_Create_Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/Open_Create_Replace File.vi"/>
				<Item Name="compatFileDialog.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatFileDialog.vi"/>
				<Item Name="compatOpenFileOperation.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOpenFileOperation.vi"/>
				<Item Name="compatCalcOffset.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatCalcOffset.vi"/>
				<Item Name="ParseXMLFragments.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/ParseXMLFragments.vi"/>
				<Item Name="FindFirstTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindFirstTag.vi"/>
				<Item Name="FindEmptyElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindEmptyElement.vi"/>
				<Item Name="FindElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElement.vi"/>
				<Item Name="FindMatchingCloseTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindMatchingCloseTag.vi"/>
				<Item Name="FindCloseTagByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindCloseTagByName.vi"/>
				<Item Name="FindElementStartByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElementStartByName.vi"/>
				<Item Name="Read From XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(string).vi"/>
				<Item Name="Write to XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File.vi"/>
				<Item Name="Write to XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(string).vi"/>
				<Item Name="Write to XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(array).vi"/>
				<Item Name="Query Input Devices.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Query Input Devices.vi"/>
				<Item Name="ErrorDescriptions.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/ErrorDescriptions.vi"/>
				<Item Name="errorList.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/errorList.vi"/>
				<Item Name="Initialize Joystick.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Initialize Joystick.vi"/>
				<Item Name="mouseAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/mouseAcquire.vi"/>
				<Item Name="keyboardAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/keyboardAcquire.vi"/>
				<Item Name="joystickAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/joystickAcquire.vi"/>
				<Item Name="Acquire Input Data.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Acquire Input Data.vi"/>
				<Item Name="closeMouse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeMouse.vi"/>
				<Item Name="closeKeyboard.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeKeyboard.vi"/>
				<Item Name="closeJoystick.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeJoystick.vi"/>
				<Item Name="Close Input Device.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Close Input Device.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="FormatTime String.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/FormatTime String.vi"/>
				<Item Name="subElapsedTime.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/subElapsedTime.vi"/>
				<Item Name="LVPoint32TypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPoint32TypeDef.ctl"/>
				<Item Name="LVCursorListTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVCursorListTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_PID_pid.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/control/pid/NI_PID_pid.lvlib"/>
				<Item Name="NI_PID__prctrl compat.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/control/pid/NI_PID__prctrl compat.lvlib"/>
				<Item Name="lvpidtkt.dll" Type="Document" URL="/&lt;vilib&gt;/addons/control/pid/lvpidtkt.dll"/>
				<Item Name="LVRangeTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRangeTypeDef.ctl"/>
				<Item Name="Bit-array To Byte-array.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Bit-array To Byte-array.vi"/>
				<Item Name="Create Mask By Alpha.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Create Mask By Alpha.vi"/>
				<Item Name="Directory of Top Level VI.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Directory of Top Level VI.vi"/>
				<Item Name="Check Path.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Path.vi"/>
				<Item Name="Read PNG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/png.llb/Read PNG File.vi"/>
				<Item Name="FixBadRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/FixBadRect.vi"/>
				<Item Name="Draw Flattened Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Flattened Pixmap.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="MGI Is Runtime.vi" Type="VI" URL="/&lt;userlib&gt;/_MGI/Application Control/MGI Is Runtime.vi"/>
			</Item>
			<Item Name="ws_runtime.dll" Type="Document" URL="ws_runtime.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="lvinput.dll" Type="Document" URL="/&lt;resource&gt;/lvinput.dll"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="IR-ATC Installer" Type="Installer">
				<Property Name="Destination[0].name" Type="Str">IR-ATC</Property>
				<Property Name="Destination[0].parent" Type="Str">{3912416A-D2E5-411B-AFEE-B63654D690C0}</Property>
				<Property Name="Destination[0].tag" Type="Str">{4D2181AE-F3D8-4856-9CDA-A75A850EEA58}</Property>
				<Property Name="Destination[0].type" Type="Str">userFolder</Property>
				<Property Name="Destination[0].unlock" Type="Bool">true</Property>
				<Property Name="Destination[1].name" Type="Str">OC Files</Property>
				<Property Name="Destination[1].parent" Type="Str">{4D2181AE-F3D8-4856-9CDA-A75A850EEA58}</Property>
				<Property Name="Destination[1].tag" Type="Str">{B600E0D4-53EB-4A91-898B-C7F3E3DCF68B}</Property>
				<Property Name="Destination[1].type" Type="Str">userFolder</Property>
				<Property Name="Destination[1].unlock" Type="Bool">true</Property>
				<Property Name="Destination[2].name" Type="Str">Saved Data</Property>
				<Property Name="Destination[2].parent" Type="Str">{4D2181AE-F3D8-4856-9CDA-A75A850EEA58}</Property>
				<Property Name="Destination[2].tag" Type="Str">{21E80CC2-71A1-466C-AD85-CF34AE72DA42}</Property>
				<Property Name="Destination[2].type" Type="Str">userFolder</Property>
				<Property Name="Destination[2].unlock" Type="Bool">true</Property>
				<Property Name="Destination[3].name" Type="Str">TrainControl</Property>
				<Property Name="Destination[3].parent" Type="Str">{B600E0D4-53EB-4A91-898B-C7F3E3DCF68B}</Property>
				<Property Name="Destination[3].tag" Type="Str">{A4A626BE-DDDD-491C-BEB5-D1A88296BFA8}</Property>
				<Property Name="Destination[3].type" Type="Str">userFolder</Property>
				<Property Name="Destination[3].unlock" Type="Bool">true</Property>
				<Property Name="Destination[4].name" Type="Str">SwitchControl</Property>
				<Property Name="Destination[4].parent" Type="Str">{B600E0D4-53EB-4A91-898B-C7F3E3DCF68B}</Property>
				<Property Name="Destination[4].tag" Type="Str">{6BCA9E0C-CB06-402A-8F7C-2254B73B1EDB}</Property>
				<Property Name="Destination[4].type" Type="Str">userFolder</Property>
				<Property Name="Destination[4].unlock" Type="Bool">true</Property>
				<Property Name="DestinationCount" Type="Int">5</Property>
				<Property Name="DistPart[0].flavorID" Type="Str">DefaultFull</Property>
				<Property Name="DistPart[0].productID" Type="Str">{04FA86DB-2E87-4191-B966-8BE674BD6BA7}</Property>
				<Property Name="DistPart[0].productName" Type="Str">NI LabVIEW Runtime 2014 SP1 f11 (64-bit)</Property>
				<Property Name="DistPart[0].SoftDep[0].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[0].productName" Type="Str">NI ActiveX Container (64-bit)</Property>
				<Property Name="DistPart[0].SoftDep[0].upgradeCode" Type="Str">{1038A887-23E1-4289-B0BD-0C4B83C6BA21}</Property>
				<Property Name="DistPart[0].SoftDep[1].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[1].productName" Type="Str">NI Service Locator 17.0</Property>
				<Property Name="DistPart[0].SoftDep[1].upgradeCode" Type="Str">{B235B862-6A92-4A04-A8B2-6D71F777DE67}</Property>
				<Property Name="DistPart[0].SoftDep[10].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[10].productName" Type="Str">NI mDNS Responder 17.0</Property>
				<Property Name="DistPart[0].SoftDep[10].upgradeCode" Type="Str">{9607874B-4BB3-42CB-B450-A2F5EF60BA3B}</Property>
				<Property Name="DistPart[0].SoftDep[11].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[11].productName" Type="Str">NI Deployment Framework 2017</Property>
				<Property Name="DistPart[0].SoftDep[11].upgradeCode" Type="Str">{838942E4-B73C-492E-81A3-AA1E291FD0DC}</Property>
				<Property Name="DistPart[0].SoftDep[12].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[12].productName" Type="Str">NI Error Reporting 2017 (64-bit)</Property>
				<Property Name="DistPart[0].SoftDep[12].upgradeCode" Type="Str">{785BE224-E5B2-46A5-ADCB-55C949B5C9C7}</Property>
				<Property Name="DistPart[0].SoftDep[2].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[2].productName" Type="Str">NI System Web Server 14.5</Property>
				<Property Name="DistPart[0].SoftDep[2].upgradeCode" Type="Str">{FCF64B73-B7D4-4971-8F11-24BAF7CC3E6C}</Property>
				<Property Name="DistPart[0].SoftDep[3].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[3].productName" Type="Str">Math Kernel Libraries</Property>
				<Property Name="DistPart[0].SoftDep[3].upgradeCode" Type="Str">{3BDD0408-2F90-4B42-9777-5ED1D4BE67A8}</Property>
				<Property Name="DistPart[0].SoftDep[4].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[4].productName" Type="Str">NI Logos 5.9</Property>
				<Property Name="DistPart[0].SoftDep[4].upgradeCode" Type="Str">{5E4A4CE3-4D06-11D4-8B22-006008C16337}</Property>
				<Property Name="DistPart[0].SoftDep[5].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[5].productName" Type="Str">NI TDM Streaming 17.0</Property>
				<Property Name="DistPart[0].SoftDep[5].upgradeCode" Type="Str">{4CD11BE6-6BB7-4082-8A27-C13771BC309B}</Property>
				<Property Name="DistPart[0].SoftDep[6].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[6].productName" Type="Str">NI LabVIEW Web Server 2014 (64-bit)</Property>
				<Property Name="DistPart[0].SoftDep[6].upgradeCode" Type="Str">{0EBB88E3-7F03-48FD-BA42-29A1B3BEE0B1}</Property>
				<Property Name="DistPart[0].SoftDep[7].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[7].productName" Type="Str">NI LabVIEW Real-Time NBFifo 2014</Property>
				<Property Name="DistPart[0].SoftDep[7].upgradeCode" Type="Str">{4372F3E3-5935-4012-93AB-B6710CE24920}</Property>
				<Property Name="DistPart[0].SoftDep[8].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[8].productName" Type="Str">NI VC2008MSMs</Property>
				<Property Name="DistPart[0].SoftDep[8].upgradeCode" Type="Str">{FDA3F8BB-BAA9-45D7-8DC7-22E1F5C76315}</Property>
				<Property Name="DistPart[0].SoftDep[9].exclude" Type="Bool">false</Property>
				<Property Name="DistPart[0].SoftDep[9].productName" Type="Str">NI VC2010MSMs</Property>
				<Property Name="DistPart[0].SoftDep[9].upgradeCode" Type="Str">{EFBA6F9E-F934-4BD7-AC51-60CCA480489C}</Property>
				<Property Name="DistPart[0].SoftDepCount" Type="Int">13</Property>
				<Property Name="DistPart[0].upgradeCode" Type="Str">{9F8AFFE4-BC38-4169-A689-2A0236519330}</Property>
				<Property Name="DistPartCount" Type="Int">1</Property>
				<Property Name="INST_author" Type="Str">Personal use</Property>
				<Property Name="INST_autoIncrement" Type="Bool">true</Property>
				<Property Name="INST_buildLocation" Type="Path">../IR-ATC/builds/IR-ATC</Property>
				<Property Name="INST_buildLocation.type" Type="Str">relativeToCommon</Property>
				<Property Name="INST_buildSpecName" Type="Str">IR-ATC Installer</Property>
				<Property Name="INST_defaultDir" Type="Str">{6BCA9E0C-CB06-402A-8F7C-2254B73B1EDB}</Property>
				<Property Name="INST_productName" Type="Str">IR-ATC</Property>
				<Property Name="INST_productVersion" Type="Str">1.0.5</Property>
				<Property Name="InstSpecBitness" Type="Str">64-bit</Property>
				<Property Name="InstSpecVersion" Type="Str">14018027</Property>
				<Property Name="MSI_arpCompany" Type="Str">Personal use</Property>
				<Property Name="MSI_autoselectDrivers" Type="Bool">true</Property>
				<Property Name="MSI_distID" Type="Str">{4D4E8668-F1A1-4949-B177-5441A21BE564}</Property>
				<Property Name="MSI_osCheck" Type="Int">0</Property>
				<Property Name="MSI_upgradeCode" Type="Str">{572FF46F-2DF2-412A-A9F8-3EB2F8397C4D}</Property>
				<Property Name="RegDest[0].dirName" Type="Str">Software</Property>
				<Property Name="RegDest[0].dirTag" Type="Str">{DDFAFC8B-E728-4AC8-96DE-B920EBB97A86}</Property>
				<Property Name="RegDest[0].parentTag" Type="Str">2</Property>
				<Property Name="RegDestCount" Type="Int">1</Property>
				<Property Name="Source[0].dest" Type="Str">{4D2181AE-F3D8-4856-9CDA-A75A850EEA58}</Property>
				<Property Name="Source[0].File[0].dest" Type="Str">{4D2181AE-F3D8-4856-9CDA-A75A850EEA58}</Property>
				<Property Name="Source[0].File[0].name" Type="Str">IR-ATC.exe</Property>
				<Property Name="Source[0].File[0].Shortcut[0].destIndex" Type="Int">0</Property>
				<Property Name="Source[0].File[0].Shortcut[0].name" Type="Str">IR-ATC</Property>
				<Property Name="Source[0].File[0].Shortcut[0].subDir" Type="Str">IR-ATC</Property>
				<Property Name="Source[0].File[0].ShortcutCount" Type="Int">1</Property>
				<Property Name="Source[0].File[0].tag" Type="Str">{AF25B1A4-2A1F-4EC8-8F0C-E0E45F82142D}</Property>
				<Property Name="Source[0].FileCount" Type="Int">1</Property>
				<Property Name="Source[0].name" Type="Str">IR-ATC</Property>
				<Property Name="Source[0].tag" Type="Ref">/My Computer/Build Specifications/IR-ATC</Property>
				<Property Name="Source[0].type" Type="Str">EXE</Property>
				<Property Name="Source[1].dest" Type="Str">{6BCA9E0C-CB06-402A-8F7C-2254B73B1EDB}</Property>
				<Property Name="Source[1].name" Type="Str">.shrc</Property>
				<Property Name="Source[1].tag" Type="Ref">/My Computer/OC Files/SwitchControl/.shrc</Property>
				<Property Name="Source[1].type" Type="Str">File</Property>
				<Property Name="Source[2].dest" Type="Str">{6BCA9E0C-CB06-402A-8F7C-2254B73B1EDB}</Property>
				<Property Name="Source[2].name" Type="Str">ControlSwitch.lua</Property>
				<Property Name="Source[2].tag" Type="Ref">/My Computer/OC Files/SwitchControl/ControlSwitch.lua</Property>
				<Property Name="Source[2].type" Type="Str">File</Property>
				<Property Name="Source[3].dest" Type="Str">{A4A626BE-DDDD-491C-BEB5-D1A88296BFA8}</Property>
				<Property Name="Source[3].name" Type="Str">.shrc</Property>
				<Property Name="Source[3].tag" Type="Ref">/My Computer/OC Files/TrainControl/.shrc</Property>
				<Property Name="Source[3].type" Type="Str">File</Property>
				<Property Name="Source[4].dest" Type="Str">{A4A626BE-DDDD-491C-BEB5-D1A88296BFA8}</Property>
				<Property Name="Source[4].name" Type="Str">TrainControl.lua</Property>
				<Property Name="Source[4].tag" Type="Ref">/My Computer/OC Files/TrainControl/TrainControl.lua</Property>
				<Property Name="Source[4].type" Type="Str">File</Property>
				<Property Name="SourceCount" Type="Int">5</Property>
			</Item>
			<Item Name="IR-ATC" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{A2AB9038-A58F-4E51-BFA9-73886297AF73}</Property>
				<Property Name="App_INI_GUID" Type="Str">{1E88D36C-2F5D-4DF4-BA85-62D5ED4AA01D}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{31FBFE90-97D5-437C-9C4B-BDC7DCA1CEC9}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">IR-ATC</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToProject</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{F10C5506-3085-42E8-9692-79E869DE556E}</Property>
				<Property Name="Bld_version.build" Type="Int">3</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">IR-ATC.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/IR-ATC.exe</Property>
				<Property Name="Destination[0].path.type" Type="Str">relativeToProject</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/data</Property>
				<Property Name="Destination[1].path.type" Type="Str">relativeToProject</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Exe_iconItemID" Type="Ref">/My Computer/Documentation/ATC Icon.ico</Property>
				<Property Name="Source[0].itemID" Type="Str">{541D735E-4F28-4272-9EF6-CCB95800B41B}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Main.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">Personal use</Property>
				<Property Name="TgtF_fileDescription" Type="Str">IR-ATC</Property>
				<Property Name="TgtF_internalName" Type="Str">IR-ATC</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2020 Personal use</Property>
				<Property Name="TgtF_productName" Type="Str">IR-ATC</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{AF25B1A4-2A1F-4EC8-8F0C-E0E45F82142D}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">IR-ATC.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
