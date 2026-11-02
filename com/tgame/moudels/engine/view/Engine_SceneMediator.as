package com.tgame.moudels.engine.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.KeyboardManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.engine.Engine_ApplicationFacade;
   import com.tgame.moudels.engine.model.Engine_SceneProxy;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.engine.Engine;
   import com.zcp.engine.Scene;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.EventManager;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Engine_SceneMediator extends Mediator
   {
      
      public static const NAME:String = "Engine_SceneMediator";
      
      private var sceneProxy:Engine_SceneProxy;
      
      public function Engine_SceneMediator(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      protected function get scene() : Scene
      {
         return viewComponent as Scene;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Engine_ApplicationFacade.CREAT_SCENE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var apd:AvatarParamData = null;
         var note:INotification = param1;
         var noteBody:Object = note.getBody();
         switch(note.getName())
         {
            case Engine_ApplicationFacade.CREAT_SCENE:
               Engine.initEngine(GameConfig.fileBaseFolder + ResPathManager.MAP_CONFIG + ResPathManager.eName_XML,GameConfig.fileBaseFolder + ResPathManager.MAP_SMALL,GameConfig.fileBaseFolder + ResPathManager.MAP_ZONE_DIR,GameConfig.fileBaseFolder + ResPathManager.AVATAR_MAP_SLIPCOVER + ResPathManager.eName_SWF,GameConfig.frameRate,GameConfig.decode);
               Engine.font_HeadFace = LanResManager.getLanFont("Engine#宋体");
               Engine.font_AttackFace = LanResManager.getLanFont("Engine#楷体");
               GameInstance.scene = new Scene(GameConfig.sceneWidth,GameConfig.sceneHeight);
               GameInstance.app.sceneContainer.addChildAt(GameInstance.scene,0);
               this.sceneProxy = facade.retrieveProxy(Engine_SceneProxy.NAME) as Engine_SceneProxy;
               this.sceneProxy.setData(GameInstance.scene);
               setViewComponent(GameInstance.scene);
               GameInstance.scene.setBlankAvatarParamData(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BLANK)));
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_SHADOW));
               apd.useSpecilizeXY = false;
               GameInstance.scene.setShadowAvatarParamData(apd);
               GameInstance.scene.setSelectedAvatarParamData(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_SELECT)));
               GameInstance.scene.setMouseCharAvatarParamData(new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_CURSOR_CLICK)));
               GameInstance.scene.addEventListener("rightClick",function(param1:MouseEvent):void
               {
                  if(KeyboardManager.enable == true)
                  {
                     PipeManager.sendMsg(PipeConstants.CLICK_RIGHT);
                  }
               });
         }
      }
      
      override public function onRegister() : void
      {
         EventManager.addEvent(SceneEvent.INTERACTIVE,this.handleSceneInteractive,EventDispatchCenter.getInstance());
         EventManager.addEvent(SceneEvent.WALK,this.handleSceneWalk,EventDispatchCenter.getInstance());
         EventManager.addEvent(SceneEvent.STATUS,this.handleSceneStatus,EventDispatchCenter.getInstance());
         EventManager.addEvent(SceneEvent.PROCESS,this.handleSceneProcess,EventDispatchCenter.getInstance());
      }
      
      override public function onRemove() : void
      {
         EventManager.removeEvent(SceneEvent.INTERACTIVE,this.handleSceneInteractive,EventDispatchCenter.getInstance());
         EventManager.removeEvent(SceneEvent.WALK,this.handleSceneWalk,EventDispatchCenter.getInstance());
         EventManager.removeEvent(SceneEvent.PROCESS,this.handleSceneProcess,EventDispatchCenter.getInstance());
      }
      
      private function handleSceneInteractive(param1:SceneEvent) : void
      {
         sendNotification(Engine_ApplicationFacade.SCENE_INTERACTIVE,param1);
      }
      
      private function handleSceneWalk(param1:SceneEvent) : void
      {
         sendNotification(Engine_ApplicationFacade.SCENE_WALK,param1);
      }
      
      private function handleSceneStatus(param1:SceneEvent) : void
      {
         sendNotification(Engine_ApplicationFacade.SCENE_STATUS,param1);
      }
      
      private function handleSceneProcess(param1:SceneEvent) : void
      {
         sendNotification(Engine_ApplicationFacade.SCENE_PROCESS,param1);
      }
      
      private function getHitSceneCharacter(param1:Array, param2:Point) : SceneCharacter
      {
         var _loc3_:SceneCharacter = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_.hitPoint(param2))
            {
               return _loc3_;
            }
         }
         return null;
      }
   }
}

