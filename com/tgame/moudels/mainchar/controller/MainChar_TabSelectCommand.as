package com.tgame.moudels.mainchar.controller
{
   import com.tgame.moudels.mainchar.model.MainChar_MainCharProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MainChar_TabSelectCommand extends SimpleCommand
   {
      
      public function MainChar_TabSelectCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:MainChar_MainCharProxy = facade.retrieveProxy(MainChar_MainCharProxy.NAME) as MainChar_MainCharProxy;
         _loc2_.TabSelect();
      }
   }
}

