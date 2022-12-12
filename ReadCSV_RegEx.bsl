Function ReadCSV_RegEx(FileName, ColumnsCount, Separator=";", SkipFirstRows = 0)
	
	Res = New ValueTable;

	For ColNum = 1 To ColumnsCount Do
		Res.Columns.Add("Column"+ColNum,  New TypeDescription("String"));
	EndDo;
	
	TextDoc = New TextDocument;
	TextDoc.Read(FileName, TextEncoding.UTF8);
	
	ColNum = 0;
	RowNum = 0;
	NewRow = Undefined;
	
	RegExp = New COMObject("VBScript.RegExp");
	
	RegExp.IgnoreCase = False;
	RegExp.Global = True; 
	
	RegExp.Pattern = "(?:,|\n|^)(""(?:(?:"""")*[^""]*)*""|[^"",\n]*|(?:\n|$))";  
	Matches=RegExp.Execute(TextDoc.GetText());
	If Matches.Count() > 0 Then
		NewRow = Res.Add();
		For Each Item In Matches Do
			ColNum = ColNum + 1;
			If ColNum > ColumnsCount Then				
				RowNum = RowNum + 1;
				ColNum = 1;									
				If SkipFirstRows > 0 AND RowNum <= SkipFirstRows Then
					continue;
				EndIf; 	
				NewRow = Res.Add();
			EndIf; 
			
			If SkipFirstRows > 0 AND RowNum  <= SkipFirstRows Then
				continue;
			EndIf; 				
			
			Value = Item.SubMatches.Item(0);
			If left(Value, 1) = """" AND Right(Value, 1) = """" Then
				Value = Mid(Value, 2, StrLen(Value) - 2);
			EndIf; 
			NewRow[ColNum -1] = StrReplace(Value, """""", """");
		EndDo; 
	EndIf; 	
		
	Return Res; 
EndFunction

