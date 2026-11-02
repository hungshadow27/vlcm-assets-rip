package com.tgame.shell.view.components.shiJieBei
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.NoticeManager;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class ShiJieBeiXiaZhuPanel extends FPanel
   {
      
      public var _$parent:DisplayObject;
      
      private var okBtn:SecondButton;
      
      private var BYTE:int = 0;
      
      public var check1:FCheckBox;
      
      public var check2:FCheckBox;
      
      public var check3:FCheckBox;
      
      private var xiaohao:FTextArea;
      
      private var tf:TextFormat;
      
      private var guoJiaId2:int;
      
      private var guoJiaId1:int;
      
      private var changCiId:int;
      
      private var guoqiSpr:Sprite;
      
      private var guoqi1:DisplayObject;
      
      private var guoqi2:DisplayObject;
      
      private var bg:DisplayObject;
      
      public function ShiJieBeiXiaZhuPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         titleText = LanResManager.getLanCommonTextWords("下注");
         skin = "panel_btn";
         width = 360 - 105 + 83;
         height = 190 + 35 + 30;
         showCloseButton = true;
         dragAble = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/xiazhuBg.swf");
         this.bg.x = 10;
         this.bg.y = 20;
         addChild(this.bg);
         this.xiaohao = new FTextArea();
         this.xiaohao.multiline = true;
         this.xiaohao.filters = StaticValue.filter;
         this.xiaohao.defaultTextFormat = this.tf;
         this.xiaohao.width = 230;
         this.xiaohao.height = 110;
         this.xiaohao.x = 20 + 33;
         this.xiaohao.y = 10 + 115 + 15;
         this.xiaohao.textColor = StaticValue.ORANGE;
         addChild(this.xiaohao);
         this.guoqiSpr = new Sprite();
         addChild(this.guoqiSpr);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 230;
         _loc1_.height = 110;
         _loc1_.x = 20 + 18 + 15;
         _loc1_.y = 10 + 20 + 85 - 7;
         _loc1_.textColor = StaticValue.ORANGE;
         _loc1_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("胜利") + "           " + LanResManager.getLanCommonTextWords("平局") + "           " + LanResManager.getLanCommonTextWords("胜利") + "</font>";
         addChild(_loc1_);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 230;
         _loc1_.height = 110;
         _loc1_.x = 145;
         _loc1_.y = 50;
         _loc1_.textColor = StaticValue.ORANGE;
         _loc1_.htmlText = "<font size = \'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>VS</font>";
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 70 + 15;
         this.check1.y = 107;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 160 + 15;
         this.check2.y = 107;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.x = 250 + 15;
         this.check3.y = 107;
         this.check3.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 100 + 62 - 10;
         this.okBtn.y = 120 + 35 + 30;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onCreate);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check1:
               if(this.check1.selectState)
               {
                  this.check2.selectState = false;
                  this.check3.selectState = false;
               }
               this.BYTE = this.guoJiaId1;
               break;
            case this.check2:
               if(this.check2.selectState)
               {
                  this.check3.selectState = false;
                  this.check1.selectState = false;
               }
               this.BYTE = -1;
               break;
            case this.check3:
               if(this.check3.selectState)
               {
                  this.check2.selectState = false;
                  this.check1.selectState = false;
               }
               this.BYTE = this.guoJiaId2;
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
      
      private function onCreate(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               if(this.check1.selectState || this.check2.selectState || this.check3.selectState)
               {
                  this._$parent.dispatchEvent(new BaseEvent(ShiJieBeiPanel.UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_OK,"",[this.changCiId,this.BYTE]));
                  this.onClose();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请选择比赛结果！"));
               }
         }
      }
      
      public function setCs(param1:int, param2:int, param3:int, param4:String, param5:String, param6:int) : void
      {
         this.guoJiaId1 = param2;
         this.guoJiaId2 = param3;
         this.changCiId = param1;
         this.xiaohao.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("下注将花费金票：") + param6 + "<br>" + LanResManager.getLanCommonTextWords("一旦下注将无法取消") + "</font>";
         this.check1.selectState = false;
         this.check2.selectState = false;
         this.check3.selectState = false;
         while(this.guoqiSpr.numChildren > 0)
         {
            this.guoqiSpr.removeChildAt(0);
         }
         this.guoqi1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/" + param2 + ".swf");
         this.guoqi1.x = 16;
         this.guoqi1.y = 25;
         this.guoqiSpr.addChild(this.guoqi1);
         this.guoqi2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/" + param3 + ".swf");
         this.guoqi2.x = 215;
         this.guoqi2.y = 25;
         this.guoqiSpr.addChild(this.guoqi2);
      }
   }
}

