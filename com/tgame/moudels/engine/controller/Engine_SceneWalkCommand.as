package com.tgame.moudels.engine.controller
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.map.TransOutRes;
   import com.tgame.common.staticdata.TaskTargetType;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.moudels.engine.model.Engine_MsgSenderProxy;
   import com.tgame.moudels.engine.model.Engine_SceneProxy;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_walk;
   import com.zcp.engine.vo.map.MapTile;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Engine_SceneWalkCommand extends SimpleCommand
   {
      
      private static var oldPArr:Array = [0,0,0,0];
      
      public function Engine_SceneWalkCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var data:Object = null;
         var msgSenderProxy:Engine_MsgSenderProxy = null;
         var path:Array = null;
         var len:int = 0;
         var mapTile:MapTile = null;
         var fromTile:MapTile = null;
         var toTile:MapTile = null;
         var tiaoyue:int = 0;
         var toRes:TransOutRes = null;
         var tempPath:Array = null;
         var step:int = 0;
         var i:int = 0;
         var isFuben1:Boolean = false;
         var isFuben2:Boolean = false;
         var $note:INotification = param1;
         var e:SceneEvent = $note.getBody() as SceneEvent;
         var action:String = e.action;
         data = e.data;
         switch(action)
         {
            case SceneEventAction_walk.READY:
               path = (data as Array)[2];
               len = int(path.length);
               if(len > 20)
               {
                  tempPath = [];
                  step = 3;
                  i = 0;
                  while(i < len - 1)
                  {
                     if(i % step == 0)
                     {
                        tempPath.push(path[i]);
                     }
                     i++;
                  }
                  path = tempPath;
               }
               GameInstance.uiInstance.popMapPanel.drawPath(path);
               this.onMainCharMove();
               break;
            case SceneEventAction_walk.THROUGH:
               this.onMainCharMove();
               break;
            case SceneEventAction_walk.ARRIVED:
               mapTile = (data as Array)[1];
               TaskTracker.doTask(TaskTargetType.TARGET_AREA,[GameInstance.scene.mapConfig.mapID,new Point(mapTile.tile_x,mapTile.tile_y)]);
               GameInstance.uiInstance.popMapPanel.drawPath([]);
               this.onMainCharMove();
               break;
            case SceneEventAction_walk.UNABLE:
               GameInstance.uiInstance.popMapPanel.drawPath([]);
               this.onMainCharMove();
               break;
            case SceneEventAction_walk.JUMP_READY:
               GameInstance.uiInstance.popMapPanel.drawPath([]);
               this.onMainCharMove();
               break;
            case SceneEventAction_walk.JUMP_THROUGH:
               this.onMainCharMove();
               break;
            case SceneEventAction_walk.JUMP_ARRIVED:
               GameInstance.uiInstance.popMapPanel.drawPath([]);
               this.onMainCharMove();
               break;
            case SceneEventAction_walk.JUMP_UNABLE:
               GameInstance.uiInstance.popMapPanel.drawPath([]);
               this.onMainCharMove();
               break;
            case SceneEventAction_walk.SEND_PATH:
               if(!GameInstance.mainCharData.isInAutoFly)
               {
                  msgSenderProxy = facade.retrieveProxy(Engine_MsgSenderProxy.NAME) as Engine_MsgSenderProxy;
                  msgSenderProxy.send_10061(data[1]);
               }
               break;
            case SceneEventAction_walk.SEND_JUMP_PATH:
               fromTile = data[1];
               toTile = data[2];
               msgSenderProxy = facade.retrieveProxy(Engine_MsgSenderProxy.NAME) as Engine_MsgSenderProxy;
               if(GameInstance.mainChar.on2Jumping())
               {
                  tiaoyue = 3;
               }
               else
               {
                  tiaoyue = GameInstance.mainChar.isJumping() ? 2 : 1;
               }
               msgSenderProxy.send_10063([fromTile.tile_x,fromTile.tile_y,toTile.tile_x,toTile.tile_y,tiaoyue]);
               break;
            case SceneEventAction_walk.ON_TRANSPORT:
               msgSenderProxy = facade.retrieveProxy(Engine_MsgSenderProxy.NAME) as Engine_MsgSenderProxy;
               mapTile = data[1];
               toRes = MapTransManager.getTransOutResByXY(GameInstance.scene.mapConfig.mapID,mapTile.tile_x,mapTile.tile_y);
               if(toRes != null)
               {
                  isFuben1 = GameConfig.wantEnterMapRes.isFuben == 1;
                  isFuben2 = MapTransManager.getMapRes(toRes.mapID).isFuben == 1;
                  if(isFuben1 && !isFuben2)
                  {
                     FAlert.show(LanResManager.getLanTextWords(this,"您确定传出本副本"),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           if(GameConfig.wantEnterMapRes.id == 20303 && toRes.mapID == 20002)
                           {
                              if(Fun.isVisible(GameInstance.uiInstance.shengxiaoRightSpr))
                              {
                                 GameInstance.uiInstance.shengxiaoRightSpr.onclose();
                              }
                              GameInstance.uiInstance.mainUI.setTrackVisible(true);
                              GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
                           }
                           NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"正在准备传送"),false);
                           msgSenderProxy.send_10051([mapTile.tile_x,mapTile.tile_y]);
                        }
                     },true);
                  }
                  else if(MapTransManager.getMapRes(toRes.mapID).isClearPkProtect)
                  {
                     FAlert.show(LanResManager.getLanTextWords(this,"该地图死亡不会增加和平保护状态"),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"正在准备传送"),false);
                           msgSenderProxy.send_10051([mapTile.tile_x,mapTile.tile_y]);
                        }
                     },true);
                  }
                  else if(ReloginManager.isInKuafu)
                  {
                     if(GameConfig.wantEnterMapRes.isFuben == 14)
                     {
                        FAlert.show(LanResManager.getLanCommonTextWords("您确认要传出比武招亲吗？"),"",2,function(param1:FAlertEvent):void
                        {
                           if(param1.eventData == FAlert.OK)
                           {
                              NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"正在准备传送"),false);
                              msgSenderProxy.send_10051([mapTile.tile_x,mapTile.tile_y]);
                           }
                        },true);
                     }
                     else if(GameConfig.wantEnterMapRes.isFuben == 3)
                     {
                        FAlert.show(LanResManager.getLanCommonTextWords("您确认要传出跨服论剑台吗？"),"",2,function(param1:FAlertEvent):void
                        {
                           if(param1.eventData == FAlert.OK)
                           {
                              NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"正在准备传送"),false);
                              msgSenderProxy.send_10051([mapTile.tile_x,mapTile.tile_y]);
                           }
                        },true);
                     }
                     else
                     {
                        NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"正在准备传送"),false);
                        msgSenderProxy.send_10051([mapTile.tile_x,mapTile.tile_y]);
                     }
                  }
                  else if(GameInstance.scene.mapConfig.mapID == 20286)
                  {
                     FAlert.show(LanResManager.getLanCommonTextWords("本次活动期间内，传出后，将无法再次进入万宝阁，") + "\n" + LanResManager.getLanCommonTextWords("是否确定离开？"),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"正在准备传送"),false);
                           msgSenderProxy.send_10051([mapTile.tile_x,mapTile.tile_y]);
                        }
                     },true);
                  }
                  else
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"正在准备传送"),false);
                     msgSenderProxy.send_10051([mapTile.tile_x,mapTile.tile_y]);
                  }
               }
         }
      }
      
      private function onMainCharMove() : void
      {
         var _loc1_:Point = GameInstance.scene.customLayer.globalToLocal(new Point(0,0));
         var _loc2_:Point = GameInstance.scene.customLayer.globalToLocal(new Point(GameConfig.sceneWidth,GameConfig.sceneHeight));
         if(oldPArr[0] != _loc1_.x || oldPArr[1] != _loc1_.y || oldPArr[2] != _loc2_.x || oldPArr[3] != _loc2_.y)
         {
            oldPArr[0] = _loc1_.x;
            oldPArr[1] = _loc1_.y;
            oldPArr[2] = _loc2_.x;
            oldPArr[3] = _loc2_.y;
            HighEffectManager.setShowArea(new Rectangle(_loc1_.x,_loc1_.y,_loc2_.x - _loc1_.x,_loc2_.y - _loc1_.y));
         }
         var _loc3_:Engine_SceneProxy = facade.retrieveProxy(Engine_SceneProxy.NAME) as Engine_SceneProxy;
         _loc3_.updateMainCharInSmallMap();
      }
   }
}

