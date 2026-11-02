package com.tgame.moudels.engine.controller
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.MonsterType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.common.vo.character.Player;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.engine.Engine;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.SceneRender;
   import com.zcp.engine.config.SceneConfig;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_interactive;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import com.zcp.manager.TimerManager;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Engine_SceneInteractiveCommand extends SimpleCommand
   {
      
      private static var _autoPathTD:TimerData;
      
      private static var _oldMapTile:MapTile;
      
      private static var AUTO_PATH_DELAY:int = 500;
      
      private static var _autoPathLastTime:int = 0;
      
      public function Engine_SceneInteractiveCommand()
      {
         super();
      }
      
      private static function startAutoTime() : void
      {
         stopAutoTime();
         _autoPathTD = TimerManager.createTimer(AUTO_PATH_DELAY,0,function():void
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            var _loc4_:* = undefined;
            if(SceneRender.nowTime - _autoPathLastTime >= AUTO_PATH_DELAY)
            {
               _autoPathLastTime = SceneRender.nowTime;
               _loc1_ = Math.floor(GameInstance.scene.mouseX / SceneConfig.TILE_WIDTH);
               _loc2_ = Math.floor(GameInstance.scene.mouseY / SceneConfig.TILE_HEIGHT);
               _loc3_ = SceneUtil.getMapTile(_loc1_,_loc2_);
               if(_loc3_ != _oldMapTile)
               {
                  _loc4_ = new SceneEvent(SceneEvent.INTERACTIVE,SceneEventAction_interactive.MOUSE_DOWN,[null,null,_loc3_]);
                  EventDispatchCenter.getInstance().dispatchEvent(_loc4_);
               }
            }
         });
      }
      
      private static function stopAutoTime() : void
      {
         if(_autoPathTD != null)
         {
            TimerManager.deleteTimer(_autoPathTD);
            _autoPathTD = null;
         }
      }
      
      override public function execute(param1:INotification) : void
      {
         var data:Object = null;
         var sc:SceneCharacter = null;
         var mt:MapTile = null;
         var canJump:Boolean = false;
         var callBack:MoveCallBack = null;
         var $note:INotification = param1;
         var e:SceneEvent = $note.getBody() as SceneEvent;
         var action:String = e.action;
         data = e.data;
         switch(action)
         {
            case SceneEventAction_interactive.MOUSE_MOVE:
               sc = data[1];
               mt = data[2];
               TCursorManager.mapTile = mt;
               if(sc != GameInstance.mouseOnChar)
               {
                  GameInstance.mouseOnChar = sc;
               }
               if(sc == null)
               {
                  TCursorManager.showCursor();
               }
               else
               {
                  switch(sc.type)
                  {
                     case SceneCharacterType.MONSTER:
                        if((sc.data as Monster).res.type == MonsterType.MOUNT)
                        {
                           TCursorManager.showCursor(TCursorManager.CURSOR_BUZHUO);
                        }
                        else if((sc.data as Monster).res.type == MonsterType.XUYUANSHU_MONSTER)
                        {
                           TCursorManager.showCursor(TCursorManager.CURSOR_DUIHUA);
                        }
                        else
                        {
                           TCursorManager.showCursor(TCursorManager.CURSOR_GONGJI);
                        }
                        break;
                     case SceneCharacterType.NPC:
                        TCursorManager.showCursor(TCursorManager.CURSOR_DUIHUA);
                        break;
                     case SceneCharacterType.BAG:
                        TCursorManager.showCursor(TCursorManager.CURSOR_GOUMAI);
                  }
               }
               break;
            case SceneEventAction_interactive.MOUSE_DOWN:
               sc = data[1] as SceneCharacter;
               mt = data[2];
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_FLOOR_ATTACK)
               {
                  PipeManager.sendMsg(PipeConstants.FLOOR_ATTACK,mt);
                  return;
               }
               MainCharSeachPathManager.clear();
               if(sc == null)
               {
                  if(GameInstance.lockOnChar != null && GameInstance.lockOnChar.type == SceneCharacterType.NPC)
                  {
                     PipeManager.sendMsg(PipeConstants.CHANGED_LOCKEDCHAR_BASE_ATTR,null);
                  }
                  if(!FightManager.isMainCharCanMove())
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"无法移动"),false);
                     return;
                  }
                  if(Engine.enable3Jump)
                  {
                     if(GameInstance.mainChar.on3Jumping())
                     {
                        return;
                     }
                  }
                  else if(Engine.enable2Jump)
                  {
                     if(GameInstance.mainChar.on2Jumping())
                     {
                        return;
                     }
                  }
                  else if(GameInstance.mainChar.isJumping())
                  {
                     return;
                  }
                  startAutoTime();
                  canJump = false;
                  if(KeyboardManager.shift_down || TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_TIAOYUE)
                  {
                     if(GameConfig.wantEnterMapRes.allowJump)
                     {
                        if(!Player(GameInstance.mainChar.data).isSoft)
                        {
                           if(Player(GameInstance.mainChar.data).attributeInfo.ppNow >= OtherConst.JUMP_USE_TILI)
                           {
                              canJump = true;
                           }
                           else
                           {
                              NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"无法跳跃"),false);
                           }
                        }
                        else
                        {
                           NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("无法跳跃"),false);
                        }
                     }
                     else
                     {
                        NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"无法跳跃2"),false);
                     }
                  }
                  if(canJump)
                  {
                     if(TCursorManager.getCurruntStatus() != TCursorManager.CURSOR_TIAOYUE)
                     {
                        TCursorManager.resumFullMouse();
                     }
                     FightManager.clearAutoAttack();
                     if(Engine.enable2Jump || Engine.enable3Jump)
                     {
                        if(GameInstance.mainChar.on3Jumping())
                        {
                           return;
                        }
                        if(GameInstance.mainChar.on2Jumping() && !GameInstance.mainCharData.skillInfo.isLearningSkill(OtherConst.SKILL_ID_RUHUTIANYI))
                        {
                           return;
                        }
                        if(GameInstance.mainChar.isJumping() && !GameInstance.mainCharData.skillInfo.isLearningSkill(OtherConst.SKILL_ID_LINGBOWEIBU))
                        {
                           return;
                        }
                        if(GameInstance.mainChar.isJumping() && GameInstance.mainCharData.isShuShenShu)
                        {
                           return;
                        }
                     }
                     else if(GameInstance.mainChar.isJumping())
                     {
                        return;
                     }
                     if(Player(GameInstance.mainChar.data).isBind || Player(GameInstance.mainChar.data).isWeiZhenShanHe || Player(GameInstance.mainChar.data).isQiongLongShenYu || Player(GameInstance.mainChar.data).isShuFuJuZhen)
                     {
                        MainCharSeachPathManager.charJump(GameInstance.mainChar,new Point(GameInstance.mainChar.tile_x,GameInstance.mainChar.tile_y),-1,OtherConst.JUMP_MAX_DIS,null,GameInstance.mainChar.isJumping(),GameInstance.mainChar.on2Jumping());
                     }
                     else
                     {
                        MainCharSeachPathManager.charJump(GameInstance.mainChar,new Point(mt.tile_x,mt.tile_y),-1,OtherConst.JUMP_MAX_DIS,null,GameInstance.mainChar.isJumping(),GameInstance.mainChar.on2Jumping());
                     }
                  }
                  else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE && TCursorManager.currentItemFace != null)
                  {
                     PipeManager.sendMsg(PipeConstants.MOUSE_ITEM_MOVE);
                  }
                  else if(!Player(GameInstance.mainChar.data).isBind && !Player(GameInstance.mainChar.data).isWeiZhenShanHe && !Player(GameInstance.mainChar.data).isQiongLongShenYu && !Player(GameInstance.mainChar.data).isStop && !Player(GameInstance.mainChar.data).isShuFuJuZhen)
                  {
                     if(TCursorManager.getCurruntStatus() != TCursorManager.CURSOR_TIAOYUE)
                     {
                        TCursorManager.resumFullMouse();
                     }
                     callBack = new MoveCallBack();
                     callBack.onMoveArrived = function(param1:SceneCharacter, param2:MapTile):void
                     {
                        FightManager.checkAutoAttack();
                     };
                     MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + mt.tile_x + "," + mt.tile_y + ",0",false,callBack);
                  }
                  else
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"无法移动"),false);
                  }
               }
               else if(!Player(GameInstance.mainChar.data).isBind && !Player(GameInstance.mainChar.data).isQiongLongShenYu && !Player(GameInstance.mainChar.data).isBuNengXuanRen)
               {
                  PipeManager.sendMsg(PipeConstants.SINGLE_CLICK,data);
               }
               break;
            case SceneEventAction_interactive.MOUSE_UP:
               stopAutoTime();
               break;
            case SceneEventAction_interactive.DOUBLE_CLICK:
               break;
            case SceneEventAction_interactive.MOUSE_OUT:
               GameInstance.mouseOnChar = null;
               TCursorManager.resumMouse();
         }
      }
   }
}

