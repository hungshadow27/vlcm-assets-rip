package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.TaskType;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.info.data.CharTaskData;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.manager.TaskTracker;
   import com.tgame.shell.view.components.cycletask.CycTaskTipPopWindow;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class CycTaskPanel extends FPanel
   {
      
      private static var taskID:int;
      
      public static const UI_CYCLETASK_DIMINUTIONBTN_CLICK:String = "UI_CYCLETASK_DIMINUTIONBTN_CLICK";
      
      public static const UI_CYCLETASK_DIMINUTION_OK:String = "UI_CYCLETASK_DIMINUTION_OK";
      
      public static const UI_CYCLETASK_UPGRADEBTN_CLICK:String = "UI_CYCLETASK_UPGRADEBTN_CLICK";
      
      public static const UI_CYCLETASK_UPGRADE_OK:String = "UI_CYCLETASK_UPGRADE_OK";
      
      public static const UI_CYCLETASK_MALLBTN_CLICK:String = "UI_CYCLETASK_MALLBTN_CLICK";
      
      public static const UI_CYCLETASK_OKBTN_CLICK:String = "UI_CYCLETASK_OKBTN_CLICK";
      
      public static const UI_CYCLETASK_ZHIJIEWANCHENG_CLICK:String = "UI_CYCLETASK_ZHIJIEWANCHENG_CLICK";
      
      public static const UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK:String = "UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK";
      
      public static const UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK1:String = "UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK1";
      
      public var $parent:DisplayObject;
      
      private var acceptCount:FLabel;
      
      private var completeCount:FLabel;
      
      private var taskTarget:FTextArea;
      
      private var difficulty:FLabel;
      
      private var taskPrize:FLabel;
      
      private var prizeLv:FLabel;
      
      private var prizeContainer:Sprite;
      
      private var appendPrize:FLabel;
      
      private var appendPrizeContainer:Sprite;
      
      private var diminutionBtn:SecondButton;
      
      private var upgradeBtn:SecondButton;
      
      private var okBtn:SecondButton;
      
      private var ok1Btn:SecondButton;
      
      private var lb1:FLabel;
      
      private var lb2:FLabel;
      
      private var lb3:FLabel;
      
      private var lb4:FLabel;
      
      private var lb5:FLabel;
      
      public function CycTaskPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var lb:FLabel;
         super();
         skin = "panel_btn";
         dragAble = true;
         this.showCloseButton = true;
         width = 355;
         height = 364;
         this.titleText = LanResManager.getLanCommonTextWords("金钱帮环式任务");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.cycletask.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         DynamicManageImages = v;
         lb = new FLabel();
         with(lb)
         {
            x = 18;
            y = 6;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"金钱帮环式任务完成情况一览");
         }
         addChild(lb);
         this.lb1 = new FLabel();
         with(this.lb1)
         {
            x = 20;
            y = 22;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"今日接取次数");
         }
         addChild(this.lb1);
         this.acceptCount = new FLabel();
         with(this.acceptCount)
         {
            x = 100;
            y = 22;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "20";
         }
         addChild(this.acceptCount);
         this.lb2 = new FLabel();
         with(this.lb2)
         {
            x = 120;
            y = 22;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"每日最多可接取金钱帮任务20次");
         }
         addChild(this.lb2);
         this.lb3 = new FLabel();
         with(this.lb3)
         {
            x = 20;
            y = 42;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"今日完成次数");
         }
         addChild(this.lb3);
         this.completeCount = new FLabel();
         with(this.completeCount)
         {
            x = 100;
            y = 42;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "20";
         }
         addChild(this.completeCount);
         this.lb4 = new FLabel();
         with(this.lb4)
         {
            x = 120;
            y = 42;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"次数=10时");
         }
         addChild(this.lb4);
         this.lb5 = new FLabel();
         with(this.lb5)
         {
            x = 120;
            y = 60;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"次数=20时");
         }
         addChild(this.lb5);
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 86;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("本次任务目标");
         }
         addChild(lb);
         this.taskTarget = new FTextArea();
         with(this.taskTarget)
         {
            x = 20;
            y = 100;
            width = 198;
            height = 37;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.taskTarget);
         this.diminutionBtn = new SecondButton();
         this.diminutionBtn.label = LanResManager.getLanTextWords(this,"降低任务难度");
         addChild(this.diminutionBtn);
         this.diminutionBtn.x = 242;
         this.diminutionBtn.y = 106;
         this.diminutionBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = 220;
            y = 86;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("难度");
         }
         addChild(lb);
         this.difficulty = new FLabel();
         with(this.difficulty)
         {
            x = 258;
            y = 86;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "20";
         }
         addChild(this.difficulty);
         lb = new FLabel();
         with(lb)
         {
            x = 275;
            y = 86;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"最小为1");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 134;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本次任务奖励");
         }
         addChild(lb);
         this.taskPrize = new FLabel();
         with(this.taskPrize)
         {
            x = 20;
            y = 150;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.taskPrize);
         this.upgradeBtn = new SecondButton();
         this.upgradeBtn.label = LanResManager.getLanTextWords(this,"提升奖励回报");
         addChild(this.upgradeBtn);
         this.upgradeBtn.x = 220;
         this.upgradeBtn.y = 170;
         this.upgradeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.prizeContainer = new Sprite();
         addChild(this.prizeContainer);
         this.prizeContainer.x = 20;
         this.prizeContainer.y = 168;
         lb = new FLabel();
         with(lb)
         {
            x = 210;
            y = 134;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"丰厚度");
         }
         addChild(lb);
         this.prizeLv = new FLabel();
         with(this.prizeLv)
         {
            x = 258;
            y = 134;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = "20";
         }
         addChild(this.prizeLv);
         lb = new FLabel();
         with(lb)
         {
            x = 275;
            y = 134;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"最大为10");
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 20;
            y = 212;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本次任务完成额外奖励");
         }
         addChild(lb);
         this.appendPrize = new FLabel();
         with(this.appendPrize)
         {
            x = 20;
            y = 227;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.appendPrize);
         this.appendPrizeContainer = new Sprite();
         addChild(this.appendPrizeContainer);
         this.appendPrizeContainer.x = 20;
         this.appendPrizeContainer.y = 242;
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"开始任务");
         addChild(this.okBtn);
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 298;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ok1Btn = new SecondButton();
         this.ok1Btn.label = LanResManager.getLanCommonTextWords("直接完成");
         this.ok1Btn.x = (width - this.ok1Btn.width) / 2 / 2 + this.okBtn.x * 2;
         this.ok1Btn.y = 298;
         this.ok1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.diminutionBtn:
               dispatchEvent(new BaseEvent(UI_CYCLETASK_DIMINUTIONBTN_CLICK));
               break;
            case this.upgradeBtn:
               dispatchEvent(new BaseEvent(UI_CYCLETASK_UPGRADEBTN_CLICK));
               break;
            case this.okBtn:
               this.onClose();
               break;
            case this.ok1Btn:
               dispatchEvent(new BaseEvent(UI_CYCLETASK_ZHIJIEWANCHENG_CLICK));
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function setTaskPrize(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         while(this.prizeContainer.numChildren > 0)
         {
            this.prizeContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new ItemFace(param1[_loc2_] as BaseItem);
            this.prizeContainer.addChild(_loc4_);
            _loc4_.x = _loc2_ * 38;
            _loc2_++;
         }
      }
      
      private function setAppendPrize(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         while(this.appendPrizeContainer.numChildren > 0)
         {
            this.appendPrizeContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new ItemFace(param1[_loc2_] as BaseItem);
            this.appendPrizeContainer.addChild(_loc4_);
            _loc4_.x = _loc2_ * 38;
            _loc2_++;
         }
      }
      
      private function openTipWindow(param1:Boolean) : void
      {
         var str:String = null;
         var bool:Boolean = param1;
         if(bool)
         {
            str = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("想直接完成任务吗？") + "</font>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  if($parent == null)
                  {
                     dispatchEvent(new BaseEvent(UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK));
                  }
                  else
                  {
                     $parent.dispatchEvent(new BaseEvent(UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK1,"",taskID));
                  }
                  onClose();
               }
            });
         }
         else
         {
            str = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("想直接完成任务吗？只要您的背包中") + "\n" + LanResManager.getLanCommonTextWords("拥有五个“赏善罚恶令”道具，即可") + "\n" + LanResManager.getLanCommonTextWords("直接完成日常任务") + "</font>\n<font color=\'" + StaticValue.RED_HTML + "\'><b>" + LanResManager.getLanCommonTextWords("很抱歉，您的背包中“赏善罚恶令”") + "\n" + LanResManager.getLanCommonTextWords("不足五个") + "</b></font>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("商城购买");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  if($parent == null)
                  {
                     dispatchEvent(new BaseEvent(UI_CYCLETASK_MALLBTN_CLICK));
                  }
                  else
                  {
                     $parent.dispatchEvent(new BaseEvent(UI_CYCLETASK_MALLBTN_CLICK));
                  }
               }
            });
         }
      }
      
      public function setTask(param1:int, param2:int) : void
      {
         var _loc3_:CharTaskData = GameInstance.mainCharData.taskInfo.getTask(param1);
         taskID = param1;
         if(_loc3_ == null)
         {
            return;
         }
         this.completeCount.text = param2.toString();
         var _loc4_:int = _loc3_.currentLoop;
         this.acceptCount.text = _loc4_.toString();
         var _loc5_:String = TaskTracker.getTaskTrackStr(_loc3_);
         this.taskTarget.htmlText = _loc5_;
         var _loc6_:int = _loc3_.taskRes.loopTaskDifficulty;
         if(_loc6_ == 1)
         {
            this.diminutionBtn.enabled = false;
         }
         else
         {
            this.diminutionBtn.enabled = true;
         }
         this.difficulty.text = _loc6_.toString();
         var _loc7_:Array = TaskTracker.getRewardArr(param1);
         var _loc8_:String = _loc7_[0];
         this.taskPrize.text = _loc8_;
         var _loc9_:int = _loc3_.taskRes.loopTaskBonus;
         if(_loc9_ == 10)
         {
            this.upgradeBtn.enabled = false;
         }
         else
         {
            this.upgradeBtn.enabled = true;
         }
         this.prizeLv.text = _loc9_.toString();
         var _loc10_:Array = _loc7_[1];
         this.setTaskPrize(_loc10_);
         var _loc11_:int = GameInstance.mainCharData.attributeInfo.lv;
         var _loc12_:String = "";
         var _loc13_:int = _loc3_.taskRes.type;
         if(_loc13_ == TaskType.DAY_LOOP)
         {
            this.lb1.text = LanResManager.getLanTextWords(this,"今日接取次数");
            this.lb2.text = LanResManager.getLanTextWords(this,"每日最多可接取金钱帮任务20次");
            this.lb3.text = LanResManager.getLanTextWords(this,"今日完成次数");
            this.lb4.text = LanResManager.getLanTextWords(this,"次数=10时");
            this.lb5.text = LanResManager.getLanTextWords(this,"次数=20时");
            if(param2 == 10 - 1)
            {
               _loc12_ = LanResManager.getLanTextWords(this,"经验+") + _loc11_ * 400;
            }
            else if(param2 == 20 - 1)
            {
               _loc12_ = LanResManager.getLanTextWords(this,"经验+") + _loc11_ * 1000 + " " + LanResManager.getLanTextWords(this,"真气+") + _loc11_ * 100;
            }
            this.appendPrize.text = _loc12_;
         }
         else if(_loc13_ == TaskType.WEEK_LOOP)
         {
            this.lb1.text = LanResManager.getLanTextWords(this,"本周接取次数");
            this.lb2.text = LanResManager.getLanTextWords(this,"每周最多可接取200次试炼任务");
            this.lb3.text = LanResManager.getLanTextWords(this,"本周完成次数");
            this.lb4.text = LanResManager.getLanTextWords(this,"次数=100时");
            this.lb5.text = LanResManager.getLanTextWords(this,"次数=200");
            if(param2 == 100 - 1)
            {
               _loc12_ = LanResManager.getLanTextWords(this,"经验+") + _loc11_ * 3000;
            }
            else if(param2 == 200 - 1)
            {
               _loc12_ = LanResManager.getLanTextWords(this,"经验+") + " " + _loc11_ * 8000 + LanResManager.getLanTextWords(this,"真气+") + _loc11_ * 100;
            }
            this.appendPrize.text = _loc12_;
         }
         var _loc14_:Array = [];
         this.setAppendPrize(_loc14_);
      }
      
      public function showDiminutionTip(param1:Boolean, param2:Function = null, param3:DisplayObject = null) : void
      {
         var _loc4_:CycTaskTipPopWindow = new CycTaskTipPopWindow(param2);
         _loc4_.$parent = param3 || this;
         _loc4_.type = 2;
         _loc4_.isItem(param1);
         POPWindowManager.showWindow(_loc4_);
      }
      
      public function showUpgradeTip(param1:Boolean, param2:Function = null, param3:DisplayObject = null) : void
      {
         var _loc4_:CycTaskTipPopWindow = new CycTaskTipPopWindow(param2);
         _loc4_.$parent = param3 || this;
         _loc4_.type = 1;
         _loc4_.isItem(param1);
         POPWindowManager.showWindow(_loc4_);
      }
      
      public function showOKTip(param1:Boolean, param2:DisplayObject = null) : void
      {
         this.$parent = param2;
         this.openTipWindow(param1);
      }
      
      public function setTaskID(param1:int) : void
      {
         taskID = param1;
      }
   }
}

