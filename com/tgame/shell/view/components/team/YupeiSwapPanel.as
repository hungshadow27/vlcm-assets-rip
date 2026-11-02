package com.tgame.shell.view.components.team
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class YupeiSwapPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var yupeiContainer1:Sprite;
      
      private var yupeiContainer2:Sprite;
      
      private var frdqpBtn:SecondButton;
      
      private var gmdqpBtn:SecondButton;
      
      private var ksghBtn:SecondButton;
      
      private var qhypBtn:SecondButton;
      
      public function YupeiSwapPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 320;
         height = 280;
         this.titleText = LanResManager.getLanCommonTextWords("定情玉佩更换");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.marriage.jade.change.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 17;
            y = 8;
            width = 140;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"当前玉佩的定情佩为");
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 17;
            y = 85;
            width = 140;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"您希望将定情佩更换为");
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 12;
            y = 172;
            width = 310;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
         }
         ft.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"原玉佩将一分为二由双方各执一份留作纪念",[],false) + "</textformat>";
         addChild(ft);
         this.yupeiContainer1 = new Sprite();
         addChild(this.yupeiContainer1);
         with(this.yupeiContainer1)
         {
            x = 42;
            y = 46;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,157,40);
            graphics.endFill();
         }
         this.yupeiContainer2 = new Sprite();
         addChild(this.yupeiContainer2);
         with(this.yupeiContainer2)
         {
            x = 42;
            y = 124;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,157,40);
            graphics.endFill();
         }
         this.frdqpBtn = new SecondButton();
         this.frdqpBtn.label = LanResManager.getLanTextWords(this,"放入定情佩");
         addChild(this.frdqpBtn);
         this.frdqpBtn.x = 8;
         this.frdqpBtn.y = 214;
         this.frdqpBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gmdqpBtn = new SecondButton();
         this.gmdqpBtn.label = LanResManager.getLanTextWords(this,"购买定情佩");
         addChild(this.gmdqpBtn);
         this.gmdqpBtn.x = 98;
         this.gmdqpBtn.y = 214;
         this.gmdqpBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ksghBtn = new SecondButton();
         this.ksghBtn.label = LanResManager.getLanTextWords(this,"开始更换");
         addChild(this.ksghBtn);
         this.ksghBtn.x = 174;
         this.ksghBtn.y = 214;
         this.ksghBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.qhypBtn = new SecondButton();
         this.qhypBtn.label = LanResManager.getLanTextWords(this,"取回原配");
         addChild(this.qhypBtn);
         this.qhypBtn.x = 245;
         this.qhypBtn.y = 214;
         this.qhypBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function aa1(param1:MouseEvent) : void
      {
         this.setDangqianyupei([new Goods(20001),new Goods(20001),new Goods(20001),new Goods(20001),new Goods(20001)]);
         this.setSwapyupei([new Goods(20001),new Goods(20001),new Goods(20001),new Goods(20001),new Goods(20001)]);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.frdqpBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_YUPEISWAPPANEL_FANGRUDINGQINGPEI_CLICK));
               break;
            case this.gmdqpBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_YUPEISWAPPANEL_GOUMAIDINGQINGPEI_CLICK));
               break;
            case this.ksghBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_YUPEISWAPPANEL_KAISHIJIAOHUAN_CLICK));
               break;
            case this.qhypBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_YUPEISWAPPANEL_QUHUIYUANPEI_CLICK));
         }
      }
      
      public function setDangqianyupei(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         while(this.yupeiContainer1.numChildren > 0)
         {
            this.yupeiContainer1.removeChildAt(0);
         }
         while(_loc3_ < param1.length)
         {
            _loc2_ = new ItemFace(param1[_loc3_]);
            if(_loc3_ == 0)
            {
               _loc2_.x = 0;
            }
            else if(_loc3_ == 1)
            {
               _loc2_.x = 67;
            }
            else if(_loc3_ == 2)
            {
               _loc2_.x = 109;
            }
            else if(_loc3_ == 3)
            {
               _loc2_.x = 159;
            }
            else if(_loc3_ == 4)
            {
               _loc2_.x = 201;
            }
            this.yupeiContainer1.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function setSwapyupei(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         while(this.yupeiContainer2.numChildren > 0)
         {
            this.yupeiContainer2.removeChildAt(0);
         }
         while(_loc3_ < param1.length)
         {
            _loc2_ = new ItemFace(param1[_loc3_]);
            if(_loc3_ == 0)
            {
               _loc2_.x = 0;
            }
            else if(_loc3_ == 1)
            {
               _loc2_.x = 67;
            }
            else if(_loc3_ == 2)
            {
               _loc2_.x = 109;
            }
            else if(_loc3_ == 3)
            {
               _loc2_.x = 159;
            }
            else if(_loc3_ == 4)
            {
               _loc2_.x = 201;
            }
            this.yupeiContainer2.addChild(_loc2_);
            _loc3_++;
         }
      }
   }
}

