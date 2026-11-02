package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class AnqiActivation extends FPanel
   {
      
      public static const UI_ANQIACTIVATION_KAIQI_CLICK:String = "UI_ANQIACTIVATION_KAIQI_CLICK";
      
      public static const UI_ANQIACTIVATIONHUODONG_YOUHUIKAIQI_CLICK:String = "UI_ANQIACTIVATIONHUODONG_YOUHUIKAIQI_CLICK";
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var bg:Bitmap;
      
      private var imgIco:DisplayObject;
      
      private var btn:SecondButton;
      
      private var fc:FCanvas;
      
      private var anqiactivationhuodong:AnqiActivationHuodong;
      
      public function AnqiActivation()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 425;
         height = 259;
         titleText = LanResManager.getLanTextWords(this,"暗器激活");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            width = 400;
            height = 50;
            x = 15;
            y = 7;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = LanResManager.getLanTextWords(this,"激活暗器简介");
         }
         addChild(this.ft);
         this.fc = new FCanvas();
         this.fc.x = 10;
         this.fc.y = 60;
         this.fc.width = 406;
         this.fc.height = 155;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.bg = StaticValue.getBitmapByClassName("ui.anqi.kuang");
         this.bg.x = 20;
         this.bg.y = 65;
         addChild(this.bg);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            width = 200;
            autoSize = TextFieldAutoSize.LEFT;
            x = 160;
            y = 70;
            filters = StaticValue.filter;
            textColor = StaticValue.SKY_BLUE;
            htmlText = LanResManager.getLanTextWords(this,"激活暗器隐藏属性",[StaticValue.YELLOW_HTML,StaticValue.YELLOW_HTML,StaticValue.YELLOW_HTML,StaticValue.YELLOW_HTML]);
         }
         addChild(this.ft1);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanTextWords(this,"激活开启");
         addChild(this.btn);
         this.btn.x = 280;
         this.btn.y = 175;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               dispatchEvent(new BaseEvent(UI_ANQIACTIVATION_KAIQI_CLICK));
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this.anqiactivationhuodong != null && this.anqiactivationhuodong.parent != null)
         {
            this.anqiactivationhuodong.parent.removeChild(this.anqiactivationhuodong);
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:Array) : void
      {
         if(this.imgIco != null && this.imgIco.parent != null)
         {
            this.imgIco.parent.removeChild(this.imgIco);
         }
         this.imgIco = FLoader.startLoad(param1[0],120,120);
         this.imgIco.x = 24;
         this.imgIco.y = 72;
         addChildAt(this.imgIco,1);
         var _loc2_:String = "";
         _loc2_ = "<textformat leading=\'4\'>";
         _loc2_ += LanResManager.getLanTextWords(this,"初始化暗器名称",[StaticValue.YELLOW_HTML]);
         _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>   " + param1[1] + "<br></font>";
         _loc2_ += LanResManager.getLanTextWords(this,"隐藏属性激活后加成",[StaticValue.YELLOW_HTML]);
         _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>   " + param1[2] + "<br></font>";
         _loc2_ += LanResManager.getLanTextWords(this,"操作所需消耗",[StaticValue.YELLOW_HTML]);
         if(param1[5])
         {
            _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>   " + param1[3] + "<br></font>";
         }
         else
         {
            _loc2_ += "<font color=\'" + StaticValue.RED_HTML + "\'>   " + param1[3] + "<br></font>";
         }
         _loc2_ += LanResManager.getLanTextWords(this,"操作成功几率",[StaticValue.YELLOW_HTML]);
         _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>   " + param1[4] + "</font>";
         _loc2_ += "</textformat>";
         this.ft1.htmlText = _loc2_;
      }
      
      public function showAnqiActivationHuodong(param1:Goods, param2:int, param3:Goods, param4:int) : void
      {
         if(!this.anqiactivationhuodong)
         {
            this.anqiactivationhuodong = new AnqiActivationHuodong();
            this.anqiactivationhuodong.$parent = this;
         }
         this.anqiactivationhuodong.visible = true;
         this.anqiactivationhuodong.setInitialize(param1,param2,param3,param4);
         GameInstance.uiInstance.uiContainer.addChild(this.anqiactivationhuodong);
         this.anqiactivationhuodong.x = this.x;
         this.anqiactivationhuodong.y = this.y + this.height;
      }
   }
}

