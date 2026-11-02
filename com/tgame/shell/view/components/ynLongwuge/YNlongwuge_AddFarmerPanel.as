package com.tgame.shell.view.components.ynLongwuge
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class YNlongwuge_AddFarmerPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var item:Bitmap;
      
      private var itemName:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var ftNum:FTextArea;
      
      private var ftDesc:FTextArea;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var count:FTextInput;
      
      private var gid:int = 0;
      
      private var gnum:int = 0;
      
      private var haveNum:int = 0;
      
      private var bg9:F9GridBitmap;
      
      private var goSpr:Sprite;
      
      public function YNlongwuge_AddFarmerPanel()
      {
         var img:Bitmap;
         var tf:TextFormat;
         var ft:FTextArea;
         super();
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 250;
         height = 195;
         titleText = LanResManager.getLanCommonTextWords("增加农民");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 105;
         img.y = 50;
         this.goSpr = new Sprite();
         addChild(this.goSpr);
         tf = new TextFormat();
         tf.align = "center";
         this.ftDesc = new FTextArea();
         with(this.ftDesc)
         {
            x = 20;
            y = 15;
            width = 180;
            height = 40;
            wordWrap = true;
            defaultTextFormat = tf;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
         }
         this.ftDesc.htmlText = "每消耗一个道具增加一个农民";
         addChild(this.ftDesc);
         ft = new FTextArea();
         with(ft)
         {
            x = 20;
            y = 50;
            width = 80;
            height = 40;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         ft.htmlText = LanResManager.getLanCommonTextWords("当前拥有数量：");
         addChild(ft);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.enabled = false;
         this.subBtn.x = 50;
         this.subBtn.y = 95;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 80;
         this.bg9.height = 20;
         this.bg9.x = 70;
         this.bg9.y = 95;
         addChild(this.bg9);
         this.count = new FTextInput();
         with(this.count)
         {
            x = 70;
            y = 95;
            width = 80;
            height = 20;
            restrict = "0-5";
            textColor = StaticValue.ORANGE;
            text = "1";
         }
         addChild(this.count);
         this.count.addEventListener(Event.CHANGE,this.onChange);
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "sumButton";
         addChild(this.addBtn);
         this.addBtn.x = 120 + 30;
         this.addBtn.y = 95;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 40;
         this.okBtn.y = 125;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 160;
         this.cancelBtn.y = 125;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function onChange(param1:Event) : void
      {
         if(int(this.count.text) < 0)
         {
            this.count.text = "0";
         }
         if(int(this.count.text) > 5)
         {
            this.count.text = String(5);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(YNlongwugePanel.UI_YN_LONGWUGE_QIANJIAN_ADDNONGMIN_CLICK,"",this.count.text));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
               break;
            case this.subBtn:
               if(int(this.count.text) > 0)
               {
                  this.count.text = (int(this.count.text) - 1).toString();
                  if(int(this.count.text) <= 1)
                  {
                     this.subBtn.enabled = false;
                  }
                  if(int(this.count.text) < 5)
                  {
                     this.addBtn.enabled = true;
                  }
                  if(Number(this.count.text) < this.gnum)
                  {
                     this.okBtn.enabled = false;
                  }
                  else
                  {
                     this.okBtn.enabled = true;
                  }
               }
               break;
            case this.addBtn:
               this.count.text = (int(this.count.text) + 1).toString();
               if(Number(this.count.text) < this.gnum || Number(this.count.text) > this.haveNum)
               {
                  this.okBtn.enabled = false;
               }
               else
               {
                  this.okBtn.enabled = true;
               }
               if(int(this.count.text) > 1)
               {
                  this.subBtn.enabled = true;
               }
               if(int(this.count.text) == 5)
               {
                  this.addBtn.enabled = false;
               }
         }
      }
      
      public function setData(param1:int, param2:int) : void
      {
         this.gid = param1;
         this.gnum = param2;
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.gid,true);
         this.ftDesc.htmlText = LanResManager.getLanCommonTextWords("每消耗") + String(this.gnum) + LanResManager.getLanCommonTextWords("个道具增加一个农民");
         this.haveNum = _loc3_.count;
         while(this.goSpr.numChildren > 0)
         {
            this.goSpr.removeChildAt(0);
         }
         var _loc4_:ItemFace = new ItemFace(_loc3_);
         if(_loc3_.count <= 0)
         {
            _loc4_.filters = Tools.blackWhiteFilter;
         }
         else
         {
            _loc4_.filters = [];
         }
         _loc4_.setShowCount(true);
         _loc4_.x = 107;
         _loc4_.y = 52;
         this.goSpr.addChild(_loc4_);
      }
   }
}

