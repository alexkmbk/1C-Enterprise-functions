Function TranslateVI_EN_ByYandex(VietnameseText) 
	
	Try
		SSL = Undefined;
		Execute(" SSL = New OpenSSLSecureConnection( New WindowsClientCertificate(WindowsCertificateSelectMode.Авто), New WindowsCertificationAuthorityCertificates()); ");
		Connection = New HTTPConnection("translate.yandex.net",,,,,,SSL);	
		APIKey = <yours API key>;
		
		Request = New HTTPRequest("/api/v1.5/tr.json/translate?key=" + APIKey +  "&text=" + VietnameseText + "&lang=vi-en"); 
		
		Res = Connection.Get(Request);
		If Res.StatusCode = 200 Then
			Json = New JSONReader();
			Json.SetString(Res.GetBodyAsString("UTF-8"));
			Result = ReadJSON(Json);		
			
			If TypeOf(Result) = Type("Structure") AND TypeOf(Result.Text) = Type("Array") AND Result.Text.Count() > 0 Then
				
				Return TrimAll(Result.Text[0]);
				
			EndIf; 
		EndIf;		
	Except
	EndTry; 
	
	Return "";
	
EndFunction
