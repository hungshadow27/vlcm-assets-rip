package com.tgame.shell.view.components.mall
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.MaillJiFenPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   
   public class MallJiFenBuyPanel extends FPanel
   {
      
      public static const TYPE_SILVER:String = "TYPE_SILVER";
      
      public static const TYPE_LIJIN:String = "TYPE_LIJIN";
      
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
      
      private var yuanpiao:Number;
      
      public function MallJiFenBuyPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         super();
         this.skin = "sceondPanel_btn";
         this.showCloseButton = true;
         width = 209;
         height = 290;
         this.Title = StaticValue.getBitmapByClassName("ui.mall.buy.title");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.mall.buy.ui");
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
            text = LanResManager.getLanCommonTextWords("需要积分：");
         }
         addChild(lb);
         this.price = new FLabel();
         with(this.price)
         {
            x = 156 + 10;
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
            x = 16;
            y = 126;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("兑换数量：");
         }
         addChild(lb);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = 91;
         this.subBtn.y = 128;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.count = new FTextInput();
         with(this.count)
         {
            x = 124;
            y = 128;
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
         this.addBtn.y = 128;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 16;
            y = 154;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("总将使用积分：");
         }
         addChild(this.lb1);
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            x = 16;
            y = 175;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("您还有拥积分：");
         }
         addChild(this.lb2);
         this.lb3 = new FLabel();
         with(this.lb3)
         {
            x = 16;
            y = 183;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.lb3);
         this.lb3.visible = false;
         this.spendSilver = new FLabel();
         with(this.spendSilver)
         {
            x = 148;
            y = 154;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "12300";
         }
         addChild(this.spendSilver);
         this.silver = new FLabel();
         with(this.silver)
         {
            x = 108;
            y = 175;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "12300";
         }
         addChild(this.silver);
         this.tip = new FLabel();
         with(this.tip)
         {
            visible = false;
            x = 18;
            y = 202;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("您的积分不足");
         }
         addChild(this.tip);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("兑换");
         addChild(this.okBtn);
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 235;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
         else
         {
            txt = LanResManager.getLanCommonTextWords("礼金");
            txt1 = "";
            icoClass = "ui.ico.money.lijin";
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
                  if(int(this.spendSilver.text) > this.yuanpiao)
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
               if(int(this.spendSilver.text) > this.yuanpiao)
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
               EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(MaillJiFenPanel.UI_MALLPANEL_BUY_JIFEN,"",[this.id,int(this.count.text)]));
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
         this.spendSilver.text = (int(this.price.text) * int(this.count.text)).toString();
         if(int(this.spendSilver.text) > this.yuanpiao)
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
      
      public function setItem(param1:int, param2:String, param3:String, param4:int, param5:String, param6:Number, param7:Number = 0, param8:int = -1) : void
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
         this.yuanpiao = param6 + param7;
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
            this.lb1.y = 154;
            this.lb2.y = 175;
            this.spendSilver.y = 154;
            this.silver.y = 175;
            this.lb3.visible = false;
         }
         else
         {
            this.lb3.text = LanResManager.getLanTextWords(MallBuyPanel,"尚可购买",[param8]);
            this.lb3.visible = true;
            this.lb1.y = 150;
            this.lb2.y = 167;
            this.spendSilver.y = 150;
            this.silver.y = 167;
         }
      }
   }
}

