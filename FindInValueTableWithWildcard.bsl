// Выполняет поиск в таблице значений, в заданной колонке
// по значению, содержащему символы * (wildcard)
// 
Function FindInValueTableWithWildcard(Table, val Value, ColumnName)
	If StrFind(Value, "*") = 0 Then
		Return Table.Find(Value, ColumnName);
	Else
		// Is wildcard                                                  
		// Заменим символы * на .* чтобы работала регулярка
		Value = StrReplaceByRegularExpression(Value, "(?<!\.)\*", ".*");
		For Each Item In Table Do
			Res = StrFindByRegularExpression(Item[ColumnName], Value,,,,true,false);
			If ValueIsFilled(Res.Value) Then
				Return Item;
			EndIf;
		EndDo;
	EndIf;	            
	Return Undefined;
EndFunction
