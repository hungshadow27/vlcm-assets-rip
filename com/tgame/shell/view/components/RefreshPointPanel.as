package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.refreshPoint.RefreshPoint_OKWindows;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class RefreshPointPanel extends FPanel
   {
      
      public static const UI_REFRESHPOINTPANEL_SART:String = "UI_REFRESHPOINTPANEL_SART";
      
      public static const UI_REFRESHPOINTPANEL_OK:String = "UI_REFRESHPOINTPANEL_OK";
      
      private var _point1:int;
      
      private var point1:int;
      
      private var _point2:int;
      
      private var point2:int;
      
      private var _point3:int;
      
      private var point3:int;
      
      private var _point4:int;
      
      private var point4:int;
      
      private var _point5:int;
      
      private var point5:int;
      
      private var allAddP1Btn:FSimpleButton;
      
      private var addP1Btn:FSimpleButton;
      
      private var subP1Btn:FSimpleButton;
      
      private var allSubP1Btn:FSimpleButton;
      
      private var allAddP2Btn:FSimpleButton;
      
      private var addP2Btn:FSimpleButton;
      
      private var subP2Btn:FSimpleButton;
      
      private var allSubP2Btn:FSimpleButton;
      
      private var allAddP3Btn:FSimpleButton;
      
      private var addP3Btn:FSimpleButton;
      
      private var subP3Btn:FSimpleButton;
      
      private var allSubP3Btn:FSimpleButton;
      
      private var allAddP4Btn:FSimpleButton;
      
      private var addP4Btn:FSimpleButton;
      
      private var subP4Btn:FSimpleButton;
      
      private var allSubP4Btn:FSimpleButton;
      
      private var pointValue:FTextArea;
      
      private var _pointValue:FTextArea;
      
      private var refreshPointValue:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function RefreshPointPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var fb:FTextArea;
         var tf:TextFormat;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 286;
         height = 340;
         titleText = LanResManager.getLanCommonTextWords("洗点");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.refresh.point.ui";
         addChild(img);
         img.x = 10;
         img.y = 85;
         v = new Vector.<Bitmap>();
         v.push(img);
         DynamicManageImages = v;
         fb = new FTextArea();
         with(fb)
         {
            x = 20;
            y = 10;
            width = 256;
            height = 80;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,0) + "</textformat>";
         }
         addChild(fb);
         fb = new FTextArea();
         with(fb)
         {
            x = 30;
            y = 118;
            width = 40;
            height = 100;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'10\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font></textformat>";
         }
         addChild(fb);
         fb = new FTextArea();
         with(fb)
         {
            x = 20;
            y = 220;
            width = 256;
            height = 100;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font></textformat>";
         }
         addChild(fb);
         tf = new TextFormat();
         tf.align = "center";
         this.pointValue = new FTextArea();
         with(this.pointValue)
         {
            multiline = true;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            x = 76;
            y = 118;
            width = 30;
            height = 95;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'14\'>" + "999<br>" + "999<br>" + "999<br>" + "999</textformat>";
         }
         addChild(this.pointValue);
         this._pointValue = new FTextArea();
         with(this._pointValue)
         {
            multiline = true;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            x = 118;
            y = 118;
            width = 30;
            height = 95;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'14\'>" + "999<br>" + "999<br>" + "999<br>" + "999</textformat>";
         }
         addChild(this._pointValue);
         this.refreshPointValue = new FTextArea();
         with(this.refreshPointValue)
         {
            multiline = false;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            x = 147;
            y = 240;
            width = 43;
            height = 20;
            textColor = StaticValue.WHITE;
            text = "999";
         }
         addChild(this.refreshPointValue);
         this.allAddP1Btn = new FSimpleButton();
         this.allAddP1Btn.skin = "upButton";
         addChild(this.allAddP1Btn);
         this.allAddP1Btn.x = 162;
         this.allAddP1Btn.y = 118;
         this.allAddP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP1Btn = new FSimpleButton();
         this.addP1Btn.skin = "sumButton";
         addChild(this.addP1Btn);
         this.addP1Btn.x = 187;
         this.addP1Btn.y = 118;
         this.addP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP1Btn = new FSimpleButton();
         this.subP1Btn.skin = "subButton";
         addChild(this.subP1Btn);
         this.subP1Btn.x = 211;
         this.subP1Btn.y = 118;
         this.subP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP1Btn = new FSimpleButton();
         this.allSubP1Btn.skin = "bottomButton";
         addChild(this.allSubP1Btn);
         this.allSubP1Btn.x = 234;
         this.allSubP1Btn.y = 118;
         this.allSubP1Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allAddP2Btn = new FSimpleButton();
         this.allAddP2Btn.skin = "upButton";
         addChild(this.allAddP2Btn);
         this.allAddP2Btn.x = 162;
         this.allAddP2Btn.y = 144;
         this.allAddP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP2Btn = new FSimpleButton();
         this.addP2Btn.skin = "sumButton";
         addChild(this.addP2Btn);
         this.addP2Btn.x = 187;
         this.addP2Btn.y = 144;
         this.addP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP2Btn = new FSimpleButton();
         this.subP2Btn.skin = "subButton";
         addChild(this.subP2Btn);
         this.subP2Btn.x = 211;
         this.subP2Btn.y = 144;
         this.subP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP2Btn = new FSimpleButton();
         this.allSubP2Btn.skin = "bottomButton";
         addChild(this.allSubP2Btn);
         this.allSubP2Btn.x = 234;
         this.allSubP2Btn.y = 144;
         this.allSubP2Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allAddP3Btn = new FSimpleButton();
         this.allAddP3Btn.skin = "upButton";
         addChild(this.allAddP3Btn);
         this.allAddP3Btn.x = 162;
         this.allAddP3Btn.y = 170;
         this.allAddP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP3Btn = new FSimpleButton();
         this.addP3Btn.skin = "sumButton";
         addChild(this.addP3Btn);
         this.addP3Btn.x = 187;
         this.addP3Btn.y = 170;
         this.addP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP3Btn = new FSimpleButton();
         this.subP3Btn.skin = "subButton";
         addChild(this.subP3Btn);
         this.subP3Btn.x = 211;
         this.subP3Btn.y = 170;
         this.subP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP3Btn = new FSimpleButton();
         this.allSubP3Btn.skin = "bottomButton";
         addChild(this.allSubP3Btn);
         this.allSubP3Btn.x = 234;
         this.allSubP3Btn.y = 170;
         this.allSubP3Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allAddP4Btn = new FSimpleButton();
         this.allAddP4Btn.skin = "upButton";
         addChild(this.allAddP4Btn);
         this.allAddP4Btn.x = 162;
         this.allAddP4Btn.y = 195;
         this.allAddP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.addP4Btn = new FSimpleButton();
         this.addP4Btn.skin = "sumButton";
         addChild(this.addP4Btn);
         this.addP4Btn.x = 187;
         this.addP4Btn.y = 195;
         this.addP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.subP4Btn = new FSimpleButton();
         this.subP4Btn.skin = "subButton";
         addChild(this.subP4Btn);
         this.subP4Btn.x = 211;
         this.subP4Btn.y = 195;
         this.subP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.allSubP4Btn = new FSimpleButton();
         this.allSubP4Btn.skin = "bottomButton";
         addChild(this.allSubP4Btn);
         this.allSubP4Btn.x = 234;
         this.allSubP4Btn.y = 195;
         this.allSubP4Btn.addEventListener(MouseEvent.CLICK,this.onPoint);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"开始洗点");
         addChild(this.okBtn);
         this.okBtn.x = 30;
         this.okBtn.y = 273;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanTextWords(this,"我在想想");
         addChild(this.cancelBtn);
         this.cancelBtn.x = panelWidth - this.cancelBtn.width - 30;
         this.cancelBtn.y = 273;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.setPoint(30,40,50,60);
      }
      
      private function onPoint(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.allAddP1Btn:
               this.point1 += this._point1;
               this._point1 = 0;
               break;
            case this.addP1Btn:
               if(this._point1 > 0)
               {
                  --this._point1;
                  this.point1 += 1;
               }
               break;
            case this.subP1Btn:
               if(this.point1 > 0)
               {
                  this._point1 += 1;
                  --this.point1;
               }
               break;
            case this.allSubP1Btn:
               this._point1 += this.point1;
               this.point1 = 0;
               break;
            case this.allAddP2Btn:
               this.point2 += this._point2;
               this._point2 = 0;
               break;
            case this.addP2Btn:
               if(this._point2 > 0)
               {
                  --this._point2;
                  this.point2 += 1;
               }
               break;
            case this.subP2Btn:
               if(this.point2 > 0)
               {
                  this._point2 += 1;
                  --this.point2;
               }
               break;
            case this.allSubP2Btn:
               this._point2 += this.point2;
               this.point2 = 0;
               break;
            case this.allAddP3Btn:
               this.point3 += this._point3;
               this._point3 = 0;
               break;
            case this.addP3Btn:
               if(this._point3 > 0)
               {
                  --this._point3;
                  this.point3 += 1;
               }
               break;
            case this.subP3Btn:
               if(this.point3 > 0)
               {
                  this._point3 += 1;
                  --this.point3;
               }
               break;
            case this.allSubP3Btn:
               this._point3 += this.point3;
               this.point3 = 0;
               break;
            case this.allAddP4Btn:
               this.point4 += this._point4;
               this._point4 = 0;
               break;
            case this.addP4Btn:
               if(this._point4 > 0)
               {
                  --this._point4;
                  this.point4 += 1;
               }
               break;
            case this.subP4Btn:
               if(this.point4 > 0)
               {
                  this._point4 += 1;
                  --this.point4;
               }
               break;
            case this.allSubP4Btn:
               this._point4 += this.point4;
               this.point4 = 0;
         }
         this._pointValue.htmlText = "<textformat leading=\'10\'>" + "-" + this._point1 + "<br>" + "-" + this._point2 + "<br>" + "-" + this._point3 + "<br>" + "-" + this._point4 + "<br>" + "</textformat>";
         this.refreshPointValue.text = (this._point1 + this._point2 + this._point3 + this._point4).toString();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_REFRESHPOINTPANEL_SART,"",[this._point1,this._point2,this._point3,this._point4]));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setPoint(param1:int, param2:int, param3:int, param4:int) : void
      {
         this._point1 = this._point2 = this._point3 = this._point4 = 0;
         this.point1 = param1;
         this.point2 = param2;
         this.point3 = param3;
         this.point4 = param4;
         this.pointValue.htmlText = "<textformat leading=\'10\'>" + this.point1 + "<br>" + this.point2 + "<br>" + this.point3 + "<br>" + this.point4 + "<br>" + "</textformat>";
         this._pointValue.htmlText = "<textformat leading=\'10\'>" + "-" + this._point1 + "<br>" + "-" + this._point2 + "<br>" + "-" + this._point3 + "<br>" + "-" + this._point4 + "<br>" + "</textformat>";
         this.refreshPointValue.text = (this._point1 + this._point2 + this._point3 + this._point4).toString();
      }
      
      public function showValidateWindow(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:RefreshPoint_OKWindows = new RefreshPoint_OKWindows();
         _loc7_.$parent = this;
         _loc7_.setValue(param1,param2,param3,param4,param5,param6);
         POPWindowManager.showWindow(_loc7_);
      }
   }
}

