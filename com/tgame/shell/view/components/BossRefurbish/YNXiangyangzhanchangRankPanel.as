package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.ynShijiebei.YNshijiebeiRankRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class YNXiangyangzhanchangRankPanel extends FPanel
   {
      
      public static const UI_XIANGYANGZHANCHANG_RANK_LINGJIANG:String = "UI_XIANGYANGZHANCHANG_RANK_LINGJIANG";
      
      private var ft:FTextArea;
      
      private var btnLingqu:SecondButton;
      
      private var list:FList;
      
      private var line:Bitmap;
      
      private var ftMy:FTextArea;
      
      public function YNXiangyangzhanchangRankPanel()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("宋蒙战场荣誉值排行榜");
         this.showCloseButton = true;
         this.skin = "panel_btn";
         this.dragAble = true;
         width = 260;
         height = 365;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : *
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:Bitmap = null;
         _loc1_ = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         _loc1_.x = 10;
         _loc1_.y = 5;
         _loc1_.width = 240;
         _loc1_.height = 24;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.text = LanResManager.getLanCommonTextWords("排名");
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.filters = StaticValue.filter;
         this.ft.x = 25;
         this.ft.y = 8;
         this.ft.width = this.ft.textWidth + 10;
         this.ft.height = 25;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.text = LanResManager.getLanCommonTextWords("玩家名称");
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.filters = StaticValue.filter;
         this.ft.x = 70;
         this.ft.y = 8;
         this.ft.width = this.ft.textWidth + 10;
         this.ft.height = 25;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.text = LanResManager.getLanCommonTextWords("荣誉值");
         this.ft.textColor = StaticValue.BlUE20;
         this.ft.filters = StaticValue.filter;
         this.ft.x = 180;
         this.ft.y = 8;
         this.ft.width = this.ft.textWidth + 10;
         this.ft.height = 25;
         addChild(this.ft);
         this.list = new FList();
         this.list.itemRenderer = new YNshijiebeiRankRender();
         this.list.x = 12;
         this.list.y = 28;
         this.list.listWidth = 235;
         this.list.listHeight = 250;
         this.list.skin = "list";
         addChild(this.list);
         this.list.mouseChildren = false;
         this.line = new Bitmap();
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.line.x = 10;
         this.line.y = 307 - 30;
         this.line.width = 240;
         this.ftMy = new FTextArea();
         this.ftMy.text = LanResManager.getLanCommonTextWords("我的战场荣誉：");
         this.ftMy.textColor = StaticValue.BlUE20;
         this.ftMy.filters = StaticValue.filter;
         this.ftMy.x = 25;
         this.ftMy.y = 268;
         this.ftMy.width = 200;
         this.ftMy.height = 25;
         addChild(this.ftMy);
         this.btnLingqu = new SecondButton();
         this.btnLingqu.x = 100;
         this.btnLingqu.y = 355 - 60;
         this.btnLingqu.label = LanResManager.getLanCommonTextWords("领取奖励");
         this.btnLingqu.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnLingqu);
         this.btnLingqu.enabled = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnLingqu:
               dispatchEvent(new BaseEvent(UI_XIANGYANGZHANCHANG_RANK_LINGJIANG));
         }
      }
      
      public function setList(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.list.dataProvider = param1;
         if(param2 == 1)
         {
            this.btnLingqu.enabled = true;
         }
         else
         {
            this.btnLingqu.enabled = false;
         }
         var _loc5_:String = "";
         if(param4 == 0)
         {
            _loc5_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("【未上榜】") + "</font>";
         }
         else
         {
            _loc5_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("第") + String(param4) + LanResManager.getLanCommonTextWords("名") + "</font>";
         }
         this.ftMy.htmlText = LanResManager.getLanCommonTextWords("我的战场荣誉：") + String(param3) + "          " + _loc5_;
      }
   }
}

