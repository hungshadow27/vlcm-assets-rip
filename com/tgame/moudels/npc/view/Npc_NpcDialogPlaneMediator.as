package com.tgame.moudels.npc.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.res.task.TaskDialogRes;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.res.task.TaskTalk;
   import com.tgame.common.res.task.vo.TaskTargetData;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.TaskDialogType;
   import com.tgame.common.staticdata.TaskTargetType;
   import com.tgame.common.vo.character.NPC;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.character.info.YabiaoInfo;
   import com.tgame.common.vo.character.info.data.CharTaskData;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.npc.Npc_ApplicationFacade;
   import com.tgame.shell.view.components.NpcDialogPanel;
   import com.tgame.shell.view.components.cycletask.SubmitItemPopWinodw;
   import com.tgame.shell.view.components.cycletask.SubmitRidePopWindow;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.engine.SceneCharacter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Npc_NpcDialogPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Npc_NpcDialogPlaneMediator";
      
      private var taskInfoArr:Array;
      
      private var npcChar:SceneCharacter;
      
      private var taskDialogRes:Array;
      
      private var tempType:int = -1;
      
      private var tempNpcID:int = -1;
      
      private var tempTaskID:int = -1;
      
      public function Npc_NpcDialogPlaneMediator()
      {
         super(NAME);
      }
      
      protected function get npcDialogPanel() : NpcDialogPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.npcDialogPanel);
         }
         return viewComponent as NpcDialogPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Npc_ApplicationFacade.UPDATE_AND_SHOW_NPC_DIALOG_PLANE,Npc_ApplicationFacade.TASK_UPDATE_NPC];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:NpcRes = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:TaskRes = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Npc_ApplicationFacade.UPDATE_AND_SHOW_NPC_DIALOG_PLANE:
               this.npcChar = _loc2_ as SceneCharacter;
               _loc3_ = NPC(this.npcChar.data).res;
               if(_loc3_.can_redirect == 1)
               {
                  this.npcChar.faceToCharacter(GameInstance.mainChar);
               }
               _loc4_ = NpcResManager.getFunctionIDListByNpcID(_loc3_.id_kind);
               if(_loc4_.length == 1 && _loc4_[0] >= NpcFunctionType.PAODAN_FANWEI.x && _loc4_[0] <= NpcFunctionType.PAODAN_FANWEI.y)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_GONGCHENG_GONGCHENGCHE_PANEL);
               }
               else
               {
                  this.updateNpcDialog();
                  PipeManager.sendMsg(PipeConstants.SHOW_NPC_DIALOG_PLANE);
                  PipeManager.sendMsg(PipeConstants.SEND_NPCID,this.npcChar);
                  TaskTracker.updateTaskUI(false,false,true,false);
               }
               break;
            case Npc_ApplicationFacade.TASK_UPDATE_NPC:
               if(this.npcChar != null && this.npcChar == _loc2_[0])
               {
                  if(this.npcDialogPanel.visible == true)
                  {
                     this.setTaskList(this.npcChar.id,[_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]]);
                     if(_loc2_[1].length > 0)
                     {
                        NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide2);
                        NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide1);
                     }
                     else if(_loc2_[3].length > 0)
                     {
                        NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide2);
                        NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide3);
                     }
                     else if(_loc2_[4].length > 0 || this.tempType == 2)
                     {
                        NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide2);
                        NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide3);
                     }
                     else if(_loc2_[4].length > 0 || this.tempType == 3)
                     {
                        NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide2);
                        NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide3);
                     }
                  }
                  else if(this.tempType != -1 && this.tempNpcID == this.npcChar.id)
                  {
                     _loc5_ = _loc2_ as Array;
                     if(this.tempType == 3)
                     {
                        for each(_loc6_ in _loc5_[3])
                        {
                           if(_loc6_.id == this.tempTaskID)
                           {
                              EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(NpcDialogPanel.UI_NPC_DIALOG_TASKLIST_CLICK,"",[2,this.tempTaskID]));
                              break;
                           }
                        }
                     }
                     if(this.tempType == 2)
                     {
                        for each(_loc6_ in _loc5_[1])
                        {
                           if(_loc6_.premiseTask == this.tempTaskID)
                           {
                              EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(NpcDialogPanel.UI_NPC_DIALOG_TASKLIST_CLICK,"",[0,_loc6_.id]));
                              this.tempType = -1;
                              this.tempNpcID = -1;
                              this.tempTaskID = -1;
                              break;
                           }
                        }
                     }
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         EventDispatchCenter.getInstance().addEventListener(NpcDialogPanel.UI_NPC_DIALOG_TASKLIST_CLICK,this.npcDialogPanelHandle);
         UIEventsRegisterManager.addUIRegisterEvent(NpcDialogPanel,function():void
         {
            npcDialogPanel.addEventListener(NpcDialogPanel.UI_NPC_DIALOG_FUNCTIONLIST_CLICK,npcDialogPanelHandle);
            npcDialogPanel.addEventListener(NpcDialogPanel.UI_NPC_DIALOG_NEXTDIALOG_SHOW,npcDialogPanelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(NpcDialogPanel,function():void
         {
            npcDialogPanel.removeEventListener(NpcDialogPanel.UI_NPC_DIALOG_FUNCTIONLIST_CLICK,npcDialogPanelHandle);
            npcDialogPanel.removeEventListener(NpcDialogPanel.UI_NPC_DIALOG_NEXTDIALOG_SHOW,npcDialogPanelHandle);
         });
      }
      
      private function npcDialogPanelHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:TaskDialogRes = null;
         var _loc7_:Boolean = false;
         var _loc8_:TaskTalk = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case NpcDialogPanel.UI_NPC_DIALOG_FUNCTIONLIST_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = _loc3_.data;
               PipeManager.sendMsg(PipeConstants.HIDE_NPC_DIALOG_PLANE);
               if(_loc4_ != LanResManager.getLanCommonTextWords("离开"))
               {
                  PipeManager.sendMsg(PipeConstants.NPC_REQ_FUNCTION,NpcFunctionType.getValueByName(String(_loc4_)));
               }
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide1);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide2);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide3);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide19);
               break;
            case NpcDialogPanel.UI_NPC_DIALOG_TASKLIST_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = _loc3_.data;
               this.taskInfoArr = _loc4_ as Array;
               _loc5_ = int(this.taskInfoArr[0]);
               _loc7_ = true;
               switch(_loc5_)
               {
                  case 0:
                     _loc6_ = TaskResManager.getTaskDialogRes(int(this.taskInfoArr[1]),TaskDialogType.ACCEPT,this.npcChar.id);
                     this.taskDialogRes = _loc6_ == null ? [] : _loc6_.talks.slice();
                     NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide1);
                     _loc7_ = false;
                     break;
                  case 1:
                     this.taskDialogRes = [];
                     _loc8_ = new TaskTalk();
                     _loc8_.talkType = 1;
                     if(this.tempNpcID != -1)
                     {
                        _loc8_.talkNpc = this.tempNpcID;
                     }
                     else
                     {
                        if(this.npcChar == null)
                        {
                           return;
                        }
                        _loc8_.talkNpc = this.npcChar.id;
                     }
                     _loc8_.talk = LanResManager.getLanTextWords(this,"别想蒙混过关");
                     this.taskDialogRes.push(_loc8_);
                     _loc8_ = new TaskTalk();
                     _loc8_.talkType = 2;
                     _loc8_.talk = LanResManager.getLanTextWords(this,"我会努力的");
                     this.taskDialogRes.push(_loc8_);
                     break;
                  case 2:
                     _loc6_ = TaskResManager.getTaskDialogRes(int(this.taskInfoArr[1]),TaskDialogType.HAND_IN,this.npcChar.id);
                     this.taskDialogRes = _loc6_ == null ? [] : _loc6_.talks.slice();
                     NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide3);
                     NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide6);
                     NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide7);
                     _loc7_ = false;
                     break;
                  case 3:
                     _loc6_ = TaskResManager.getTaskDialogRes(int(this.taskInfoArr[1]),TaskDialogType.TALK,this.npcChar.id);
                     this.taskDialogRes = _loc6_ == null ? [] : _loc6_.talks.slice();
               }
               this.showNextDialog(_loc7_);
               break;
            case NpcDialogPanel.UI_NPC_DIALOG_NEXTDIALOG_SHOW:
               this.showNextDialog(true);
         }
      }
      
      private function updateNpcDialog() : void
      {
         var _loc1_:NpcRes = NPC(this.npcChar.data).res;
         var _loc2_:Array = NpcFunctionType.getNameArrByValueArr(NpcResManager.getFunctionIDListByNpcID(_loc1_.id_kind));
         var _loc3_:String = NpcFunctionType.getNameByValue(NpcFunctionType.TASK);
         var _loc4_:int = _loc2_.indexOf(_loc3_);
         if(_loc4_ != -1)
         {
            _loc2_.splice(_loc4_,1);
         }
         _loc2_ = _loc2_.concat(LanResManager.getLanCommonTextWords("离开"));
         var _loc5_:String = ResPathManager.getBigICOPath(_loc1_.id_ico_big);
         this.npcDialogPanel.show(_loc5_,_loc1_.name,_loc1_.getOneNpcSimpleTalk(GameInstance.mainCharData.attributeInfo.getSex() == 1),_loc2_);
      }
      
      private function setTaskList(param1:int, param2:Array = null) : void
      {
         var _loc4_:Bitmap = null;
         var _loc3_:String = GameInstance.npcTishiDict[param1];
         if(GameInstance.npcTupianTishiDict[param1] != null)
         {
            _loc4_ = GameInstance.npcTupianTishiDict[param1];
         }
         this.npcDialogPanel.setTaskList(param2,_loc3_,_loc4_);
      }
      
      private function showNextDialog(param1:Boolean) : void
      {
         var arr1:Array = null;
         var talk1:TaskTalk = null;
         var talk2:TaskTalk = null;
         var talkNpcRes:NpcRes = null;
         var talkNpcName:String = null;
         var headImgPath:String = null;
         var goodsP:int = 0;
         var mountID:int = 0;
         var task:CharTaskData = null;
         var hasAlert:Boolean = false;
         var targetGoods:Array = null;
         var ttd:TaskTargetData = null;
         var goodsRes:GoodsRes = null;
         var goodsArr:Array = null;
         var alertPlane:DisplayObject = null;
         var targetMount:Array = null;
         var mountArr:Array = null;
         var xml:XML = null;
         var pMount:PureMount = null;
         var alertPlane2:DisplayObject = null;
         var isHaveTask:Boolean = param1;
         var len:int = int(this.taskDialogRes.length);
         if(len >= 2)
         {
            arr1 = [];
            talk1 = this.taskDialogRes.shift();
            talk2 = this.taskDialogRes.shift();
            talkNpcRes = NpcResManager.getNpcRes(talk1.talkNpc);
            talkNpcName = talkNpcRes.name;
            headImgPath = ResPathManager.getBigICOPath(talkNpcRes.id_ico_big);
            this.npcDialogPanel.setNextDialog([talk1.getTalk(GameInstance.mainCharData.attributeInfo.getSex() == 1),talk2.getTalk(GameInstance.mainCharData.attributeInfo.getSex() == 1),talkNpcName,headImgPath]);
            PipeManager.sendMsg(PipeConstants.SHOW_NPC_DIALOG_PLANE);
            if(!isHaveTask)
            {
               NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide2);
            }
         }
         else
         {
            PipeManager.sendMsg(PipeConstants.HIDE_NPC_DIALOG_PLANE);
            if(this.taskInfoArr[0] == "3")
            {
               this.tempType = 3;
               this.tempNpcID = this.npcChar.id;
               this.tempTaskID = this.taskInfoArr[1];
               TaskTracker.doTask(TaskTargetType.TARGET_NPC,this.npcChar.id);
            }
            else if(this.taskInfoArr[0] == "1")
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉,条件不足,任务交接失败"));
            }
            else if(this.taskInfoArr[0] == "0")
            {
               if(this.taskInfoArr[1] == YabiaoInfo.SELF_ID || this.taskInfoArr[1] == YabiaoInfo.BANGHUI_ID)
               {
                  PipeManager.sendMsg(PipeConstants.OPEN_JIE_YABIAO_PANEL,this.taskInfoArr[1]);
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.TASK_ACCEPT_CMD,this.taskInfoArr[1]);
               }
            }
            else if(this.taskInfoArr[0] == "2")
            {
               if(this.taskInfoArr[1] == YabiaoInfo.SELF_ID || this.taskInfoArr[1] == YabiaoInfo.BANGHUI_ID)
               {
                  PipeManager.sendMsg(PipeConstants.OPEN_JIAO_YABIAO_PANEL,this.taskInfoArr[1]);
               }
               else
               {
                  this.tempType = 2;
                  this.tempNpcID = this.npcChar.id;
                  this.tempTaskID = this.taskInfoArr[1];
                  goodsP = 0;
                  mountID = 0;
                  task = GameInstance.mainCharData.taskInfo.getTask(this.tempTaskID);
                  hasAlert = false;
                  targetGoods = task.taskRes.targetGoods;
                  for each(ttd in targetGoods)
                  {
                     goodsRes = GoodsResManager.getGoodsRes(ttd.id);
                     if(goodsRes.kind == GoodsKind.K2)
                     {
                        goodsArr = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(ttd.id,true);
                        alertPlane = SubmitItemPopWinodw.showSubmitItemPanel(goodsArr);
                        alertPlane.addEventListener(SubmitItemPopWinodw.UI_CYCLETASK_ITEM_SUBMIT,function(param1:BaseEvent):void
                        {
                           goodsP = int(Number(param1.data));
                           if(goodsP > 0)
                           {
                              PipeManager.sendMsg(PipeConstants.TASK_HANDIN_CMD,[tempTaskID,goodsP,mountID]);
                           }
                        });
                        hasAlert = true;
                        break;
                     }
                  }
                  if(!hasAlert)
                  {
                     targetMount = task.taskRes.targetHorse;
                     var _loc3_:int = 0;
                     var _loc4_:* = targetMount;
                     for each(ttd in _loc4_)
                     {
                        mountArr = GameInstance.mainCharData.mountInfo.getMountArrByMID(ttd.id,task.taskRes.hourseDrop);
                        xml = <list/>;
                        for each(pMount in mountArr)
                        {
                           xml.appendChild(<node rideName={pMount.name} level={pMount.mountAttributeInfo.lv} label={pMount.id} state={pMount.fightStatus} quality={pMount.mountAttributeInfo.quality}/>);
                        }
                        alertPlane2 = SubmitRidePopWindow.showSubmitRIdePanel(xml);
                        alertPlane2.addEventListener(SubmitRidePopWindow.UI_CYCLETASK_RIDE_SUBMIT,function(param1:BaseEvent):void
                        {
                           mountID = int(Number(param1.data));
                           if(mountID > 0)
                           {
                              PipeManager.sendMsg(PipeConstants.TASK_HANDIN_CMD,[tempTaskID,goodsP,mountID]);
                           }
                        });
                        alertPlane2.addEventListener(SubmitRidePopWindow.UI_CYCLETASK_RIDE_INTO,function(param1:BaseEvent):void
                        {
                           mountID = int(Number(param1.data));
                           if(mountID > 0)
                           {
                              PipeManager.sendMsg(PipeConstants.SHOW_MOUNT_ATTR_PANEL,[GameInstance.mainChar.id,mountID]);
                           }
                        });
                        hasAlert = true;
                     }
                  }
                  if(!hasAlert)
                  {
                     PipeManager.sendMsg(PipeConstants.TASK_HANDIN_CMD,[this.tempTaskID,goodsP,mountID]);
                  }
               }
            }
         }
      }
   }
}

