package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class HuangTuBaYeChaKanXinXiPanel extends FPanel
   {
      
      public static const UI_HUANGTUBAYE_CHAKAN_FANYE:String = "UI_HUANGTUBAYE_CHAKAN_FANYE";
      
      public static const UI_HUANGTUBAYE_CHENGCHISHIZHI_FANYE:String = "UI_HUANGTUBAYE_CHENGCHISHIZHI_FANYE";
      
      public var $parent:DisplayObject;
      
      public var _parent:DisplayObject;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var shouyeButton:SmallButton;
      
      private var weiyeButton:SmallButton;
      
      private var cengshu:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var tf:TextFormat;
      
      private var dangqianye:int;
      
      private var zuidaye:int;
      
      private var chengchibiaoshi:int;
      
      private var listint:Boolean = false;
      
      private var bg1:DisplayObject;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      public function HuangTuBaYeChaKanXinXiPanel()
      {
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 576 + 130 - 205 + 8 + 1;
         height = 432 + 140 - 123;
         titleText = " ";
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/shizhixinxi.swf");
         this.bg1.x = 10;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.ft = new FTextArea();
         this.ft.multiline = true;
         this.ft.wordWrap = true;
         this.ft.filters = StaticValue.filter;
         this.ft.width = 100;
         this.ft.height = 70;
         this.ft.x = 25 + 9;
         this.ft.y = 20 - 11;
         addChild(this.ft);
         this.ft1 = new FTextArea();
         this.ft1.multiline = true;
         this.ft1.wordWrap = true;
         this.ft1.filters = StaticValue.filter;
         this.ft1.width = 100;
         this.ft1.height = 70;
         this.ft1.x = 250 - 139;
         this.ft1.y = 20 - 11;
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         this.ft2.multiline = true;
         this.ft2.wordWrap = true;
         this.ft2.filters = StaticValue.filter;
         this.ft2.width = 100;
         this.ft2.height = 70;
         this.ft2.x = 400 - 133;
         this.ft2.y = 20 - 11;
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         this.ft3.multiline = true;
         this.ft3.wordWrap = true;
         this.ft3.filters = StaticValue.filter;
         this.ft3.width = 100;
         this.ft3.height = 70;
         this.ft3.x = 400 + 100 - 86;
         this.ft3.y = 20 - 11;
         addChild(this.ft3);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 35 - 15 - 5 - 5 + 2;
            y = 40 - 7;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,500 - 15,400);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new XinXiList();
         this.giftList.listWidth = 500 - 15;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37 + 150 - 97;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 + 270 - 187 - 5;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170 + 150 - 97;
         this.cengshu.y = 230 - 20 + 25 + 270 - 187 - 5;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 150 - 97;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 + 270 - 187 - 5;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shouyeButton = new SmallButton();
         this.shouyeButton.label = LanResManager.getLanCommonTextWords("首页");
         addChild(this.shouyeButton);
         this.shouyeButton.x = -50 + 298 - 97;
         this.shouyeButton.y = 50 + 457 - 187 - 8;
         this.shouyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.weiyeButton = new SmallButton();
         this.weiyeButton.label = LanResManager.getLanCommonTextWords("尾页");
         addChild(this.weiyeButton);
         this.weiyeButton.x = -50 + 470 - 97;
         this.weiyeButton.y = 50 + 458 - 187 - 8;
         this.weiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.miaoshu = new FTextArea();
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.filters = StaticValue.filter;
         this.miaoshu.width = 400;
         this.miaoshu.height = 70;
         this.miaoshu.x = 35;
         this.miaoshu.y = 343;
         addChild(this.miaoshu);
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("这里记载着英雄们的辉煌，为了帮会的荣誉，勇往直前。") + "</font>";
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.listint)
         {
            switch(param1.target)
            {
               case this.shangyiyeButton:
                  this.dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_CHAKAN_FANYE,"",this.dangqianye - 1));
                  break;
               case this.xiayiyeButton:
                  this.dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_CHAKAN_FANYE,"",this.dangqianye + 1));
                  break;
               case this.shouyeButton:
                  this.dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_CHAKAN_FANYE,"",1));
                  break;
               case this.weiyeButton:
                  this.dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_CHAKAN_FANYE,"",this.zuidaye));
            }
         }
         else
         {
            switch(param1.target)
            {
               case this.shangyiyeButton:
                  this.dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_CHENGCHISHIZHI_FANYE,"",[this.chengchibiaoshi,this.dangqianye - 1]));
                  break;
               case this.xiayiyeButton:
                  this.dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_CHENGCHISHIZHI_FANYE,"",[this.chengchibiaoshi,this.dangqianye + 1]));
                  break;
               case this.shouyeButton:
                  this.dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_CHENGCHISHIZHI_FANYE,"",[this.chengchibiaoshi,1]));
                  break;
               case this.weiyeButton:
                  this.dispatchEvent(new BaseEvent(UI_HUANGTUBAYE_CHENGCHISHIZHI_FANYE,"",[this.chengchibiaoshi,this.zuidaye]));
            }
         }
      }
      
      public function setInitialize(param1:Array, param2:int, param3:int) : void
      {
         this.giftList.dataProvider = param1;
         this.listint = true;
         this.dangqianye = param2;
         if(param3 == 0)
         {
            param3 = 1;
         }
         this.zuidaye = param3;
         if(param2 == 1)
         {
            this.shangyiyeButton.enabled = false;
         }
         else
         {
            this.shangyiyeButton.enabled = true;
         }
         if(param2 == param3)
         {
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            this.xiayiyeButton.enabled = true;
         }
         titleText = LanResManager.getLanCommonTextWords("皇城");
         this.ft.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("届次") + "</font>";
         this.ft1.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("占领时间") + "</font>";
         this.ft2.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻克人员") + "</font>";
         this.ft3.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("在位天数") + "</font>";
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param2 + "/" + param3 + "</font>";
      }
      
      public function setRongYu(param1:int, param2:String, param3:Array, param4:int, param5:int) : void
      {
         this.giftList.dataProvider = param3;
         this.listint = false;
         titleText = param2;
         this.chengchibiaoshi = param1;
         this.dangqianye = param4;
         if(param5 == 0)
         {
            param5 = 1;
         }
         this.zuidaye = param5;
         if(param4 == 1)
         {
            this.shangyiyeButton.enabled = false;
         }
         else
         {
            this.shangyiyeButton.enabled = true;
         }
         if(param4 == param5)
         {
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            this.xiayiyeButton.enabled = true;
         }
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param4 + "/" + param5 + "</font>";
         this.ft.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("次数") + "</font>";
         this.ft1.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("占领时间") + "</font>";
         this.ft2.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻占人员") + "</font>";
         this.ft3.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("歼敌数量") + "</font>";
      }
   }
}

