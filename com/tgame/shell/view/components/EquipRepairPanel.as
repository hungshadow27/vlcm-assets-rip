package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class EquipRepairPanel extends FPanel
   {
      
      public static const UI_EQUIPREPAIR_COMMONREPAIRBTN_CLICK:String = "UI_EQUIPREPAIR_COMMONREPAIRBTN_CLICK";
      
      public static const UI_EQUIPREPAIR_SPECIALREPAIRBTN_CLICK:String = "UI_EQUIPREPAIR_SPECIALREPAIRBTN_CLICK";
      
      private var commonRepairPrice:FTextArea;
      
      private var specialRepairPrice:FTextArea;
      
      private var commonRepairBtn:SecondButton;
      
      private var specialRepairBtn:SecondButton;
      
      private var tip1:FLabel;
      
      private var tip2:FLabel;
      
      public function EquipRepairPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var text1:FTextArea;
         var lb:FLabel;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 272;
         height = 262;
         this.titleText = LanResManager.getLanCommonTextWords("装备修理");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.equip.repair.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         text1 = new FTextArea();
         with(text1)
         {
            width = 240;
            height = 40;
            x = 14;
            y = 4;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("我将修理您身上和坐骑上的全部装备") + "<br>" + LanResManager.getLanCommonTextWords("有不需要现在修理的装备，请提前脱下") + "</font></textformat>";
         }
         addChild(text1);
         text1 = new FTextArea();
         with(text1)
         {
            width = 240;
            height = 40;
            x = 14;
            y = 44;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("普通修理采用的工艺简便，费用低廉") + "<br>" + LanResManager.getLanCommonTextWords("但修理后有可能减少装备的耐久度上限") + "</font></textformat>";
         }
         addChild(text1);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 95;
         img.y = 85;
         this.commonRepairPrice = new FTextArea();
         with(this.commonRepairPrice)
         {
            x = 122;
            y = 87;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.commonRepairPrice);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 95;
         img.y = 137;
         this.specialRepairPrice = new FTextArea();
         with(this.specialRepairPrice)
         {
            x = 122;
            y = 139;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.specialRepairPrice);
         lb = new FLabel();
         with(lb)
         {
            x = 30;
            y = 86;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("普修价格：");
         }
         addChild(lb);
         this.tip1 = new FLabel();
         with(this.tip1)
         {
            x = 207;
            y = 86;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("城主税收");
         }
         addChild(this.tip1);
         lb = new FLabel();
         with(lb)
         {
            x = 14;
            y = 115;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("特殊修理费用较贵，但不会减少耐久度上限");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 30;
            y = 137;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("特修价格：");
         }
         addChild(lb);
         this.tip2 = new FLabel();
         with(this.tip2)
         {
            x = 207;
            y = 137;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("城主税收");
         }
         addChild(this.tip2);
         lb = new FLabel();
         with(lb)
         {
            x = 14;
            y = 166;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请问您需要哪种修理方式？");
         }
         addChild(lb);
         this.commonRepairBtn = new SecondButton();
         this.commonRepairBtn.label = LanResManager.getLanCommonTextWords("普通修理");
         addChild(this.commonRepairBtn);
         this.commonRepairBtn.x = 40;
         this.commonRepairBtn.y = 195;
         this.commonRepairBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.specialRepairBtn = new SecondButton();
         this.specialRepairBtn.label = LanResManager.getLanCommonTextWords("特殊修理");
         addChild(this.specialRepairBtn);
         this.specialRepairBtn.x = 156;
         this.specialRepairBtn.y = 195;
         this.specialRepairBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.commonRepairBtn:
               dispatchEvent(new BaseEvent(UI_EQUIPREPAIR_COMMONREPAIRBTN_CLICK));
               break;
            case this.specialRepairBtn:
               dispatchEvent(new BaseEvent(UI_EQUIPREPAIR_SPECIALREPAIRBTN_CLICK));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setRepairPrice(param1:int, param2:int) : void
      {
         this.commonRepairPrice.text = param1.toString();
         if(GameConfig.wantEnterMapRes.id == OtherConst.XIANGYANGCHENG_MAP_ID)
         {
            this.tip1.visible = this.tip2.visible = true;
         }
         else
         {
            this.tip1.visible = this.tip2.visible = false;
         }
         this.commonRepairPrice.htmlText = param1 + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + (GameConfig.wantEnterMapRes.id == OtherConst.XIANGYANGCHENG_MAP_ID ? "+" + int(param1 * GameConfig.xiangyangcheng_shuilv) : "") + "</font>";
         this.specialRepairPrice.text = param2.toString();
         this.specialRepairPrice.htmlText = param2 + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + (GameConfig.wantEnterMapRes.id == OtherConst.XIANGYANGCHENG_MAP_ID ? "+" + int(param2 * GameConfig.xiangyangcheng_shuilv) : "") + "</font>";
      }
   }
}

