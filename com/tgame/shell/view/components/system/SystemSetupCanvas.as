package com.tgame.shell.view.components.system
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.SystemPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   import flash.utils.Dictionary;
   
   public class SystemSetupCanvas extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      public var check1:FCheckBox;
      
      public var check2:FCheckBox;
      
      public var check3:FCheckBox;
      
      public var check4:FCheckBox;
      
      public var check5:FCheckBox;
      
      public var check6:FCheckBox;
      
      public var check7:FCheckBox;
      
      public var check8:FCheckBox;
      
      public var check9:FCheckBox;
      
      public var check10:FCheckBox;
      
      public var check11:FCheckBox;
      
      public var check12:FCheckBox;
      
      public var check13:FCheckBox;
      
      public var check14:FCheckBox;
      
      private var subBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var adhibitionBtn:SecondButton;
      
      private var shuju:Array;
      
      public var bgImg:Bitmap;
      
      private var tip:FTextArea;
      
      public function SystemSetupCanvas()
      {
         this.shuju = new Array();
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.system.option.ui";
         addChild(this.bgImg);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 15;
         this.check1.y = 20;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 40;
            y = 22;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"系统设置屏蔽其他玩家的造型显示",[StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 28;
            y = 58;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"系统设置与您的机器非常卡的时候",[StaticValue.GREEN_HTML,StaticValue.GREEN_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 15;
         this.check2.y = 104;
         this.check2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 40;
            y = 106;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"系统设置与屏蔽其他玩家的名字信息",[StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.x = 15;
         this.check3.y = 146;
         this.check3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 40;
            y = 148;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"系统设置与屏蔽暴击操作的震屏特效",[StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check4 = new FCheckBox();
         addChild(this.check4);
         this.check4.x = 15;
         this.check4.y = 188;
         this.check4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check4.enabled = false;
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 40;
            y = 190;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"系统设置与屏蔽生命过低时的心跳特效",[StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check5 = new FCheckBox();
         addChild(this.check5);
         this.check5.x = 15;
         this.check5.y = 230;
         this.check5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 40;
            y = 232;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"屏蔽任务追踪面板的显示",[StaticValue.WHITE_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check6 = new FCheckBox();
         addChild(this.check6);
         this.check6.x = 15;
         this.check6.y = 254;
         this.check6.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 40;
            y = 256;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"屏蔽队员信息窗口的显示",[StaticValue.WHITE_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check7 = new FCheckBox();
         addChild(this.check7);
         this.check7.x = 241;
         this.check7.y = 20;
         this.check7.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 266;
            y = 22;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"关闭地图音乐",[StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check8 = new FCheckBox();
         addChild(this.check8);
         this.check8.x = 241;
         this.check8.y = 64;
         this.check8.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 266;
            y = 66;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"关闭动作音效",[StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check9 = new FCheckBox();
         addChild(this.check9);
         this.check9.x = 241;
         this.check9.y = 106;
         this.check9.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 266;
            y = 108;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"禁止他人向我发起私聊",[StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check10 = new FCheckBox();
         addChild(this.check10);
         this.check10.x = 241;
         this.check10.y = 148;
         this.check10.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 266;
            y = 150;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"禁止他人将我加为好友",[StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check11 = new FCheckBox();
         addChild(this.check11);
         this.check11.x = 241;
         this.check11.y = 190;
         this.check11.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 266;
            y = 192;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"拒绝他人向我发起交易",[StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check12 = new FCheckBox();
         addChild(this.check12);
         this.check12.x = 241;
         this.check12.y = 232;
         this.check12.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 266;
            y = 234;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"拒绝他人邀请我加入帮派",[StaticValue.WHITE_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check13 = new FCheckBox();
         addChild(this.check13);
         this.check13.x = 241;
         this.check13.y = 256;
         this.check13.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 266;
            y = 258;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"拒绝他人邀请我加入组队",[StaticValue.WHITE_HTML],false) + "</textformat>";
         }
         addChild(this.tip);
         this.check14 = new FCheckBox();
         this.check14.selectState = true;
         addChild(this.check14);
         this.check14.x = 241;
         this.check14.y = 280;
         this.check14.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            tip.autoSize = TextFieldAutoSize.LEFT;
            x = 266;
            y = 282;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "Huỷ kích hoạt kĩ năng ẩn thân" + "</font>" + "</textformat>";
         }
         addChild(this.tip);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.check1:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[0,this.check1.selectState]));
               break;
            case this.check2:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[1,this.check2.selectState]));
               break;
            case this.check3:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[2,this.check3.selectState]));
               break;
            case this.check4:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[3,this.check4.selectState]));
               break;
            case this.check5:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[4,this.check5.selectState]));
               break;
            case this.check6:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[5,this.check6.selectState]));
               break;
            case this.check7:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[6,this.check7.selectState]));
               break;
            case this.check8:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[7,this.check8.selectState]));
               break;
            case this.check9:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[8,this.check9.selectState]));
               break;
            case this.check10:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[9,this.check10.selectState]));
               break;
            case this.check11:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[10,this.check11.selectState]));
               break;
            case this.check12:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[11,this.check12.selectState]));
               break;
            case this.check13:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[12,this.check13.selectState]));
               break;
            case this.check14:
               this._parent.dispatchEvent(new BaseEvent(SystemPanel.UI_SYSTEM_SETUP_CHECK_SHOW,"",[13,this.check14.selectState]));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function SetInitialize(param1:Dictionary) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 14)
         {
            this["check" + (_loc2_ + 1)].selectState = param1[_loc2_];
            _loc2_++;
         }
      }
   }
}

