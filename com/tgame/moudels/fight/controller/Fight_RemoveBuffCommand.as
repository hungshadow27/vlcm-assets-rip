package com.tgame.moudels.fight.controller
{
   import com.tgame.moudels.fight.model.Fight_BuffProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Fight_RemoveBuffCommand extends SimpleCommand
   {
      
      public function Fight_RemoveBuffCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Array = param1.getBody() as Array;
         var _loc3_:Fight_BuffProxy = facade.retrieveProxy(Fight_BuffProxy.NAME) as Fight_BuffProxy;
         _loc3_.r_cancelBuff(_loc2_[0],_loc2_[1],_loc2_[2]);
      }
   }
}

