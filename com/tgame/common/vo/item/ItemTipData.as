package com.tgame.common.vo.item
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.specialItemTip.YouLongZhiRen;
   import com.tgame.manager.TextManager;
   import flash.display.Sprite;
   
   public class ItemTipData
   {
      
      public static const TYPE_1:int = 0;
      
      public static const TYPE_2:int = 1;
      
      public var _currentItem:BaseItem;
      
      private var _tipXML:XML;
      
      private var _itemTip:ItemTip;
      
      private var _type:int;
      
      private var _isAppendData:Boolean;
      
      private var _itemFace:ItemFace;
      
      private var id:int;
      
      public function ItemTipData(param1:BaseItem, param2:int = 0, param3:ItemFace = null)
      {
         super();
         this._type = param2;
         this._currentItem = param1;
         this._itemTip = new ItemTip();
         this._itemFace = param3;
         this.showItemLocalTip();
      }
      
      public function get isAppendData() : Boolean
      {
         return this._isAppendData;
      }
      
      public function get tipXML() : XML
      {
         return this._tipXML;
      }
      
      public function get showTip() : Sprite
      {
         this._itemTip.clear();
         return this._itemTip.getItemTip(this._tipXML);
      }
      
      public function set appendData(param1:Array) : void
      {
         var _loc2_:Goods = null;
         this._isAppendData = true;
         this._tipXML = null;
         this.showItemLocalTip();
         if(param1[8] == GameInstance.mainChar.id)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1[6]);
         }
         var _loc3_:GoodsRes = GoodsResManager.getGoodsRes(param1[7]);
         this.id = param1[7];
         if(Boolean(_loc3_) && (Boolean(_loc3_.kind == GoodsKind.K2 || _loc3_.kind == GoodsKind.K59)) || SpecialGoodsID.YN_SPECIALGOOD_WUGONG_ARR.indexOf(this.id) != -1)
         {
            if(SpecialGoodsID.YN_SPECIALGOOD_WUGONG_ARR.indexOf(this.id) == -1)
            {
               this.addData(this._tipXML,_loc3_,64,"#ffffff",[param1[0],param1[1],_loc2_]);
               this.addData(this._tipXML,_loc3_,65,"#ffffff",param1[20]);
               this.addData(this._tipXML,_loc3_,87,"#ffffff",[param1[2],param1[7],param1[4].is11Star]);
               this.addData(this._tipXML,_loc3_,1003,"#FF9A18",param1[33]);
               this.addData(this._tipXML,_loc3_,251,"#FF9A18",[param1[3],param1[7]]);
               this.addData(this._tipXML,_loc3_,273,"#FF9A18",param1[22]);
            }
            else
            {
               this.addData(this._tipXML,_loc3_,273,"#FF9A18",param1[22]);
            }
            if(SpecialGoodsID.YN_SPECIALGOOD_WUGONG_ARR.indexOf(this.id) == -1)
            {
               this.addData(this._tipXML,_loc3_,1000,"#FF9A18",param1[28]);
               this.addData(this._tipXML,_loc3_,1027,"#ff0000",param1[35]);
               this.addData(this._tipXML,_loc3_,272,"#FF9A18",param1[21]);
               this.addData(this._tipXML,_loc3_,998,"#FF9A18",param1[27]);
               this.addData(this._tipXML,_loc3_,274,"#FF9A18",param1[23]);
               this.addData(this._tipXML,_loc3_,252,"#FF9A18",param1[4]);
               this.addData(this._tipXML,_loc3_,275,"#FF9A18",param1[24]);
               this.addData(this._tipXML,_loc3_,271,"#FF9A18",param1[19]);
               this.addData(this._tipXML,_loc3_,253,"#FF9A18",[param1[5],param1[14],_loc2_]);
               this.addData(this._tipXML,_loc3_,265,"#FF9A18",[param1[11],param1[13]]);
               this.addData(this._tipXML,_loc3_,268,"#FF9A18",param1[15]);
               this.addData(this._tipXML,_loc3_,269,"#FF9A18",param1[16]);
               this.addData(this._tipXML,_loc3_,1006,"#FF9A18",param1[43]);
               this.addData(this._tipXML,_loc3_,999,"#ff0000",param1[25]);
               this.addData(this._tipXML,_loc3_,997,"#ff0000",param1[26]);
               this.addData(this._tipXML,_loc3_,1004,"#ff0000",param1[34]);
               this.addData(this._tipXML,_loc3_,1005,"#ff0000",param1[42]);
               this.addData(this._tipXML,_loc3_,1008,"#ff0000",param1[36]);
               this.addData(this._tipXML,_loc3_,1009,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1010,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1011,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1012,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1013,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1014,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1015,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1016,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1017,"#ff0000",param1[37]);
               this.addData(this._tipXML,_loc3_,1018,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1019,"#FF9A18",param1[38]);
               this.addData(this._tipXML,_loc3_,1020,"#ff0000",param1[39]);
               this.addData(this._tipXML,_loc3_,1021,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1022,"#ff0000",param1[40]);
               this.addData(this._tipXML,_loc3_,1023,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1024,"#ff0000",param1[41]);
               this.addData(this._tipXML,_loc3_,1025,"#FF9A18",param1[29]);
               this.addData(this._tipXML,_loc3_,1026,"#ff0000",param1[30]);
               this.addData(this._tipXML,_loc3_,1028,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1029,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1030,"#ff0000",param1[44]);
               this.addData(this._tipXML,_loc3_,1031,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1032,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1033,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1034,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1035,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1036,"#ff0000",param1[45]);
               this.addData(this._tipXML,_loc3_,1037,"#ff0000",param1[46]);
               this.addData(this._tipXML,_loc3_,1038,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1039,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1040,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1041,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1042,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1043,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1044,"#ff0000",param1[47]);
               this.addData(this._tipXML,_loc3_,1045,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1046,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1047,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1048,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1049,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1050,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1051,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1052,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1053,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1056,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1057,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1058,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1059,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1054,"#ff0000",param1[48]);
               this.addData(this._tipXML,_loc3_,1055,"#ff0000",param1[49]);
               this.addData(this._tipXML,_loc3_,1060,"#ff0000",param1[50]);
               this.addData(this._tipXML,_loc3_,1061,"#ff0000",param1[51]);
               this.addData(this._tipXML,_loc3_,1062,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1063,"#ff0000",param1[52]);
               this.addData(this._tipXML,_loc3_,1064,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1065,"#ff0000",param1[53]);
               this.addData(this._tipXML,_loc3_,1066,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1067,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1068,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1069,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1070,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1071,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1072,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1073,"#ff0000",param1[54]);
               this.addData(this._tipXML,_loc3_,1074,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1075,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1076,"#ff0000",param1[55]);
               this.addData(this._tipXML,_loc3_,1077,"#ff0000",param1[56]);
               this.addData(this._tipXML,_loc3_,1078,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1079,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1080,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1081,"#ff0000",param1[57]);
               this.addData(this._tipXML,_loc3_,1082,"#ff0000",param1[58]);
               this.addData(this._tipXML,_loc3_,1083,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1084,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1085,"#ff0000",param1[59]);
               this.addData(this._tipXML,_loc3_,1086,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1087,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1088,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1089,"#ff0000",param1[60]);
               this.addData(this._tipXML,_loc3_,1090,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1091,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1092,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1093,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1094,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1095,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1096,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1097,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1098,"#ff0000",param1[61]);
               this.addData(this._tipXML,_loc3_,1099,"#ff0000",param1[62]);
               this.addData(this._tipXML,_loc3_,1100,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1101,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1102,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1103,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1104,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1105,"#ff0000",param1[63]);
               this.addData(this._tipXML,_loc3_,1106,"#ff0000",param1[64]);
               this.addData(this._tipXML,_loc3_,1107,"#ff0000",param1[65]);
               this.addData(this._tipXML,_loc3_,1108,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1109,"#ff0000",param1[66]);
               this.addData(this._tipXML,_loc3_,1110,"#ff0000",param1[67]);
               this.addData(this._tipXML,_loc3_,1111,"#ff0000",param1[68]);
               this.addData(this._tipXML,_loc3_,1112,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1113,"#ff0000",param1[69]);
               this.addData(this._tipXML,_loc3_,1114,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1115,"#ff0000",param1[70]);
               this.addData(this._tipXML,_loc3_,1116,"#ff0000",param1[71]);
               this.addData(this._tipXML,_loc3_,1117,"#ff0000",param1[72]);
               this.addData(this._tipXML,_loc3_,1118,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1119,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1120,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1121,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1122,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1123,"#ff0000",param1[73]);
               this.addData(this._tipXML,_loc3_,1124,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1125,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1126,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1127,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1128,"#ff0000",param1[74]);
               this.addData(this._tipXML,_loc3_,1129,"#ff0000",param1[75]);
               this.addData(this._tipXML,_loc3_,1130,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1131,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1132,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1133,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1134,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1135,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1136,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1137,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1138,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1139,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1140,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1141,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1142,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1143,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1144,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1145,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1146,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1147,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1148,"#ff0000",param1[76]);
               this.addData(this._tipXML,_loc3_,1149,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1150,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1151,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1152,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1153,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1154,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1155,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1156,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1157,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1158,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1159,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1160,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1161,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1162,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1163,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1164,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1165,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1166,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1167,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1168,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1169,"#ff0000",param1[77]);
               this.addData(this._tipXML,_loc3_,1170,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1171,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1172,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1173,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1174,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1175,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1176,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1177,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1178,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1179,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1180,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1181,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1182,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1184,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1185,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1186,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1187,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1188,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1189,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1190,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1191,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1192,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1193,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1194,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1195,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1196,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1197,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1198,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1199,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1200,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1201,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1202,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1203,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1204,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1205,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1206,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1207,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1208,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1209,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1210,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1211,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1212,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1213,"#ff0000",param1[78]);
               this.addData(this._tipXML,_loc3_,1214,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1215,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1216,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1217,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1218,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1219,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1220,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1221,"#ff0000",param1[79]);
               this.addData(this._tipXML,_loc3_,1222,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1223,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1224,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1225,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1226,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1227,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1228,"#ff0000",param1[80]);
               this.addData(this._tipXML,_loc3_,1230,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1231,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1232,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1233,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1234,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1235,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1236,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1237,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1238,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1240,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1241,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1242,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1243,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1244,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1245,"#ff0000",param1[81]);
               this.addData(this._tipXML,_loc3_,1246,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1247,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1248,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1249,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1250,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1251,"#ff0000",param1[82]);
               this.addData(this._tipXML,_loc3_,1252,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1253,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1254,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1255,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1256,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1257,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1258,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1259,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1260,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1261,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1262,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1263,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1264,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1265,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1266,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1267,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1268,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1269,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1270,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1271,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1272,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1273,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1274,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1275,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1276,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1277,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1278,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1279,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1280,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1281,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1282,"#ff0000",param1[83]);
               this.addData(this._tipXML,_loc3_,1283,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1284,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1285,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1286,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1287,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1288,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1289,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1290,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1291,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1292,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1293,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1294,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1295,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1296,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1297,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1298,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1299,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1300,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1301,"#ff0000",param1[84]);
               this.addData(this._tipXML,_loc3_,1302,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1303,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1304,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1305,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1306,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1307,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1308,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1309,"#ff0000",param1[7]);
               this.addData(this._tipXML,_loc3_,1310,"#ff0000",param1[85]);
               this.addData(this._tipXML,_loc3_,1311,"#ff0000",param1[86]);
               this.addData(this._tipXML,_loc3_,1312,"#ff0000",param1[87]);
               this.addData(this._tipXML,_loc3_,1313,"#ff0000",param1[88]);
               this.addData(this._tipXML,_loc3_,1314,"#ff0000",param1[89]);
               this.addData(this._tipXML,_loc3_,1315,"#ff0000",param1[90]);
               this.addData(this._tipXML,_loc3_,1316,"#ff0000",param1[91]);
               this.addData(this._tipXML,_loc3_,1317,"#ff0000",param1[92]);
               this.addData(this._tipXML,_loc3_,1318,"#ff0000",param1[93]);
               this.addData(this._tipXML,_loc3_,1319,"#ff0000",param1[94]);
               this.addData(this._tipXML,_loc3_,1320,"#ff0000",param1[95]);
               this.addData(this._tipXML,_loc3_,1321,"#ff0000",param1[96]);
               this.addData(this._tipXML,_loc3_,1322,"#ff0000",param1[97]);
               this.addData(this._tipXML,_loc3_,1323,"#ff0000",param1[98]);
               this.addData(this._tipXML,_loc3_,1324,"#ff0000",param1[99]);
               this.addData(this._tipXML,_loc3_,1325,"#ff0000",param1[100]);
            }
         }
         var _loc4_:Object = param1[18];
         if(_loc4_ != null)
         {
            this.addData(this._tipXML,_loc3_,270,StaticValue.YELLOW_HTML,_loc4_.charName);
         }
         if(Boolean(param1[17]) && param1[17].attr != "")
         {
            this.addData(this._tipXML,_loc3_,263,StaticValue.WHITE_HTML,[_loc3_.gems_type,_loc3_.gems_value,param1[17]]);
         }
         if(param1[8] != 0)
         {
            if(GameInstance.mainCharData.attributeInfo.isNPCShopOpen)
            {
               this.addData(this._tipXML,_loc3_,260,StaticValue.GREEN_HTML,_loc2_);
            }
            this.addData(this._tipXML,_loc3_,254,"#8ea8d8",_loc2_);
         }
         else if(GameInstance.mainCharData.attributeInfo.isNPCShopOpen)
         {
            this.addData(this._tipXML,_loc3_,259,StaticValue.GREEN_HTML);
         }
         if(param1[9])
         {
            this.addData(this._tipXML,_loc3_,262,StaticValue.GREEN_HTML,param1[9]);
         }
         if(param1[10])
         {
            this.addData(this._tipXML,_loc3_,264,StaticValue.RED_HTML,param1[10]);
         }
         if(param1[12])
         {
            this.addData(this._tipXML,_loc3_,266,StaticValue.GREEN_HTML,[param1[12],param1[14]]);
         }
         if(param1[31])
         {
            this.addData(this._tipXML,_loc3_,1001,StaticValue.GREEN_HTML,param1[31]);
         }
         if(param1[32])
         {
            this.addData(this._tipXML,_loc3_,1002,StaticValue.RED_HTML,param1[32]);
         }
      }
      
      public function destroy() : void
      {
         this._itemTip = null;
         this._currentItem = null;
         this._tipXML = null;
      }
      
      public function showItemLocalTip() : void
      {
         var _loc1_:GoodsRes = null;
         var _loc2_:McBaseItem = null;
         var _loc3_:Goods = null;
         var _loc4_:Skill = null;
         var _loc5_:Buff = null;
         if(this._currentItem is McBaseItem)
         {
            _loc2_ = this._currentItem as McBaseItem;
            this._tipXML = this.getMcDataXML(_loc2_);
         }
         else if(this._currentItem is Goods && this._currentItem.position != -1)
         {
            if(this._tipXML == null)
            {
               _loc1_ = GoodsResManager.getGoodsRes(this._currentItem.id);
               if(!_loc1_)
               {
                  return;
               }
               this._tipXML = <data/>;
               if(this._type == TYPE_2)
               {
                  this.addData(this._tipXML,_loc1_,501);
               }
               this.addData(this._tipXML,_loc1_,4);
               this.addData(this._tipXML,_loc1_,255);
               switch(_loc1_.kind)
               {
                  case GoodsKind.K3:
                     this.addData(this._tipXML,_loc1_,66);
                     this.addData(this._tipXML,_loc1_,5);
                     this.addData(this._tipXML,_loc1_,257,StaticValue.WHITE_HTML,[_loc1_.drug_type,_loc1_.drug_value,_loc1_.use_desc]);
                     break;
                  case GoodsKind.K5:
                     this.addData(this._tipXML,_loc1_,66);
                     this.addData(this._tipXML,_loc1_,6);
                     this.addData(this._tipXML,_loc1_,5);
                     break;
                  case GoodsKind.K2:
                     this.addData(this._tipXML,_loc1_,258);
                     this.addData(this._tipXML,_loc1_,86);
                     this.addData(this._tipXML,_loc1_,66);
                     this.addData(this._tipXML,_loc1_,6);
                     this.addData(this._tipXML,_loc1_,5);
                     this.addData(this._tipXML,_loc1_,67);
                     this.addData(this._tipXML,_loc1_,68);
                     this.addData(this._tipXML,_loc1_,69);
                     this.addData(this._tipXML,_loc1_,70);
                     this.addData(this._tipXML,_loc1_,999);
                     this.addData(this._tipXML,_loc1_,997);
                     break;
                  case GoodsKind.K6:
                     this.addData(this._tipXML,_loc1_,66);
                     this.addData(this._tipXML,_loc1_,5);
                     this.addData(this._tipXML,_loc1_,263,StaticValue.WHITE_HTML,[_loc1_.gems_type,_loc1_.gems_value]);
                     break;
                  default:
                     this.addData(this._tipXML,_loc1_,66);
                     this.addData(this._tipXML,_loc1_,5);
               }
            }
         }
         else if(this._currentItem is Goods && (this._currentItem as Goods).roleID == -99)
         {
            _loc1_ = GoodsResManager.getGoodsRes(this._currentItem.id);
            if(!_loc1_)
            {
               return;
            }
            this._tipXML = <data/>;
            if(this._type == TYPE_2)
            {
               this.addData(this._tipXML,_loc1_,501);
            }
            this.addData(this._tipXML,_loc1_,4);
            _loc3_ = this._currentItem as Goods;
            this.addData(this._tipXML,_loc1_,255);
            switch(_loc1_.kind)
            {
               case GoodsKind.K3:
                  this.addData(this._tipXML,_loc1_,66);
                  this.addData(this._tipXML,_loc1_,5);
                  this.addData(this._tipXML,_loc1_,257,StaticValue.WHITE_HTML,[_loc1_.drug_type,_loc1_.drug_value,_loc1_.use_desc]);
                  break;
               case GoodsKind.K5:
                  this.addData(this._tipXML,_loc1_,66);
                  this.addData(this._tipXML,_loc1_,6);
                  this.addData(this._tipXML,_loc1_,5);
                  break;
               case GoodsKind.K2:
                  this.addData(this._tipXML,_loc1_,258);
                  this.addData(this._tipXML,_loc1_,86);
                  this.addData(this._tipXML,_loc1_,66);
                  this.addData(this._tipXML,_loc1_,6);
                  this.addData(this._tipXML,_loc1_,5);
                  this.addData(this._tipXML,_loc1_,67);
                  this.addData(this._tipXML,_loc1_,68);
                  this.addData(this._tipXML,_loc1_,69);
                  this.addData(this._tipXML,_loc1_,70);
                  this.addData(this._tipXML,_loc1_,999);
                  this.addData(this._tipXML,_loc1_,997);
            }
         }
         else if(this._currentItem is Skill)
         {
            _loc4_ = this._currentItem as Skill;
            this._tipXML = this.getSkillDataXML(_loc4_);
         }
         else if(this._currentItem is Buff)
         {
            _loc5_ = this._currentItem as Buff;
            this._tipXML = this.getBuffDataXML(_loc5_);
         }
      }
      
      private function addData(param1:XML, param2:GoodsRes, param3:int, param4:String = "#ffffff", param5:* = null) : XML
      {
         /*
          * Decompilation error
          * Timeout (1 minute) was reached
          * Instruction count: 95118
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to timeout");
      }
      
      private function getSingleXML(param1:XML, param2:String) : XML
      {
         var _loc3_:int = 0;
         var _loc4_:XMLList = null;
         var _loc5_:int = 0;
         _loc4_ = param1.children();
         _loc5_ = _loc4_.length();
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            if(param2 == _loc4_[_loc3_].@id)
            {
               return _loc4_[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      private function getSkillDataXML(param1:Skill) : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:MountSkill = null;
         var _loc7_:int = 0;
         if(param1.isLearn == 0 && param1.isOther == 0)
         {
            if(!(param1.res.wugong_type == 5 || param1.res.wugong_type == 6))
            {
               return this.showNoSkill(param1);
            }
         }
         if(Boolean(param1.res.wugong_type == 3 || param1.isAnqiSkill || param1.res.wugong_type == 5 || param1.res.wugong_type == 6 || param1.isGongJian == 1 || param1.isDanTian == 1 || OtherConst.isDanTianSkill(param1.id)) || Boolean(param1.res.wugong_type == 9) || param1.res.wugong_type == 16)
         {
            return this.showOtherSkill(param1);
         }
         _loc2_ = <data/>;
         _loc3_ = XML("<row id=\'4\' size=\'14\' txt=\'" + TextManager.getXMLText(param1.res.name) + "\' color=\'" + "#ffe21d" + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 255 + "\' txt=\'" + param1.res.id_ico_big + "\' color=\'" + "\' />");
         _loc2_.appendChild(_loc3_);
         if(param1.res.skilltype == 2 && (param1.res.wugong_type == 1 || param1.res.wugong_type == 2 || param1.res.wugong_type == 4))
         {
            _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"当前层数") + "： " + param1.level + LanResManager.getLanTextWords(this,"层") + "  \' color=\'" + StaticValue.GREEN_HTML + "\' />");
            _loc2_.appendChild(_loc3_);
         }
         if(param1.res.useway == 1)
         {
            if(param1.id != OtherConst.DEFAULT_SKILL_ID && param1.res.skilltype == 2 && param1.id != OtherConst.XIANGLONG_SKILL_ID_1 && param1.id != OtherConst.XIANGLONG_SKILL_ID_2 && param1.id != OtherConst.XIANGLONG_SKILL_ID_3 && param1.id != OtherConst.YIJINJING_SKILL_ID && param1.id != OtherConst.SHENZHAOJING_SKILL_ID && param1.id != OtherConst.LIUMAISHNEJIAN_SKILL_ID_1 && param1.id != OtherConst.LIUMAISHNEJIAN_SKILL_ID_2 && param1.id != OtherConst.LIUMAISHNEJIAN_SKILL_ID_3 && param1.id != OtherConst.LIUMAISHNEJIAN_SKILL_ID_4 && param1.id != OtherConst.LIUMAISHNEJIAN_SKILL_ID_5 && param1.id != OtherConst.LIUMAISHNEJIAN_SKILL_ID_6 && param1.id != OtherConst.LIUMAISHNEJIAN_SKILL_ID_7 && param1.id != OtherConst.SHENZHAOJING_SKILL_ID && param1.id != OtherConst.ANQIKAIFENG_SKILL_ID && param1.id != OtherConst.YUCHANDU_SKILL_ID && param1.id != OtherConst.XUEMOFUTI_SKILL_ID && param1.id != OtherConst.XIANGLONGPAOXIAO_SKILL_ID && param1.id != OtherConst.JINGMAINILIU_SKILL_ID && param1.id != OtherConst.JINCHANTUOQIAO_SKILL_ID && param1
            .id != OtherConst.ZHENWUQIJIEZHEN_SKILL_ID && param1.id != OtherConst.JINGANGFUMOQUAN_SKILL_ID && param1.id != OtherConst.JINGANGFUMOQUAN_DINGJI_SKILL_ID && param1.id != OtherConst.JINGANGFUMOQUAN_YINCANG_SKILL_ID && param1.id != OtherConst.LONGZHUA_SKILL_ID && param1.id != OtherConst.LONGZHUA_QIANGHUA_SKILL_ID && param1.res.wugong_type != 40 && param1.id != OtherConst.XIAOYAOYUFENG_SKILL_ID && param1.id != OtherConst.SHENXINGBAIBIAN_SKILL_ID && param1.id != OtherConst.SHENXINGBAIBIAN_SKILL_DINGJI_ID && param1.id != OtherConst.WUXINGQUAN_HUHESHUANGXING_SKILL_ID && param1.id != OtherConst.SKILL_ID_RULAISHENZHANG && param1.id != OtherConst.MOLINGZHIYUAN_SKILL_ID && param1.id != OtherConst.DINGCHANJUE_SKILL_ID && param1.id != OtherConst.YIHUAJIEMU_SKILL_ID && param1.id != OtherConst.SIWANGJINWU_SKILL_ID && param1.id != OtherConst.HUANGJINYINZHE_SKILL_ID && param1.id != OtherConst.XUANYUANGUPAO_SKILL_ID && param1.id != OtherConst.QUANSHENCHUDONG_SKILL_ID && param1.id != OtherConst.CIYUANYICHU_SKILL_ID && param1
            .id != OtherConst.KUNSHOUYUCHANG_SKILL_ID && param1.id != OtherConst.SHENJIANZHONG_SKILL_ID && param1.id != OtherConst.HANBINGZHANG_SKILL_ID && param1.id != OtherConst.JIANJI_SKILL_ID && param1.id != OtherConst.QIANLIZHIWAI_SKILL_ID && param1.id != OtherConst.XIDUNIZHUANJIUYIN_SKILL_ID && param1.id != OtherConst.JIANTIFENGYIN_SKILL_ID && param1.id != OtherConst.FOGUANGPUZHAO_SKILL_ID && param1.id != OtherConst.BUSIJINSHEN_SKILL_ID && param1.id != OtherConst.ZIFUDONGTIAN_SKILL_ID && param1.id != OtherConst.TIANYUYANMENG_SKILL_ID && param1.id != OtherConst.HUANGJINGONGCHENGNU_SKILL_ID && param1.id != OtherConst.ZHAOFENGYINDIE_SKILL_ID && param1.id != OtherConst.DIANLAO_SKILL_ID && param1.id != OtherConst.KAITIAN_SKILL_ID && param1.id != OtherConst.TAOHUAHUTI_SKILL_ID && param1.id != OtherConst.KUNXIANSHU_SKILL_ID && param1.id != OtherConst.HUANYINGFENSHEN_SKILL_ID && param1.id != OtherConst.SIWANGXUANYAN_SKILL_ID && param1.id != OtherConst.GUIYINGXIANZHONG_SKILL_ID && param1.id != OtherConst
            .JUEQINGMIJI_SKILL_ID && param1.id != OtherConst.ZIJINQIANKUN_SKILL_ID && param1.id != OtherConst.MEIRENJI_SKILL_ID && param1.id != OtherConst.LINGHUHUANHUA_SKILL_ID && param1.id != OtherConst.JINJIAZHANCHE_SKILL_ID && param1.id != OtherConst.TAIYUANJING_SKILL_ID && param1.id != OtherConst.ZHANLONGJUE_SKILL_ID && param1.id != OtherConst.ZHANLONGJUE_SKILL_ID1 && param1.id != OtherConst.ZHANLONGJUE_SKILL_ID2 && param1.id != OtherConst.ZHANLONGJUE_SKILL_ID3 && param1.id != OtherConst.ZHANLONGJUE_SKILL_ID4 && param1.id != OtherConst.GUIZHUA_SKILL_ID4 && param1.id != OtherConst.GUIZHUA_SKILL_ID5 && param1.id != OtherConst.GUIZHUA_SKILL_ID6 && param1.id != OtherConst.GUIZHUA_SKILL_ID7 && param1.id != OtherConst.GUIZHUA_SKILL_ID8 && param1.res.wugong_type != 62)
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"熟练度") + "： " + param1.shulianCurrent + "/" + param1.shulianTotal + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            if(param1.id != OtherConst.DEFAULT_SKILL_ID && param1.res.skilltype == 2 && param1.id !== OtherConst.ANQIKAIFENG_SKILL_ID && param1.res.wugong_type != 40 && param1.id != OtherConst.JINGANGFUMOQUAN_SKILL_ID && OtherConst.YN_SKILL_ID_ARR.indexOf(param1.id) == -1)
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"冷却间隔") + "： " + param1.getCoolingtime() / 1000 + LanResManager.getLanTextWords(this,"秒") + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            if(param1.res.depletion_parameter == 1)
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"消耗生命") + "： " + param1.res.depletion_value + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            else if(param1.res.depletion_parameter == 2)
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"消耗内力") + "： " + param1.skillWaste() + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            else if(param1.res.depletion_parameter == 3)
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanCommonTextWords("消耗体力") + "： " + param1.res.depletion_value + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            else if(param1.res.depletion_parameter != 4)
            {
               _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
         }
         else
         {
            _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"被动加成") + "\' color=\'" + StaticValue.BlUE20_HTML + "\' />");
            _loc2_.appendChild(_loc3_);
            _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
            _loc2_.appendChild(_loc3_);
            _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
            _loc2_.appendChild(_loc3_);
         }
         if(param1.res.skilltype == 1)
         {
            _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
            _loc2_.appendChild(_loc3_);
         }
         _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"描述信息") + "\' color=\'" + "#ffffff" + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'5\' txt=\'" + TextManager.getXMLText(param1.res.desc) + "\' color=\'" + StaticValue.ORANGE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         if(param1.id != OtherConst.DEFAULT_SKILL_ID && param1.res.skilltype == 2 && (param1.res.wugong_type == 1 || param1.res.wugong_type == 2 || param1.res.wugong_type == 4))
         {
            _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"提升条件") + "\' color=\'" + "#ffffff" + "\' />");
            _loc2_.appendChild(_loc3_);
            if(param1.studyLevel > 0)
            {
               if(GameInstance.mainCharData.attributeInfo.lv < param1.studyLevel)
               {
                  _loc3_ = XML("<row txt=\'" + "    " + LanResManager.getLanTextWords(this,"人物等级需求",[param1.studyLevel]) + "\' color=\'" + StaticValue.RED_HTML + "\' />");
                  _loc2_.appendChild(_loc3_);
               }
               else
               {
                  _loc3_ = XML("<row txt=\'" + "    " + LanResManager.getLanTextWords(this,"人物等级需求",[param1.studyLevel]) + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
                  _loc2_.appendChild(_loc3_);
               }
            }
            if(GameInstance.mainCharData.attributeInfo.gqNow < param1.zhenqi)
            {
               _loc3_ = XML("<row txt=\'" + "    " + LanResManager.getLanTextWords(this,"真气需求") + ":" + param1.zhenqi + "\' color=\'" + StaticValue.RED_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            else
            {
               _loc3_ = XML("<row txt=\'" + "    " + LanResManager.getLanTextWords(this,"真气需求") + ":" + param1.zhenqi + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            if(GameInstance.mainCharData.moneyInfo.copper < param1.copper)
            {
               _loc3_ = XML("<row txt=\'" + "    " + LanResManager.getLanTextWords(this,"铜钱需求") + ":" + param1.copper + "\' color=\'" + StaticValue.RED_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            else
            {
               _loc3_ = XML("<row txt=\'" + "    " + LanResManager.getLanTextWords(this,"铜钱需求") + ":" + param1.copper + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
         }
         if(param1.id != OtherConst.DEFAULT_SKILL_ID && param1.res.useway == 1 && param1.res.skilltype == 2 && (param1.res.wugong_type == 1 || param1.res.wugong_type == 2 || param1.res.wugong_type == 4))
         {
            _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"可在武功查看面板中提升") + "\' color=\'" + "#ffffff" + "\' />");
            _loc2_.appendChild(_loc3_);
         }
         else if(param1.res.useway == 2)
         {
            if(param1.res.skilltype == 2 && (param1.res.wugong_type == 1 || param1.res.wugong_type == 2 || param1.res.wugong_type == 4))
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"可在武功查看面板中提升") + "\' color=\'" + "#ffffff" + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"心法技能，无需使用默认生效") + "\' color=\'" + "#ffffff" + "\' />");
            _loc2_.appendChild(_loc3_);
         }
         if(param1 is MountSkill)
         {
            _loc5_ = [LanResManager.getLanCommonTextWords("为主人增加生命"),LanResManager.getLanCommonTextWords("为主人增加内力"),LanResManager.getLanCommonTextWords("为主人增加体力"),LanResManager.getLanCommonTextWords("为主人增加攻击"),LanResManager.getLanCommonTextWords("为主人增加防御"),LanResManager.getLanCommonTextWords("为主人增加暴击"),LanResManager.getLanCommonTextWords("为主人增加闪避"),LanResManager.getLanCommonTextWords("为主人增加攻击速度"),LanResManager.getLanCommonTextWords("为主人增加移动速度")];
            _loc6_ = param1 as MountSkill;
            if(_loc6_.lv > 0)
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanCommonTextWords("等级") + "：" + _loc6_.lv + LanResManager.getLanCommonTextWords("级") + "\' color=\'" + "#ffffff" + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            if(_loc6_.nowLvJianChengStr != "")
            {
               _loc4_ = _loc6_.nowLvJianChengStr.split(",");
               _loc7_ = 0;
               while(_loc7_ < _loc4_.length)
               {
                  if(_loc4_[_loc7_] != "0")
                  {
                     _loc3_ = XML("<row txt=\'" + _loc5_[_loc7_] + "：" + _loc4_[_loc7_] + "\' color=\'" + "#ffffff" + "\' />");
                     _loc2_.appendChild(_loc3_);
                  }
                  _loc7_++;
               }
            }
            if(_loc6_.nextLvUpUseZhenQi > 0)
            {
               _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanCommonTextWords("下一级需要铜币：") + _loc6_.nextLvUpUseCopper + "   " + LanResManager.getLanCommonTextWords("真气：") + _loc6_.nextLvUpUseZhenQi + LanResManager.getLanCommonTextWords("点。") + "\' color=\'" + "#ffffff" + "\' />");
               _loc2_.appendChild(_loc3_);
               _loc3_ = XML("<row txt=\'【" + TextManager.getXMLText(param1.res.name) + "】\' color=\'" + "#ffe21d" + "\' />");
               _loc2_.appendChild(_loc3_);
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanCommonTextWords("等级") + "：" + (_loc6_.lv + 1) + LanResManager.getLanCommonTextWords("级") + "\' color=\'" + "#ffffff" + "\' />");
               _loc2_.appendChild(_loc3_);
               if(_loc6_.nextLvJianChengStr != "")
               {
                  _loc4_ = _loc6_.nextLvJianChengStr.split(",");
                  _loc7_ = 0;
                  while(_loc7_ < _loc4_.length)
                  {
                     if(_loc4_[_loc7_] != "0")
                     {
                        _loc3_ = XML("<row txt=\'" + _loc5_[_loc7_] + "：" + _loc4_[_loc7_] + "\' color=\'" + "#ffffff" + "\' />");
                        _loc2_.appendChild(_loc3_);
                     }
                     _loc7_++;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      private function showNoSkill(param1:Skill) : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         _loc2_ = <data/>;
         _loc3_ = XML("<row id=\'4\' size=\'14\' txt=\'" + TextManager.getXMLText(param1.res.name) + "\' color=\'" + "#ffe21d" + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 255 + "\' txt=\'" + param1.res.id_ico_big + "\' color=\'" + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"尚未学会") + "\' color=\'" + StaticValue.RED_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"描述信息") + "\' color=\'" + "#ffffff" + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'5\' txt=\'" + TextManager.getXMLText(param1.res.desc) + "\' color=\'" + StaticValue.ORANGE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         if(param1.res.wugong_type == 1 || param1.res.wugong_type == 2 || param1.res.wugong_type == 4 || param1.res.learningBook != 0)
         {
            _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"学习条件") + "\' color=\'" + "#ffffff" + "\' />");
            _loc2_.appendChild(_loc3_);
            if(GameInstance.mainCharData.attributeInfo.lv < param1.studyLevel)
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"人物等级需求",[param1.studyLevel]) + "\' color=\'" + StaticValue.RED_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            else
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"人物等级需求",[param1.studyLevel]) + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
            _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"秘籍需求") + "：" + param1.res.getMijiName() + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
            _loc2_.appendChild(_loc3_);
         }
         _loc3_ = XML("<row txt=\'" + TextManager.getXMLText(param1.res.source) + "\' color=\'" + StaticValue.ORANGE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         return _loc2_;
      }
      
      private function showOtherSkill(param1:Skill) : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         _loc2_ = <data/>;
         _loc3_ = XML("<row id=\'4\' size=\'14\' txt=\'" + TextManager.getXMLText(param1.res.name) + "\' color=\'" + "#ffe21d" + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 255 + "\' txt=\'" + param1.res.id_ico_big + "\' color=\'" + "\' />");
         _loc2_.appendChild(_loc3_);
         if(param1.res.useway == 1)
         {
            _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"冷却间隔") + "：" + param1.getCoolingtime() / 1000 + LanResManager.getLanTextWords(this,"秒") + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
            _loc2_.appendChild(_loc3_);
            if(param1.res.depletion_parameter == 2)
            {
               _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"消耗内力") + "：" + param1.skillWaste() + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
               _loc2_.appendChild(_loc3_);
            }
         }
         _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"描述信息") + "\' color=\'" + "#ffffff" + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'5\' txt=\'" + TextManager.getXMLText(param1.res.desc) + "\' color=\'" + StaticValue.ORANGE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row txt=\'" + "  " + "\' color=\'" + StaticValue.GREEN_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         return _loc2_;
      }
      
      private function getBuffDataXML(param1:Buff) : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc2_ = <data/>;
         if(param1.id == OtherConst.YLZR_BUFF_ID)
         {
            _loc2_ = YouLongZhiRen.getItemTipXML(param1);
         }
         else
         {
            _loc3_ = XML("<row size=\'14\' txt=\'" + TextManager.getXMLText(param1.res.name) + "\' color=\'" + "#ffe21d" + "\' />");
            _loc2_.appendChild(_loc3_);
            _loc3_ = XML("<row txt=\'" + TextManager.getXMLText(param1.res.desc) + "\' color=\'" + "#ffffff" + "\' />");
            _loc2_.appendChild(_loc3_);
            _loc3_ = XML("<row txt=\'" + TextManager.getXMLText(param1.miaoShu) + "\' color=\'" + "#ff0000" + "\' />");
            _loc2_.appendChild(_loc3_);
            _loc3_ = XML("<row txt=\'" + TextManager.getXMLText(param1.miaoShu) + "\' color=\'" + "#ff0000" + "\' />");
            _loc2_.appendChild(_loc3_);
            if(this._itemFace)
            {
               _loc4_ = this._itemFace.getCDFace().getLosttime();
               if(_loc4_ > 0)
               {
                  _loc5_ = "";
                  _loc6_ = Math.floor(_loc4_ / 86400);
                  _loc7_ = Math.floor(_loc4_ % 86400 / 3600);
                  _loc8_ = Math.floor(_loc4_ % 86400 % 3600 / 60);
                  _loc9_ = Math.floor(_loc4_ % 86400 % 3600 % 60);
                  if(_loc6_ > 0)
                  {
                     _loc5_ += _loc6_ + LanResManager.getLanCommonTextWords("天");
                  }
                  if(_loc7_ > 0)
                  {
                     _loc5_ += _loc7_ + LanResManager.getLanCommonTextWords("时");
                  }
                  if(_loc8_ > 0)
                  {
                     _loc5_ += _loc8_ + LanResManager.getLanCommonTextWords("分");
                  }
                  if(_loc9_ > 0)
                  {
                     _loc5_ += _loc9_ + LanResManager.getLanCommonTextWords("秒");
                  }
                  if(param1.extraTime > 0)
                  {
                     _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"剩余加成时间") + _loc5_ + "\' color=\'" + "#ffffff" + "\' />");
                     _loc2_.appendChild(_loc3_);
                  }
                  else
                  {
                     _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"剩余时间") + _loc5_ + "\' color=\'" + "#ffffff" + "\' />");
                     _loc2_.appendChild(_loc3_);
                  }
               }
               if(param1.chuliang > 0)
               {
                  _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"剩余储量") + param1.chuliang + "\' color=\'" + "#ffffff" + "\' />");
                  _loc2_.appendChild(_loc3_);
               }
               if(param1.res.buff_flag == 3)
               {
                  if(param1.res.id_kind != 721563 && param1.res.id_kind != 721556 && param1.res.id_kind != 721575 && param1.res.id_kind != 721595 && param1.res.id_kind != 721616)
                  {
                     _loc3_ = XML("<row txt=\'" + LanResManager.getLanTextWords(this,"失效时间") + param1.vipTime + "\' color=\'" + "#ff0000" + "\' />");
                     _loc2_.appendChild(_loc3_);
                  }
               }
            }
         }
         return _loc2_;
      }
      
      private function getMcDataXML(param1:McBaseItem) : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         _loc2_ = <data/>;
         _loc4_ = 150;
         if(param1.quality == 1)
         {
            _loc5_ = StaticValue.HUISE_HTML;
         }
         else if(param1.quality == 2)
         {
            _loc5_ = StaticValue.WHITE_HTML;
         }
         else if(param1.quality == 3)
         {
            _loc5_ = StaticValue.BLUE_HTML;
         }
         else if(param1.quality == 4)
         {
            _loc5_ = StaticValue.GREEN_HTML;
         }
         else if(param1.quality == 5)
         {
            _loc5_ = StaticValue.PURPLE_HTML;
         }
         else if(param1.quality == 6)
         {
            _loc5_ = StaticValue.YELLOW_HTML;
         }
         _loc3_ = XML("<row size=\'14\' txt=\'" + param1.name + " Lv." + param1.dengji + "\' color=\'" + _loc5_ + "\' width=\'" + _loc4_ + "\' />");
         _loc2_.appendChild(_loc3_);
         if(param1.dangqianJingyan != -1)
         {
            _loc3_ = XML("<row size=\'14\' txt=\'" + param1.dangqianJingyan + "/" + param1.zuidaJingyan + "\' color=\'" + StaticValue.WHITE_HTML + "\' width=\'" + _loc4_ + "\' />");
            _loc2_.appendChild(_loc3_);
         }
         if(param1.miaoshu != "")
         {
            _loc6_ = param1.miaoshu.split(",");
            _loc7_ = "";
            if(_loc6_[0] == 25 || _loc6_[0] == 31 || _loc6_[0] == 32 || _loc6_[0] == 33 || _loc6_[0] == 34)
            {
               _loc7_ = "%";
               _loc6_[1] /= 100;
            }
            _loc3_ = XML("<row size=\'14\' txt=\'" + ItemTip.fightAttr["a" + _loc6_[0]] + "  +" + _loc6_[1] + _loc7_ + "\' color=\'" + StaticValue.GREEN_HTML + "\' width=\'" + _loc4_ + "\' />");
            _loc2_.appendChild(_loc3_);
         }
         if(param1.jiage != -1)
         {
            _loc3_ = XML("<row size=\'14\' txt=\'" + LanResManager.getLanCommonTextWords("价格") + " " + param1.jiage + "\' color=\'" + StaticValue.WHITE_HTML + "\' width=\'" + _loc4_ + "\' />");
            _loc2_.appendChild(_loc3_);
         }
         return _loc2_;
      }
   }
}

