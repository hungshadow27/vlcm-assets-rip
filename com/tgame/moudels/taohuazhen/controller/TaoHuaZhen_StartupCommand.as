package com.tgame.moudels.taohuazhen.controller
{
   import com.tgame.moudels.taohuazhen.model.TaoHuaZhen_MsgReceivedProxy;
   import com.tgame.moudels.taohuazhen.model.TaoHuaZhen_MsgSenderProxy;
   import com.tgame.moudels.taohuazhen.view.TaoHuaZhen_Mediator;
   import com.tgame.moudels.taohuazhen.view.TaoHuaZhen_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TaoHuaZhen_StartupCommand extends SimpleCommand
   {
      
      public function TaoHuaZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TaoHuaZhen_MsgSenderProxy());
         facade.registerProxy(new TaoHuaZhen_MsgReceivedProxy());
         facade.registerMediator(new TaoHuaZhen_Mediator());
         facade.registerMediator(new TaoHuaZhen_TargetMediator());
      }
   }
}

