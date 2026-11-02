package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class AmmoBuyPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var count:FTextInput;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var imgIco1:DisplayObject;
      
      public function AmmoBuyPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var img:Bitmap = null;
         super();
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         dragAble = true;
         width = 294;
         height = 315;
         this.titleText = LanResManager.getLanCommonTextWords("炮弹购买");
         bg = new Bitmap();
         bg.name = "ui.gongcheng.ammo.buy.ui";
         addChild(bg);
         bg.x = 6;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         tf = new TextFormat();
         tf.align = "center";
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 15;
            y = 8;
            width = 260;
            height = 45;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"任何战争的背后");
         }
         addChild(this.fta);
         img = StaticValue.getBitmapByClassName("ui.gongcheng.ammo.frame");
         addChild(img);
         img.x = 73;
         img.y = 45;
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            x = 9;
            y = 207;
            width = 260;
            height = 45;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.fta2);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            x = 185;
            y = 207;
            width = 90;
            height = 45;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "100";
         }
         addChild(this.fta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 9;
            y = 228;
            width = 260;
            height = 45;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"购买数量");
         }
         addChild(this.fta);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = 78;
         this.subBtn.y = 229;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.count = new FTextInput();
         with(this.count)
         {
            x = 104;
            y = 228;
            width = 118;
            height = 20;
            defaultTextFormat = tf;
            restrict = "0-9";
            textColor = StaticValue.ORANGE;
            text = "1";
         }
         addChild(this.count);
         this.count.addEventListener(Event.CHANGE,this.onChange);
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "sumButton";
         addChild(this.addBtn);
         this.addBtn.x = 224;
         this.addBtn.y = 229;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定购买");
         addChild(this.okBtn);
         this.okBtn.x = 60;
         this.okBtn.y = 257;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 195;
         this.cancelBtn.y = 257;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(int(this.count.text) > 1)
               {
                  this.count.text = (int(this.count.text) - 1).toString();
               }
               break;
            case this.addBtn:
               this.count.text = (int(this.count.text) + 1).toString();
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(GongchengPaoPanel.UI_AMMOBUYPANEL_OKCLICK,"",int(this.count.text)));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onChange(param1:Event) : void
      {
         if(int(this.count.text) < 1)
         {
            this.count.text = "1";
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function setInitialize(param1:int, param2:String, param3:int) : void
      {
         var _loc4_:String = null;
         this.fta1.text = String(param1);
         this.fta2.text = param2 + LanResManager.getLanTextWords(this,"每颗炮弹售价");
         if(this.imgIco1 != null && this.imgIco1.parent != null)
         {
            this.imgIco1.parent.removeChild(this.imgIco1);
         }
         _loc4_ = GameConfig.fileBaseFolder + "res/ui/huopao/imgpaodan" + param3 + ".png";
         this.imgIco1 = FLoader.startLoad(_loc4_,144,137);
         this.imgIco1.x = 78;
         this.imgIco1.y = 51;
         addChildAt(this.imgIco1,1);
      }
   }
}

