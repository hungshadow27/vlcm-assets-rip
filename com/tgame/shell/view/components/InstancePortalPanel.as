package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.instanceportal.InstancePortalProcessionListPanel;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class InstancePortalPanel extends FPanel
   {
      
      public static const UI_INSTANCEPORTAL_ACCEDEBTN:String = "UI_INSTANCEPORTAL_ACCEDEBTN";
      
      public static const UI_INSTANCEPORTAL_REFUSEBTN:String = "UI_INSTANCEPORTAL_REFUSEBTN";
      
      private var lb:FLabel;
      
      private var fta:FTextArea;
      
      private var flabel1:FLabel;
      
      private var flabel2:FLabel;
      
      private var flabel3:FLabel;
      
      private var flabel4:FLabel;
      
      private var flabel5:FLabel;
      
      private var ftextarea1:FTextArea;
      
      public var accedeBtn:SecondButton;
      
      public var refuseBtn:SecondButton;
      
      private var obj:Bitmap;
      
      private var countDownNmuber:int;
      
      private var fbmc:FTextArea;
      
      private var intervalId:int;
      
      private var processionlist:InstancePortalProcessionListPanel;
      
      private var selectBtn:FSimpleButton;
      
      private var listContainer2:FCanvas;
      
      private var giftList2:FList;
      
      private var Scroll2:FVScorllBar;
      
      private var selectGrade:FLabel;
      
      private var selectList2:FList;
      
      private var bg9:F9GridBitmap;
      
      private var changjingId:int;
      
      private var text:FLabel;
      
      private var text1:FLabel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function InstancePortalPanel()
      {
         var v:Vector.<Bitmap>;
         var bg:Bitmap = null;
         super();
         dragAble = true;
         this.skin = "sceondPanel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 308;
         height = 265;
         this.titleText = LanResManager.getLanCommonTextWords("副本传送");
         bg = new Bitmap();
         bg.name = "ui.instance.portal.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 70;
            y = 17;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("队长") + "：";
         }
         addChild(this.lb);
         this.flabel1 = new FLabel();
         with(this.flabel1)
         {
            x = 124;
            y = 17;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.flabel1);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 203;
            y = 17;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("等级") + "：";
         }
         addChild(this.lb);
         this.flabel2 = new FLabel();
         with(this.flabel2)
         {
            x = 243;
            y = 17;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.flabel2);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 83;
            y = 43;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮派") + "：";
         }
         addChild(this.lb);
         this.flabel3 = new FLabel();
         with(this.flabel3)
         {
            x = 124;
            y = 43;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.flabel3);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 203;
            y = 43;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("门派") + "：";
         }
         addChild(this.lb);
         this.flabel4 = new FLabel();
         with(this.flabel4)
         {
            x = 243;
            y = 43;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.flabel4);
         this.fbmc = new FTextArea();
         with(this.fbmc)
         {
            x = 40;
            y = 81;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            fbmc.text = LanResManager.getLanCommonTextWords("邀请您进入【副本名称】");
         }
         addChild(this.fbmc);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 110;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("副本要求等级") + "：<br>" + LanResManager.getLanCommonTextWords("每日限入次数") + "：<br>" + LanResManager.getLanCommonTextWords("副本奖励信息") + "：</font></textformat>";
         }
         addChild(this.fta);
         this.ftextarea1 = new FTextArea();
         with(this.ftextarea1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 105;
            y = 110;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ftextarea1);
         this.text1 = new FLabel();
         with(this.text1)
         {
            x = 32 + 335 - 233;
            y = 12 + 196 - 100;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("进入模式:");
         }
         addChild(this.text1);
         this.text1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.text1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         this.bg9 = Tools.get9GridBitmpByName("inputBg");
         this.bg9.width = 90;
         this.bg9.height = 19;
         this.bg9.x = 32 + 335 + 60 - 220;
         this.bg9.y = 12 + 196 - 100;
         addChild(this.bg9);
         this.selectGrade = new FLabel();
         with(this.selectGrade)
         {
            x = 155 + 335 - 60 - 220;
            y = 12 + 196 - 100;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("普通奖励");
         }
         addChild(this.selectGrade);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 272 + 335 - 60 - 44 - 6 - 220;
         this.selectBtn.y = 10 + 196 - 98;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.listContainer2 = new FCanvas();
         this.listContainer2.skin = "backGroud";
         this.listContainer2.x = 150 + 335 - 60 - 220;
         this.listContainer2.y = 28 + 196 - 98;
         addChild(this.listContainer2);
         this.listContainer2.visible = false;
         this.selectList2 = new FList();
         this.selectList2.skin = "list";
         this.selectList2.listWidth = 70;
         this.selectList2.x = 5;
         this.selectList2.y = 2;
         this.selectList2.itemRenderer = new StrengthenListRender();
         this.selectList2.dataProvider = <list>
																	<node label={LanResManager.getLanCommonTextWords("普通奖励")} id="1"/>
			
																</list>;
         this.listContainer2.addChild(this.selectList2);
         this.selectList2.setSelectItemByIndex(0);
         this.selectList2.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.listContainer2.width = this.selectList2.width + 10;
         this.listContainer2.height = this.selectList2.height + 4;
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 20;
            y = 180;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请问您是否同意传送");
         }
         addChild(this.lb);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 200;
            y = 180;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("倒计时") + "：";
         }
         addChild(this.lb);
         this.flabel5 = new FLabel();
         with(this.flabel5)
         {
            x = 263;
            y = 180;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = "15";
         }
         addChild(this.flabel5);
         this.accedeBtn = new SecondButton();
         this.accedeBtn.label = LanResManager.getLanCommonTextWords("同意");
         addChild(this.accedeBtn);
         this.accedeBtn.x = 70;
         this.accedeBtn.y = 209;
         this.accedeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.refuseBtn = new SecondButton();
         this.refuseBtn.label = LanResManager.getLanCommonTextWords("拒绝");
         addChild(this.refuseBtn);
         this.refuseBtn.x = 190;
         this.refuseBtn.y = 209;
         this.refuseBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.obj = new Bitmap(new BitmapData(60,60,true,0));
         addChild(this.obj);
         this.obj.width = this.obj.height = 48;
         this.obj.x = 23;
         this.obj.y = 13;
         this.showProcessionListPanel();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.addEventListener(Event.ADDED_TO_STAGE,this.addHandler);
      }
      
      private function addHandler(param1:Event) : void
      {
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.text1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.text1.getCharIndexAtPoint(this.text1.mouseX,this.text1.mouseY);
               if(_loc2_ >= this.text1.text.indexOf(LanResManager.getLanCommonTextWords("进入模式:")) && _loc2_ <= this.text1.text.indexOf(LanResManager.getLanCommonTextWords("进入模式:")) + 4)
               {
                  _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("进入模式说明：") + "<br></font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"普通奖励模式：进入时消耗一次副本进入次数，最后通关时获得正常通关奖励。双倍奖励模式：进入时消耗两次副本进入次数，最后通关时获得二倍通关奖励。如果在双倍奖励模式下通关失败，不会返还额外消耗的进入次数。") + "</font></textformat>";
                  this.showTip(_loc3_);
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.text1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 10;
         this.tipCanvas.y = mouseY;
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         this.listContainer2.visible = !this.listContainer2.visible;
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         var _loc2_:BaseEvent = null;
         this.selectGrade.text = this.selectList2.selectItem.label;
         this.listContainer2.visible = false;
         switch(this.selectList2.selectItem.id)
         {
            case "1":
            case "2":
            case "3":
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.accedeBtn:
               dispatchEvent(new BaseEvent(UI_INSTANCEPORTAL_ACCEDEBTN,"",[this.changjingId,this.selectList2.selectItem.id]));
               break;
            case this.refuseBtn:
               dispatchEvent(new BaseEvent(UI_INSTANCEPORTAL_REFUSEBTN,"",[this.changjingId,this.selectList2.selectItem.id]));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_INSTANCEPORTAL_REFUSEBTN,"",[this.changjingId,this.selectList2.selectItem.id]));
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showProcessionListPanel() : void
      {
         if(this.processionlist == null)
         {
            this.processionlist = new InstancePortalProcessionListPanel();
         }
         addChild(this.processionlist);
         this.processionlist.x = 308;
         this.processionlist.y = -25;
      }
      
      public function setInitializeContent(param1:Array, param2:int) : void
      {
         var _loc3_:Bitmap = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         if(param2 != -1)
         {
            this.changjingId = param2;
         }
         if(param1.length > 0)
         {
            _loc3_ = StaticValue.getBitmapByClassName(param1[0]);
            if(_loc3_)
            {
               this.obj.bitmapData = _loc3_.bitmapData;
            }
            if(param1[1].charAt(0) == "[" && param1[1].indexOf("]") != -1)
            {
               this.flabel1.text = param1[1].split("]")[1];
            }
            else
            {
               this.flabel1.text = param1[1];
            }
            this.flabel2.text = param1[2];
            this.flabel3.text = param1[3];
            this.flabel4.text = param1[4];
            _loc4_ = param1[7] / 2;
            _loc5_ = "";
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_ += "★";
               _loc6_++;
            }
            if(param1[7] % 2 != 0)
            {
               if(param1[7] % 2 == 1)
               {
                  _loc5_ += "☆";
               }
            }
            this.ftextarea1.htmlText = "<textformat leading=\'8\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1[5] + "<br>" + param1[6] + "<br>" + _loc5_ + "</font></textformat>";
            this.fbmc.htmlText = LanResManager.getLanCommonTextWords("邀请您进入") + "【" + param1[8] + "】";
            this.changjingId = param2;
         }
         else
         {
            this.obj.bitmapData = null;
            this.flabel1.text = "";
            this.flabel2.text = "";
            this.flabel3.text = "";
            this.flabel4.text = "";
            this.ftextarea1.htmlText = "";
            this.processionlist.giftList.dataProvider = new Array();
            this.changjingId = -1;
         }
      }
      
      public function setCountDownFun(param1:int) : void
      {
         this.flabel5.text = String(param1);
      }
      
      public function isDuizhang(param1:Boolean, param2:int) : void
      {
         this.accedeBtn.enabled = param1;
         this.selectBtn.enabled = param1;
         if(param1 == false)
         {
            if(param2 == 1)
            {
               this.selectGrade.text = LanResManager.getLanCommonTextWords("普通奖励");
               this.selectList2.setSelectItemByLabel(LanResManager.getLanCommonTextWords("普通奖励"));
            }
            else if(param2 == 2)
            {
               this.selectGrade.text = LanResManager.getLanCommonTextWords("双倍奖励");
               this.selectList2.setSelectItemByLabel(LanResManager.getLanCommonTextWords("双倍奖励"));
            }
            else if(param2 == 0)
            {
               this.selectGrade.text = LanResManager.getLanCommonTextWords("普通奖励");
               this.selectList2.setSelectItemByLabel(LanResManager.getLanCommonTextWords("普通奖励"));
            }
         }
         else
         {
            this.selectGrade.text = LanResManager.getLanCommonTextWords("普通奖励");
            this.selectList2.setSelectItemByLabel(LanResManager.getLanCommonTextWords("普通奖励"));
         }
      }
      
      public function setProcessionListFun(param1:Array) : void
      {
         this.processionlist.giftList.dataProvider = param1;
      }
   }
}

