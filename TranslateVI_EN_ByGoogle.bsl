// the idea - https://ctrlq.org/code/19909-google-translate-api
//
Function TranslateVI_EN_ByGoogle(VietnameseText) Export
	
	Try
		SSL = New OpenSSLSecureConnection(Undefined, Undefined);
		Connection = New HTTPConnection("script.google.com",,,,,,SSL);	
		Request = New HTTPRequest("/macros/s/<your gdocs macros ID>/exec?q=" + VietnameseText); // you shoul obtain the Id of your gdocs macros 
		
		Res = Connection.Get(Request);
		If Res.StatusCode = 200 Then
			Json = New JSONReader();
			Json.SetString(Res.GetBodyAsString("UTF-8"));
			Result = ReadJSON(Json);		
			
			If TypeOf(Result) = Type("Structure") Then					
				Return TrimAll(Result.translatedText);
			EndIf; 
		ElsIf Res.StatusCode = 302 Then
			
			URI = СтруктураURI(Res.Заголовки.Получить("Location"));
						
			Соединение = Новый HTTPСоединение(URI.Хост, URI.Порт,,,,,SSL);
			Запрос = Новый HTTPЗапрос(URI.ПутьНаСервере);
			Res =  Соединение.Получить(Запрос);
			If Res.StatusCode = 200 Then
				Json = New JSONReader();
				Json.SetString(Res.GetBodyAsString("UTF-8"));
				Result = ReadJSON(Json);		
				
				If TypeOf(Result) = Type("Structure") Then					
					Return TrimAll(Result.translatedText);
				EndIf; 
			EndIf;
		EndIf;		
	Except
	EndTry; 
	
	Return "";
	
EndFunction
