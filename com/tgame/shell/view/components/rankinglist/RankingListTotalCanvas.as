package com.tgame.shell.view.components.rankinglist
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class RankingListTotalCanvas extends Sprite
   {
      
      public var bg:Bitmap;
      
      private var text1:FTextArea;
      
      private var text2:FTextArea;
      
      private var text3:FTextArea;
      
      private var text4:FTextArea;
      
      public function RankingListTotalCanvas()
      {
         super();
         addChild(StaticValue.getBitmapByClassName("ui.rankinglist.total.bg"));
         this.bg = new Bitmap();
         this.bg.name = "ui.rankinglist.total.bg";
         addChild(this.bg);
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.leading = "10";
         var _loc2_:FTextArea = new FTextArea();
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.filters = StaticValue.filter;
         _loc2_.defaultTextFormat = _loc1_;
         _loc2_.autoSize = TextFormatAlign.LEFT;
         _loc2_.x = 10;
         _loc2_.y = 54;
         _loc2_.text = LanResManager.getLanTextWords(this,"全部排行榜名称") + "\n" + LanResManager.getLanCommonTextWords("神圣战斗力");
         addChild(_loc2_);
         var _loc3_:FLabel = new FLabel();
         _loc3_.textColor = StaticValue.BlUE20;
         _loc3_.filters = StaticValue.filter;
         _loc3_.x = 86;
         _loc3_.y = 26;
         _loc3_.text = LanResManager.getLanTextWords(this,"江湖榜");
         addChild(_loc3_);
         this.text1 = new FTextArea();
         this.text1.textColor = StaticValue.WHITE;
         this.text1.filters = StaticValue.filter;
         this.text1.defaultTextFormat = _loc1_;
         this.text1.autoSize = TextFormatAlign.LEFT;
         this.text1.x = 86;
         this.text1.y = 54;
         addChild(this.text1);
         _loc3_ = new FLabel();
         _loc3_.textColor = StaticValue.BlUE20;
         _loc3_.filters = StaticValue.filter;
         _loc3_.x = 160;
         _loc3_.y = 26;
         _loc3_.text = LanResManager.getLanTextWords(this,"同级榜");
         addChild(_loc3_);
         this.text2 = new FTextArea();
         this.text2.textColor = StaticValue.WHITE;
         this.text2.filters = StaticValue.filter;
         this.text2.defaultTextFormat = _loc1_;
         this.text2.autoSize = TextFormatAlign.LEFT;
         this.text2.x = 160;
         this.text2.y = 54;
         addChild(this.text2);
         _loc2_ = new FTextArea();
         _loc2_.textColor = StaticValue.ORANGE;
         _loc2_.filters = StaticValue.filter;
         _loc2_.defaultTextFormat = _loc1_;
         _loc2_.autoSize = TextFormatAlign.LEFT;
         _loc2_.x = 222;
         _loc2_.y = 54;
         _loc2_.text = LanResManager.getLanTextWords(this,"全部排行榜名称2") + "\n" + LanResManager.getLanCommonTextWords("战斗力排行");
         addChild(_loc2_);
         _loc3_ = new FLabel();
         _loc3_.textColor = StaticValue.BlUE20;
         _loc3_.filters = StaticValue.filter;
         _loc3_.x = 298;
         _loc3_.y = 26;
         _loc3_.text = LanResManager.getLanTextWords(this,"江湖榜");
         addChild(_loc3_);
         this.text3 = new FTextArea();
         this.text3.textColor = StaticValue.WHITE;
         this.text3.filters = StaticValue.filter;
         this.text3.defaultTextFormat = _loc1_;
         this.text3.autoSize = TextFormatAlign.LEFT;
         this.text3.x = 298;
         this.text3.y = 54;
         addChild(this.text3);
         _loc3_ = new FLabel();
         _loc3_.textColor = StaticValue.BlUE20;
         _loc3_.filters = StaticValue.filter;
         _loc3_.x = 370;
         _loc3_.y = 26;
         _loc3_.text = LanResManager.getLanTextWords(this,"同级榜");
         addChild(_loc3_);
         this.text4 = new FTextArea();
         this.text4.textColor = StaticValue.WHITE;
         this.text4.filters = StaticValue.filter;
         this.text4.defaultTextFormat = _loc1_;
         this.text4.autoSize = TextFormatAlign.LEFT;
         this.text4.x = 370;
         this.text4.y = 54;
         addChild(this.text4);
      }
      
      public function setStatisticsData(param1:Array, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         var _loc5_:String = "";
         var _loc6_:String = "";
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc3_ % 2 == 0)
            {
               if(param1[_loc3_] == -1)
               {
                  _loc5_ += "\n";
               }
               else
               {
                  _loc5_ += LanResManager.getLanTextWords(this,"名次",[param1[_loc3_]]);
               }
            }
            else if(param1[_loc3_] == -1)
            {
               _loc6_ += "\n";
            }
            else
            {
               _loc6_ += LanResManager.getLanTextWords(this,"名次",[param1[_loc3_]]);
            }
            _loc3_++;
         }
         this.text1.text = _loc5_;
         this.text2.text = _loc6_;
         _loc4_ = int(param2.length);
         var _loc7_:String = "";
         var _loc8_:String = "";
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc3_ % 2 == 0)
            {
               if(param2[_loc3_] == -1)
               {
                  _loc7_ += "\n";
               }
               else
               {
                  _loc7_ += LanResManager.getLanTextWords(this,"名次",[param2[_loc3_]]);
               }
            }
            else if(param2[_loc3_] == -1)
            {
               _loc8_ += "\n";
            }
            else
            {
               _loc8_ += LanResManager.getLanTextWords(this,"名次",[param2[_loc3_]]);
            }
            _loc3_++;
         }
         this.text3.text = _loc7_;
         this.text4.text = _loc8_;
      }
   }
}

