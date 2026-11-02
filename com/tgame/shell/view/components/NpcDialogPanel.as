package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.staticdata.TaskType;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.info.YabiaoInfo;
   import com.tgame.common.vo.character.info.data.CharEndTaskData;
   import com.tgame.common.vo.character.info.data.CharTaskData;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.text.*;
   
   public class NpcDialogPanel extends Sprite
   {
      
      public static const UI_NPC_DIALOG_FUNCTIONLIST_CLICK:String = "UI_NPC_DIALOG_FUNCTIONLIST_CLICK";
      
      public static const UI_NPC_DIALOG_TASKLIST_CLICK:String = "UI_NPC_DIALOG_TASKLIST_CLICK";
      
      public static const UI_NPC_DIALOG_NEXTDIALOG_SHOW:String = "UI_NPC_DIALOG_NEXTDIALOG_SHOW";
      
      private var headimg:DisplayObject;
      
      private var headUrl:String = "";
      
      private var topContainer:FCanvas;
      
      private var underContainer:FCanvas;
      
      private var npcName:FLabel;
      
      private var npcDialog:FTextArea;
      
      public var functionList:FTextArea;
      
      public var taskList:FTextArea;
      
      public var taskDialog:FTextArea;
      
      private var tf:TextFormat;
      
      private var tishiSpr:Sprite;
      
      public function NpcDialogPanel()
      {
         super();
         this.tf = new TextFormat();
         this.tf.size = 14;
         this.headimg = new Bitmap(new BitmapData(200,200,true,0));
         addChild(this.headimg);
         this.headimg.y = -200;
         this.topContainer = new FCanvas();
         this.topContainer.skin = "dialogBg_top";
         addChild(this.topContainer);
         this.underContainer = new FCanvas();
         this.underContainer.skin = "dialogBg_underside";
         addChild(this.underContainer);
         this.underContainer.y = 120;
         this.tishiSpr = new Sprite();
         addChild(this.tishiSpr);
         this.tishiSpr.y = 120;
         this.npcName = new FLabel();
         with(this.npcName)
         {
            x = 8;
            y = 8;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,16,null,true);
         }
         this.topContainer.addChild(this.npcName);
         this.npcDialog = new FTextArea();
         with(this.npcDialog)
         {
            x = 28;
            y = 40;
            width = 460;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
         }
         this.topContainer.addChild(this.npcDialog);
         this.functionList = new FTextArea();
         with(this.functionList)
         {
            x = 18;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            addEventListener(TextEvent.LINK,onFunction);
         }
         this.underContainer.addChild(this.functionList);
         this.taskList = new FTextArea();
         with(this.taskList)
         {
            width = 306;
            x = 260;
            y = 30;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            addEventListener(TextEvent.LINK,onTask);
         }
         this.underContainer.addChild(this.taskList);
         this.taskDialog = new FTextArea();
         with(this.taskDialog)
         {
            x = 28;
            y = 15;
            width = 460;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            visible = false;
         }
         this.underContainer.addChild(this.taskDialog);
      }
      
      private function onFunction(param1:TextEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_NPC_DIALOG_FUNCTIONLIST_CLICK,"",param1.text));
      }
      
      private function onTask(param1:TextEvent) : void
      {
         var str:String = null;
         var arr:Array = null;
         var e:TextEvent = param1;
         str = e.text;
         if(str == "fangqiSelf" || str == "fangqiBanghui")
         {
            FAlert.show(LanResManager.getLanCommonTextWords("确定放弃该押镖任务？"),"",2,function(param1:FAlertEvent):void
            {
               var _loc2_:int = 0;
               if(param1.eventData == FAlert.OK)
               {
                  _loc2_ = str == "fangqiSelf" ? -1 : -2;
                  PipeManager.sendMsg(PipeConstants.FANGQI_YABIAO_TASK,_loc2_);
               }
            },false);
         }
         else
         {
            arr = e.text.split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
            EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(UI_NPC_DIALOG_TASKLIST_CLICK,"",arr));
         }
      }
      
      private function onNextDialog(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_NPC_DIALOG_NEXTDIALOG_SHOW));
      }
      
      private function resize() : void
      {
         this.topContainer.height = this.npcDialog.height + 60;
         var _loc1_:Number = this.functionList.visible ? this.functionList.height + this.functionList.y : 0;
         var _loc2_:Number = this.taskList.visible ? this.taskList.height + this.taskList.y : 0;
         var _loc3_:Number = this.taskDialog.visible ? this.taskDialog.height + this.taskDialog.y : 0;
         var _loc4_:Number = _loc1_ > _loc2_ ? _loc1_ : _loc2_;
         this.underContainer.height = (_loc4_ > _loc3_ ? _loc4_ : _loc3_) + 30;
         this.underContainer.y = this.topContainer.height + 10;
         this.tishiSpr.y = this.topContainer.height + 10;
      }
      
      public function show(param1:String, param2:String, param3:String, param4:Array) : void
      {
         var _loc5_:int = 0;
         if(this.headUrl != param1)
         {
            this.headUrl = param1;
            if(this.headimg != null && this.headimg.parent != null)
            {
               this.headimg.parent.removeChild(this.headimg);
            }
            if(param1 != "")
            {
               this.headimg = FLoader.startLoad(param1,200,200);
               addChild(this.headimg);
               this.headimg.y = -200;
            }
         }
         this.underContainer.removeEventListener(MouseEvent.CLICK,this.onNextDialog);
         this.functionList.visible = true;
         this.taskList.visible = true;
         this.taskDialog.visible = false;
         this.npcName.text = param2;
         this.npcDialog.text = param3;
         this.functionList.htmlText = "<textformat leading=\'4\'>";
         var _loc6_:int = int(param4.length);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            this.functionList.htmlText += "<a href=\"event:" + param4[_loc5_] + "\">☞ " + param4[_loc5_] + "</a><br>";
            _loc5_++;
         }
         this.functionList.htmlText += "</textformat>";
         this.resize();
      }
      
      public function setTaskList(param1:Array = null, param2:String = null, param3:Bitmap = null) : void
      {
         var _loc5_:TaskRes = null;
         var _loc4_:String = "";
         if(param2 != null && param2 != "")
         {
            _loc4_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font><br />";
         }
         if(param1 != null)
         {
            for each(_loc5_ in param1[3])
            {
               _loc4_ += this.getNpcTaskHtmlText(_loc5_,3);
            }
            for each(_loc5_ in param1[0])
            {
               _loc4_ += this.getNpcTaskHtmlText(_loc5_,0);
            }
            for each(_loc5_ in param1[2])
            {
               _loc4_ += this.getNpcTaskHtmlText(_loc5_,2);
            }
            for each(_loc5_ in param1[1])
            {
               _loc4_ += this.getNpcTaskHtmlText(_loc5_,1);
            }
         }
         if(GameInstance.lockOnChar != null)
         {
            if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE)
            {
               if(GameInstance.lockOnChar.id == YabiaoInfo.ACCEPT_NPC_ID)
               {
                  _loc4_ += "<font color=\'" + StaticValue.BLUE_HTML + "\'><a href=\"event:0," + YabiaoInfo.SELF_ID + "\">" + "[" + LanResManager.getLanCommonTextWords("帮会") + "]" + LanResManager.getLanCommonTextWords("个人押镖任务") + "(" + LanResManager.getLanCommonTextWords("对话|可接|可交|进行中").split("|")[1] + ")" + "</a></font><br />";
               }
            }
            else if(GameInstance.mainCharData.yabiaoInfo.haveSelfYabiao())
            {
               if(GameInstance.lockOnChar.id == GameInstance.mainCharData.yabiaoInfo.yabiaoNpc)
               {
                  if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_FAIL)
                  {
                     _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + "[" + LanResManager.getLanCommonTextWords("帮会") + "]" + LanResManager.getLanCommonTextWords("个人押镖任务") + "(" + LanResManager.getLanCommonTextWords("已失败") + ")" + " <u><a href=\"event:fangqiSelf\">" + LanResManager.getLanCommonTextWords("点此放弃") + "</a></u></font><br />";
                  }
                  else if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT)
                  {
                     _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + "[" + LanResManager.getLanCommonTextWords("帮会") + "]" + LanResManager.getLanCommonTextWords("个人押镖任务") + "(" + LanResManager.getLanCommonTextWords("已超时") + ")" + " <u><a href=\"event:fangqiSelf\">" + LanResManager.getLanCommonTextWords("点此放弃") + "</a></u></font><br />";
                  }
                  else
                  {
                     _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\"event:2," + YabiaoInfo.SELF_ID + "\">" + "[" + LanResManager.getLanCommonTextWords("帮会") + "]" + LanResManager.getLanCommonTextWords("个人押镖任务") + "(" + LanResManager.getLanCommonTextWords("对话|可接|可交|进行中").split("|")[2] + ")" + "</a></font><br />";
                  }
               }
            }
            if(GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE)
            {
               if(GameInstance.lockOnChar.id == YabiaoInfo.ACCEPT_NPC_ID)
               {
                  _loc4_ += "<font color=\'" + StaticValue.BLUE_HTML + "\'><a href=\"event:0," + YabiaoInfo.BANGHUI_ID + "\">" + "[" + LanResManager.getLanCommonTextWords("帮会") + "]" + LanResManager.getLanCommonTextWords("帮会押镖任务") + "(" + LanResManager.getLanCommonTextWords("对话|可接|可交|进行中").split("|")[1] + ")" + "</a></font><br />";
               }
            }
            else if(GameInstance.mainCharData.yabiaoInfo.haveBanghuiYabiao())
            {
               if(GameInstance.lockOnChar.id == GameInstance.mainCharData.yabiaoInfo.yabiaoNpc)
               {
                  if(GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_FAIL)
                  {
                     _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + "[" + LanResManager.getLanCommonTextWords("帮会") + "]" + LanResManager.getLanCommonTextWords("个人押镖任务") + "(" + LanResManager.getLanCommonTextWords("已失败") + ")" + " <u><a href=\"event:fangqiBanghui\">" + LanResManager.getLanCommonTextWords("点此放弃") + "</a></u></font><br />";
                  }
                  else if(GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT)
                  {
                     _loc4_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + "[" + LanResManager.getLanCommonTextWords("帮会") + "]" + LanResManager.getLanCommonTextWords("个人押镖任务") + "(" + LanResManager.getLanCommonTextWords("已超时") + ")" + " <u><a href=\"event:fangqiBanghui\">" + LanResManager.getLanCommonTextWords("点此放弃") + "</a></u></font><br />";
                  }
                  else
                  {
                     _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\"event:2," + YabiaoInfo.BANGHUI_ID + "\">" + "[" + LanResManager.getLanCommonTextWords("帮会") + "]" + LanResManager.getLanCommonTextWords("帮会押镖任务") + "(" + LanResManager.getLanCommonTextWords("对话|可接|可交|进行中").split("|")[2] + ")" + "</a></font><br />";
                  }
               }
            }
         }
         this.taskList.htmlText = _loc4_;
         while(this.tishiSpr.numChildren > 0)
         {
            this.tishiSpr.removeChildAt(0);
         }
         if(param3 != null)
         {
            this.tishiSpr.addChild(param3);
            param3.x = 150;
            param3.y = 30;
         }
         this.resize();
      }
      
      private function getNpcTaskHtmlText(param1:TaskRes, param2:int) : String
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc8_:CharEndTaskData = null;
         var _loc9_:CharTaskData = null;
         var _loc3_:String = "";
         _loc4_ = "[" + TaskType.getNameByValue(param1.type) + "]";
         _loc5_ = param1.name;
         _loc6_ = "";
         if(param1.isLoop)
         {
            if(param2 == 0)
            {
               _loc8_ = TaskManager.getEndTask(param1.id);
               if(_loc8_ != null)
               {
                  _loc6_ = "(" + (_loc8_.currentLoop + 1) + "/" + param1.loopMaxCount + ")";
               }
               else
               {
                  _loc6_ = "(1/" + param1.loopMaxCount + ")";
               }
            }
            else
            {
               _loc9_ = TaskManager.getTask(param1.id);
               if(_loc9_ != null)
               {
                  _loc6_ = "(" + _loc9_.currentLoop + "/" + param1.loopMaxCount + ")";
               }
               else
               {
                  _loc6_ = "(1/" + param1.loopMaxCount + ")";
               }
            }
         }
         if(param1.type == TaskType.CISHA)
         {
            _loc6_ = "";
         }
         var _loc7_:Array = LanResManager.getLanCommonTextWords("对话|可接|可交|进行中").split("|");
         if(param2 == 3)
         {
            _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\"event:3," + param1.id + "\">" + _loc4_ + _loc5_ + _loc6_ + "(" + _loc7_[0] + ")</a></font><br />";
         }
         else if(param2 == 0)
         {
            _loc3_ += "<font color=\'" + StaticValue.BLUE_HTML + "\'><a href=\"event:0," + param1.id + "\">" + _loc4_ + _loc5_ + _loc6_ + "(" + _loc7_[1] + ")</a></font><br />";
         }
         else if(param2 == 2)
         {
            _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\"event:2," + param1.id + "\">" + _loc4_ + _loc5_ + _loc6_ + "(" + _loc7_[2] + ")</a></font><br />";
         }
         else if(param2 == 1)
         {
            _loc3_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'><a href=\"event:1," + param1.id + "\">" + _loc4_ + _loc5_ + _loc6_ + "(" + _loc7_[3] + ")</a></font><br />";
         }
         return _loc3_;
      }
      
      public function setNextDialog(param1:Array) : void
      {
         this.functionList.visible = false;
         this.taskList.visible = false;
         this.taskDialog.visible = true;
         this.npcDialog.htmlText = param1[0];
         this.taskDialog.htmlText = param1[1];
         this.npcName.text = param1[2];
         if(this.headUrl != param1[3])
         {
            this.headUrl = param1[3];
            if(this.headimg != null && this.headimg.parent != null)
            {
               this.headimg.parent.removeChild(this.headimg);
            }
            if(param1[3] != "")
            {
               this.headimg = FLoader.startLoad(param1[3],200,200);
               addChild(this.headimg);
               this.headimg.y = -200;
            }
         }
         this.underContainer.addEventListener(MouseEvent.CLICK,this.onNextDialog);
         this.resize();
      }
   }
}

