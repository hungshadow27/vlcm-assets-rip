package com.tgame.shell.view.components.mall
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.FLoader;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.MallPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class MallBuyPanel extends FPanel
   {
      
      public static const TYPE_SILVER:String = "TYPE_SILVER";
      
      public static const TYPE_LIJIN:String = "TYPE_LIJIN";
      
      public static const TYPE_TONGBI:String = "TYPE_TONGBI";
      
      public static const TYPE_LEIJIZHI:String = "TYPE_LEIJIZHI";
      
      private static var _type:String = TYPE_SILVER;
      
      private static var txt:String = "";
      
      private static var txt1:String = "";
      
      private static var icoClass:String = "ui.ico.money.silver";
      
      public var $parent:DisplayObject;
      
      private var bigIco:DisplayObject;
      
      private var ico:Bitmap;
      
      private var goodsName:FLabel;
      
      private var price:FLabel;
      
      private var effect:FTextArea;
      
      private var count:FTextInput;
      
      private var spendSilver:FLabel;
      
      private var silver:FLabel;
      
      private var tip:FLabel;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var okBtn:SecondButton;
      
      private var id:int;
      
      private var lb1:FLabel;
      
      private var lb2:FLabel;
      
      private var lb3:FLabel;
      
      private var lb8:FTextArea;
      
      private var ft:FTextArea;
      
      private var yuanpiao:Number;
      
      private var huodongId:int;
      
      private var longfengType:int;
      
      private var _t:int = -1;
      
      public function MallBuyPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         super();
         this.skin = "sceondPanel_btn";
         this.showCloseButton = true;
         width = 209;
         height = 290;
         this.titleText = LanResManager.getLanCommonTextWords("购买道具");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.mall.buy.xiugai.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         this.ico = new Bitmap();
         addChild(this.ico);
         this.ico.x = 15;
         this.ico.y = 5;
         this.goodsName = new FLabel();
         with(this.goodsName)
         {
            x = 96;
            y = 18;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.goodsName);
         lb = new FLabel();
         with(lb)
         {
            x = 96;
            y = 40;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("售价") + "：";
         }
         addChild(lb);
         img = StaticValue.getBitmapByClassName(icoClass);
         addChild(img);
         img.x = 131;
         img.y = 40;
         this.price = new FLabel();
         with(this.price)
         {
            x = 156;
            y = 40;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "125300";
         }
         addChild(this.price);
         this.effect = new FTextArea();
         with(this.effect)
         {
            x = 16;
            y = 78;
            width = 175;
            height = 45;
            wordWrap = true;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(MallBuyFestivalPanel,"佩戴能够增加攻击力30%，提高生命力50%，防50%");
         }
         addChild(this.effect);
         lb = new FLabel();
         with(lb)
         {
            x = 10;
            y = 119;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(MallBuyPanel,"购买数量") + "：";
         }
         addChild(lb);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = 89;
         this.subBtn.y = 129;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.count = new FTextInput();
         with(this.count)
         {
            x = 124;
            y = 130;
            width = 36;
            height = 20;
            restrict = "0-9";
            textColor = StaticValue.ORANGE;
            text = "1";
         }
         addChild(this.count);
         this.count.addEventListener(Event.CHANGE,this.onChange);
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "sumButton";
         addChild(this.addBtn);
         this.addBtn.x = 172;
         this.addBtn.y = 129;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 16 - 6;
            y = 138;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(MallBuyPanel,"总将花费",[txt]) + txt1 + "：";
         }
         addChild(this.lb1);
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            x = 16 - 6;
            y = 159;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(MallBuyPanel,"您帐户中还有",[txt]) + "：";
         }
         addChild(this.lb2);
         this.lb3 = new FLabel();
         with(this.lb3)
         {
            x = 10;
            y = 198;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(MallBuyPanel,"尚可购买");
         }
         addChild(this.lb3);
         this.lb3.visible = false;
         this.spendSilver = new FLabel();
         with(this.spendSilver)
         {
            x = 95 + 39;
            y = 138;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "12300";
         }
         addChild(this.spendSilver);
         this.silver = new FLabel();
         with(this.silver)
         {
            x = 90;
            y = 159;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "12300";
         }
         addChild(this.silver);
         this.lb8 = new FTextArea();
         with(this.lb8)
         {
            x = 16 - 6;
            y = 180;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("用") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("金票") + "</font>" + LanResManager.getLanCommonTextWords("购买的物品将与角色") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("绑定") + "</font></font>";
         }
         addChild(this.lb8);
         this.tip = new FLabel();
         with(this.tip)
         {
            visible = false;
            x = 10;
            y = 212;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(MallBuyPanel,"您账户中的钱不足",[txt]);
         }
         addChild(this.tip);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.okBtn);
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 235;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 166 + 6;
            y = 154;
            width = 30;
            height = 20;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            htmlText = "<a href=\'event:\'>" + LanResManager.getLanCommonTextWords("充值") + "</a>";
         }
         addChild(this.ft);
         this.ft.addEventListener(TextEvent.LINK,this.onLink);
      }
      
      public static function set type(param1:String) : void
      {
         _type = param1;
         if(_type == TYPE_SILVER)
         {
            txt = LanResManager.getLanCommonTextWords("元宝");
            txt1 = LanResManager.getLanCommonTextWords("(金票)");
            icoClass = "ui.ico.money.silver";
         }
         else if(_type == TYPE_LIJIN)
         {
            txt = LanResManager.getLanCommonTextWords("礼金");
            txt1 = "";
            icoClass = "ui.ico.money.lijin";
         }
         else if(_type == TYPE_TONGBI)
         {
            txt = LanResManager.getLanCommonTextWords("铜币");
            txt1 = "";
            icoClass = "ui.ico.money.copper";
         }
         else if(_type == TYPE_LEIJIZHI)
         {
            txt = "累计值";
            txt1 = "";
            icoClass = "ui.ico.money.copper";
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(int(this.count.text) > 0)
               {
                  this.count.text = (int(this.count.text) - 1).toString();
                  this.spendSilver.text = (int(this.price.text) * int(this.count.text)).toString();
                  if(Number(this.spendSilver.text) > this.yuanpiao)
                  {
                     this.tip.visible = true;
                     this.okBtn.enabled = false;
                  }
                  else
                  {
                     this.tip.visible = false;
                     this.okBtn.enabled = true;
                  }
               }
               break;
            case this.addBtn:
               this.count.text = (int(this.count.text) + 1).toString();
               this.spendSilver.text = (int(this.price.text) * int(this.count.text)).toString();
               if(Number(this.spendSilver.text) > this.yuanpiao)
               {
                  this.tip.visible = true;
                  this.okBtn.enabled = false;
               }
               else
               {
                  this.tip.visible = false;
                  this.okBtn.enabled = true;
               }
               break;
            case this.okBtn:
               if(this._t == 1)
               {
                  PipeManager.sendMsg(PipeConstants.LONGFENGDANGPU_BUY,[this.id,int(this.count.text),this.longfengType]);
               }
               else
               {
                  EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(MallPanel.UI_MALLPANEL_BUY,"",[this.id,int(this.count.text),this.huodongId]));
               }
               this.onClose();
         }
      }
      
      private function onLink(param1:TextEvent) : void
      {
         GameConfig.chongzhi();
      }
      
      private function onChange(param1:Event) : void
      {
         if(int(this.count.text) < 0)
         {
            this.count.text = "0";
         }
         if(int(this.count.text) > 5000)
         {
            this.count.text = "1";
         }
         this.spendSilver.text = (int(this.price.text) * int(this.count.text)).toString();
         if(Number(this.spendSilver.text) > this.yuanpiao)
         {
            this.tip.visible = true;
            this.okBtn.enabled = false;
         }
         else
         {
            this.tip.visible = false;
            this.okBtn.enabled = true;
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent is POPWindowManager)
         {
            POPWindowManager.closeWindow();
         }
         else if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setItem(param1:int, param2:String, param3:String, param4:int, param5:String, param6:Number, param7:Number = 0, param8:int = -1, param9:int = -1, param10:int = -1, param11:int = -1) : void
      {
         if(Boolean(this.bigIco) && Boolean(this.bigIco.parent))
         {
            this.bigIco.parent.removeChild(this.bigIco);
         }
         this.bigIco = FLoader.startLoad(param2,65,65);
         addChild(this.bigIco);
         this.bigIco.x = 21;
         this.bigIco.y = 7;
         this.id = param1;
         this.goodsName.text = param3;
         this.price.text = param4.toString();
         this.effect.text = param5;
         this.silver.text = param6.toString();
         this.count.text = "1";
         this.spendSilver.text = param4.toString();
         if(_type == TYPE_LIJIN)
         {
            this.yuanpiao = param6;
         }
         else
         {
            this.yuanpiao = param6 + param7;
         }
         if(param4 > this.yuanpiao)
         {
            this.tip.visible = true;
            this.okBtn.enabled = false;
         }
         else
         {
            this.tip.visible = false;
            this.okBtn.enabled = true;
         }
         if(param8 == -1)
         {
            this.lb1.y = 149;
            this.lb2.y = 165;
            this.spendSilver.y = 149;
            this.silver.y = 165;
            this.ft.y = 149;
            this.lb3.visible = false;
         }
         else if(param10 != 1)
         {
            this.lb3.text = LanResManager.getLanTextWords(MallBuyPanel,"尚可购买",[param8]);
            this.lb3.visible = true;
            this.lb1.y = 145;
            this.lb2.y = 159;
            this.spendSilver.y = 145;
            this.silver.y = 159;
            this.ft.y = 145;
         }
         else
         {
            this.lb1.y = 149;
            this.lb2.y = 165;
            this.spendSilver.y = 149;
            this.silver.y = 165;
            this.ft.y = 149;
            this.lb3.visible = false;
         }
         this.huodongId = param9;
         this._t = param10;
         this.longfengType = param11;
      }
   }
}

