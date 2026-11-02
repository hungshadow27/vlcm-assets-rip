package com.tgame.moudels.fight.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.moudels.fight.model.Fight_proxy;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.CharStatusType;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Fight_HitCharCommand extends SimpleCommand
   {
      
      public function Fight_HitCharCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc6_:Fight_proxy = null;
         var _loc2_:Array = param1.getBody() as Array;
         var _loc3_:SceneCharacter = _loc2_[0] as SceneCharacter;
         var _loc4_:Boolean = Boolean(_loc2_[1]);
         var _loc5_:Boolean = Boolean(_loc2_[2]);
         if(_loc3_.getStatus() != CharStatusType.DEATH)
         {
            _loc6_ = facade.retrieveProxy(Fight_proxy.NAME) as Fight_proxy;
            if(_loc4_)
            {
               _loc6_.attackChar(_loc3_,Fight_proxy.mainChar_skillID,Fight_proxy.mainChar_skillDistance,_loc5_);
            }
            else
            {
               _loc6_.attackChar(_loc3_,Fight_proxy.temp_skillID,Fight_proxy.temp_skillDistance,_loc5_);
            }
         }
         else
         {
            GameInstance.uiInstance.mainUI.setSysTip(LanResManager.getLanTextWords(this,"目标已死亡!"));
         }
      }
   }
}

