// Transliteration from Vietnamese text to Latin chars only text
//
Function Translit_VN_LAT(VietText) Export
	
	Mapinfo = New Map;
	Mapinfo.Insert("A", "A");
	Mapinfo.Insert("Ă", "A");
	Mapinfo.Insert("Â", "A");
	Mapinfo.Insert("Ạ", "A");
	Mapinfo.Insert("Ặ", "A");
	Mapinfo.Insert("Ậ", "A");
	
	Mapinfo.Insert("À", "A");
	Mapinfo.Insert("Ằ", "A");
	Mapinfo.Insert("Ầ", "A");
	Mapinfo.Insert("È", "E");
	Mapinfo.Insert("Ề", "E");
	Mapinfo.Insert("Ì", "I");
	Mapinfo.Insert("Ò", "O");
	Mapinfo.Insert("Ồ", "O");
	Mapinfo.Insert("Ờ", "O");
	Mapinfo.Insert("Ù", "U");
	Mapinfo.Insert("Ừ", "U");
	Mapinfo.Insert("Ỳ", "Y");
	Mapinfo.Insert("Ỳ", "Y");
	
	Mapinfo.Insert("Á", "A");
	Mapinfo.Insert("Ắ", "A");
	Mapinfo.Insert("Ấ", "A");
	Mapinfo.Insert("É", "E");
	Mapinfo.Insert("Ế", "E");
	Mapinfo.Insert("Í", "I");
	Mapinfo.Insert("Ó", "O");
	Mapinfo.Insert("Ố", "O");
	Mapinfo.Insert("Ớ", "O");
	Mapinfo.Insert("Ú", "U");
	Mapinfo.Insert("Ứ", "U");
	Mapinfo.Insert("Ý", "Y");
	
	Mapinfo.Insert("Ả", "A");
	Mapinfo.Insert("Ẳ", "A");
	Mapinfo.Insert("Ẩ", "A");
	Mapinfo.Insert("Ẻ", "E");
	Mapinfo.Insert("Ể", "E");
	Mapinfo.Insert("Ỉ", "I");
	Mapinfo.Insert("Ỏ", "O");
	Mapinfo.Insert("Ổ", "O");
	Mapinfo.Insert("Ở", "O");
	Mapinfo.Insert("Ủ", "U");
	Mapinfo.Insert("Ử", "U");
	Mapinfo.Insert("Ỷ", "Y");	
	
	Mapinfo.Insert("Ã", "A");
	Mapinfo.Insert("Ẵ", "A");
	Mapinfo.Insert("Ẫ", "A");
	Mapinfo.Insert("Ẽ", "E");
	Mapinfo.Insert("Ễ", "E");
	Mapinfo.Insert("Ĩ", "I");
	Mapinfo.Insert("Õ", "O");
	Mapinfo.Insert("Ỗ", "O");
	Mapinfo.Insert("Ỡ", "O");
	Mapinfo.Insert("Ỡ", "O");
	Mapinfo.Insert("Ũ", "U");
	Mapinfo.Insert("Ữ", "U");
	Mapinfo.Insert("Ỹ", "Y");
	Mapinfo.Insert("Ỹ", "Y");
		
	Mapinfo.Insert("Ẹ", "E");
	Mapinfo.Insert("Ệ", "E");
	Mapinfo.Insert("Ị", "I");
	Mapinfo.Insert("Ọ", "O");
	Mapinfo.Insert("Ộ", "O");
	Mapinfo.Insert("Ợ", "O");
	Mapinfo.Insert("Ụ", "U");
	Mapinfo.Insert("Ự", "U");
	Mapinfo.Insert("Ỵ", "Y");
	
	Mapinfo.Insert("B", "B");
	Mapinfo.Insert("C", "C");
	Mapinfo.Insert("D", "D");
	Mapinfo.Insert("Đ", "D");
	Mapinfo.Insert("E", "E");
	Mapinfo.Insert("Ê", "E");
	Mapinfo.Insert("G", "G");
	Mapinfo.Insert("H", "H");
	Mapinfo.Insert("I", "I");
	Mapinfo.Insert("K", "K");
	Mapinfo.Insert("L", "L");
	Mapinfo.Insert("M", "M");
	Mapinfo.Insert("N", "N");
	Mapinfo.Insert("O", "O");
	Mapinfo.Insert("Ô", "O");
	Mapinfo.Insert("Ơ", "O");
	Mapinfo.Insert("P", "P");
	Mapinfo.Insert("Q", "Q");
	Mapinfo.Insert("R", "R");
	Mapinfo.Insert("S", "S");
	Mapinfo.Insert("T", "T");
	Mapinfo.Insert("U", "U");
	Mapinfo.Insert("Ư", "U");
	Mapinfo.Insert("V", "V");
	Mapinfo.Insert("X", "X");
	Mapinfo.Insert("Y", "Y");
	
	Res = "";
	Len = StrLen(VietText);
	For i = 1 To Len Do
		Char = Mid(VietText, i, 1);
		ResChar = MapInfo.Get(Char);
		If ResChar = Undefined AND Char <> Upper(Char) Then
			ResChar = MapInfo.Get(Upper(Char));
			If ResChar <> Undefined Then
				ResChar = Lower(ResChar);
			EndIf; 
		EndIf; 
		If ResChar = Undefined Then
			ResChar = Char;
		EndIf; 
		Res = Res + ResChar;
	EndDo;
	
	Return Res;
	
EndFunction