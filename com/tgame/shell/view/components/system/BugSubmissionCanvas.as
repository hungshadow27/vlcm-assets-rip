package com.tgame.shell.view.components.system
{
   import com.fireice.radioBox.FRadioBox;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.SystemPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.SceneRender;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.*;
   
   public class BugSubmissionCanvas extends Sprite
   {
      
      private static var lastTime:int = 0;
      
      private static const OK_DELAY:int = 1000;
      
      private var _parent:DisplayObject;
      
      private var tip:FTextArea;
      
      private var radioBox1:FRadioBox;
      
      private var radioBox2:FRadioBox;
      
      private var radioBox3:FRadioBox;
      
      private var radioBox4:FRadioBox;
      
      private var lb:FLabel;
      
      private var onlineserviceBtn:SecondButton;
      
      private var subBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var TitleTxt:FTextInput;
      
      private var ContentTxt:FTextInput;
      
      private var type:int = 1;
      
      public var bgImg:Bitmap;
      
      public function BugSubmissionCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.system.option.bug.sumbit.ui";
         addChild(this.bgImg);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 360;
            height = 45;
            x = 12;
            y = 18;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"傲剑详解",[StaticValue.BLUE_HTML,StaticValue.BLUE_HTML]);
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 250;
            height = 20;
            x = 12;
            y = 63;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"玩家QQ交流群",[StaticValue.ORANGE_HTML]);
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 135;
            height = 40;
            x = 12;
            y = 83;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"群号1群号3",[StaticValue.WHITE_HTML,StaticValue.WHITE_HTML]);
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 135;
            height = 40;
            x = 180;
            y = 83;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"群号2",[StaticValue.WHITE_HTML]);
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            width = 35;
            height = 70;
            x = 12;
            y = 141;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"类型标题内容",[StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML]);
         }
         addChild(this.tip);
         this.radioBox1 = new FRadioBox();
         addChild(this.radioBox1);
         this.radioBox1.x = 52;
         this.radioBox1.y = 142;
         this.radioBox1.selectState = true;
         this.radioBox1.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 68;
            y = 141;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"提交BUG");
         }
         addChild(this.lb);
         this.radioBox2 = new FRadioBox();
         addChild(this.radioBox2);
         this.radioBox2.x = 132;
         this.radioBox2.y = 142;
         this.radioBox2.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 148;
            y = 141;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"好主意");
         }
         addChild(this.lb);
         this.radioBox3 = new FRadioBox();
         addChild(this.radioBox3);
         this.radioBox3.x = 210;
         this.radioBox3.y = 142;
         this.radioBox3.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 226;
            y = 141;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("投诉");
         }
         addChild(this.lb);
         this.radioBox4 = new FRadioBox();
         addChild(this.radioBox4);
         this.radioBox4.x = 273;
         this.radioBox4.y = 142;
         this.radioBox4.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 289;
            y = 141;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("其他");
         }
         addChild(this.lb);
         this.TitleTxt = new FTextInput();
         with(this.TitleTxt)
         {
            x = 57;
            y = 164;
            width = 260;
            height = 20;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"left");
            text = "";
         }
         this.TitleTxt.setMaxChars(40);
         addChild(this.TitleTxt);
         this.ContentTxt = new FTextInput();
         with(this.ContentTxt)
         {
            multiline = true;
            wordWrap = true;
            x = 57;
            y = 194;
            width = 355;
            height = 85;
            defaultTextFormat = new TextFormat(null,null,StaticValue.WHITE,null,null,null,null,null,"left");
            text = LanResManager.getLanTextWords(this,"联系方式");
         }
         addChild(this.ContentTxt);
         this.onlineserviceBtn = new SecondButton();
         this.onlineserviceBtn.label = LanResManager.getLanTextWords(this,"呼叫在线客服");
         addChild(this.onlineserviceBtn);
         this.onlineserviceBtn.x = 65;
         this.onlineserviceBtn.y = 319;
         this.onlineserviceBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.subBtn = new SecondButton();
         this.subBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.subBtn);
         this.subBtn.x = 270;
         this.subBtn.y = 319;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 350;
         this.cancelBtn.y = 319;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.radioBox1:
               this.radioBox2.selectState = false;
               this.radioBox3.selectState = false;
               this.radioBox4.selectState = false;
               this.type = 0;
               break;
            case this.radioBox2:
               this.radioBox1.selectState = false;
               this.radioBox3.selectState = false;
               this.radioBox4.selectState = false;
               this.type = 1;
               break;
            case this.radioBox3:
               this.radioBox1.selectState = false;
               this.radioBox2.selectState = false;
               this.radioBox4.selectState = false;
               this.type = 2;
               break;
            case this.radioBox4:
               this.radioBox1.selectState = false;
               this.radioBox2.selectState = false;
               this.radioBox3.selectState = false;
               this.type = 3;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:URLRequest = null;
         switch(param1.target)
         {
            case this.onlineserviceBtn:
               _loc2_ = "http://www43.53kf.com/webCompany.php?arg=niuaa&style=1";
               _loc3_ = new URLRequest(_loc2_);
               navigateToURL(_loc3_);
               break;
            case this.subBtn:
               if(SceneRender.nowTime - lastTime < OK_DELAY)
               {
                  return;
               }
               lastTime = SceneRender.nowTime;
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_BUGSUBMIS_SUB_SHOW,"",[this.type,this.TitleTxt.text,this.ContentTxt.text]));
               this.subBtn.enabled = false;
               this.cancelBtn.enabled = false;
               break;
            case this.cancelBtn:
               this.SetInitialize();
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function SetInitialize() : void
      {
         this.radioBox1.selectState = true;
         this.radioBox2.selectState = false;
         this.radioBox3.selectState = false;
         this.radioBox4.selectState = false;
         this.TitleTxt.text = "";
         this.ContentTxt.text = LanResManager.getLanTextWords(this,"联系方式");
      }
      
      public function Relieve() : void
      {
         this.subBtn.enabled = true;
         this.cancelBtn.enabled = true;
         this.SetInitialize();
      }
   }
}

