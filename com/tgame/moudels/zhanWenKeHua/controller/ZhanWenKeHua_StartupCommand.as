package com.tgame.moudels.zhanWenKeHua.controller
{
   import com.tgame.moudels.zhanWenKeHua.model.ZhanWenKeHua_MsgReceiveProxy;
   import com.tgame.moudels.zhanWenKeHua.model.ZhanWenKeHua_MsgSendProxy;
   import com.tgame.moudels.zhanWenKeHua.view.ZhanWenKeHua_JinChuiZiUseMediator;
   import com.tgame.moudels.zhanWenKeHua.view.ZhanWenKeHua_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ZhanWenKeHua_StartupCommand extends SimpleCommand
   {
      
      public function ZhanWenKeHua_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ZhanWenKeHua_MsgSendProxy());
         facade.registerProxy(new ZhanWenKeHua_MsgReceiveProxy());
         facade.registerMediator(new ZhanWenKeHua_Mediator());
         facade.registerMediator(new ZhanWenKeHua_JinChuiZiUseMediator());
      }
   }
}

