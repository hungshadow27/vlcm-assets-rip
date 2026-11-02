package com.tgame.shell.view.components.biguan
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.BiGuangPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class AffirmancePanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var _type:int;
      
      private var tip:FTextArea;
      
      private var tip1:FLabel;
      
      private var exp:FTextArea;
      
      private var zhenqi:FTextArea;
      
      private var item:ItemFace;
      
      private var buyBtn:SmallButton;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function AffirmancePanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         var tf:TextFormat;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         width = 273;
         height = 260;
         titleText = LanResManager.getLanTextWords(this,"闭关设定与收益");
         img = StaticValue.getBitmapByClassName("ui.biguan.affirmance.ui");
         addChild(img);
         img.x = 10;
         img.y = 2;
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 20;
            y = 10;
            width = 236;
            height = 60;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"您确认要领取单倍闭关收益吗",[StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML]);
         }
         addChild(this.tip);
         this.tip1 = new FLabel();
         with(this.tip1)
         {
            x = 133;
            y = 80;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"单倍收益如下");
         }
         addChild(this.tip1);
         lb = new FLabel();
         with(lb)
         {
            x = 100;
            y = 115;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"人物经验值");
         }
         addChild(lb);
         tf = new TextFormat();
         tf.align = "center";
         this.exp = new FTextArea();
         with(this.exp)
         {
            x = 189;
            y = 114;
            width = 58;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "10000";
         }
         addChild(this.exp);
         lb = new FLabel();
         with(lb)
         {
            x = 100;
            y = 143;
            width = 58;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"人物真气储量");
         }
         addChild(lb);
         this.zhenqi = new FTextArea();
         with(this.zhenqi)
         {
            x = 189;
            y = 142;
            width = 58;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "10000";
         }
         addChild(this.zhenqi);
         this.buyBtn = new SmallButton();
         this.buyBtn.label = LanResManager.getLanTextWords(this,"购买");
         addChild(this.buyBtn);
         this.buyBtn.x = 40;
         this.buyBtn.y = 135;
         this.buyBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("领取双倍");
         addChild(this.okBtn);
         this.okBtn.x = 30;
         this.okBtn.y = 195;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanTextWords(this,"我再想想");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 30;
         this.cancelBtn.y = 195;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.buyBtn:
               this.$parent.dispatchEvent(new BaseEvent(BiGuangPanel.UI_BIGUAN_BUY_BTN_CLICK));
               break;
            case this.okBtn:
               if(this.okBtn.label == LanResManager.getLanTextWords(this,"领取单倍"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(BiGuangPanel.UI_BIGUAN_INCOME_GET));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(BiGuangPanel.UI_BIGUAN_DOUBLING_INCOME_GET));
               }
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
         if(this._type == 1)
         {
            this.tip.htmlText = LanResManager.getLanTextWords(this,"确认领取单倍闭关收益",[StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML]);
            this.tip1.htmlText = LanResManager.getLanTextWords(this,"单倍收益如下");
            this.okBtn.label = LanResManager.getLanTextWords(this,"领取单倍");
         }
         else
         {
            this.tip.htmlText = LanResManager.getLanTextWords(this,"消耗一个闭关令符",[StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML]);
            this.tip1.htmlText = LanResManager.getLanTextWords(this,"双倍收益如下");
            this.okBtn.label = LanResManager.getLanTextWords(this,"领取双倍");
         }
      }
      
      public function setData(param1:Goods, param2:int, param3:int) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         if(param1.count == 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         addChild(this.item);
         this.item.x = 40;
         this.item.y = 87;
         this.exp.text = param2.toString();
         this.zhenqi.text = param3.toString();
      }
   }
}

