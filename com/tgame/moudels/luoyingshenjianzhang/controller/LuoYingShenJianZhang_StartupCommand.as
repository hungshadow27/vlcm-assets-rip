package com.tgame.moudels.luoyingshenjianzhang.controller
{
   import com.tgame.moudels.luoyingshenjianzhang.model.LuoYingShenJianZhang_MsgReceivedProxy;
   import com.tgame.moudels.luoyingshenjianzhang.model.LuoYingShenJianZhang_MsgSenderProxy;
   import com.tgame.moudels.luoyingshenjianzhang.view.LuoYingShenJianZhang_Mediator;
   import com.tgame.moudels.luoyingshenjianzhang.view.LuoYingShenJianZhang_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LuoYingShenJianZhang_StartupCommand extends SimpleCommand
   {
      
      public function LuoYingShenJianZhang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new LuoYingShenJianZhang_MsgSenderProxy());
         facade.registerProxy(new LuoYingShenJianZhang_MsgReceivedProxy());
         facade.registerMediator(new LuoYingShenJianZhang_Mediator());
         facade.registerMediator(new LuoYingShenJianZhang_TargetMediator());
      }
   }
}

