package com.tgame.shell.view.components.task
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.tree.FTree;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.activity.ActivityRes;
   import com.tgame.common.res.activity.ActivityResManager;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.res.task.vo.TaskTargetData;
   import com.tgame.common.staticdata.TaskType;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.info.DynamicTaskInfo;
   import com.tgame.common.vo.character.info.YabiaoInfo;
   import com.tgame.common.vo.character.info.data.CharTaskData;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.shell.view.components.CycTaskPanel;
   import com.tgame.shell.view.components.TaskPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class AcceptableTaskList extends Sprite
   {
      
      public static const UI_TASK_TASK_ACCEPTED:String = "UI_TASK_TASK_ACCEPTED";
      
      public static const UI_TASK_TASK_ACCEPTABLE:String = "UI_TASK_TASK_ACCEPTABLE";
      
      public static const UI_TASK_ACTIVE:String = "UI_TASK_ACTIVE";
      
      public var bgImg:Bitmap;
      
      public var $parent:DisplayObject;
      
      private var cyc:CycTaskPanel;
      
      private var _type:String;
      
      private var title:FLabel;
      
      private var taskTree:FTree;
      
      private var taskScroll:FVScorllBar;
      
      private var listContainer:Sprite;
      
      private var contentContainer:Sprite;
      
      public var content:FTextArea;
      
      private var contentScroll:FVScorllBar;
      
      public var tipContainer:Sprite;
      
      public var tip:FTextArea;
      
      private var tipScroll:FVScorllBar;
      
      private var prizeContainer:Sprite;
      
      private var cancelBtn:SecondButton;
      
      private var selectID:String = "0";
      
      public function AcceptableTaskList()
      {
         super();
         this._type = UI_TASK_TASK_ACCEPTED;
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.task.ui";
         this.title = new FLabel();
         with(this.title)
         {
            x = 67;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("任务名称");
         }
         addChild(this.title);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 4;
            y = 30;
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,172,219);
            graphics.endFill();
         }
         this.taskTree = new FTree();
         this.taskTree.treeWidth = 172;
         this.taskTree.itemRenderer = new TaskListitemRender();
         this.listContainer.addChild(this.taskTree);
         this.taskScroll = new FVScorllBar(this.listContainer,219);
         addChild(this.taskScroll);
         this.taskScroll.x = 177;
         this.taskScroll.y = 30;
         this.listContainer.addEventListener(MouseEvent.CLICK,this.onClick);
         this.contentContainer = new Sprite();
         with(this.contentContainer)
         {
            x = 203;
            y = 5;
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,261,113);
            graphics.endFill();
         }
         addChild(this.contentContainer);
         this.content = new FTextArea();
         with(this.content)
         {
            x = 0;
            y = 0;
            width = 261;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
         }
         this.content.addEventListener(TextEvent.LINK,this.onLink);
         this.contentContainer.addChild(this.content);
         this.contentScroll = new FVScorllBar(this.contentContainer,113);
         this.contentScroll.x = 464;
         this.contentScroll.y = 5;
         addChild(this.contentScroll);
         this.tipContainer = new Sprite();
         addChild(this.tipContainer);
         this.tipContainer.x = 203;
         this.tipContainer.y = 125;
         with(this.tipContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,261,123);
            endFill();
         }
         this.prizeContainer = new Sprite();
         this.tipContainer.addChild(this.prizeContainer);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 0;
            y = 0;
            width = 261;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
         }
         this.tipContainer.addChild(this.tip);
         this.tip.addEventListener(TextEvent.LINK,this.onLink);
         this.tipScroll = new FVScorllBar(this.tipContainer,123);
         this.tipScroll.x = 464;
         this.tipScroll.y = 125;
         addChild(this.tipScroll);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("放弃");
         addChild(this.cancelBtn);
         this.cancelBtn.enabled = false;
         this.cancelBtn.x = 395;
         this.cancelBtn.y = 263;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onCancel);
      }
      
      private function onLink(param1:TextEvent) : void
      {
         var _loc2_:String = param1.text;
         var _loc3_:Array = _loc2_.split(",");
         if(_loc3_.indexOf("reset") != -1)
         {
            if(_loc3_.indexOf("nandu") != -1)
            {
               this.$parent.dispatchEvent(new BaseEvent(TaskPanel.RESET_TASK_NANDU,"",parseInt(_loc3_[0])));
            }
            else if(_loc3_.indexOf("jiangli") != -1)
            {
               this.$parent.dispatchEvent(new BaseEvent(TaskPanel.RESET_TASK_JIANGLI,"",parseInt(_loc3_[0])));
            }
            else if(_loc3_.indexOf("wancheng") != -1)
            {
               this.$parent.dispatchEvent(new BaseEvent(CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_CLICK));
               this.cyc = new CycTaskPanel();
               this.cyc.setTaskID(parseInt(_loc3_[0]));
            }
         }
         else
         {
            MainCharSeachPathManager.mainCharWalk(param1);
         }
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         if(this.taskTree.selectItem == null || this.taskTree.selectItem.state == null)
         {
            this.cancelBtn.enabled = false;
            this.content.htmlText = "";
            this.tip.htmlText = "";
            while(this.prizeContainer.numChildren > 0)
            {
               this.prizeContainer.removeChildAt(0);
            }
         }
         else
         {
            this.cancelBtn.enabled = true;
            if(this._type == UI_TASK_TASK_ACCEPTED)
            {
               this.setAcceptedTaskContent();
               if(this.selectID != this.taskTree.selectItem.label)
               {
                  this.$parent.dispatchEvent(new BaseEvent(TaskPanel.UI_TASKPANEL_TASK_LIST,"",int(this.taskTree.selectItem.label)));
                  this.selectID = this.taskTree.selectItem.label;
                  this.cyc = new CycTaskPanel();
                  this.cyc.setTaskID(parseInt(this.selectID));
               }
            }
            else if(this._type == UI_TASK_TASK_ACCEPTABLE)
            {
               this.setAcceptableTaskContent();
               this.selectID = this.taskTree.selectItem.label;
            }
            else if(this._type == UI_TASK_ACTIVE)
            {
               this.setActiveContent();
               this.selectID = this.taskTree.selectItem.label;
            }
         }
         this.taskScroll.update();
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         var taskID:int = 0;
         var alertStr:String = null;
         var taskRes:TaskRes = null;
         var e:MouseEvent = param1;
         taskID = parseInt(this.taskTree.selectItem.label);
         var isYabiao:Boolean = false;
         if(taskID == YabiaoInfo.SELF_ID || taskID == YabiaoInfo.BANGHUI_ID)
         {
            isYabiao = true;
            alertStr = LanResManager.getLanTextWords(this,"确定放弃任务") + "\n" + (taskID == YabiaoInfo.SELF_ID ? LanResManager.getLanCommonTextWords("个人押镖任务") : LanResManager.getLanCommonTextWords("帮会押镖任务"));
         }
         else
         {
            taskRes = TaskResManager.getTaskRes(taskID);
            alertStr = LanResManager.getLanTextWords(this,"确定放弃任务") + "\n" + taskRes.name;
            if(taskRes.isLoop && taskRes.type != TaskType.LV_LOOP && taskRes.type != TaskType.CISHA)
            {
               alertStr += "\n<font color=\'#FF0000\'>" + LanResManager.getLanTextWords(this,"环式任务被放弃后将会导致无法领到最终大奖") + "</font>";
            }
         }
         FAlert.show(alertStr,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               if(taskID == YabiaoInfo.SELF_ID || taskID == YabiaoInfo.BANGHUI_ID)
               {
                  PipeManager.sendMsg(PipeConstants.FANGQI_YABIAO_TASK,taskID);
               }
               else
               {
                  $parent.dispatchEvent(new BaseEvent(TaskPanel.UI_TASKPANEL_TASK_CANCEL,"",taskID));
               }
            }
         },false);
      }
      
      private function setAcceptedTaskContent() : void
      {
         var _loc8_:NpcRes = null;
         var _loc9_:MapRes = null;
         var _loc17_:int = 0;
         var _loc19_:ItemFace = null;
         var _loc20_:String = null;
         var _loc1_:int = int(this.taskTree.selectItem.label);
         if(_loc1_ == YabiaoInfo.SELF_ID || _loc1_ == YabiaoInfo.BANGHUI_ID)
         {
            this.setAcceptedTaskContent_yabiao();
            return;
         }
         if(_loc1_ == DynamicTaskInfo.CISHA_TASK_ID)
         {
            this.setAcceptedTaskContent_CiSha();
            return;
         }
         GameInstance.mainCharData.yabiaoInfo.updateTime_for_taskList = null;
         var _loc2_:CharTaskData = GameInstance.mainCharData.taskInfo.getTask(_loc1_);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:TaskRes = _loc2_.taskRes;
         var _loc4_:Boolean = TaskManager.checkHandInTask(_loc1_,false,true)[0] == 1;
         var _loc5_:String = _loc3_.name;
         var _loc6_:String = TaskTracker.convertHtmlStr(_loc4_ ? _loc3_.endDes : _loc3_.unEndDes);
         var _loc7_:String = TaskTracker.getTaskTrackStr(_loc2_,"　　");
         _loc8_ = NpcResManager.getNpcRes(_loc3_.endNpc);
         _loc9_ = MapTransManager.getMapRes(_loc8_.sceneid);
         var _loc10_:String = "[" + _loc9_.name + "]" + _loc8_.name;
         var _loc11_:Array = TaskTracker.getRewardArr(_loc1_);
         this.content.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务名称") + "</font><br>　　" + _loc5_ + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务描述") + "</font><br>　　" + _loc6_ + "</textformat>";
         this.contentScroll.update();
         var _loc12_:String = "";
         var _loc13_:String = "";
         var _loc14_:String = "";
         var _loc15_:String = "";
         var _loc16_:Boolean = false;
         if(_loc3_.isLoop && _loc3_.type != TaskType.LV_LOOP)
         {
            _loc16_ = true;
            if(_loc3_.loopTaskDifficulty > 1)
            {
               _loc14_ += "    <u><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\"event:" + _loc3_.id + ",reset,nandu\">" + LanResManager.getLanTextWords(this,"降低任务难度") + "</a></font></u>(" + LanResManager.getLanCommonTextWords("当前") + ":" + _loc3_.loopTaskDifficulty + " " + LanResManager.getLanCommonTextWords("最小") + ":1)";
            }
            if(_loc3_.loopTaskBonus < 10)
            {
               _loc15_ += "    <u><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\"event:" + _loc3_.id + ",reset,jiangli\">" + LanResManager.getLanTextWords(this,"提升奖励回报") + "</a></font></u>(" + LanResManager.getLanCommonTextWords("当前") + ":" + _loc3_.loopTaskBonus + " " + LanResManager.getLanCommonTextWords("最大") + ":10)";
            }
         }
         _loc12_ = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务追踪") + "</font>" + _loc14_ + "<br>" + _loc7_ + "<br>";
         if(_loc4_)
         {
            _loc8_ = NpcResManager.getNpcRes(_loc3_.endNpc);
            _loc9_ = MapTransManager.getMapRes(_loc8_.sceneid);
            _loc20_ = "[" + _loc9_.name + "]" + _loc8_.name;
            _loc12_ += LanResManager.getLanTextWords(this,"向...复命",[StaticValue.WHITE_HTML,StaticValue.GREEN_HTML,_loc8_.id_kind,_loc20_]);
         }
         if(_loc16_)
         {
            _loc13_ = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("交任务NPC") + "</font>   " + "<u><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\"event:" + _loc3_.id + ",reset,wancheng\">" + LanResManager.getLanCommonTextWords("直接完成") + LanResManager.getLanCommonTextWords("(消耗赏善罚恶令)") + "<br>　　" + "<font color=\'" + StaticValue.BLUE_HTML + "\'><u><a href=\'event:" + _loc3_.endNpc + "\'>" + _loc10_ + "</a></u></font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务奖励") + "</font>" + _loc15_ + "<br>";
         }
         else
         {
            _loc13_ = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("交任务NPC") + "</font><br>　　" + "<font color=\'" + StaticValue.BLUE_HTML + "\'><u><a href=\'event:" + _loc3_.endNpc + "\'>" + _loc10_ + "</a></u></font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务奖励") + "</font>" + _loc15_ + "<br>";
         }
         var _loc18_:int = int(_loc11_[0].length);
         _loc17_ = 0;
         while(_loc17_ < _loc18_)
         {
            _loc13_ += "　　" + _loc11_[0][_loc17_] + "<br>";
            _loc17_++;
         }
         _loc13_ += "</textformat>";
         TaskTracker.setLeaveTimeCallBack(_loc2_,1,this.tip,_loc12_,_loc13_,"　　");
         _loc18_ = int(_loc11_[1].length);
         while(this.prizeContainer.numChildren > 0)
         {
            this.prizeContainer.removeChildAt(0);
         }
         _loc17_ = 0;
         while(_loc17_ < _loc18_)
         {
            _loc19_ = new ItemFace(_loc11_[1][_loc17_] as Goods);
            this.prizeContainer.addChild(_loc19_);
            _loc19_.x = 20 + _loc17_ * 38;
            _loc17_++;
         }
         this.prizeContainer.y = this.tip.height + 10;
         this.tipScroll.update();
      }
      
      private function setAcceptedTaskContent_yabiao() : void
      {
         var _loc2_:NpcRes = null;
         var _loc3_:MapRes = null;
         var _loc13_:Boolean = false;
         var _loc14_:String = null;
         var _loc1_:int = int(this.taskTree.selectItem.label);
         _loc2_ = NpcResManager.getNpcRes(GameInstance.mainCharData.yabiaoInfo.yabiaoNpc);
         _loc3_ = MapTransManager.getMapRes(_loc2_.sceneid);
         var _loc4_:String = "[" + _loc3_.name + "]" + _loc2_.name;
         var _loc5_:Boolean = _loc1_ == YabiaoInfo.SELF_ID ? GameInstance.mainCharData.yabiaoInfo.haveSelfYabiao() : GameInstance.mainCharData.yabiaoInfo.haveBanghuiYabiao();
         var _loc6_:String = _loc1_ == YabiaoInfo.SELF_ID ? LanResManager.getLanCommonTextWords("个人押镖任务") : LanResManager.getLanCommonTextWords("帮会押镖任务");
         var _loc7_:String = LanResManager.getLanCommonTextWords("襄阳城总镖头韩拿山劳烦侠士将此镖车安全的运达：");
         _loc7_ = _loc7_ + ("<font color=\'" + StaticValue.BLUE_HTML + "\'><u><a href=\'event:" + GameInstance.mainCharData.yabiaoInfo.yabiaoNpc + "\'>" + _loc4_ + "</a></u></font>");
         var _loc8_:String = "";
         this.content.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务名称") + "</font><br>　　" + _loc6_ + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务描述") + "</font><br>　　" + _loc7_ + "</textformat>";
         this.contentScroll.update();
         var _loc9_:String = "";
         var _loc10_:String = "";
         var _loc11_:String = "";
         var _loc12_:String = "";
         _loc9_ = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务追踪") + "</font>" + _loc11_ + "<br>" + _loc8_ + "<br>";
         if(_loc5_)
         {
            _loc2_ = NpcResManager.getNpcRes(GameInstance.mainCharData.yabiaoInfo.yabiaoNpc);
            _loc3_ = MapTransManager.getMapRes(_loc2_.sceneid);
            _loc14_ = "[" + _loc3_.name + "]" + _loc2_.name;
            _loc9_ += LanResManager.getLanTextWords(this,"向...复命",[StaticValue.WHITE_HTML,StaticValue.GREEN_HTML,_loc2_.id_kind,_loc14_]);
         }
         if(_loc1_ == YabiaoInfo.SELF_ID && (GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_FAIL || GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT))
         {
            _loc13_ = true;
         }
         if(_loc1_ == YabiaoInfo.BANGHUI_ID && (GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_FAIL || GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT))
         {
            _loc13_ = true;
         }
         if(_loc13_)
         {
            _loc10_ += "　　<font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务已失败") + "</font><br />";
         }
         _loc10_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("交任务NPC") + "</font><br>　　" + "<font color=\'" + StaticValue.BLUE_HTML + "\'><u><a href=\'event:" + GameInstance.mainCharData.yabiaoInfo.yabiaoNpc + "\'>" + _loc4_ + "</a></u></font><br>";
         _loc10_ = _loc10_ + "</textformat>";
         TaskTracker.setLeaveTimeCallBack(GameInstance.mainCharData.yabiaoInfo,1,this.tip,_loc9_,_loc10_,"　　");
         this.prizeContainer.y = this.tip.height + 10;
         this.tipScroll.update();
      }
      
      private function setAcceptedTaskContent_CiSha() : void
      {
         var _loc1_:int = int(this.taskTree.selectItem.label);
         var _loc2_:TaskRes = TaskResManager.getTaskRes(_loc1_);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.name;
         var _loc4_:String = TaskTracker.convertHtmlStr(_loc2_.publishDes);
         var _loc5_:String = "   " + LanResManager.getLanCommonTextWords("完成刺杀密令任务");
         var _loc6_:String = TaskTracker.getAcceptNpcStr(_loc2_);
         var _loc7_:NpcRes = NpcResManager.getNpcRes(_loc2_.endNpc);
         var _loc8_:MapRes = MapTransManager.getMapRes(_loc7_.sceneid);
         var _loc9_:String = "[" + _loc8_.name + "]" + _loc7_.name;
         var _loc10_:int = GameInstance.mainCharData.dynamicTaskInfo.CISHA_TASK_STATUS;
         this.content.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务名称") + "</font><br>　　" + _loc3_ + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务描述") + "</font><br>　　" + _loc4_ + "</textformat>";
         this.contentScroll.update();
         var _loc11_:String = "";
         var _loc12_:String = "";
         var _loc13_:String = "";
         var _loc14_:String = "";
         _loc11_ = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务追踪") + "</font>" + _loc13_ + "<br>" + _loc5_ + "<br>";
         if(_loc10_ == 2)
         {
            _loc11_ += LanResManager.getLanTextWords(this,"向...复命",[StaticValue.WHITE_HTML,StaticValue.GREEN_HTML,_loc7_.id_kind,_loc9_]);
         }
         if(_loc10_ == 3 || _loc10_ == 4)
         {
            _loc12_ += "　　<font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务已失败") + "</font><br />";
         }
         _loc12_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("交任务NPC") + "</font><br>　　" + "<font color=\'" + StaticValue.BLUE_HTML + "\'><u><a href=\'event:" + _loc2_.endNpc + "\'>" + _loc9_ + "</a></u></font><br>";
         _loc12_ = _loc12_ + "</textformat>";
         var _loc15_:CharTaskData = GameInstance.mainCharData.taskInfo.getTask(_loc1_);
         if(_loc15_ != null)
         {
            _loc15_.updateTime_for_taskList = null;
         }
         this.tip.htmlText = _loc11_ + _loc12_;
         this.prizeContainer.y = this.tip.height + 10;
         this.tipScroll.update();
      }
      
      private function setAcceptableTaskContent() : void
      {
         var _loc8_:int = 0;
         var _loc10_:ItemFace = null;
         var _loc1_:int = int(this.taskTree.selectItem.label);
         if(_loc1_ == YabiaoInfo.SELF_ID || _loc1_ == YabiaoInfo.BANGHUI_ID)
         {
            this.setAcceptableTaskContent_yabiao();
            return;
         }
         if(_loc1_ == DynamicTaskInfo.CISHA_TASK_ID)
         {
            this.setAcceptableTaskContent_CiSha();
            return;
         }
         var _loc2_:TaskRes = TaskResManager.getTaskRes(_loc1_);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.name;
         var _loc4_:String = TaskTracker.convertHtmlStr(_loc2_.publishDes);
         var _loc5_:String = TaskTracker.getAcceptNpcStr(_loc2_);
         var _loc6_:Array = TaskTracker.getRewardArr(_loc1_);
         this.content.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务名称") + "</font><br>　　" + _loc3_ + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务描述") + "</font><br>　　" + _loc4_ + "<br>" + "</textformat";
         this.contentScroll.update();
         var _loc7_:String = "<textformat leading=\'2\'>";
         _loc7_ = _loc7_ + ("\n<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("接任务NPC") + "</font>");
         if(_loc2_.accept_begin_time != "")
         {
            _loc7_ += "\n　　" + LanResManager.getLanCommonTextWords("起始时间") + " " + _loc2_.accept_begin_time;
         }
         if(_loc2_.complete_end_time != "")
         {
            _loc7_ += "\n　　" + LanResManager.getLanCommonTextWords("截止时间") + " " + _loc2_.complete_end_time;
         }
         _loc7_ += "\n　　<font color=\'" + StaticValue.BLUE_HTML + "\'>" + _loc5_ + "</font>";
         _loc7_ = _loc7_ + ("\n<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务奖励") + "</font><br>");
         var _loc9_:int = int(_loc6_[0].length);
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc7_ += "　　" + _loc6_[0][_loc8_] + "<br>";
            _loc8_++;
         }
         _loc7_ += "</textformat>";
         this.tip.htmlText = _loc7_;
         _loc9_ = int(_loc6_[1].length);
         while(this.prizeContainer.numChildren > 0)
         {
            this.prizeContainer.removeChildAt(0);
         }
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc10_ = new ItemFace(_loc6_[1][_loc8_] as Goods);
            this.prizeContainer.addChild(_loc10_);
            _loc10_.x = 20 + _loc8_ * 38;
            _loc8_++;
         }
         this.prizeContainer.y = this.tip.height + 10;
         this.tipScroll.update();
      }
      
      private function setAcceptableTaskContent_CiSha() : void
      {
         var _loc1_:int = int(this.taskTree.selectItem.label);
         var _loc2_:TaskRes = TaskResManager.getTaskRes(_loc1_);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.name;
         var _loc4_:String = TaskTracker.convertHtmlStr(_loc2_.publishDes);
         var _loc5_:String = TaskTracker.getAcceptNpcStr(_loc2_);
         this.content.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务名称") + "</font><br>　　" + _loc3_ + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务描述") + "</font><br>　　" + _loc4_ + "<br>" + "</textformat";
         this.contentScroll.update();
         var _loc6_:String = "<textformat leading=\'2\'>";
         _loc6_ = _loc6_ + ("\n<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("接任务NPC") + "</font>");
         _loc6_ = _loc6_ + ("\n　　<font color=\'" + StaticValue.BLUE_HTML + "\'>" + _loc5_ + "</font>");
         _loc6_ = _loc6_ + "</textformat>";
         this.tip.htmlText = _loc6_;
         this.prizeContainer.y = this.tip.height + 10;
         this.tipScroll.update();
      }
      
      private function setAcceptableTaskContent_yabiao() : void
      {
         var _loc1_:int = int(this.taskTree.selectItem.label);
         var _loc2_:NpcRes = NpcResManager.getNpcRes(YabiaoInfo.ACCEPT_NPC_ID);
         var _loc3_:MapRes = MapTransManager.getMapRes(_loc2_.sceneid);
         var _loc4_:String = "[" + _loc3_.name + "]" + _loc2_.name;
         var _loc5_:String = _loc1_ == YabiaoInfo.SELF_ID ? LanResManager.getLanCommonTextWords("个人押镖任务") : LanResManager.getLanCommonTextWords("帮会押镖任务");
         var _loc6_:String = LanResManager.getLanCommonTextWords("襄阳城总镖头韩拿山有事劳烦侠士，请速去帮忙");
         this.content.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务名称") + "</font><br>　　" + _loc5_ + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务描述") + "</font><br>　　" + _loc6_ + "<br>" + "</textformat";
         this.contentScroll.update();
         var _loc7_:String = "<textformat leading=\'2\'>";
         _loc7_ = _loc7_ + ("\n<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("接任务NPC") + "</font>");
         _loc7_ = _loc7_ + ("\n　　<font color=\'" + StaticValue.BLUE_HTML + "\'><u><a href=\'event:" + YabiaoInfo.ACCEPT_NPC_ID + "\'>" + _loc4_ + "</a></u></font><br>");
         this.tip.htmlText = _loc7_;
         this.prizeContainer.y = this.tip.height + 10;
         this.tipScroll.update();
      }
      
      private function setActiveContent() : void
      {
         var _loc10_:int = 0;
         var _loc12_:ItemFace = null;
         var _loc13_:MapRes = null;
         var _loc14_:String = null;
         var _loc15_:TaskTargetData = null;
         var _loc16_:Goods = null;
         var _loc1_:int = int(this.taskTree.selectItem.label);
         var _loc2_:ActivityRes = ActivityResManager.getActivityRes(_loc1_);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = "　　" + _loc2_.name;
         var _loc4_:String = "　　";
         if(_loc2_.fromTime != "" && _loc2_.toTime != "")
         {
            _loc4_ += _loc2_.fromTime + " " + LanResManager.getLanTextWords(this,"某时至某时") + " " + _loc2_.toTime;
         }
         else if(_loc2_.fromTime != "")
         {
            _loc4_ += _loc2_.fromTime + " " + LanResManager.getLanTextWords(this,"某时起");
         }
         else if(_loc2_.toTime != "")
         {
            _loc4_ += _loc2_.toTime + " " + LanResManager.getLanTextWords(this,"某时止");
         }
         else
         {
            _loc4_ += LanResManager.getLanCommonTextWords("无限制");
         }
         var _loc5_:String = "";
         if(_loc2_.minLevel > 0)
         {
            _loc5_ += "　　" + LanResManager.getLanCommonTextWords("最低等级") + "：" + _loc2_.minLevel;
         }
         if(_loc2_.minTeamPlayerNum > 0)
         {
            _loc5_ += _loc5_ != "" ? "\n" : "";
            _loc5_ = _loc5_ + ("　　" + LanResManager.getLanCommonTextWords("组队人数") + "：" + _loc2_.minTeamPlayerNum);
         }
         if(_loc5_ == "")
         {
            _loc5_ = "　　" + LanResManager.getLanCommonTextWords("无限制");
         }
         var _loc6_:String = "　　" + _loc2_.des;
         this.content.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动名称") + "</font><br>" + _loc3_ + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动时间") + "</font><br>" + _loc4_ + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("参与条件") + "</font><br>" + _loc5_ + "<br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动简介") + "</font><br>" + _loc6_ + "<br>" + "</textformat>";
         this.contentScroll.update();
         var _loc7_:String = "　　";
         var _loc8_:NpcRes = NpcResManager.getNpcRes(_loc2_.acceptNpc);
         if(_loc8_ != null)
         {
            _loc13_ = MapTransManager.getMapRes(_loc8_.sceneid);
            _loc14_ = "[" + _loc13_.name + "]" + _loc8_.name;
            _loc7_ += "<a href=\"event:" + _loc2_.acceptNpc + "\">" + _loc14_ + "</a>";
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("无");
         }
         var _loc9_:String = "　　" + _loc2_.prizeAttr;
         this.tip.htmlText = "<textformat leading=\'3\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动NPC") + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + _loc7_ + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动奖励") + "</font><br>" + _loc9_ + "<br>" + "</textformat>";
         var _loc11_:int = int(_loc2_.prizeArr.length);
         while(this.prizeContainer.numChildren > 0)
         {
            this.prizeContainer.removeChildAt(0);
         }
         _loc10_ = 0;
         while(_loc10_ < _loc11_)
         {
            _loc15_ = _loc2_.prizeArr[_loc10_] as TaskTargetData;
            _loc16_ = new Goods(_loc15_.id);
            _loc16_.count = _loc15_.count;
            _loc12_ = new ItemFace(_loc16_);
            this.prizeContainer.addChild(_loc12_);
            _loc12_.x = 20 + _loc10_ * 38;
            _loc10_++;
         }
         this.prizeContainer.y = this.tip.height + 10;
         this.tipScroll.update();
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         if(param1 == UI_TASK_TASK_ACCEPTED)
         {
            this.title.text = LanResManager.getLanCommonTextWords("任务名称");
            this.cancelBtn.visible = true;
         }
         else if(param1 == UI_TASK_TASK_ACCEPTABLE)
         {
            this.title.text = LanResManager.getLanCommonTextWords("任务名称");
            this.cancelBtn.visible = false;
         }
         else
         {
            this.title.text = LanResManager.getLanCommonTextWords("活动名称");
            this.cancelBtn.visible = false;
         }
      }
      
      public function set dataProvider(param1:XML) : void
      {
         var _loc2_:XML = null;
         this.content.htmlText = "";
         this.tip.htmlText = "";
         while(this.prizeContainer.numChildren > 0)
         {
            this.prizeContainer.removeChildAt(0);
         }
         this.taskTree.dataProvider = param1;
         if(param1.children().length() == 0)
         {
            this.cancelBtn.enabled = false;
            return;
         }
         if(!this.taskTree.showNodeByLabel(this.selectID))
         {
            _loc2_ = param1.children()[0];
            this.taskTree.showNodeByLabel(_loc2_.children()[0].@label);
         }
         this.taskScroll.update();
         this.onClick();
      }
      
      public function showTaskByID(param1:String) : void
      {
         this.taskTree.showNodeByLabel(param1);
         this.onClick();
      }
   }
}

