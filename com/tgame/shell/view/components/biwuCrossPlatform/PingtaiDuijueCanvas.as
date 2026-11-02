package com.tgame.shell.view.components.biwuCrossPlatform
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class PingtaiDuijueCanvas extends Sprite
   {
      
      private var ft:FTextArea;
      
      private var txt_time:FTextArea;
      
      public var $parent:DisplayObject;
      
      private var bg:DisplayObject;
      
      private var gongImg:DisplayObject;
      
      private var gongImg2:DisplayObject;
      
      private var gongImg3:DisplayObject;
      
      private var gongImg4:DisplayObject;
      
      public function PingtaiDuijueCanvas()
      {
         super();
         this.bg = StaticValue.getBitmapByClassName("ui.biwuDahui.kuapingtai.bg");
         this.bg.x = 0;
         this.bg.y = 0;
         addChild(this.bg);
         this.txt_time = new FTextArea();
         this.txt_time.filters = StaticValue.filter;
         this.txt_time.textColor = StaticValue.GREEN;
         this.txt_time.width = 311;
         this.txt_time.height = 30;
         this.txt_time.wordWrap = true;
         this.txt_time.htmlText = "";
         addChild(this.txt_time);
         this.txt_time.x = 230;
         this.txt_time.y = 150;
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 260;
         this.ft.wordWrap = true;
         this.ft.width = 300;
         this.ft.filters = StaticValue.filter;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("欢迎战斗力40000以上的玩家积极备战！");
         this.ft.setTextFormat(new TextFormat(null,15));
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 300;
         this.ft.wordWrap = true;
         this.ft.width = 570;
         this.ft.filters = StaticValue.filter;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("还在感叹高处不胜寒吗？还为难逢对手而感到遗憾吗？想与其他平台的好手一较高下吗？想证明自己的实力吗？跨平台比武大会，打破网络壁垒，国内众多平台高手汇聚，来吧，战个痛快！");
         this.ft.setTextFormat(new TextFormat(null,13));
         addChild(this.ft);
      }
      
      public function setData(param1:String, param2:String) : void
      {
         this.txt_time.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("对决日期：") + param1 + "</textformat>";
         var _loc3_:Array = param2.split(",");
         if(_loc3_.length >= 2)
         {
            if(this.gongImg != null && this.gongImg.parent != null)
            {
               removeChild(this.gongImg);
            }
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/biwudahuiKPT/" + _loc3_[0] + "_big.png",220,80);
            if(this.gongImg)
            {
               addChild(this.gongImg);
            }
            if(this.gongImg2 != null && this.gongImg2.parent != null)
            {
               removeChild(this.gongImg2);
            }
            this.gongImg2 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/biwudahuiKPT/" + _loc3_[1] + "_big.png",220,80);
            if(this.gongImg2)
            {
               addChild(this.gongImg2);
            }
            if(this.gongImg)
            {
               this.gongImg.x = 40;
               this.gongImg.y = 80;
            }
            if(this.gongImg2)
            {
               this.gongImg2.x = 350;
               this.gongImg2.y = 75;
            }
         }
         if(_loc3_.length >= 4)
         {
            if(this.gongImg3 != null && this.gongImg3.parent != null)
            {
               removeChild(this.gongImg3);
            }
            this.gongImg3 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/biwudahuiKPT/" + _loc3_[2] + "_big.png",220,80);
            if(!this.gongImg3)
            {
            }
            if(this.gongImg4 != null && this.gongImg4.parent != null)
            {
               removeChild(this.gongImg4);
            }
            this.gongImg4 = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/biwudahuiKPT/" + _loc3_[2] + "_big.png",220,80);
            if(!this.gongImg4)
            {
            }
            if(this.gongImg)
            {
               this.gongImg.x = 40;
               this.gongImg.y = 30;
            }
            if(this.gongImg2)
            {
               this.gongImg2.x = 350;
               this.gongImg2.y = 25;
            }
            if(this.gongImg3)
            {
               this.gongImg3.x = 40;
               this.gongImg3.y = 160;
            }
            if(this.gongImg4)
            {
               this.gongImg4.x = 350;
               this.gongImg4.y = 155;
            }
         }
      }
   }
}

