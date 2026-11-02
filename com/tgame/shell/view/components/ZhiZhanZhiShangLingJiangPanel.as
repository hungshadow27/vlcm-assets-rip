package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class ZhiZhanZhiShangLingJiangPanel extends FPanel
   {
      
      public static const UI_ZHIZHANZHISHANG_LINGJIANG:String = "UI_ZHIZHANZHISHANG_LINGJIANG";
      
      private var titleFta:FTextArea;
      
      private var allZhenYingFta:FTextArea;
      
      private var personFta:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var img:DisplayObject;
      
      public function ZhiZhanZhiShangLingJiangPanel()
      {
         super();
         this.dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 500;
         height = 175 + 50 + 35;
         this.titleText = LanResManager.getLanCommonTextWords("止战之殇领取奖励");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.titleFta = new FTextArea();
         this.titleFta.x = 255;
         this.titleFta.y = 10;
         this.titleFta.filters = StaticValue.filter;
         this.titleFta.width = 200;
         addChild(this.titleFta);
         this.allZhenYingFta = new FTextArea();
         this.allZhenYingFta.x = 205;
         this.allZhenYingFta.y = 60;
         this.allZhenYingFta.width = 280;
         this.allZhenYingFta.textColor = StaticValue.WHITE;
         this.allZhenYingFta.filters = StaticValue.filter;
         addChild(this.allZhenYingFta);
         this.personFta = new FTextArea();
         this.personFta.x = 350;
         this.personFta.y = 140;
         this.personFta.width = 160;
         this.personFta.filters = StaticValue.filter;
         this.personFta.textColor = StaticValue.GREEN;
         addChild(this.personFta);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
         addChild(this.okBtn);
         this.okBtn.x = 210;
         this.okBtn.y = 150 + 40 + 3;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_ZHIZHANZHISHANG_LINGJIANG));
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:String = param1 == 0 ? LanResManager.getLanCommonTextWords("红方") : LanResManager.getLanCommonTextWords("蓝方");
         var _loc9_:String = param1 == 1 ? LanResManager.getLanCommonTextWords("红方") : LanResManager.getLanCommonTextWords("蓝方");
         var _loc10_:String = param2 == 0 ? LanResManager.getLanCommonTextWords("胜利") : LanResManager.getLanCommonTextWords("失败");
         var _loc11_:String = param1 == 0 ? StaticValue.RED_HTML : StaticValue.BLUE_HTML;
         if(param2 == 0)
         {
            this.img = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/zhizhanzhishang/sheng.swf",183,182);
         }
         else
         {
            this.img = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/zhizhanzhishang/bai.swf",183,182);
         }
         this.titleFta.htmlText = "<textformat><font size=\'22\' color=\'" + _loc11_ + "\'>" + _loc8_ + _loc10_ + "</font></textformat>";
         this.allZhenYingFta.htmlText = "<textformat leading=\'10\'><font size=\'13\' color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc8_ + LanResManager.getLanCommonTextWords("斩杀") + _loc9_ + param3 + LanResManager.getLanCommonTextWords("人") + "<br>" + _loc8_ + LanResManager.getLanCommonTextWords("造成") + _loc9_ + param4 + LanResManager.getLanCommonTextWords("伤害") + "<br>" + _loc8_ + LanResManager.getLanCommonTextWords("获得擂鼓助威") + param5 + LanResManager.getLanCommonTextWords("次") + "</font></textformat>";
         var _loc12_:String = param7 != 0 ? LanResManager.getLanCommonTextWords("擂鼓助威：") + param7 + LanResManager.getLanCommonTextWords("次") + "<br>" : "";
         if(param6 !== -1)
         {
            _loc12_ += LanResManager.getLanCommonTextWords("个人成绩：") + param6 + LanResManager.getLanCommonTextWords("人");
         }
         this.personFta.htmlText = "<textformat leading=\'8\'><font size=\'13\' color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc12_ + "</font></textformat>";
         if(this.img != null && this.img.parent != null)
         {
            removeChild(this.img);
         }
         this.img.x = 8;
         this.img.y = 2;
         addChild(this.img);
      }
   }
}

