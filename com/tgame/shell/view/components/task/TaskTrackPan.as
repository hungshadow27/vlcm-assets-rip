package com.tgame.shell.view.components.task
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.staticdata.TaskType;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.info.DynamicTaskInfo;
   import com.tgame.common.vo.character.info.YabiaoInfo;
   import com.tgame.common.vo.character.info.data.CharEndTaskData;
   import com.tgame.common.vo.character.info.data.CharTaskData;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskManager;
   import com.tgame.manager.TaskTracker;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class TaskTrackPan extends Sprite
   {
      
      public static const RESET_TASK:String = "TaskTrackPan.RESET_TASK";
      
      private static const WIDTH:Number = 166;
      
      private static const MARGIN:Number = 3;
      
      private var _boxArr:Array = [];
      
      private var _textPrefix:String = "    ";
      
      private var _isFrist:Boolean = true;
      
      private var _ss:StyleSheet;
      
      public function TaskTrackPan()
      {
         super();
         this._ss = new StyleSheet();
         this._ss.parseCSS("a{text-decoration:underline;}a:link {color: " + TaskTracker.TASK_GREEN2 + "} a:visited {color: #d59712} a:hover {color: #ff0000} a:active {color: #d59712}");
      }
      
      public function setData(param1:Array, param2:int) : void
      {
         if(!param1)
         {
            return;
         }
         this.updateUI(param1,param2);
      }
      
      private function updateUI(param1:Array, param2:int) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Sprite = null;
         var _loc10_:Sprite = null;
         var _loc11_:Sprite = null;
         var _loc12_:Sprite = null;
         var _loc13_:Array = null;
         var _loc14_:Sprite = null;
         var _loc15_:Array = null;
         var _loc16_:Sprite = null;
         var _loc17_:Sprite = null;
         var _loc18_:Sprite = null;
         this.clear();
         if(param2 == 1)
         {
            _loc3_ = param1[0];
            _loc4_ = param1[1];
            _loc5_ = param1[2];
            _loc6_ = param1[3];
            _loc7_ = param1[4];
            _loc8_ = param1[5];
            if(_loc3_.length > 0 || _loc6_.length > 0)
            {
               _loc9_ = this.getBox(LanResManager.getLanCommonTextWords("主线任务"),[[_loc3_,1],[_loc6_,2]]);
               if(_loc9_)
               {
                  this.addChild(_loc9_);
                  this._boxArr.push(_loc9_);
               }
            }
            if(_loc4_.length > 0)
            {
               _loc10_ = this.getBox(LanResManager.getLanCommonTextWords("支线任务"),[[_loc4_,1]]);
               if(_loc10_)
               {
                  this.addChild(_loc10_);
                  this._boxArr.push(_loc10_);
               }
            }
            if(_loc5_.length > 0 || _loc7_.length > 0)
            {
               _loc11_ = this.getBox(LanResManager.getLanCommonTextWords("循环任务"),[[_loc5_,1],[_loc7_,2]]);
               if(_loc11_)
               {
                  this.addChild(_loc11_);
                  this._boxArr.push(_loc11_);
               }
            }
            if(_loc8_.length > 0 || _loc8_.length > 0)
            {
               _loc12_ = this.getBox(LanResManager.getLanCommonTextWords("刺杀任务"),[[_loc8_,7]]);
               if(_loc12_)
               {
                  this.addChild(_loc12_);
                  this._boxArr.push(_loc12_);
               }
            }
            if(GameInstance.mainCharData.yabiaoInfo.haveSelfYabiao() || GameInstance.mainCharData.yabiaoInfo.haveBanghuiYabiao())
            {
               _loc13_ = [];
               if(GameInstance.mainCharData.yabiaoInfo.haveSelfYabiao())
               {
                  _loc13_.push(YabiaoInfo.SELF_ID);
               }
               if(GameInstance.mainCharData.yabiaoInfo.haveBanghuiYabiao())
               {
                  _loc13_.push(YabiaoInfo.BANGHUI_ID);
               }
               _loc14_ = this.getBox(LanResManager.getLanCommonTextWords("帮会任务"),[[_loc13_,3]]);
               if(_loc14_)
               {
                  this.addChild(_loc14_);
                  this._boxArr.push(_loc14_);
               }
            }
         }
         else if(param2 == 2)
         {
            _loc6_ = param1[0];
            _loc15_ = param1[1];
            _loc7_ = param1[2];
            _loc8_ = param1[3];
            if(_loc6_.length > 0)
            {
               _loc16_ = this.getBox(LanResManager.getLanCommonTextWords("主线任务"),[[_loc6_,2]]);
               if(_loc16_)
               {
                  this.addChild(_loc16_);
                  this._boxArr.push(_loc16_);
               }
            }
            if(_loc15_.length > 0)
            {
               _loc17_ = this.getBox(LanResManager.getLanCommonTextWords("支线任务"),[[_loc15_,2]]);
               if(_loc17_)
               {
                  this.addChild(_loc17_);
                  this._boxArr.push(_loc17_);
               }
            }
            if(_loc7_.length > 0)
            {
               _loc18_ = this.getBox(LanResManager.getLanCommonTextWords("循环任务"),[[_loc7_,2]]);
               if(_loc18_)
               {
                  this.addChild(_loc18_);
                  this._boxArr.push(_loc18_);
               }
            }
            if(_loc8_.length > 0 || _loc8_.length > 0)
            {
               _loc11_ = this.getBox(LanResManager.getLanCommonTextWords("刺杀任务"),[[_loc8_,2]]);
               if(_loc11_)
               {
                  this.addChild(_loc11_);
                  this._boxArr.push(_loc11_);
               }
            }
            if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE || GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE)
            {
               _loc13_ = [];
               if(GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE)
               {
                  _loc13_.push(YabiaoInfo.SELF_ID);
               }
               if(GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.NONE_ACCEPTABLE)
               {
                  _loc13_.push(YabiaoInfo.BANGHUI_ID);
               }
               _loc14_ = this.getBox(LanResManager.getLanCommonTextWords("帮会任务"),[[_loc13_,4]]);
               if(_loc14_)
               {
                  this.addChild(_loc14_);
                  this._boxArr.push(_loc14_);
               }
            }
         }
         this.reSize();
      }
      
      private function clear() : void
      {
         Fun.clearChildren(this);
         this.graphics.clear();
         this._boxArr.length = 0;
      }
      
      private function onLink(param1:TextEvent) : void
      {
         var str:String = null;
         var textArr:Array = null;
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
         else if(str == "dropCiShaTask")
         {
            FAlert.show(LanResManager.getLanCommonTextWords("确定放弃该刺杀任务吗？"),"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  PipeManager.sendMsg(PipeConstants.DROP_TASK,DynamicTaskInfo.CISHA_TASK_ID);
               }
            },false);
         }
         else
         {
            textArr = str.split(",");
            if(textArr.indexOf("reset") != -1)
            {
               this.dispatchEvent(new BaseEvent(RESET_TASK,"",parseInt(textArr[0])));
            }
            else
            {
               MainCharSeachPathManager.mainCharWalk(e);
            }
         }
      }
      
      private function getBox(param1:String, param2:Array) : Sprite
      {
         var textSp:Sprite;
         var sp:Sprite = null;
         var btn:FSimpleButton = null;
         var text:TextField = null;
         var thisOpenClose:Function = null;
         var itemBox:Sprite = null;
         var pre:Sprite = null;
         var taskNum:int = 0;
         var arr:Array = null;
         var $taskArr:Array = null;
         var $type:int = 0;
         var task:* = undefined;
         var row:Sprite = null;
         var getTaskRow:Function = null;
         var $title:String = param1;
         var $taskArrAndTypeArr:Array = param2;
         thisOpenClose = function(param1:MouseEvent):void
         {
            if(itemBox.parent)
            {
               btn.skin = "sumButton";
               text.htmlText = "<font color=\'" + TaskTracker.TASK_GREEN + "\' size=\'13\'>" + $title + "(" + taskNum + ")</font>";
               itemBox.parent.removeChild(itemBox);
            }
            else
            {
               btn.skin = "subButton";
               text.htmlText = "<font color=\'" + TaskTracker.TASK_GREEN + "\' size=\'13\'>" + $title + "(" + taskNum + ")</font>";
               sp.addChild(itemBox);
            }
            reSize();
            param1.stopImmediatePropagation();
         };
         if($taskArrAndTypeArr.length == 0)
         {
            return null;
         }
         sp = new Sprite();
         textSp = new Sprite();
         textSp.buttonMode = true;
         textSp.addEventListener(MouseEvent.MOUSE_DOWN,thisOpenClose);
         textSp.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         btn = new FSimpleButton();
         btn.skin = "subButton";
         textSp.addChild(btn);
         text = new TextField();
         text.selectable = false;
         text.mouseEnabled = false;
         text.autoSize = TextFieldAutoSize.LEFT;
         text.filters = StaticValue.filter;
         text.x = btn.width + 1;
         text.htmlText = "<font color=\'" + TaskTracker.TASK_GREEN + "\' size=\'13\'>" + $title + "(" + taskNum + ")</font>";
         textSp.addChild(text);
         sp.addChild(textSp);
         itemBox = new Sprite();
         taskNum = 0;
         for each(arr in $taskArrAndTypeArr)
         {
            $taskArr = arr[0];
            $type = int(arr[1]);
            if($taskArr.length != 0)
            {
               if($type == 1)
               {
                  getTaskRow = this.getTaskRow1;
               }
               else if($type == 2)
               {
                  getTaskRow = this.getTaskRow2;
               }
               else if($type == 3)
               {
                  getTaskRow = this.getTaskRow3;
               }
               else if($type == 4)
               {
                  getTaskRow = this.getTaskRow4;
               }
               else if($type == 7)
               {
                  getTaskRow = this.getTaskRow7;
               }
               for each(task in $taskArr)
               {
                  row = getTaskRow(task);
                  if(row)
                  {
                     taskNum++;
                     row.y = pre ? pre.y + pre.height - 3 : -3;
                     pre = row;
                     itemBox.addChild(row);
                  }
               }
            }
         }
         itemBox.x = btn.width - 11;
         itemBox.y = text.height + 2;
         sp.addChild(itemBox);
         text.htmlText = "<font color=\'" + TaskTracker.TASK_GREEN + "\' size=\'13\'>" + $title + "(" + taskNum + ")</font>";
         return sp;
      }
      
      private function getTaskRow1(param1:CharTaskData) : Sprite
      {
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:NpcRes = null;
         var _loc13_:MapRes = null;
         var _loc14_:String = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:Sprite = new Sprite();
         var _loc3_:TextField = new TextField();
         _loc3_.selectable = false;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.styleSheet = this._ss;
         _loc3_.filters = StaticValue.filter;
         _loc3_.addEventListener(TextEvent.LINK,this.onLink);
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,TaskTracker.goonDispatchEvent);
         _loc3_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _loc2_.addChild(_loc3_);
         var _loc4_:CharTaskData = param1 as CharTaskData;
         var _loc5_:Boolean = TaskManager.checkHandInTask(_loc4_.taskID,false,true)[0] == 1;
         var _loc6_:String = "";
         var _loc7_:String = "";
         var _loc8_:String = TaskTracker.TASK_ORANGE;
         var _loc9_:String = _loc4_.taskRes.name;
         if(_loc5_)
         {
            _loc10_ = "<font color=\'" + TaskTracker.TASK_YELLOW + "\'>【" + LanResManager.getLanCommonTextWords("可交付") + "】</font>";
         }
         else
         {
            _loc10_ = "<font color=\'" + TaskTracker.TASK_RED + "\'>【" + LanResManager.getLanCommonTextWords("未完成") + "】</font>";
         }
         _loc9_ += _loc10_;
         _loc6_ += "<font size=\'12\' color=\'" + _loc8_ + "\'>";
         _loc6_ = _loc6_ + ("[" + _loc4_.taskRes.receptionLevel + "]");
         _loc6_ = _loc6_ + _loc9_;
         _loc6_ = _loc6_ + "</font>";
         _loc6_ = _loc6_ + ("<font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>");
         if(_loc4_.taskRes.isLoop)
         {
            _loc11_ = "[" + _loc4_.currentLoop + "/" + _loc4_.taskRes.loopMaxCount + "]";
            _loc6_ += "\n" + this._textPrefix + LanResManager.getLanTextWords(this,"第...环",[_loc11_]) + " " + _loc10_;
         }
         _loc6_ += "\n" + TaskTracker.getTaskTrackStr(_loc4_,this._textPrefix);
         if(_loc5_)
         {
            _loc12_ = NpcResManager.getNpcRes(_loc4_.taskRes.endNpc);
            _loc13_ = MapTransManager.getMapRes(_loc12_.sceneid);
            _loc14_ = "[" + _loc13_.name + "]" + _loc12_.name;
            _loc6_ += "\n" + this._textPrefix + LanResManager.getLanCommonTextWords("任务回复") + " <a href=\"event:" + _loc12_.id_kind + "\">" + _loc14_ + "</a>";
         }
         if(_loc4_.taskRes.isLoop && _loc4_.taskRes.type != TaskType.LV_LOOP)
         {
            if(_loc4_.taskRes.loopTaskDifficulty > 1 || _loc4_.taskRes.loopTaskBonus < 10)
            {
               _loc6_ += "\n" + this._textPrefix + "<a href=\"event:" + _loc4_.taskID + ",reset\">" + LanResManager.getLanTextWords(this,"降低任务难度与提升奖励回报") + "</a>";
            }
         }
         _loc6_ += "</font>\n";
         TaskTracker.setLeaveTimeCallBack(_loc4_,2,_loc3_,_loc6_,_loc7_,this._textPrefix);
         return _loc2_;
      }
      
      private function getTaskRow2(param1:TaskRes) : Sprite
      {
         var _loc7_:CharEndTaskData = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:Sprite = new Sprite();
         var _loc3_:TextField = new TextField();
         _loc3_.selectable = false;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.styleSheet = this._ss;
         _loc3_.filters = StaticValue.filter;
         _loc3_.addEventListener(TextEvent.LINK,this.onLink);
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,TaskTracker.goonDispatchEvent);
         _loc3_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _loc2_.addChild(_loc3_);
         var _loc4_:String = "";
         _loc4_ = _loc4_ + ("<font size=\'12\' color=\'" + TaskTracker.TASK_ORANGE + "\'>");
         _loc4_ = _loc4_ + ("[" + param1.receptionLevel + "]");
         _loc4_ = _loc4_ + param1.name;
         var _loc5_:String = "<font color=\'" + TaskTracker.TASK_BLUE + "\'>【" + LanResManager.getLanCommonTextWords("未接取") + "】</font>";
         _loc4_ += _loc5_;
         _loc4_ = _loc4_ + "</font>";
         _loc4_ = _loc4_ + ("<font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>");
         var _loc6_:String = "";
         if(param1.isLoop)
         {
            _loc7_ = TaskManager.getEndTask(param1.id);
            if(_loc7_ != null)
            {
               _loc6_ = "[" + (_loc7_.currentLoop + 1) + "/" + param1.loopMaxCount + "]";
            }
            else
            {
               _loc6_ = "[1/" + param1.loopMaxCount + "]";
            }
            if(param1.id != DynamicTaskInfo.CISHA_TASK_ID)
            {
               _loc4_ += "\n" + this._textPrefix + LanResManager.getLanTextWords(this,"第...环",[_loc6_]) + _loc5_;
            }
         }
         if(param1.accept_begin_time != "")
         {
            _loc4_ += "\n" + this._textPrefix + LanResManager.getLanCommonTextWords("起始时间") + " " + param1.accept_begin_time;
         }
         if(param1.complete_end_time != "")
         {
            _loc4_ += "\n" + this._textPrefix + LanResManager.getLanCommonTextWords("截止时间") + " " + param1.complete_end_time;
         }
         _loc4_ += "\n" + this._textPrefix + LanResManager.getLanCommonTextWords("任务接取") + " ";
         _loc4_ = _loc4_ + TaskTracker.getAcceptNpcStr(param1);
         _loc4_ = _loc4_ + "</font>";
         _loc3_.htmlText = _loc4_;
         return _loc2_;
      }
      
      private function getTaskRow3(param1:int) : Sprite
      {
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:TextField = new TextField();
         _loc3_.selectable = false;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.styleSheet = this._ss;
         _loc3_.filters = StaticValue.filter;
         _loc3_.addEventListener(TextEvent.LINK,this.onLink);
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,TaskTracker.goonDispatchEvent);
         _loc3_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _loc2_.addChild(_loc3_);
         var _loc4_:int = param1;
         if(param1 == YabiaoInfo.SELF_ID)
         {
            _loc5_ = GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_HANDIN;
         }
         else if(param1 == YabiaoInfo.BANGHUI_ID)
         {
            _loc5_ = GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_HANDIN;
         }
         if(param1 == YabiaoInfo.SELF_ID && (GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_FAIL || GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT))
         {
            _loc6_ = true;
         }
         if(param1 == YabiaoInfo.BANGHUI_ID && (GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_FAIL || GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT))
         {
            _loc6_ = true;
         }
         var _loc7_:String = "";
         var _loc8_:String = "";
         var _loc9_:String = TaskTracker.TASK_ORANGE;
         if(param1 == YabiaoInfo.SELF_ID)
         {
            _loc10_ = LanResManager.getLanCommonTextWords("个人押镖任务");
         }
         else if(param1 == YabiaoInfo.BANGHUI_ID)
         {
            _loc10_ = LanResManager.getLanCommonTextWords("帮会押镖任务");
         }
         if(_loc5_)
         {
            _loc11_ = "<font color=\'" + TaskTracker.TASK_YELLOW + "\'>【" + LanResManager.getLanCommonTextWords("可交付") + "】</font>";
         }
         else if(_loc6_)
         {
            _loc11_ = "<font color=\'" + TaskTracker.TASK_RED + "\'>【" + LanResManager.getLanCommonTextWords("已失败") + "】</font>";
         }
         else
         {
            _loc11_ = "<font color=\'" + TaskTracker.TASK_RED + "\'>【" + LanResManager.getLanCommonTextWords("未完成") + "】</font>";
         }
         _loc10_ += _loc11_;
         _loc7_ += "<font size=\'12\' color=\'" + _loc9_ + "\'>";
         _loc7_ = _loc7_ + "[0]";
         _loc7_ = _loc7_ + _loc10_;
         _loc7_ = _loc7_ + "</font>";
         _loc7_ = _loc7_ + ("<font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>");
         var _loc12_:NpcRes = NpcResManager.getNpcRes(GameInstance.mainCharData.yabiaoInfo.yabiaoNpc);
         var _loc13_:MapRes = MapTransManager.getMapRes(_loc12_.sceneid);
         var _loc14_:String = "[" + _loc13_.name + "]" + _loc12_.name;
         _loc7_ += "\n" + this._textPrefix + LanResManager.getLanCommonTextWords("任务回复") + " <a href=\"event:" + _loc12_.id_kind + "\">" + _loc14_ + "</a>";
         _loc7_ = _loc7_ + "</font>\n";
         if(_loc6_)
         {
            _loc8_ += "\n" + this._textPrefix + "<font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务已失败") + "</font>";
            _loc8_ = _loc8_ + ("\n" + this._textPrefix + "<a href=\"event:" + (param1 == YabiaoInfo.SELF_ID ? "fangqiSelf" : "fangqiBanghui") + "\"><font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("点此放弃") + "</font></a>");
         }
         TaskTracker.setLeaveTimeCallBack(GameInstance.mainCharData.yabiaoInfo,2,_loc3_,_loc7_,_loc8_,this._textPrefix);
         return _loc2_;
      }
      
      private function getTaskRow4(param1:int) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         var _loc3_:TextField = new TextField();
         _loc3_.selectable = false;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.styleSheet = this._ss;
         _loc3_.filters = StaticValue.filter;
         _loc3_.addEventListener(TextEvent.LINK,this.onLink);
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,TaskTracker.goonDispatchEvent);
         _loc3_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _loc2_.addChild(_loc3_);
         var _loc4_:String = "";
         _loc4_ = _loc4_ + ("<font size=\'12\' color=\'" + TaskTracker.TASK_ORANGE + "\'>");
         _loc4_ = _loc4_ + "[0]";
         if(param1 == YabiaoInfo.SELF_ID)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("个人押镖任务");
         }
         else if(param1 == YabiaoInfo.BANGHUI_ID)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("帮会押镖任务");
         }
         var _loc5_:String = "<font color=\'" + TaskTracker.TASK_BLUE + "\'>【" + LanResManager.getLanCommonTextWords("未接取") + "】</font>";
         _loc4_ += _loc5_;
         _loc4_ = _loc4_ + "</font>";
         _loc4_ = _loc4_ + ("<font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>");
         _loc4_ = _loc4_ + ("\n" + this._textPrefix + LanResManager.getLanCommonTextWords("任务接取") + " ");
         var _loc6_:NpcRes = NpcResManager.getNpcRes(YabiaoInfo.ACCEPT_NPC_ID);
         var _loc7_:MapRes = MapTransManager.getMapRes(_loc6_.sceneid);
         var _loc8_:String = "[" + _loc7_.name + "]" + _loc6_.name;
         _loc4_ += "<a href=\"event:" + YabiaoInfo.ACCEPT_NPC_ID + "\">" + _loc8_ + "</a>";
         _loc4_ = _loc4_ + "</font>";
         _loc3_.htmlText = _loc4_;
         return _loc2_;
      }
      
      private function getTaskRow7(param1:CharTaskData) : Sprite
      {
         var _loc10_:String = null;
         var _loc14_:String = null;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:TextField = new TextField();
         _loc3_.selectable = false;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.styleSheet = this._ss;
         _loc3_.filters = StaticValue.filter;
         _loc3_.addEventListener(TextEvent.LINK,this.onLink);
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,TaskTracker.goonDispatchEvent);
         _loc3_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _loc2_.addChild(_loc3_);
         var _loc4_:CharTaskData = param1 as CharTaskData;
         var _loc5_:int = GameInstance.mainCharData.dynamicTaskInfo.CISHA_TASK_STATUS;
         var _loc6_:String = "";
         var _loc7_:String = "";
         var _loc8_:String = TaskTracker.TASK_ORANGE;
         var _loc9_:String = _loc4_.taskRes.name;
         switch(_loc5_)
         {
            case 1:
               _loc10_ = "<font color=\'" + TaskTracker.TASK_RED + "\'>【" + LanResManager.getLanCommonTextWords("未完成") + "】</font>";
               break;
            case 2:
               _loc10_ = "<font color=\'" + TaskTracker.TASK_YELLOW + "\'>【" + LanResManager.getLanCommonTextWords("可交付") + "】</font>";
               break;
            case 3:
               _loc10_ = "<font color=\'" + TaskTracker.TASK_RED + "\'>【" + LanResManager.getLanCommonTextWords("已超时") + "】</font>";
               break;
            case 4:
               _loc10_ = "<font color=\'" + TaskTracker.TASK_RED + "\'>【" + LanResManager.getLanCommonTextWords("已失败") + "】</font>";
         }
         _loc9_ += _loc10_;
         _loc6_ += "<font size=\'12\' color=\'" + _loc8_ + "\'>";
         _loc6_ = _loc6_ + ("[" + _loc4_.taskRes.receptionLevel + "]");
         _loc6_ = _loc6_ + _loc9_;
         _loc6_ = _loc6_ + "</font>";
         _loc6_ = _loc6_ + ("<font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>");
         if(_loc4_.taskRes.isLoop)
         {
            _loc14_ = "(" + _loc4_.currentLoop + "/" + _loc4_.taskRes.loopMaxCount + ")";
            _loc6_ += _loc14_;
         }
         _loc6_ += "\n    " + LanResManager.getLanCommonTextWords("完成刺杀密令任务");
         var _loc11_:NpcRes = NpcResManager.getNpcRes(_loc4_.taskRes.endNpc);
         var _loc12_:MapRes = MapTransManager.getMapRes(_loc11_.sceneid);
         var _loc13_:String = "[" + _loc12_.name + "]" + _loc11_.name;
         _loc6_ += "\n" + this._textPrefix + LanResManager.getLanCommonTextWords("任务回复") + " <a href=\"event:" + _loc11_.id_kind + "\">" + _loc13_ + "</a>";
         _loc6_ = _loc6_ + "</font>\n";
         if(_loc5_ == 3 || _loc5_ == 4)
         {
            _loc7_ += this._textPrefix + "<font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("任务已失败") + "</font>";
            _loc7_ = _loc7_ + ("\n" + this._textPrefix + "<a href=\"event:dropCiShaTask\"><font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("点此放弃") + "</font></a>");
         }
         if(_loc4_ != null)
         {
            _loc4_.updateTime_for_taskTracker = null;
         }
         _loc3_.htmlText = _loc6_ + _loc7_;
         return _loc2_;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         GameInstance.scene.sceneDispatchEvent(param1);
      }
      
      private function reSize() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         var _loc1_:int = int(this._boxArr.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = this._boxArr[_loc4_];
            _loc3_.y = _loc2_ ? _loc2_.y + _loc2_.height + 2 : 0;
            _loc2_ = _loc3_;
            _loc4_++;
         }
         GameInstance.uiInstance.mainUI.taskTrackSrollUpdate(!this._isFrist);
         if(this._isFrist)
         {
            this._isFrist = false;
         }
      }
   }
}

