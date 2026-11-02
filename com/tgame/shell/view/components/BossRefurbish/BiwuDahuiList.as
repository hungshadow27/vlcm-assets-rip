package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.conquerPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class BiwuDahuiList extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public static var $parent2:DisplayObject;
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      private var btn:SmallButton;
      
      private var biwudahuizhuwei:BiwuDahuiZhuweiCanvas;
      
      public function BiwuDahuiList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 23;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 2;
            y = 0;
            width = 36;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            if(data.isLiang == 0)
            {
               textColor = 12237498;
            }
            htmlText = data.xiaozu;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 81;
            y = 0;
            width = 116;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            if(data.isLiang == 0)
            {
               textColor = 12237498;
            }
            htmlText = data.name;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 173;
            y = 0;
            width = 50;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            if(data.isLiang == 0)
            {
               textColor = 12237498;
            }
            htmlText = data.zhanchang;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 248;
            y = 0;
            width = 40;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            if(data.isLiang == 0)
            {
               textColor = 12237498;
            }
            htmlText = data.shijian;
         }
         addChild(this.ft);
         this.btn = new SmallButton();
         with(this.btn)
         {
            x = 360;
            y = 0;
         }
         if(data.zhuangtai == 0)
         {
            this.btn.visible = false;
         }
         else if(data.zhuangtai == 1)
         {
            this.btn.label = LanResManager.getLanCommonTextWords("助威");
         }
         else
         {
            this.btn.label = LanResManager.getLanCommonTextWords("观战");
         }
         if(data.isLiang == 0)
         {
            this.btn.enabled = false;
         }
         addChild(this.btn);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 407;
            y = 0;
            width = 40;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.BLUE;
            if(data.isLiang == 0)
            {
               textColor = 12237498;
            }
            htmlText = data.zhuweicishu;
         }
         addChild(this.ft);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(this.btn.label)
         {
            case LanResManager.getLanCommonTextWords("助威"):
               if(BiwuDahuiZhuweiCanvas.checkBoxBl)
               {
                  $parent2.dispatchEvent(new BaseEvent(conquerPanel.UI_BIWUDAHUI_ZHUWEIOK_BTN_CLICK,"",[data.id,data.qufu]));
               }
               else
               {
                  $parent.dispatchEvent(new BaseEvent(BiwuDahuiCanvas.UI_BIWUDAHUI_ZHUWEI_BTN_CLICK,"",[data.id,data.qufu]));
               }
               break;
            case LanResManager.getLanCommonTextWords("观战"):
               $parent2.dispatchEvent(new BaseEvent(conquerPanel.UI_BIWUDAHUI_GUANZHAN_BTN_CLICK,"",[data.id,data.qufu]));
         }
      }
   }
}

